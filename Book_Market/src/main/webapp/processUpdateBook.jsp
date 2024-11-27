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
	//String savePath = "./resources/images/";
	String savePath = application.getRealPath("./resources/images/");
	int maxSize = 10*1024*1024;
	String encoding = "utf-8";
	DefaultFileRenamePolicy df = new DefaultFileRenamePolicy();
	MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, df);
	String bookId = multi.getParameter("bookId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Enumeration<?> en = multi.getFileNames();
	String fname = (String)en.nextElement();
	String filename = multi.getFilesystemName(fname);
	
	Integer price;
	if(unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);
	
	long stock;
	if(unitsInStock.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitsInStock);
	
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql = "select * from book where b_id=?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, bookId);
	rs=ps.executeQuery();
	
	if(rs.next()) {
		if(filename!=null) {
			sql="update book set b_fileName=?, b_name=?, b_unitPrice=?, b_author=?, b_description=?, "
				+ "b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=? "
				+ "where b_id=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, filename);
			ps.setString(2, name);
			ps.setInt(3, price);
			ps.setString(4, author);
			ps.setString(5, description);
			ps.setString(6, publisher);
			ps.setString(7, category);
			ps.setLong(8, stock);
			ps.setString(9, releaseDate);
			ps.setString(10, condition);
			ps.setString(11, bookId);
			
			ps.executeUpdate();
		}
		
		else {
			sql="update book set b_name=?, b_unitPrice=?, b_author=?, b_description=?, "
				+ "b_publisher=?, b_category=?, b_unitsInStock=?, b_releaseDate=?, b_condition=? "
				+ "where b_id=?";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setInt(2, price);
			ps.setString(3, author);
			ps.setString(4, description);
			ps.setString(5, publisher);
			ps.setString(6, category);
			ps.setLong(7, stock);
			ps.setString(8, releaseDate);
			ps.setString(9, condition);
			ps.setString(10, bookId);
			
			ps.executeUpdate();
		}
	}
	
	
	if(ps!=null)ps.close();
	if(conn!=null)conn.close();
	
	response.sendRedirect("editBook.jsp?edit=update");
	
%>