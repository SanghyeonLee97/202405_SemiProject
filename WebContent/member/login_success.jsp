<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function test() {
		alert("아이디나 비밀번호를 확인해주세요");
		location.href="login.jsp";
	}
</script>
</head>
<body 
<% 
	//id세션이 존재하지 않는다면 페이지 로드할때 gologin스크립트를 실행
	if(session.getAttribute("id")==null){
%>
onload="test()">
<%
	//id세션이 존재한다면 페이지 로드
	}else{ 
%>
>
	<h1>로그인 성공</h1>
	세션에 저장된 id: <%=session.getAttribute("id") %>
</body>
<%} %>
</html>