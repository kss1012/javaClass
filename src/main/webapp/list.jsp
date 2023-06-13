<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String url = "jdbc:mariadb://localhost:3307/jspdb";
	String user = "root";
	String pass = "maria";
	Class.forName("org.mariadb.jdbc.Driver");
	//System.out.println("드라이버 로딩!");
	Connection con = DriverManager.getConnection(url, user, pass);
	//System.out.println("접속 성공!");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
<%
Statement stmt = con.createStatement();
String sql = "select * from person";
ResultSet rs = stmt.executeQuery(sql);
while(rs.next()){
	int id = rs.getInt("id");
	String name = rs.getString("name");
	String addr = rs.getString("addr");
	String phone = rs.getString("phone");
	
%>	
<tr>
<td><%=id %></td>
<td><a href="updateForm.jsp?id=<%=id %>"><%=name %></a></td>
<td><%=addr %></td>
<td><%=phone %></td>
</tr>
<%} %>
</table>
</body>
</html>
















