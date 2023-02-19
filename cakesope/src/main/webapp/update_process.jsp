<%@ page import="java.sql.*" %>
<% 


String pname=request.getParameter("pname");
String flavor=request.getParameter("flavor");
String kg=request.getParameter("kg");

String qty=request.getParameter("qty");
String price=request.getParameter("price");

String id = request.getParameter("id");

System.out.println(id);
System.out.println(pname);
System.out.println(flavor);
System.out.println(kg);
System.out.println(qty);
System.out.println(price);

if(id != null) {
    try {
    	System.out.println("romit dobariya");
        // Set up database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cake", "root", "root");
        int personID = Integer.parseInt(id);
        // Prepare statement
        String sql = "UPDATE menu SET  pname=?, flavor=?, kg=? , qty=?, price=? WHERE menu_id=?";
        PreparedStatement ps = con.prepareStatement(sql);
  
        ps.setString(1, pname);
        ps.setString(2, flavor);
        ps.setString(3, kg);
        ps.setString(4, qty);
        ps.setString(5, price);
        ps.setInt(6, Integer.parseInt(id));

        // Execute update
        int i = ps.executeUpdate();
        if (i > 0) {
            System.out.print("Record Updated Successfully");
            response.sendRedirect("InsertMenu.jsp");
        } else {
            out.print("There is a problem in updating Record.");
        }
    } catch (Exception e) {
        // Log exception
        e.printStackTrace();

        // Set error attribute and forward to error page
        request.setAttribute("error", "An error occurred while updating the record.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
}

%>
<html>
Hello
</html>
