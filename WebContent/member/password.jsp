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
		
	}
	main>section>article{
		width: 100%; height:350px;
		margin-top: 100px;
		
	}
	main>section>nav{
		width: 100%; height:140px;
		margin-left: 250px;	

	}
	header>div{
		
		position: absolute;
		margin-top:100px;
		text-align: center;
		margin-left:280px;
	}
	input {
		width: 300px;
		height: 45px;
		margin-left: 150px;
		margin-top: 20px;
}
	p {
		margin-left: 130px;
	
	}
	#button1 {
		width: 100px;
		height: 45px;
}
	
	#button2 {
		 margin-bottom : 20px;
		 width: 300px; 
		 height: 50px; 
		 background-color:#ffEB5A; 
		 border-color: yellow; 
		 border-collapse: collapse;
	
	
	}
	nav>a {
		margin-left: 20px;
	
	}
</style>
</head>
<body>
	<main>
		<section>
			<header>
				<div><h2>비밀번호 찾기</h2></div>
			</header>
			<article>
				<form id="passwordForm" action="password.jsp">
				
											<!-- 아이디를 입력하고 -->
					<input type="text" name="id" placeholder="아이디를 입력해주세요" required="required">
											<!-- 확인 버튼을 누르면 -->
					<input type="submit" value="확인">
											<!-- 아이디와 일치하는 비밀번호가 출력
												(출력은 여기다 해도 상관 없고 새로운 페이지를 만들어도 상관X)
											 -->
					
				</form>
			</article>
			<nav>
				<button id="button2"><a href="login.jsp" style="color: black;"><h4>로그인하러 가기</h4></a></button><br><br>
				<a href="id.jsp" style="color: black;">아이디 찾기</a>
				<a href="register.jsp" style="color: black;">회원가입</a>
				<a href="/projectdengdeng/index.jsp" style="color: black;">홈페이지</a>
			</nav>
		</section>
	</main>
</body>
</html>