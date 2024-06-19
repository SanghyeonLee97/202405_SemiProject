<%@page import="DTO.ProductInquiryDTO"%>
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
				<header>1:1 문의</header>
				<nav>section-section-nav</nav>
				<article>
					<table>
						<tr>
							<td>주문 번호</td>
							<td>문의 제목</td>
							<td>작성일</td>
							<td>처리 상태</td>
						</tr>
						<%
							ArrayList<ProductInquiryDTO> pidtoArr = 
							(ArrayList<ProductInquiryDTO>)request.getAttribute("pidtoArr");
							for(int i=0;i<pidtoArr.size();i++){
						%>
						<tr>
							<td><%=pidtoArr.get(i).getOrder_no() %></td>
							<td><%=pidtoArr.get(i).getPi_title() %></td>
							<td><%=pidtoArr.get(i).getPi_date() %></td>
							<td><%=pidtoArr.get(i).getPi_answer() %></td>
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