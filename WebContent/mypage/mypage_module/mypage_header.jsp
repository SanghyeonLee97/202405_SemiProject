<%@page import="DTO.mypage.MyPageHeaderDTO"%>
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
<style type="text/css">
	#mypheader {
		color: black;
	}

</style>
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
		MyPageDAO mdao = new MyPageDAO();
		MyPageHeaderDTO mdto = mdao.getMyPageHeader(sessionno);
	%>
	<header>
        <h1><%=sessionid %>님</h1>
        <article >
        	<a href="/projectdengdeng/mypage/mypage_main.jsp" id="mypheader" >
        	<img src="/projectdengdeng/imagefile/mypagedelivery.png" width="60px;" height="50px;">
	        	주문/배송<br>
	        	<%=mdto.getOrder_count() %>
        	</a>
        </article>
        <article>
        	<a href="reviewlist.do" id="mypheader">
        	<img src="/projectdengdeng/imagefile/mypagereview.png" width="60px;" height="50px;">
	        	리뷰<br>
	        	<%=mdto.getReview_count() %>
        	</a>
        </article>
        <article>
        	<a href="reserve.do" id="mypheader">
        	<img src="/projectdengdeng/imagefile/mypagereserve.png" width="60px;" height="50px;">
	        	적립금<br>
	        	<%=mdto.getCustomer_point() %>
        	</a>
        </article>
        <article>
        	<a href="coupon.do" id="mypheader">
        	<img src="/projectdengdeng/imagefile/mypagecoupon.png" width="60px;" height="50px;">
	        	쿠폰<br>
	        	<%=mdto.getCoupon_count() %>
        	</a>
        </article>
    </header>
</body>
</html>