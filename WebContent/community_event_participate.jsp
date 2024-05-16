<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>nav{
		width: 100%; height: 40px;
		background-color: #ddffff;
	}
	main>section{
		width: 100%;
		padding-top:120px;
		background-color: #ffffdd;
	}
	main>section>article{
		width: 100%; height: 300px;
		background-color: #ffddff;
		position: relative;
	}
	main>section>article:nth-child(2){
		margin-top: 100px;
	}
	main>section>article>div{
		width: 200px; height: 300px;
		background-color: #ddddff;
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
	main>section>nav:nth-child(3){
		width: 100%; height: 80px;
		background-color: #ddffff;
	}
	main>section>nav:nth-child(4){
		width: 100%; height: 40px;
		margin-top:20px;
		background-color: #ddffff;
	}
</style>
</head>
<body>
	<header>
		header
	</header>
	<main>
		<nav>
			nav
		</nav>
		<section>
			<article>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
			</article>
			<article>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
			</article>
			<nav>
			section-nav
			</nav>
			<nav>
			section-nav
			</nav>
		</section>
		
	</main>
	<footer>
		footer
	</footer>
</body>
</html>