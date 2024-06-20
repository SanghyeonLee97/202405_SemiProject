<%@page import="DTO.MyPageCouponDTO"%>
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
	table{
		border: 1px solid black;
		border-collapse: collapse;
	}
	tr,td{
		border: 1px solid black;
	}
</style>
</head>
<body>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header>쿠폰</header>
				<article>
					<table>
						<tr>
							<td>쿠폰명</td>
							<td>할인율/금액</td>
							<td>제한조건</td>
							<td>유효기간</td>
						</tr>
						<%
							ArrayList<MyPageCouponDTO> mcdtoArr = 
							(ArrayList<MyPageCouponDTO>)request.getAttribute("mcdtoArr");
							for(int i=0;i<mcdtoArr.size();i++){
						%>
						<tr>
							<td><%=mcdtoArr.get(i).getCoupon_name() %></td>
							<td><%=mcdtoArr.get(i).getCoupon_discount() %></td>
							<td><%=mcdtoArr.get(i).getCoupon_limit() %></td>
							<td><%=mcdtoArr.get(i).getCoupon_duedate() %></td>
						</tr>
						<%} %>
					</table>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>