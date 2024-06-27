<%@page import="DTO.mypage.MyPageCancelDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 100%;
	}
	
	tr{
		text-align: center;
		border-bottom: 1px solid #ccc;
	}
</style>
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
				<table>
					<tr>
						<th></th>
						<th>상품명</th>
						<th>상품가격</th>
						<th>구매날짜</th>
						<th>구매수량</th>
						<th>주문번호</th>
						<th>진행상태</th>
					</tr>
						<%
							for(int i=0;i<mcdtoArr.size();i++){
						%>
					<tr>	
						<td>
							<div>
								<img src=<%=mcdtoArr.get(i).getProduct_imgurl() %> alt="상품이미지(product_imgurl)" width="100px" height="100px">
							</div>
						</td>	
						<td><%=mcdtoArr.get(i).getProduct_name() %></td>
						<td><%=mcdtoArr.get(i).getProduct_price() %>원</td>
						<td><%=mcdtoArr.get(i).getOrder_date() %> 구매</td>
						<td><%=mcdtoArr.get(i).getOrder_quantity() %> 개</td>
						<td><%=mcdtoArr.get(i).getOrder_no() %></td>
						<%
								switch(mcdtoArr.get(i).getStatus()){
								case 0:
						%>
						<td><button onclick="location.href='cancelrefund.do?order_no=<%=mcdtoArr.get(i).getOrder_no() %>'">
						주문 취소</button><br></td>
						<%			break;
								case 1:
						%>
						<td>취소완료<br></td>
						<% 			break;
								case 2:
						%>
						<td>배송완료<br>
						<button onclick="location.href='productinquiry.do?order_no=<%=mcdtoArr.get(i).getOrder_no() %>'">
						상품 문의</button><br></td>
						<%			break;
								}%>
						<%	}%>
					</tr>
				</table>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>