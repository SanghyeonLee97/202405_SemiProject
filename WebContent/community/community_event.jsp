<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.7.1.js"></script>
<script type="text/javascript"></script>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/community.css?after" rel="stylesheet" type="text/css">
<style type="text/css">
	section{
		padding-bottom: 40px;
	}
	section>article{
		height: 400px;
		margin-top:40px;
		position: relative;
	}
	section>article:nth-child(2){
		margin-top:80px;
	}
	section>article>div{
		width: 250px; height: 350px;
		background-color: #ddddff;
		position: absolute;
	}
	section>article>div:nth-child(1) {
		left: 170px;
	}
	section>article>div:nth-child(2) {
		left: 490px;
	}
	section>article>div:nth-child(3) {
		left: 810px;
	}
	#img{
		height: 350px;
		width: 250px;
	}

	#eventheader{
		text-align: center;
 		margin-top: 60px;
		
	}	
</style>
</head>
<body>
	<main>
		<section>
			<header>
				<h1 id=eventheader>이벤트 목록</h1>
			</header>
			<article>
				<div><a href="/projectdengdeng/community/community_event_page.jsp">
					<img id= img src="/projectdengdeng/imagefile/PhotoEvent1.png">
					</a></div>
				
				<div><img id= img src="/projectdengdeng/imagefile/MainEvent2.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/MainEvent3.png"></div>
			</article>
			<article>
				<div><img id= img src="/projectdengdeng/imagefile/MainEvent1.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EndEvent1.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EndEvent2.png"></div>
			</article>
			<article>
				<div><img id= img src="/projectdengdeng/imagefile/EndEvent3.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EndEvent4.png"></div>
				<div><img id= img src="/projectdengdeng/imagefile/EndEvent5.png"></div>
			</article>
			
		</section>
	</main>
</body>
</html>