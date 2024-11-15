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
			<h1 class="display-5 fw-bold">도서상세정보</h1>
			<p class="col-md-8 fs-4">Book Detail Informations</p>
		</div>
	</div>

	<%--  <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean> --%>
	<% 
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book b = dao.getById(id);
	%>
	<div class="row align-items-md-stretch">
		
		<div class="col-md-5">
			<img src="<%=request.getContextPath()%>/resources/images/<%=b.getFilename()%>" style="width:70%">
		</div>
			<div class="col-md-7">
				<h3><b><%= b.getName() %></b></h3>
				<p> <%= b.getDescription() %>
				<p> 도서코드 : <span class = "badge text-bg-danger"><%= b.getBookId() %></span>
				<p> 저자 : <%= b.getAuthor() %></p>
				<p> 출판사 : <%= b.getPublisher() %></p>
				<p> 분류 : <%= b.getCategory() %></p>
				<p> 재고수 : <%= b.getUnitsInStock() %>
				<p> <%= b.getDescription().substring(0, 60)%>...</p>
				<p> <%= NumberFormat.getInstance().format(b.getUnitPrice()) %>원</p>
				<p><a href="#" class="btn btn-info">도서주문 &raquo;</a>
				<p><a href="./book_list.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
			</div>
	</div>
	<!-- 바닥글 -->
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>