<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
</head>
<body>
	<!-- 메뉴영역 -->
	<div class="container py-4">
		<!-- 디렉티브 태그 -->
		<%@ include file = "menu.jsp" %>
	<!-- 중간타이틀 -->
	<div class="p-5 mb-4 text-bg-primary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서등록</h1>
			<p class="col-md-8 fs-4">Book Addtion</p>
		</div>
	</div>
	<a href="logout.jsp" class="btn btn-success pull right">logout</a>
	<div class="row align-items-md-stretch">
		<form name="newBook" action="processAddBook.jsp" method="post" enctype="multipart/form-data">
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "bookId"/></label>
				<div class="col-sm-3">
					<input type="text" id="bookId" name="bookId" class="form-control">
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "name"/></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "author"/></label>
				<div class="col-sm-3">
					<input type="text" id="author" name="author" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "publisher"/></label>
				<div class="col-sm-3">
					<input type="text" id="publisher" name="publisher" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "releaseDate"/></label>
				<div class="col-sm-3">
					<input type="text" id="releaseDate" name="releaseDate" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "description"/></label>
				<div class="col-sm-5">
					<textarea id="name" name="description" cols="50" rows="2" class="form-control" placeholder="100자 이상 적어주세요"></textarea>
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "category"/></label>
				<div class="col-sm-3">
					<input id="name" type="text" name="category" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "unitsInStock"/></label>
				<div class="col-sm-3">
					<input id="unitsInStock" type="text" name="unitsInStock" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New"> <fmt:message key = "condition_New"/>
					<input type="radio" name="condition" value="Old"> <fmt:message key = "condition_Old"/>
					<input type="radio" name="condition" value="Ebook"> <fmt:message key = "condition_Ebook"/>
				</div>
			</div>

			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key = "BookImage"/></label>
				<div class="col-sm-5">
					<input id="BookImage" type="file" name="BookImage" class="form-control">
				</div>
			</div>

			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="<fmt:message key = "button"/>" onclick=CheckAddBook()>
				</div>
			</div>
		</form>
	</div>
	<!-- 바닥글 -->
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>