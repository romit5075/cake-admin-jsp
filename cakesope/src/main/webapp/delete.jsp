
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%
	int id = Integer.parseInt(request.getParameter("id"));

try{
    Connection con = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/cake", "root", "root");

    PreparedStatement pst = con.prepareStatement("DELETE FROM menu WHERE menu_id = ?");
    pst.setInt(1, id);
    int i = pst.executeUpdate();

    if(i > 0){
      response.sendRedirect("InsertMenu.jsp");
    } else {
    	out.println("Data is not getting Deleted");
    }

  } catch(Exception e){
    out.println(e);
  }
%>