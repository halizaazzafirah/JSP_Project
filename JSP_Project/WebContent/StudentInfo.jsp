<%@ page import="java.io.*,java.util.*,java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudentInfo</title>
</head>
<body>
<h1>Student Information System</h1>
<p>
      <%
      boolean login=false;
      String driverName="com.mysql.jdbc.Driver";
      Statement statement=null;
      Connection conn = null;
      
      
      try{
    	  
    	Class.forName(driverName);
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db2?serverTimezone=UTC", "root", "1234");
        PreparedStatement stmt= conn.prepareStatement("select name from students where id=? and password=?");
        stmt.setString(1,request.getParameter("id"));
        stmt.setString(2,request.getParameter("password"));
        System.out.println(stmt);
        ResultSet rs=stmt.executeQuery();
        
        	if(rs.next()){
        		
        		login=true;
        		
        	}
        	
      } catch(Exception e){
    	  out.println(e.getMessage());
      }
      
      if(login){
      %>
      <%out.println("Hello");%>
      <%=request.getParameter("id")%>
      
      
      <%
      try{
      	statement= conn.createStatement();
      	ResultSet rs=statement.executeQuery("select id, name, department from students");
      %>
      
      <table border="1">
      <tr>
      	<th>ID</th>
      	<th>Name</th>
      	<th>Department</th>
      </tr>
      
      <%
      while(rs.next()){
      %>
      
      <tr>
      	<td><%=rs.getString("id")%></td>
      	<td><%=rs.getString("name")%></td>
      	<td><%=rs.getString("department")%></td>
      </tr>
      
      <%
      }
      %>
      </table>
      
      <p>
      <a href="addStudent.html"><button type='addStudent'>Add Student</button></a>
      <a href="viewMark.jsp?<%=request.getParameter("id")%>"><button type='marks'>View Marks</button></a>
      </p>
      
      <%
      } catch(Exception e){
      out.println(e.getMessage());
      }
      }else{
      %>
      <p>login failed</p>	
      <%
      }
      %>
</p>
</body>
</html>