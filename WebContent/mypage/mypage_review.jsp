<%@page import="DTO.mypage.MyPageReviewDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
</head>
<body>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header>리뷰</header>
				<nav>section-section-nav</nav>
				<article>
					<%
						ArrayList<MyPageReviewDTO> mrdtoArr = 
						(ArrayList<MyPageReviewDTO>)request.getAttribute("mrdtoArr");
						for(int i=0;i<mrdtoArr.size();i++){
					%>
					<img alt="" src="<%=mrdtoArr.get(i).getProduct_imgurl() %>"><br>
					주문번호 <%=mrdtoArr.get(i).getOrder_no() %><br>
					<%=mrdtoArr.get(i).getProduct_name() %><br>
					<%=mrdtoArr.get(i).getProduct_price()*mrdtoArr.get(i).getOrder_quantity() %>원<br>
					수량: <%=mrdtoArr.get(i).getOrder_quantity() %><br>
					<%=mrdtoArr.get(i).getReview_rating() %>점<br>
					<%=mrdtoArr.get(i).getReview_title() %><br>
					<%=mrdtoArr.get(i).getReview_content()%><br>
					<%=mrdtoArr.get(i).getReview_date()%><br>
					<br>
					<%
						}
					%>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>