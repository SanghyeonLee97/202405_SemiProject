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
		padding-bottom: 40px;
	}
	main>section>header{
		width:100%; height: 100px;
		background-color: #ddffdd;
	}
	main>section>article{
		width: 100%; height:500px;
		background-color: #ddffff;
	}
	main>section>nav{
		width: 100%; height:140px;
		background-color: #ffffdd;
	}
	


</style>
</head>
<body>
<header>비밀번호찾기</header>
<main>
	<section>
		<header>
			<h1>비밀번호 찾기</h1>
		</header>
		<article>
			<form id="passwordForm" action="password.jsp">
				이름 : <input type="text" name="name" placeholder="내용을 입력해주세요" required="required"><br>
				아이디 : <input type="text" name="id" placeholder="내용을 입력해주세요" required="required"><br>
				이메일 : <input type="text" name="email" placeholder="내용을 입력해주세요" required="required">
					<button type="button">이메일 발송</button><br>
				입력하신 이메일로 임시 비밀번호를 받으실 수 있습니다.<br>
				임시 비밀번호로 로그인 하신 후 꼭 비밀번호를 변경 해 주세요.
			</form>
		</article>
		<nav>
			<button type="submit" form="passwordForm">비밀번호 찾기</button><br><!-- 이버튼의 용도는? -->
			<a href="login.jsp">로그인</a>
			<a href="id.jsp">아이디 찾기</a>
			<a href="register.jsp">회원가입</a>
		</nav>
	</section>
</main>
<footer>footer</footer>
</body>
</html>