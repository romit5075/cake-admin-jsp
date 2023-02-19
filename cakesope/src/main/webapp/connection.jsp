<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd"> 

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head> 
</head> 
<body>

<% 
try{
	
	 Connection con = null;	
	 
	//Class.forName("com.mysql.jdbc.Driver");  
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cake","root","root");
	 if(con != null){
		 System.out.println("Conect");
	 }
}
catch(Exception ex){
	System.out.println(ex);
}
%>

</body> 
</html>