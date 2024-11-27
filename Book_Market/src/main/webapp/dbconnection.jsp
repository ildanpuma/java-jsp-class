<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Connection conn = null;
	try {
		String url = "jdbc:mysql://localhost:3306/bookmarketdb";
		String user = "root";
		String password = "admin";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
		out.println("DB 연결 성공<br>");
	}
	catch (SQLException e){
		out.println("DB 연결 실패<br>");
		e.getMessage();
	}
%>