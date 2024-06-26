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
<link href="../css/mypage.css?after" rel="stylesheet" type="text/css">
<style type="text/css">
	
	#mainbt{
	
		width: 50px;
		height: 30px;
		margin-right : 15px;
		background: yellow;
		border: none;
		margin-top: 15px;
	
	}
	#mypmain {
		display: flex;
		justify-content :space-between;
		
		
	
	}

	#mypdeliverybt{
		width: 100px;
		height: 40px;
		position: relative;
		right: 100px;
		top: 40px;
		background: #FAFAD2;
		border: none;
	} 
	
	
</style>
</head>
<body>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header><h3>주문/배송</h3></header>
				<nav>
					<button id="mainbt">최근</button>
					<button id="mainbt">1개월</button>
					<button id="mainbt">3개월</button>
					<button id="mainbt">6개월</button>
					<button id="mainbt">1년</button>
					<input type="date" value="2024-06-01">
					~
					<input type="date" value="2024-07-30">
					<input id="mainbt" type="button" value="조회">
				</nav>
					<%
						CommunityDAO cdao = new CommunityDAO();
						int userNo = cdao.getCustomerNo((String)session.getAttribute("id"));
						ArrayList<MyPageMainDTO> mmdtoArr = mdao.getMypageMain(userNo);
						for(int i=0;i<mmdtoArr.size();i++){
					%>
					<article id="mypmain">
						<img alt="" src="<%=mmdtoArr.get(i).getProduct_imgurl() %>" width="120px;" height="120px;">
						<div style="width: 700px;">
						<%=mmdtoArr.get(i).getProduct_name() %><br>
						<%=mmdtoArr.get(i).getProduct_price()*mmdtoArr.get(i).getOrder_quantity() %>원<br>
						수량: <%=mmdtoArr.get(i).getOrder_quantity() %><br>
						주문번호: <%=mmdtoArr.get(i).getOrder_no() %>
						</div>
					<%
							switch(mmdtoArr.get(i).getStatus()){
								case 0:
					%>
					<button type="button" id="mypdeliverybt">배송조회</button>
					<%
								break;
								case 1:
					%>
					주문취소
					<% 
								break;
								case 2:
					%>
					<button id="mypdeliverybt" type="button" onclick="location.href='mypagewritereview.do?order_no=<%=mmdtoArr.get(i).getOrder_no() %>'">
					
					리뷰작성</button>
					<%
								break;
							}
					%>
					
				</article>
					<%} %>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>