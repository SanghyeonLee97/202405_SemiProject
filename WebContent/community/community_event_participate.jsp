<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/community.css?after" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section{
		padding-top:80px;
	}
	main>section>article{
		height: 400px;
		position: relative;
	}
	main>section>article:nth-child(2){
		margin-top: 100px;
	}
	main>section>article>div{
		width: 220px; height: 330px;
		position: absolute;
	}
	main>section>article>div:nth-child(1){
		left: 50px;
	}
	main>section>article>div:nth-child(2){
		left: 350px;
	}
	main>section>article>div:nth-child(3){
		left: 650px;
	}
	main>section>article>div:nth-child(4){
		left: 950px;
	}
	main>section>nav:nth-child(4){
		height: 40px;
		margin-top:20px;
	}
	#img{
		height: 330px;
		width: 220px;
	}
	#participate{
		text-align: center;
	}
</style>
</head>
<body>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
				<h1 id=participate>이벤트 참여 후기</h1>
			<article>
				<div><img id= img src="/projectdengdeng/imagefile/EventImg13.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EventImg14.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EventImg15.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EventImg16.png"></div>
			</article>
			<article>
				<div><img id= img src="/projectdengdeng/imagefile/EventImg17.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EventImg18.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EventImg19.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EventImg20.png"></div>
			</article>
			<nav>
			section-nav
			</nav>
			<nav>
			section-nav
			</nav>
		</section>
		
	</main>
</body>
</html>