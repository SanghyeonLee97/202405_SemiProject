<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>Insert title here</title>
<style type="text/css">

	body{
		height: 200px;
	}
	header{
		position: relative;
	}
	body>article{
		background-color: #ffEB5A;
		
	}
	header>section{
		position: relative;
		left : 500px;
		bottom : 30px;
		
	}
	#login{
		position: absolute;
		left : 800px;
		top : 90px;
		
	}

</style>
</head>
<body>
	<header>
		<section>
			<div onclick ="location.href='/projectdengdeng/index.jsp';">
			<img src="/projectdengdeng/imagefile/Logo3.png" width="180px;" height="180px"></div>
		</section>
		<section id= "login">
		<%
			//id세션이 존재한다면
			if(session.getAttribute("id")==null){
		%>
			<div><a href="/projectdengdeng/member/login.jsp" style="color: black;">로그인</a>|
			<a href="/projectdengdeng/member/register.jsp" style="color: black;">회원가입</a></div> 
		<%
			//존재하지 않는다면
			}else{
		%>
			
			<div>
				<%=session.getAttribute("id") %>님 환영함
				<a href="/projectdengdeng/mypage/mypage_main.jsp" style="color: black;">
					<img src="/projectdengdeng/imagefile/login2.png">마이페이지
				</a>
				<a href="logout.do">로그아웃</a>
			</div>
		<%
			}
		%>
		</section>
	</header>
	
	<article>
		<ul class="nav justify-content-center">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="#" style="color: black;">사료</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#" style="color: black;">간식</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#" style="color: black;">장난감</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#" style="color: black;">미용용품</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#" style="color: black;">배변용품</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#" style="color: black;">이벤트</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/projectdengdeng/community/community_QNA.jsp" style="color: black;">고객문의</a>
		  </li>
		</ul>
	</article>		
</body>
</html>