<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<header class="pb-3 mb-4 border-bottom">
	<div class="container text-bg-white">
	<div class="d-flex">
		<a href="./welcome.jsp" class="d-flex align-items-center text-dark text-decoration-none">
			<i class="fa-solid fa-house"></i>&nbsp;
			<span class="fs-4">HOME</span>
		</a>
		
		<ul class="nav">
		  <li class="nav-item">
		    <a class="nav-link" href="book_list.jsp">도서목록</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="./addBook.jsp">도서등록</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="./editBook.jsp?edit=update">도서수정</a>
		  </li>
		</ul>
		</div>
	</div>
	</header>
</body>
</html>