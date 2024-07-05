<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#buttons {
		width: 120px;
		height: 40px;
		margin: 0 20px;
		background: #ffEB5A;
}
 
.community-nav{
 	display: flex;
 	justify-content: center;
 }

</style>
</head>
<body>
	<nav class="community-nav">
		<button id=buttons onclick="location.href='/projectdengdeng/community/community_notice.jsp'"><h5>notice</h5></button>
		<button id=buttons onclick="location.href='/projectdengdeng/community/community_faq.jsp'"><h5>FAQ</h5></button>
		<button id=buttons onclick="location.href='/projectdengdeng/community/community_qna.jsp'"><h5>QNA</h5></button>
		<button id=buttons onclick="location.href='/projectdengdeng/community/community_event_participate.jsp'"><h5>이벤트참여</h5></button>
	</nav>
</body>
</html>