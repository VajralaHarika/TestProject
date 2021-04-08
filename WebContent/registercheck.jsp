<%@page import="java.sql.*"%>
<% 

try
    {
      Connection con=null;
      Class.forName("com.mysql.cj.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ess", "root","root");
    PreparedStatement pst=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?)"); 
    pst.setInt(1,0);
    pst.setString(2,request.getParameter("fname")); 
    pst.setString(3,request.getParameter("lname"));
    pst.setString(4,request.getParameter("email"));
    pst.setString(5,request.getParameter("passwd"));
    pst.setString(6,request.getParameter("gender"));
    pst.setString(7,request.getParameter("city"));
    pst.setString(8,request.getParameter("country"));
    pst.executeUpdate();
    pst.close(); 
    con.close(); 
    response.sendRedirect("index.html");
    }
    catch(Exception e)
    {
      System.out.println(e);
    }
    
%>