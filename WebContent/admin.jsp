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
	main{
		background-color: lightgray;
	}
	table{
		margin: 0 auto;
	}
	form{
		border: 1px solid black;
		padding: 10px;
	}
	input{
		width: 100%;
	}
	textarea{
		width: 100%;
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
	<main>
		<h1>어드민접속</h1><br>
		<form action="noticeWrite.do">
			<h3>공지 등록</h3><br>
			제목<br>
			<input name="noticeTitle"><br>
			내용<br>
			<textarea name="noticeContent" rows="10" cols="100"></textarea><br>
			<button type="submit">확인</button><br><br>
		</form>
		<br>
		<form action="faqWrite.do">
			<h3>faq 등록</h3><br>
			제목<br>
			<input><br>
			내용<br>
			<textarea rows="10" cols="100"></textarea><br>
			<button type="submit">확인</button><br>
		</form>
		회원 강제탈퇴
	</main>
</body>
</html>