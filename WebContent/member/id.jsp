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
		width: 800px;
		margin-left: 200px;
		padding-top: 40px;
		padding-bottom: 40px;
	}
	main>section>header{
		width:100%; height: 160px;
		background-color: #ddffdd;
	}
	main>section>article{
		width: 100%; height:460px;
		background-color: #ddffff;
	}
	main>section>nav{
		width: 100%; height:140px;
		background-color: #ffffdd;
	}




</style>
</head>
<body>
<header>header</header>
<main>
	<section>
		<header>
			<h1>아이디 찾기</h1>
		</header>
		<article>
			<form id="idForm" action="id.jsp">
				이름 : <input type="text" name="id" placeholder="내용을 입력해주세요" required="required"><br>
				이메일 : <br>
				본인확인 이메일 주소와 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.<br>
				<input type="text" name="email" placeholder="내용을 입력해주세요" required="required">
				<button type="button">인증번호받기</button><br>
				인증번호 입력<br>
				<input type="text" name="authenticationNumber" placeholder="내용을 입력해주세요" required="required"><br>
				<input type="text" name="returnId" readonly="readonly">
			</form>
		</article>
		<nav>
			<button type="submit" form="idForm">아이디 찾기</button><br>
			<a href="login.jsp">로그인</a>
			<a href="password.jsp">비밀번호 찾기</a>
			<a href="register.jsp">회원가입</a>
		</nav>
	</section>
</main>
<footer>footer</footer>
</body>
</html>