<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">

	.wrapper{
	    width: 640px;
	    padding: 40px;
	    text-align: center;
	    background: white;
	    margin: auto;
	}
	.img{
		left : 0px;
		bottom : 0px;
		position: absolute;
	}
	
	h1{
	  color:#6A24FE;
	  font-size:48px;
	  margin:120px 0 80px 0 ;
	  position: relative;
	  
	}
	#Id, #Pw {
		width: 70%;
		height : 40px;
		padding: 10px;
		box-sizing: border-box;
		border-radius: 5px;
		border: none;
		justify-content: center;
		background: #DCDCDC;
	}
	#Id{
		margin-top : 50px;
		margin-bottom: 10px;
	}
	
		
	input[type="checkbox"]{
		cursor: pointer;
		margin-top : 6px;
		margin-bottom: 15px;
		width: 17px;
		height: 17px;
	}
  	.signin__btn{
		background:#6A24FE;
		color:white;
		display:block;
		width:80%;
		height:50px;
		border-radius:8px;
		margin:0 auto;
		margin-top : 15px;
		border:none;
		cursor:pointer;
		font-size:14px;
	  }
	}

	main>section{
		width: 83%;
		margin-left: 330px;
		padding-top: 100px;
		padding-bottom: 140px;
	}
	main>section>header{
		width:100%; height: 100px;
		
	}
	main>section>article{
		width: 100%; height:200px;
		
	}
	main>section>nav{
		width: 100%; height:75px;
		
	}
	
</style>
</head>
<body>
	<main class="wrapper">
		<section>
			<header>
				<img src="../imagefile/Logo3.png" height="180px" width="200px" class="img">
				<h1>뎅뎅몰</h1>
			</header>
			<article>
				<form id="loginForm" action="login.do" method="post">
					<input type="text" placeholder="아이디" name="id" required="required" id="Id"><br>
					<input type="password" placeholder="비밀번호" name="password" required="required" id="Pw"><br>
					<input type="checkbox" name="idSave">아이디저장<br>
					<a href="id.jsp">아이디 찾기</a>&nbsp;&nbsp;
					<a href="password.jsp">비밀번호찾기</a>&nbsp;&nbsp;
					<a href="register.jsp">회원가입</a>
				</form>
			</article>
			<nav>
				<button type="submit" form="loginForm" class="signin__btn">로그인</button><br>
			</nav>
		</section>
	</main>
</body>
</html>