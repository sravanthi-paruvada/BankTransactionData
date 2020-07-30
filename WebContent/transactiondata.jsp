<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>transaction page</title>
<style>
table{
width:1000px;
border-collapse: collapse;
}
table, tr, td{
border: 1px solid black;
}
td, tr{
padding: 30px;
text-align:center;
}
.g
{
padding: 100px;
align: left;
}
ul
{
list-style-type:none;
margin:0;padding:0;
overflow:hidden;
background-color:black;
color:white;
font-size: 50px;
}
ul1
{
list-style-type:none;
margin:0;padding:0;
overflow:hidden;
background-color:white;
color:white;
font-size: 50px;
}
li{
float:center;
display:inline-block;
}
table1{
width:1000px;
border-collapse: collapse;
}
td, tr{
padding: 30px;
text-align:center;
}
.submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #9C27B0, #E040FB);
        border: 0;
        padding-left: 30px;
        padding-right: 20px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 10%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.4);
        margin-right:10%;
    }
</style>
</head>
<body>
<ul>
<center>
<li>
<li>TRANSACTION DETAILS</li></center>
</ul>
<ul1><li> ..</li></ul1>
<center>
<table1>
<center>
<tr>
<td><a href="Transaction"><button class="submit" type="button">FUND TRANSFER</button></a></td>
<td><strong>ACCOUNT BALNCE:
 <%
 try{
	 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
    Statement stmt =con.createStatement(); 
	String que1 = "select balanceAmount from TransactionDetails2 ORDER BY id DESC LIMIT 1";
	ResultSet resultset1 = stmt.executeQuery(que1);
	int i=0;
	while(resultset1.next()){
		%>
		<%=resultset1.getInt(1)%></strong></td></tr></center></table1>
		<%
		i++;
	}
	%>
<table>
<tr>
<thead>
<td><strong>ID</strong></td>
<td><strong>accountNo</strong></td>
<td><strong>transactionAmount</strong></td>
<td><strong>balanceAmount</strong></td>
</thead>
</tr>
<% 
	String que2 = "select * from TransactionDetails2 ORDER BY id DESC LIMIT 5";
	ResultSet resultset2 = stmt.executeQuery(que2);
	int j=0;
	while(resultset2.next()){
		%>
		<tbody>
		<tr >
		<td><%=resultset2.getInt(1) %></td>
		<td><%=resultset2.getString(2) %></td>
		<td><%=resultset2.getInt(3) %></td>
		<td><%=resultset2.getInt(4) %></td>
		
		</tr>
		</tbody>
<% 
j++;
	}
	}
 catch(Exception e)
 {
	 e.printStackTrace();

 }
 %>
 </table>
 </center>
</body>
</html>

