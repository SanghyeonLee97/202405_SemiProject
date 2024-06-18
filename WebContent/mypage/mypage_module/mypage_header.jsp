<%@page import="DTO.MyPageHeaderDTO"%>
<%@page import="dao.MyPageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage header Module</title>
<script type="text/javascript">
	function chk() {
		alert("비정상적인 접근");
		location.href="/projectdengdeng/index.jsp";
	}
</script>
</head>
<body onload="
	<%
		if(session.getAttribute("id")==null){
	%>
chk()
	<%} %>
">
	<%
		String sessionid = (String)session.getAttribute("id");
		String sessionno = (String)session.getAttribute("no");
		System.out.print(sessionno);
		MyPageDAO mdao = new MyPageDAO();
		MyPageHeaderDTO mdto = mdao.getMyPageHeader(sessionno);
	%>
	<header>
        <h1><%=sessionid %>님</h1>
        <article>
        	주문/배송<br>
        	<%=mdto.getOrder_count() %>
        </article>
        <article>
        	리뷰<br>
        	<%=mdto.getReview_count() %>
        </article>
        <article>
        	<a href="reserve.do">
	        	적립금<br>
	        	<%=mdto.getCustomer_point() %>
        	</a>
        </article>
        <article>
        	쿠폰<br>
        	<%=mdto.getCoupon_count() %>
        </article>
    </header>
</body>
</html>