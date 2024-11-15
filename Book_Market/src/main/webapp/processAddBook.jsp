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
	
	/* BookRepository dao=BookRepository.getInstance(); */
	
	
	/* Book newBook = new Book();
	
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(filename); */
	
	/* dao.addBook(newBook); */
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql = "insert into book values(?,?,?,?,?,?,?,?,?,?,?)";
	ps = conn.prepareStatement(sql);
	ps.setString(1, bookId);
	ps.setString(2, name);
	ps.setInt(3, price);
	ps.setString(4, author);
	ps.setString(5, description);
	ps.setString(6, publisher);
	ps.setString(7, category);
	ps.setLong(8, stock);
	ps.setString(9, releaseDate);
	ps.setString(10, condition);
	ps.setString(11, filename);
	
	ps.executeUpdate();
	
	if(ps!=null)ps.close();
	if(conn!=null)conn.close();
	
	response.sendRedirect("book_list.jsp");
	
%>