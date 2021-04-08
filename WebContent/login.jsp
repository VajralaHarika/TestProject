<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("uname");
String pwd = request.getParameter("passwd");

try
{
	Connection con=null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("Driver Class Loaded");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ess", "root","root");
	System.out.println("Connection Established");	  
	  PreparedStatement pstmt = con.prepareStatement("select * from registration where email=? and password=?");
	  pstmt.setString(1,email);
	  pstmt.setString(2,pwd);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		
		response.sendRedirect("student.html");
	  }
	  else
	  {
		  %>
		<center>	<h3>Invalid Email or Password</h3></center><br>
	 <center> <a href="login.html"> 
      <button class="btn btn-secondary"> 
           Try Again
        </button> 
    </a> </center>
    
 
			<% 
	  }
}
catch(Exception e)
{
	out.println(e);
}

%>