<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function gologin() {
		alert("아이디나 비밀번호를 확인해주세요");
		location.href="/projectdengdeng/member/login.jsp";
	}
	function quituser() {
		alert("탈퇴한 회원입니다");
		location.href="/projectdengdeng/member/login.jsp";
	}
</script>
<style type="text/css">
	.login_success{
		text-align: center;
		width: 100%;
	}
	#maingo{
		background : lightgray;
		color : black;
		border: none;
		width: 125px;
		height: 50px;
	}
</style>
</head>
<body 
<% 
	//id세션이 존재하지 않는다면 페이지 로드할때 gologin스크립트를 실행
	if(request.getParameter("quit")!=null){
%>
onload="quituser()">
<%
	}
	if(session.getAttribute("id")==null){
%>
onload="gologin()">
<%
	//id세션이 존재한다면 페이지 로드
	}else{ 
%>
>
	<div class="login_success">
		<img src="../imagefile/checkmark.png" style="width:70px; height: 70px;">
		<h1>로그인 성공</h1>
		<h4>더 좋은 서비스로 찾아뵙겠습니다 즐거운 쇼핑되세요</h4>
		<%-- 세션에 저장된 id: <%=session.getAttribute("id") %> --%>
		<hr>
		<br>
		<button onclick="location.href='../index.jsp'" id="maingo">메인</button>
	</div>
</body>
<%} %>
</html>