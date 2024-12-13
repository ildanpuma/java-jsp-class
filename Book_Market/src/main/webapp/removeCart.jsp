<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@page import="java.util.ArrayList"%>

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("./exceptionNoBookId.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();			
	Book goods = dao.getById(id);
	if(goods == null)
		response.sendRedirect("./exceptionNoBookId.jsp");
	
		
	// 세션 속성 이름 cartlist(장바구니)의 세션 정보를 얻어와 ArratList객체에 저장
	ArrayList<Book> lists = (ArrayList<Book>)session.getAttribute("cartlist");
	Book b = new Book();
	for(int i = 0; i < lists.size(); i++){
		b = lists.get(i);
		if( b.getBookId().equals(id))
			lists.remove(b);
	}
	response.sendRedirect("./cart.jsp");
%>