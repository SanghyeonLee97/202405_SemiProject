<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>header>h1{
		position: absolute;
		left: 140px;
		top: 60px;
	}
	main>header>article{
		width: 80px; height: 120px;
		background-color: #ddffff;
		position: absolute;
	}
	main>header>article:nth-child(2){
		left: 720px; top:20px;
	}
	main>header>article:nth-child(3){
		left: 820px; top:20px;
	}
	main>header>article:nth-child(4){
		left: 920px; top:20px;
	}
	main>header>article:nth-child(5){
		left: 1020px; top:20px;
	}
	main>header{
		width: 100%; height: 160px;
		background-color: #ffffdd;
		position: relative;
	}
	main>section{
		width: 100%;
		margin-top:20px;
		background-color: #eeffdd;
	}
	section>aside{
		width: 200px; height: 400px;
		float: left;
		background-color: #ddddff;
	}
	section>section{
		width: 980px;
		margin-left: 20px;
		float: left;
		border-left: 1px solid gray;
	}
	section>header{
		width: 940px; height: 40px;
		margin-left:40px;
		background-color: #ffdddd;
	}
	section>article{
		width: 900px; height: 580px;
		margin-left:40px;
		background-color: #ddffff;
		border-top: 1px solid gray;
	}
</style>
</head>
<body>
	<header>header</header>
	
	<main>
		<header>
			<h1>홍길동</h1>
			<article>header-article</article>
			<article>header-article</article>
			<article>header-article</article>
			<article>header-article</article>
		</header>
		<section>
			<aside>section-aside</aside>
			<section>
				<header>section-section-header</header>
				<article>section-section-article</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
	<footer>footer</footer>
</body>
</html>