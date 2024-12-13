<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*" %>
    <%@ page import ="java.text.*" %>
    <%@ page import ="dto.*" %>
    <%@ page import ="dao.*" %>
    <%@ include file="dbconnection.jsp" %>
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
			<h1 class="display-5 fw-bold">로그인 페이지</h1>
			<p class="col-md-8 fs-4">login page</p>
		</div>
	</div>
	<%-- 본문영역 --%>
	
	<div class="row align-items-md-stretch text-center">
	<div class="row justify content-center align-items-center">
			<div class="h-10 p-5 md-6">
				<h3>Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("id 와 비밀번호를 확인해주세요.");
					out.println("</div>");
				}
			%>	
				
			</div>
			<form action="j_security_check" method = "post" class="form-singin">
				<div class="form-floating mb-3 row">
					<input type="text" name="j_username" class="form=control" value="id">
				</div>
				
				<div class="form-floating mb-3 row">
					<input type="password" name="j_password" class="form=control" value="id">
				</div>
				
				<button type="submit" class=""btn btn-success>로그인</button>
			</form>
			</div>
		</div>
	</div>
	<!-- 바닥글 -->
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>