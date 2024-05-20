<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 페이지</title>
<link href="style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main{
		padding-top: 30px;
	}
	main>nav{
		width:100%; height:40px;
		background-color: #ddffdd;
	}
	main>section{
		margin-top: 10px;
		background-color: #ddddff;
	}
	main>section>aside{
		width:200px; height: 600px;
		background-color: #ffffdd;
		float: left;
	}
	main>section>aside>header{
		width: 100%; height: 20px;
		background-color: #ffdddd;
	}
	main>section>section{
		width:800px; height: 720px;
		margin-top: 30px;
		float: left;
	}
	main>section>section>article{
		width: 100%; height: 120px;
		margin-top: 80px;
		background-color: #ddffff;
		position: relative;
	}
	main>section>section>article:first-child{
		margin-top: 0;
	}
	main>section>section>article>div{
		width: 100px; height: 120px;
		background-color: #ddffdd;
		position: absolute;
	}
	main>section>section>article>div:nth-child(1){
		left: 100px;
	}
	main>section>section>article>div:nth-child(2){
		left: 300px;
	}
	main>section>section>article>div:nth-child(3){
		left: 500px;
	}
	main>section>section>article>div:nth-child(4){
		left: 700px;
	}
	main>section>aside:nth-child(3) {
		height: 700px;
		margin-top: 30px;
	}
</style>
</head>
<body>
	<header>header</header>
	<main>
		<nav>nav</nav>
		<section>
			<aside>
				<header>section-aside-header</header>
			section-aside
			</aside>
			<section>
				<article>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
				</article>
				<article>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
				</article>
				<article>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
				</article>
				<article>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
					<div>section-section-article-div</div>
				</article>   
			</section>
			<aside>section-aside</aside>
			<div style="clear: both;"></div>
		</section>
	</main>
	<footer>footer</footer>
</body>
</html>