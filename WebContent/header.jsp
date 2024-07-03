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
		border-top: 1px solid #e7e7e7;
		border-bottom: 1px solid #e7e7e7;
		font-weight: bolder;
		
	}
	header>section{
		position: absolute;
		left : 535px;
		top : 0px;
		
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
			<img src="/projectdengdeng/imagefile/newlogo.png" onclick ="location.href='/projectdengdeng/index.jsp'" style=" width: 120px; height: 120px ; "></div>
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
				<a href="/projectdengdeng/mypage/mypage_main.jsp">
					<img src="/projectdengdeng/imagefile/login2.png">마이페이지
				</a>
				<a href="logout.do" >로그아웃</a>
			</div>
		<%
			}
		%>
		</section>
	</header>
	
	<article>
		<ul class="nav justify-content-center">
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" 
		    href="/projectdengdeng/product/list.do?pc_parent_no=1" style="color: black;">사료</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" 
		    href="/projectdengdeng/product/list.do?pc_parent_no=2" style="color: black;">간식</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" 
		    href="/projectdengdeng/product/list.do?pc_parent_no=3" style="color: black;">장난감</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" 
		    href="/projectdengdeng/product/list.do?pc_parent_no=4" style="color: black;">미용용품</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" 
		    href="/projectdengdeng/product/list.do?pc_parent_no=5" style="color: black;">위생용품</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/projectdengdeng/community/community_event.jsp" style="color: black;">이벤트</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="/projectdengdeng/community/community_qna.jsp" style="color: black;">고객문의</a>
		  </li>
		</ul>
	</article>		
</body>
</html>