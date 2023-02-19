
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@page import="java.util.regex.*"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%


String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String password=request.getParameter("password");
String cpassword=request.getParameter("cpassword");
String error = "";
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cake", "root", "root");
try{
	
	if(fname != null || lname != null || email !=null || phone != null || password != null || cpassword != null){
		
		if(fname.isEmpty() || lname.isEmpty() ||email.isEmpty() || phone.isEmpty() ||password.isEmpty() || cpassword.isEmpty()){
			error="all fields are mandatory";
		}else{
			if(email.trim().length() == 0 || !email.matches("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$")){
				error="Enter valid Email";
			}else{
				
			if(password.equals(cpassword)){
			
			 Statement st = con.createStatement();
			 ResultSet rs;
			 rs = st.executeQuery("select * from register where email='" + email + "'");
			 
			 if(rs.next()){
				 error="User Aleredy Exist";
			 }else{
				 
			 int i = st.executeUpdate("insert into register(FirstName,LastName,email,phone,password)values('" + fname + "','" + lname
					 + "','" + email + "','" + phone + "','" + password + "')"); 
			 response.sendRedirect("index.jsp");
			 }
			 
			}else{
				error="password and confirm password are not match";
			}
		}
		}
	}else{
		error="all fields are mandatory";
	}
		
	
}catch(Exception ex){
	
	System.out.println(ex);
	 
}

	
	
 


%>
    
    
    
    <!--This is a Registration Page  -->
 <jsp:include page="Header2.jsp"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>cake shope</title>
<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css"
  rel="stylesheet"
/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<style>
.set{
margin-bottom:40px;
}
</style>
</head>
<body>
<!-- Section: Design Block -->
<section class="">
  <!-- Jumbotron -->
  <div class="px-4 py-5 px-md-5 text-center text-lg-start" style="background-color: hsl(0, 0%, 96%)">
    <div class="container">
      <div class="row gx-lg-5 align-items-center">
        <div class="col-lg-6 mb-5 mb-lg-0">
          <h1 class="my-5 display-3 fw-bold ls-tight">
            Radhe's cake <br />
            <span class="text-primary">Tack The best cake</span>
          </h1>
          <p style="color: hsl(217, 10%, 50.8%)">
            1.a sweet, baked, breadlike food, made with or without shortening, and usually
             containing flour, sugar,baking powder or soda, eggs, and liquid flavoring.
             2. a flat, thin mass of bread, esp. unleavened bread.
          </p>
        </div>

        <div class="col-lg-6 mb-5 mb-lg-0">
          <div class="card">
            <div class="card-body py-5 px-md-5">
              <form method="post">
                <!-- 2 column grid layout with text inputs for the first and last names -->
                <div class="row">
                <h3 class="set">Registration</h3>	
                
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
<%= error %>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
                  <div class="col-md-6 mb-4">
                    
                    <div class="form-outline">
                      <input type="text" id="form3Example1" class="form-control" name="fname"/>
                      <label class="form-label" for="form3Example1">First name</label>
                    </div>
                  </div>
                  <div class="col-md-6 mb-4">
                    <div class="form-outline">
                      <input type="text" id="form3Example2" class="form-control" name="lname"/>
                      <label class="form-label" for="form3Example2">Last name</label>
                    </div>
                    	
                  </div>
                </div>

                <!-- Email input -->
                <div class="form-outline mb-4">
                  <input type="email" id="form3Example3" class="form-control" name="email"/>
                  <label class="form-label" for="form3Example3">Email address</label>
                </div>
                
                 <!-- phone input -->
                <div class="form-outline mb-4">
                  <input type="text" id="form3Example5" class="form-control" name="phone"/>
                  <label class="form-label" for="form3Example3">Phone</label>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                  <input type="password" id="form3Example4" class="form-control" name="password"/>
                  <label class="form-label" for="form3Example4">Password</label>
                </div>
                
                 <!-- Password input -->
                <div class="form-outline mb-4">
                  <input type="password" id="form3Example4" class="form-control" name="cpassword"/>
                  <label class="form-label" for="form3Example6">Confirm crePassword</label>
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-center mb-4">
                  <input class="form-check-input me-2" type="checkbox" value="" id="form2Example33" checked />
                  <label class="form-check-label" for="form2Example33">
                    Subscribe to our newsletter
                  </label>
                </div>

                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block mb-4">
                  Sign up
                </button>

                <!-- Register buttons -->
                <div class="text-center">
                 
                 
                   exist user..  <a href="index.jsp">Login hear</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

</section>
<!-- Section: Design Block -->

<!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"
></script>
</body>
</html>