<%@ page import="java.io.*,java.util.*,java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Student Marks</title>
  </head>
  <body>
  <h1>Student Average marks</h1>
    
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
		    statement = conn.createStatement();
		    ResultSet rs = statement.executeQuery("select * from marks");    
	%>
	 <table border="1">
          <tr>
          	<th>ID</th>
          	<th>Science</th>
          	<th>Mathematics</th>
          	<th>Physic</th>
          	<th>Average</th>
          
          </tr>
          
          <%
          while(rs.next()){
        	  String science="";
        	  String mathematic="";
        	  String physic="";
        	  int average=0;
        	  
          %>
  
          <tr>
          	<td><%=rs.getString("id")%></td>
          	<td><%=science=rs.getString("science")%></td>
          	<td><%=mathematic=rs.getString("mathematic")%></td>
          	<td><%=physic=rs.getString("physic")%></td>
          	<td><%=average=(Integer.parseInt(science)+ Integer.parseInt(mathematic)+ Integer.parseInt(physic))/3%></td>
          	
          </tr>
          
          <%
          }
          %>
          </table>
	  	<p> <a href="addMark.jsp"><button type='addMark'>Add New Student Marks</button></a></p>
	  	
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
    
   
  </body>
</html>