<jsp:include page="Header2.jsp"/>

<% 
if(session.getAttribute("email")==null){
	response.sendRedirect("index.jsp");
}
%>
<%@page import="java.util.regex.*"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<%
//update data


%>

<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cake", "root", "root");
String id = request.getParameter("id");
  PreparedStatement pstmt = con.prepareStatement("SELECT * FROM menu WHERE menu_id = ?");
  pstmt.setString(1, id);
  ResultSet rs = pstmt.executeQuery();
  if (rs.next()) {
	  String aid=rs.getString("menu_id");
    String pname = rs.getString("pname");
    String flavor = rs.getString("flavor");
    String kg = rs.getString("kg");
    String qty = rs.getString("qty");
    String price = rs.getString("price");
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
        <h1 class="text-center">Edit Products</h1>
        
        <!-- Form -->
        
        <div class="error">
        
        </div>
        <form  method="post" action="update_process.jsp" >
            	<input type="hidden" name="id" value="<%= aid %>">
            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_title" class="form-label">Product Name</label>
                <input type="text" name="pname" value="<%= pname %>" id="product_title" class="form-control"
                    placeholder="Enter product title">
            </div>

            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_flavor" class="form-label">flavor</label>
                <input type="text" name="flavor" id="product_flavor" value="<%= flavor %>" class="form-control"
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
                <input type="text" name="qty" id="product_keywords" value="<%= qty %>" placeholder="Enter product Quantity"
                    class="form-control">
            </div>

            <!-- Price -->
            <div class="form-outline mb-4 w-50 m-auto">
                <label for="product_price" class="form-label ">Product Price</label>
                <input type="text" name="price" id="product_keywords" value="<%= price %>" placeholder="Enter product Price"
                    class="form-control">
            </div>

            <!-- Submit -->
            <div class="form-outline mb-4 w-50 m-auto">
          
               <button type="submit" class="btn btn-info mb-3 px-3">Update Product</button>
            </div>
                <%
  }
  con.close();
} catch (Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
            
        </form>
    </div>
    