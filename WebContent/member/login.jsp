<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section{
		width: 540px;
		margin-left: 330px;
		padding-top: 100px;
		padding-bottom: 140px;
	}
	main>section>header{
		width:100%; height: 100px;
		background-color: #ddffdd;
	}
	main>section>article{
		width: 100%; height:200px;
		background-color: #ddffff;
	}
	main>section>nav{
		width: 100%; height:60px;
		background-color: #ffffdd;
	}
</style>
</head>
<body>
<header>header</header>
<main>
	<section>
		<header>
			<h1>로그인</h1>
		</header>
		<article>
			<form id="loginForm" action="login_backend.jsp" method="post">
				<input type="text" placeholder="아이디" name="id" required="required"><br>
				<input type="text" placeholder="비밀번호" name="password" required="required"><br>
				<input type="checkbox" name="idSave">아이디저장<br>
			</form>
		</article>
		<nav>
			<button type="submit" form="loginForm">로그인</button><br>
			<a href="id.jsp">아이디 찾기</a>
			<a href="password.jsp">비밀번호찾기</a>
			<a href="register.jsp">회원가입</a>
		</nav>
	</section>
</main>
<footer>footer</footer>
</body>
</html>