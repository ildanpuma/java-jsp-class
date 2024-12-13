<%@page import="dto.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String id = request.getParameter("id");
	if(id==null){
		response.sendRedirect("exceptionNoBookId.jsp");
		return;
	}
	
	//db연결 안한 버전
	BookRepository dao = BookRepository.getInstance();
	Book good = dao.getById(id);
	if(good == null){
		out.println("선택한 도서정보가 없습니다.");
	}
%>