<%@page import="DTO.MyPageCancelDTO"%>
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
<style type="text/css">
</style>
</head>
<body>
	<%
		
		ArrayList<MyPageCancelDTO> mcdtoArr = 
		(ArrayList<MyPageCancelDTO>)request.getAttribute("cancel");
	%>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header>취소/반품/교환</header>
				<article>
					<%
						for(int i=0;i<mcdtoArr.size();i++){
					%>
					<%=mcdtoArr.get(i).getProduct_name() %><br>
					<%=mcdtoArr.get(i).getProduct_price() %>원<br>
					<%=mcdtoArr.get(i).getOrder_date() %> 구매<br>
					<%=mcdtoArr.get(i).getOrder_quantity() %> 개<br>
					주문번호 <%=mcdtoArr.get(i).getOrder_no() %><br>
					<%
							switch(mcdtoArr.get(i).getStatus()){
							case 0:
					%>
					<button onclick="location.href='cancelrefund.do?order_no=<%=mcdtoArr.get(i).getOrder_no() %>'">
					
					<%			break;
							case 1:
					%>
					취소완료<br>
					<% 			break;
							case 2:
					%>
					배송완료<br>
					<button onclick="location.href='cancelrefund.do?order_no=<%=mcdtoArr.get(i).getOrder_no() %>'">
					상품 문의</button><br>
					<%			break;
							}%>
					<br>
					<%	}%>
					
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>