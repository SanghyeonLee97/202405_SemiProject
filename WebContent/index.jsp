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
		padding-top: 20px;
	}
	main>section{
		width: 100%; height: 160px;
		margin-top: 20px;
		background-color: #ddffff;
		position: relative;
	}
	main>section:first-child{
		margin-top: 0px;
	}
	main>section>article{
		width: 140px; height: 100px;
		background-color: #ddffdd;
		position: absolute;
	}
	main>section>article:nth-child(1){
		left: 220px;
	}
	main>section>article:nth-child(2){
		left: 420px;
	}
	main>section>article:nth-child(3){
		left: 620px;
	}
	main>section>article:nth-child(4){
		left: 820px;
	}
</style>
</head>
<body>
	<header>header</header>
	<main>
		<section>
			<article>article</article>
			<article>article</article>
			<article>article</article>
			<article>article</article>
			section
		</section>
		<section>
			<article>article</article>
			<article>article</article>
			<article>article</article>
			<article>article</article>
			section
		</section>
		<section>
			<article>article</article>
			<article>article</article>
			<article>article</article>
			<article>article</article>
			section
		</section>
	</main>
	<footer>footer</footer>
</body>
</html>