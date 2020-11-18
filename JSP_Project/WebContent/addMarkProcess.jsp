<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>successfully add marks...</title>
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
		  
		   PreparedStatement stmt= conn.prepareStatement("insert into marks values (?,?,?,?)");
		   stmt.setString(1, request.getParameter("id"));
		   stmt.setString(2, request.getParameter("science"));
		   stmt.setString(3, request.getParameter("math"));
		   stmt.setString(4, request.getParameter("physic"));
		 
		   System.out.println(stmt);
		   
		   int row = stmt.executeUpdate();
		   if(row>0) {
			   out.println(row + " new student marks successfully added");
		   }   else {
			   out.println("Failed to add new marks");
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
	    //out.println("login failed");
   }
   %>
   <form method="get" action="addMark.html">
	<p><input type="submit" value="Go Back to Add More Student Marks"></p>
</form>

<form method="get" action="studentMark.jsp">
	<p><input type="submit" value="View Mark"></p>
</form>
  
</body>
</html>