<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.awt.DefaultFocusTraversalPolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dto.Book" %>
<%@ page import = "dao.BookRepository" %>
<%@ include file = "dbconnection.jsp" %>

<% 
	request.setCharacterEncoding("UTF-8");
	
	String bookId = request.getParameter("id");
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql = "select * from book where b_id=?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, bookId);
	rs=ps.executeQuery();
	
	if(rs.next()) {
		sql="delete from book where b_id=?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, bookId);
		ps.executeUpdate();
	}
	else {
		out.println("<script>alert('일치하는 도서가 없습니다.'); history.back();</script>");
	}
	
	
	if(ps!=null)ps.close();
	if(rs!=null)rs.close();
	if(conn!=null)conn.close();
	
	response.sendRedirect("editBook.jsp?edit=delete");
	
%>