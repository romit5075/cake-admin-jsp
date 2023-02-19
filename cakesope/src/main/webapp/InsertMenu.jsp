<jsp:include page="Header2.jsp"/>

<% 
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("email")==null){
	response.sendRedirect("index.jsp");
}
%>
<%@page import="java.util.regex.*"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<% 
String pname=request.getParameter("pname");
String flavor=request.getParameter("flavor");
String kg=request.getParameter("kg");

String qty=request.getParameter("qty");
String price=request.getParameter("price");


String error = "";

try{
	

	 Class.forName("com.mysql.jdbc.Driver");
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cake", "root", "root");
	 Statement st = con.createStatement();
	
	 if(pname.isEmpty() || flavor.isEmpty() || kg.isEmpty() || qty.isEmpty() || price.isEmpty()){
		 error="All field mandatory";
	 }else{
		 
	int i = st.executeUpdate("insert into menu(pname,flavor,kg,qty,price)values('" + pname + "','" + flavor + "','" + kg + "','"+ qty +"','"+ price +"')"); 
	 }

	
  
}catch(Exception e){
	 e.printStackTrace();
}


%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Insert Product Admin-Dashboard</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS Link -->
    <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font Awersome Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Font Awersome Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
        integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- Link CSS FILE -->
    <link rel="stylesheet" href="romit.css">
    <style>
    .error {
        color: red;
        width: 50%;
        margin: 10px 0px 10px 350px;
    }
    </style>
      <!-- Serch Start -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
  <!-- Serch End -->
    
</head>

<body class="product_form ">
   
    <div class="container mt-3">
        <h1 class="text-center">Add Products</h1>
        <p> <%= error %></p>
        <!-- Form -->
        <!-- i can insert img in this form throw so use [enctype] -->
        <div class="error">
        
        </div>
        <form  method="post" >
            <!-- title -->
           
            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_title" class="form-label">Product Name</label>
                <input type="text" name="pname" id="product_title" class="form-control"
                    placeholder="Enter product title">
            </div>

            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_flavor" class="form-label">flavor</label>
                <input type="text" name="flavor" id="product_flavor" class="form-control"
                    placeholder="Enter product flavor">
            </div>
            
            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_flavor2" class="form-label">KG :</label>
                <select name="kg">
	<option value="0.5" <% if(kg == "0.5") out.print("selected"); %>>0.5 KG</option>
	<option value="1" <% if(kg == "1") out.print("selected"); %>>1 KG</option>
	<option value="2" <% if(kg == "2") out.print("selected"); %>>2 KG</option>
	<option value="5" <% if(kg == "5") out.print("selected");%>>5 KG</option>
</select>
            </div>
            
        
            <!-- Image 1 -->
            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_image1" class="form-label">Product image1</label>
                <input type="file" name="img" id="product_image1" class="form-control" multiple>
            </div>
            
            <!-- Quantity -->
            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_price" class="form-label ">Product Quantity</label>
                <input type="text" name="qty" id="product_keywords" placeholder="Enter product Quantity"
                    class="form-control">
            </div>

            <!-- Price -->
            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_price" class="form-label ">Product Price</label>
                <input type="text" name="price" id="product_keywords" placeholder="Enter product Price"
                    class="form-control">
            </div>

            <!-- Submit -->
            <div class="form-outline mb-4 w-50 m-auto">
                <input type="submit" class="btn btn-info mb-3 px-3" value="Products Inserted">
            </div>
        </form>
    </div>
    
     <div class="container">
    <div class="romit">
      <h1 class="text-center mb-2">All Product</h1>
      <div class="table-responsive">
        <table class="table table-hover" id="myTable">
          <thead class="table-dark">
            <tr>
              <th scope="col">id</th>
              <th scope="col">Product Name</th>
              <th scope="col">product Flavor</th>
              <th scope="col">KG<th>
              <th scope="col">Image</th>
              <th scope="col">Quantity</th>
              <th scope="col">Price</th>
              
              <th scope="col">Edit</th>
              <th scope="col">Delete</th>
            </tr>
          </thead>
          <tbody>
          
           <%
			// Get the data from the database
			Class.forName("com.mysql.jdbc.Driver");	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cake", "root", "root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from menu");

			// Loop through the data and display it in the table
			while (rs.next()) {
				String aid = rs.getString("menu_id");
				String apname = rs.getString("pname");
				String aflavor = rs.getString("flavor");
				String akg = rs.getString("kg");
				String aqty = rs.getString("qty");
				String aprice = rs.getString("price");

				%>
			<tr>
              <td scope="row"><%= aid %></td>
              <td><%= apname %></td>
			  <td><%= aflavor %><td>
              <td><%= akg %></td>
              
              <td><img src="./a.jpg" alt="" style="width: 45px; height: 45px"></td>
              <td><%= aqty %></td>
			  <td><%= aprice %></td>
              <td><a href="updatemenu.jsp?id=<%=rs.getString("menu_id")%>"><button type='button' class='btn btn-info'>Edit</button></a></td>
              <td><a href="delete.jsp?id=<%=rs.getString("menu_id")%>"><button type="button" class="btn btn-danger">Delete</button></a></td>
            </tr>
				<%
			}

			// Close the database connection
			rs.close();
			st.close();
			con.close();
		%>

          </tbody>
        </table>
      </div>
    </div>
  </div>
   <!-- Serch Start-->
  <script src="https://code.jquery.com/jquery-3.6.1.min.js"
    integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js">
  </script>
  <script>
    $(document).ready(function () {
      $('#myTable').DataTable();
    });


  </script>
  <!-- Serch End-->
</body>
