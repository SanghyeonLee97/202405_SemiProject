<%@page import="DTO.MyPageReserveDTO"%>
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
				<header>적립금</header>
				<nav>
					<button onclick="location.href='reserve.do'">전체</button>
					<button onclick="location.href='reserve.do?status=0'">적립</button>
					<button onclick="location.href='reserve.do?status=1'">사용</button>
				</nav>
				<article>
					<table>
						<tr>
							<td>상태</td>
							<td>적립금</td>
							<td>적립 내용</td>
							<td>주문 번호</td>
						</tr>
						<%
							ArrayList<MyPageReserveDTO> msdtoarr = 
							(ArrayList<MyPageReserveDTO>)request.getAttribute("reserve");
							for(int i=0;i<msdtoarr.size();i++){
						%>
						<tr>
							<td>
								<%
									if(msdtoarr.get(i).getPoint_status()==0){
								%>
								적립
								<%
									}else{
								%>
								사용
								<%
									}
								%>
							</td>
							<td><%=msdtoarr.get(i).getPoint_amount() %></td>
							<td><%=msdtoarr.get(i).getProduct_name() %></td>
							<td><%=msdtoarr.get(i).getOrder_no() %></td>
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