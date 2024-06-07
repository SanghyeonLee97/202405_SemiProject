<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/projectdengdeng/css/style2.css?after" rel="stylesheet" type="text/css">
<style type="text/css">
	table{
		margin: 0 auto;
	}
</style>
</head>
<body onload="
	<%
		MemberDAO mdao = new MemberDAO();
		String id = (String)session.getAttribute("id");
		if(mdao.adminChk(id)==false){
	%>
	location.href='/projectdengdeng/index.jsp';
	<%
		}
	%>
">
<h1>어드민접속</h1>
공지 등록<br>
faq 등록<br>
회원 강제탈퇴
</body>
</html>