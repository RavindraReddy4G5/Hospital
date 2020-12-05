<%@ page import="java.sql.*" %>
<html>
<center>
<h2> Update Patient Details</h2>
</center>
<body bgcolor="green">
<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:1432/motivity";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
int id=Integer.parseInt(request.getParameter("id"));
pst=con.prepareStatement("Select * from patient where id=?");
pst.setInt(1,id);
ResultSet set=pst.executeQuery();
if(set.next()){
%>
<form action="./patient_updated.jsp"  align="center">
<table align="center">
<tr>
<td>Id</td>
<td>:</td>
<td><input type="hidden" name="id" value="<%=set.getInt("id") %>" ></td>
</tr>
<tr>
<td>Name</td>
<td>:</td>
<td> <input type="text" name="name" value="<%=set.getString("name") %>"></td>
</tr>
<tr>
<td>Bloodgroup</td>
<td>:</td>
<td><select name="blood">
<option value="<%=set.getString("bloodgroup")%>"><%=set.getString("bloodgroup")%></option>
<option>--select from list---</option>
<option value="A+">A+</option>
<option value="B+">B+</option>
<option value="O+">O+</option>
<option value="AB+">AB+</option>
<option value="O-">O-</option>
<option value="AB-">AB-</option>
</select>
</td>
</tr>
<tr>
<td>phoneNumber</td>
<td>:</td>
<td> <input type="number" name="phone" value="<%=set.getInt("phonenumber") %>"></td>
</tr>
<tr>
<td>Mail id</td>
<td>:</td>
<td><input type="email" name="mail" value="<%=set.getString("emailid") %>" /></td>
</tr>
<tr>
<td>Password</td>
<td>:</td>
<td><input type="text" name="password" value="<%=set.getString("password") %>"/></td>
</tr>
<tr>
<td>Gender</td>
<td>:</td>
<td><input type="radio"  name="gender" value="male" checked="<%=set.getString("gender") %>"required>male
<input type="radio"  name="gender" value="female" required>female</td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="Update"/></td>
</tr>

<%} %>
</table>
</form>
</body>
</html>