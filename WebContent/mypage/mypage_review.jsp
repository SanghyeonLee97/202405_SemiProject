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
<link href="../css/mypage.css?after" rel="stylesheet" type="text/css">
<style type="text/css">

	#reviewbt{
	
		width: 50px;
		height: 30px;
		margin-right : 15px;
		background: yellow;
		border: none;
		margin-top: 15px;
	
	}


</style>
</head>
<body>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header><h3>리뷰</h3></header>
				<nav>
					<button id="reviewbt">최근</button>
					<button id="reviewbt">1개월</button>
					<button id="reviewbt">3개월</button>
					<button id="reviewbt">6개월</button>
					<button id="reviewbt">1년</button>
					<input type="date" value="2024-06-01">
					~
					<input type="date" value="2024-07-30">
					<input id="reviewbt" type="button" value="조회">
				</nav>
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