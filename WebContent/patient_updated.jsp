<%@ page import="java.sql.*" %>
<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:1432/motivity";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
String name=request.getParameter("name");
String blood=request.getParameter("blood");
long mobile=Long.parseLong(request.getParameter("phone"));
String mail=request.getParameter("mail");
String password=request.getParameter("password");
String gender=request.getParameter("gender");
int id=Integer.parseInt(request.getParameter("id"));
String sql="update patient set name=?,bloodgroup=?,phonenumber=?,emailid=?,password=?,gender=? where id=?";
pst=con.prepareStatement(sql);
pst.setString(1, name);
pst.setString(2,blood);
pst.setLong(3,mobile);
pst.setString(4,mail);
pst.setString(5,password);
pst.setString(6,gender);
pst.setInt(7, id);
int x=pst.executeUpdate();
if(x!=0)
	response.sendRedirect("patient_profile.jsp?msg=updated");
%>