<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/community.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section{
		padding-top:80px;
	}
	main>section>article{
		height: 300px;
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
	main>section>nav:nth-child(4){
		height: 40px;
		margin-top:20px;
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