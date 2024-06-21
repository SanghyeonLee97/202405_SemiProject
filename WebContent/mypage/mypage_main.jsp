<%@page import="DTO.mypage.MyPageMainDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommunityDAO"%>
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
				<header>주문/배송</header>
				<nav>section-section-nav</nav>
				<article>
					<%
						CommunityDAO cdao = new CommunityDAO();
						int userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
						ArrayList<MyPageMainDTO> mmdtoArr = mdao.getMypageMain(userNo);
						for(int i=0;i<mmdtoArr.size();i++){
					%>
					<img alt="" src="<%=mmdtoArr.get(i).getProduct_imgurl() %>"><br>
					<%=mmdtoArr.get(i).getProduct_name() %><br>
					<%=mmdtoArr.get(i).getProduct_price()*mmdtoArr.get(i).getOrder_quantity() %>원<br>
					수량: <%=mmdtoArr.get(i).getOrder_quantity() %><br>
					주문번호: <%=mmdtoArr.get(i).getOrder_no() %><br>
					<%
							switch(mmdtoArr.get(i).getStatus()){
								case 0:
					%>
					<button type="button">배송조회</button>
					<%
								break;
								case 1:
					%>
					주문취소
					<% 
								break;
								case 2:
					%>
					<button type="button" onclick="location.href='mypagewritereview.do?order_no=<%=mmdtoArr.get(i).getOrder_no() %>'">
					리뷰작성</button>
					<%
								break;
							}
					%>
					<br>
					<%} %>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>