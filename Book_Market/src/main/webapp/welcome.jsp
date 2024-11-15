<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*" %>
    <%@ page import ="java.text.*" %>
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
			<h1 class="display-5 fw-bold"><%= greeting %></h1>
			<p class="col-md-8 fs-4">BookMarket</p>
		</div>
	</div>

	<%
		Date dateNow = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		response.setIntHeader("time", 1);
	%>
	<div class="row align-items-md-stretch text-center">
		<div class="col-md-12">
			<div class="h-100 p-5">
				<h3><%= tagline %></h3>
				<h5 name="time">접속시간 : <%= sdf.format(dateNow) %></h5>
			</div>
		</div>
	</div>
	<!-- 바닥글 -->
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>