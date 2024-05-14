<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main{
		padding: 20px 0;
	}
	main>section{
		width: 1040px;
		background-color: #ddffff;
		margin-left: 80px;
	}
	main>section:nth-child(1) {
		 height: 40px;
	}
	main>section:nth-child(2) {
		height: 580px;
		margin-top: 20px;
	}
	button{
		width: 100px; height: 40px;
		margin-left: 20px;
		background-color: black;
		color: white;
	}
	main>section:nth-child(1)>button:nth-child(1){
		margin-left: 0px;
	}
	main>section:nth-child(3){
		height: 40px;
		margin-top: 20px;
		position: relative;
	}
	main>section:nth-child(3)>p{
		width: 780px;
		display: inline-block;
		text-align: center;
	}
	main>section:nth-child(3)>button:nth-child(3){
		position: absolute;
		right: 20px;
	}
	
</style>
</head>
<body>
	<header>
		header
	</header>
	<main>
		<section>
			<button value="notice">공지</button>
			<button value="qna">문의</button>
			<button value="고객센터">고객센터</button>
			<button value="이벤트참여">이벤트참여</button>
			section
		</section>
		<section>
			section
		</section>
		<section>
			<button value="notice">쇼핑하기</button>
			<p>section</p>
			<button value="notice">글쓰기</button>
		</section>
	</main>
	<footer>
		footer
	</footer>
</body>
</html>