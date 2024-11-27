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
<title>도서 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<!-- 메뉴영역 -->
	<div class="container py-4">
		<!-- 디렉티브 태그 -->
		<%@ include file = "menu.jsp" %>
	<!-- 중간타이틀 -->
	<div class="p-5 mb-4 text-bg-primary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">도서 수정하기</h1>
			<p class="col-md-8 fs-4">BookEdit</p>
		</div>
	</div>
	<%-- 본문영역 --%>
	<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean> --%>
	<% 
		/* BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks(); */
		String bookId=request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM book WHERE b_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookId);
		rs = pstmt.executeQuery();
		if(rs.next()){

	%>
	<div class = "row align-items-md-stretch">
		<div class = "col-md-5">
			<img src = "<%=request.getContextPath()%>/resources/images/<%=rs.getString("b_filename")%>" alt = "image" style = "width: 100%">
		</div>
		<div class = "col-md-7">
			<form name = "newBook" action = "./processUpdateBook.jsp" method = "post" enctype = "multipart/form-data">
				<div class = "mb-3 row">
					<label class="col-sm-2">도서코드</label>
					<div class="col-sm-5">
						<input type="text" name="bookId" id="bookId" class"form-control" value="<%=rs.getString("b_id")%>">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">도서명</label>
					<div class="col-sm-5">
						<input class="text" name="name" id="name" class="form-control" value="<%=rs.getString("b_name")%>">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">가격</label>
					<div class="col-sm-5">
						<input class="text" name="unitPrice" id="unitPrice" class="form-control" value="<%=rs.getInt("b_unitPrice")%>">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">저자</label>
					<div class="col-sm-5">
						<input class="text" name="author" id="author" class="form-control" value="<%=rs.getString("b_author")%>">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">출판사</label>
					<div class="col-sm-5">
						<input class="text" name="publisher" id="publisher" class="form-control" value="<%=rs.getString("b_publisher")%>">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">출판일</label>
					<div class="col-sm-5">
						<input class="text" name="releaseDate" id="releaseDate" class="form-control" value="<%=rs.getString("b_releaseDate")%>">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">상세정보</label>
					<div class="col-sm-58">
						<textarea name="description" cols="50" rows="2" class="form-control" 
						placeholder="100자 이상 적어주세요"><%=rs.getString("b_description")%></textarea>
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">재고수</label>
					<div class="col-sm-5">
						<input class="text" name="unitsInStock" id="unitsInStock" class="form-control" value="<%=rs.getLong("b_unitsInStock")%>">
					</div>
				</div>

				<div class="mb-3 row">
					<label class="col-sm-2">분류</label>
					<div class="col-sm-5">
						<input class="text" name="category" id="category" class="form-control" value="<%=rs.getString("b_category")%>">
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">상태</label>
					<div class="col-sm-8">
						<input type="radio" name="condition" value="New" <%= rs.getString("b_condition").equals("New") ? "checked" : "" %>> 신규도서
						<input type="radio" name="condition" value="Old" <%= rs.getString("b_condition").equals("Old") ? "checked" : "" %>> 중고도서
						<input type="radio" name="condition" value="Ebook" <%= rs.getString("b_condition").equals("Ebook") ? "checked" : "" %>> E-Book
					</div>
				</div>
				
				<div class="mb-3 row">
					<label class="col-sm-2">이미지</label>
					<div class="col-sm-8">
						<input type="file" name="BookImage" class="form-control">
					</div>
				</div>
				
				<div class="mb-3 row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="등록">
					</div>
				</div>
			</form>
		</div>
	<%
		}
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	%>
	</div>
	<!-- 바닥글 -->
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>