<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

//DB 접속
	String sid = request.getParameter("id");
int mid = Integer.parseInt(sid);
	String url = "jdbc:mariadb://localhost:3307/jspdb";
	String user = "root";
	String pass = "maria";
	Class.forName("org.mariadb.jdbc.Driver");
	//System.out.println("드라이버 로딩!");
	Connection con = DriverManager.getConnection(url, user, pass);
	//System.out.println("접속 성공!");
	Statement stmt = con.createStatement();
String sql = "select * from person where id = "+mid;
ResultSet rs = stmt.executeQuery(sql);
int id = 0;
String name = "";
String addr = "";
String phone = "";

if(rs.next()){
	id = rs.getInt("id");
	name = rs.getString("name");
	addr = rs.getString("addr");
	phone = rs.getString("phone");
}
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자료 입력</h2>

<form action= "update.jsp">

<table border="1">
<tr>
       <td><label for="name">이름:</label></td>
       <td><input type="text"  name="name" value="<%=name %>"></td>
        
       <td><label for="addr">주소:</label></td>
        <td><input type="text" name="addr" value="<%=addr %>"></td>
        
         <td><label for="phone">전화번호:</label></td>
        <td><input type="text" name="phone" value="<%=phone %>"></td>
        
        <input type="submit" value="제출">
        </tr>
</form>
    
    </table>
   
</body>
</html>