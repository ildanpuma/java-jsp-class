<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*" %>
    <%@ page import ="java.text.*" %>
    <%@ page import ="dto.*" %>
    <%@ page import ="dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<!-- 메뉴영역 -->
	<div class="container py-4">
		<!-- 디렉티브 태그 -->
		<%@ include file = "menu.jsp" %>
	<!-- 선언문태그 -->
	<%! 
		String greeting = "도서 쇼핑몰에 오신 것을 환영합니다.";
		String tagline = "Welcome to Web Market!";
	%>
	<!-- 중간타이틀 -->
	<div class="p-5 mb-4 text-bg-primary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서목록</h1>
			<p class="col-md-8 fs-4">BookList</p>
		</div>
	</div>

	<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean> --%>
	<% 
		BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	<div class="row align-items-md-stretch text-center">
		<%
		for(int i = 0; i < listOfBooks.size(); i++){
			Book b = listOfBooks.get(i);
		%>
		<div class="col-md-4">
			<div class="h-100 p-5">
				<img alt="표지" src="<%=request.getContextPath()%>/resources/images/<%=b.getFilename()%>" 
				style="width:250px; height:350px">
				<h3><%= b.getName() %></h3>
				<p> <%= b.getAuthor() %></p>
				<p> <%= b.getPublisher() %></p>
				<p> <%= b.getDescription().substring(0, 60)%>...</p>
				<p> <%= NumberFormat.getInstance().format(b.getUnitPrice()) %>원</p>
				<p><a href="book_detail.jsp?id=<%=b.getBookId()%>" class="btn btn-secondary">상세정보&raquo;</a>
			</div>
		</div>
		<% } %>
	</div>
	<!-- 바닥글 -->
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>