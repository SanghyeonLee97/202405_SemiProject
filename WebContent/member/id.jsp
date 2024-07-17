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
	}
	main>section>article{
		width: 100%; height:400px;
		margin-left: 150px;
	}
	main>section>nav{
		width: 100%; height:140px;
		margin-left: 260px;
	}

	header>div {
		position: absolute;
		top:30px;
		text-align: center;
		margin-left:300px;
}
	nav>a {
		margin-left: 20px;
	
	}
	#button1 {
		width:100px; 
		height:40px;
		
	}
	
	#button2 {
		margin-top: 50px;
		margin-right : 10px;
		width: 300px; 
		height: 50px; 
		background-color:#ffEB5A; 
		border-color: yellow; 
		border-collapse: collapse;
	}
	input {
		width: 300px;
		height:40px; 
}
	

</style>
</head>
<body>

	<main>
		<section>
			<header>
				<div><h2>아이디 찾기</h2></div>
			</header>
			<article>
				<form id="idForm" action="id.do">
					<p class="findEmail">이메일 : <input type="text" name="member_email" placeholder="이메일 입력" size="30" required></p>
					<!-- <p>전화번호 : <input type="text"  name="member_call" placeholder="휴대폰번호를 '-'없이 입력" onKeyup = "addHypen(this);" required></p> -->
					
					<br><br>
					<input type="submit" name="returnId" readonly="readonly" value="찾기">
				</form>
				<%

					if(request.getAttribute("id")!=null){
				%>
				<h4>회원님의 아이디는 <%=request.getAttribute("id") %> 입니다.</h4>
				<%}else{ %>
				<h4>존재하지 않는 아이디입니다.</h4>
				<%} %>
			</article>
			<nav>
				<button id="button2"><a href="login.jsp" style="color: black;"><h4>로그인하러 가기</h4></a></button><br><br>
				<a href="password.jsp" style="color: black;">비밀번호 찾기</a>
				<a href="register.jsp" style="color: black;">회원가입</a>
				<a href="/projectdengdeng/index.jsp" style="color: black;">홈페이지</a>
			</nav>
		</section>
	</main>
</body>
</html>