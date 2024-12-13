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
<script type="text/javascript">
	function addTocart() {
		if(confirm("도설르 장바구니에 추가하시겠습니까?")){
			documet.addform.submit();
		}else {
			documet.addform.reset();
		}
	}
</script>
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
/* 		BookRepository dao = BookRepository.getInstance();
		Book b = dao.getById(id); */
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from book where b_id = ? ";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		if(rs.next()){
	%>
	<div class="row align-items-md-stretch">
		
		<div class="col-md-5">
			<img src="<%=request.getContextPath()%>/resources/images/<%=rs.getString("b_fileName")%>" style="width:70%">
		</div>
			<div class="col-md-7">
				<h3><b><%= rs.getString("b_name") %></b></h3>
				<p> <%= rs.getString("b_description") %>
				<p> 도서코드 : <span class = "badge text-bg-danger"><%= rs.getString("b_id") %></span>
				<p> 저자 : <%= rs.getString("b_author") %></p>
				<p> 출판사 : <%= rs.getString("b_publisher") %></p>
				<p> 분류 : <%= rs.getString("b_category") %></p>
				<p> 재고수 : <%= rs.getLong("b_unitsInStock") %>
				<p> <%= rs.getString("b_description").substring(0, 60)%>...</p>
				<p> <%= NumberFormat.getInstance().format(rs.getInt("b_unitPrice")) %>원</p>
				<form name = "addform" action="./addcart.jsp?id=<%=rs.getString("b_id")%>" method="post">
					<a href="./addcart.jsp" class="btn btn-info" onclick="addTocart()">도서주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./book_list.jsp" class="btn btn-secondary">도서목록 &raquo;</a>
				</form>
			</div>
	</div>
	<%}
		if(rs != null) rs.close();
		if(ps != null) ps.close();
		if(conn != null) conn.close();%>
	<!-- 바닥글 -->
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>