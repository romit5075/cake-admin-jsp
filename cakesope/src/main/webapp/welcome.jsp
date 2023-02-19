<!DOCTYPE html>
<html lang="en">

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<jsp:include page="Header2.jsp"/>

<% 
if(session.getAttribute("email")==null){
	response.sendRedirect("index.jsp");
}
%>
<%
	String email=(String)session.getAttribute("email");  
try{
	Class.forName("com.mysql.jdbc.Driver");
}catch(Exception e){
	out.println(e);
}

%>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cake", "root", "root");


  
  //change password
  String changepassword = request.getParameter("changepassword");
  if(changepassword != null){
	 response.sendRedirect("");
  }
%>


<html>
  
<head>
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
  <!-- Serch Start -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
  <!-- Serch End -->

  <!-- Link CSS FILE -->
  <link rel="stylesheet" href="rahul.css">
  <style>
    .romit {
      margin: 30px 0px 10px 120px;
    }
  </style>
</head>

<body>
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
            <tr>

              <th scope="row">1</th>
              <td>cake</td>
              <td>flaver</td>
				<td>dd<td>
              <td><img src="./upload/" alt="" style="width: 45px; height: 45px"></td>

              <td>5</td>
              <td>10</td>

              <td><a href="#"><button type='button' class='btn btn-info'>Edit</button></a></td>
              <td><a href="#"><button type="button" class="btn btn-danger">Delete</button></a></td>

            </tr>

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

</html>