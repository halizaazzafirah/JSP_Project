<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>successfully add new student...</title>
</head>
<body>
<p>

    <%
      boolean login=false;
      String driverName="com.mysql.jdbc.Driver";
      Statement statement=null;
      Connection conn = null;
      
      
      try {
	    	login=true;
	    	//load the jdbc driver
	    	Class.forName(driverName);
			//connect to the database server	   
		    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2?serverTimezone=UTC", "root", "1234");
			
	    } catch(Exception e) {
	    	out.println(e.getMessage());
	    }
		       
    if(login) {
	   try {
		   //update password
		   PreparedStatement stmt= conn.prepareStatement("insert into students values (?,?,?,?)");
		   stmt.setString(1, request.getParameter("id"));
		   stmt.setString(2, request.getParameter("name"));
		   stmt.setString(3, request.getParameter("password"));
		   stmt.setString(4, request.getParameter("department"));
		 
		   System.out.println(stmt);
		   
		   int row = stmt.executeUpdate();
		   if(row>0) {
			   out.println(row + " new student successfully added");
			   %>
			    <p><a href="Index.html"><button type='Index'>Back</button></a><p>
			   <%
		   }   else {
			   out.println("Failed to add new student");
		   }
		   
   %>
   
   <% 
	   } catch(Exception e) {
	    	out.println(e.getMessage());
	    }
   } else {
   %>
	    <p>login failed</p>
	    <% 
   }
   %>
   </p>

</body>
</html>