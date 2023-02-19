<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

%>
<%   
  
String email = (String)session.getAttribute("email");  
%> 




<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    
    
    <title>Cake Shop</title>
</head>
<body>
<div class="a">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="InsertMenu.jsp">Add Menu <span class="sr-only"></span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="welcome.jsp">Show Menu <span class="sr-only"></span></a>
      </li>
      <li class="nav-item active">
       <p class="nav-link">Email : <%= email %></p>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
     <% 
     String cheak = (String)session.getAttribute("email");  
     if (cheak == null || !cheak.equals(email)) { 
     %>
     <a href="index.jsp" class="btn btn-outline-success my-2 my-sm-0">Login</a> 
     
     <%
     }else{
     %>
      <a href="logout.jsp" class="btn btn-outline-danger  my-2 my-sm-0">logout</a> 
     <%}
     
     %>
    </form>
  </div>
</nav>
</div>
</body>
</html>

