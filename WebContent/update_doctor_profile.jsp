<%@ page import="java.sql.*" %>
<html>
<center>
<h2> Update Doctor Profile</h2>
</center>
<body bgcolor="grey">
<%
Connection con=null;
PreparedStatement pst=null;
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:1432/motivity";
String user="root";
String pwd="root";
con=DriverManager.getConnection(url,user,pwd);
int id=Integer.parseInt(request.getParameter("id"));
pst=con.prepareStatement("Select * from doctor where id=?");
pst.setInt(1,id);
ResultSet set=pst.executeQuery();
if(set.next()){
%>
<form action="./doctor_updated.jsp"  align="center">
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
<td>specialization</td>
<td>:</td>
<td><select name="specialization">
<option value="<%=set.getString("specialization")%>"><%=set.getString("specialization")%></option>
<option>--select from list---</option>
<option value="cardiaologist">Cardiaologist</option>
<option value="neurologist">Neurologist</option>
<option value="gatro-enterologist">Gatro-enterologist</option>
<option value="nephrologist">Nephrologist</option>
<option value="rheuamatologist">Rheuamatologist</option>
<option value="oncologist">Oncologist</option>
<option value="pulmonologist">Pulmonologist</option>
<option value="gynocologist">Gynocologist</option>
<option value="opthomologist">Opthomologist</option></select>
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
<td><input type="text" name="password" /></td>
</tr>
<tr>
<td>Country</td>
<td>:</td>
<td><select name="country"> 
<option value="<%=set.getString("country")%>"><%=set.getString("country")%></option>
<option value="India">India</option>
<option value="Germany">Germany</option>  
<option value="China">China</option>
<option value="Australia">Australia</option> 
<option value="U.K">U.K</option>  
</select> </td>
</tr>
<tr>
<td>Gender</td>
<td>:</td>
<td><input type="radio"  name="gender" value="male" checked="<%=set.getString("gender") %>"required>male
<input type="radio"  name="gender" value="female" required>female</td>
</tr>
<tr>
<td>Age </td>
<td>:</td>
<td><input type="number" name="age" value="<%=set.getInt("age")%>" /></td>
</tr>
<tr>
<td>Working Time </td>
<td>:</td>
<td><input type="text" name="time" value="<%=set.getString("workingdays") %>" /></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="Update" style="color:black"/></td>
</tr>

<%} %>
</table>
</form>
</body>
</html>