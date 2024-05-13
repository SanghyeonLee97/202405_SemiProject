<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>header{
		width: 100%; height: 180px;
		background-color: #ddffdd;
		position: relative;
	}
	main>section{
		width: 100%;
		margin-top:20px;
		background-color: #ddddff;
	}
	main>section>section:nth-child(1) {
		width: 780px;
		background-color: #ffddff;
		float: left;
	}
	main>section>section:nth-child(1)>article{
		background-color: #ddffff;
	}
	main>section>section:nth-child(1)>article:nth-child(1){
		width: 780px; height: 180px;
	}
	main>section>section:nth-child(1)>article:nth-child(2){
		width: 780px; height: 180px;
		margin-top:40px;
	}
	main>section>section:nth-child(1)>article:nth-child(3){
		width: 780px; height: 180px;
		margin-top:40px;
	}
	main>section>section:nth-child(2) {
		width: 380px; height: 360px;
		margin-left:40px;
		background-color: #ffffdd;
		float: left;
	}
</style>
</head>
<body>
	<header>header</header>
	<main>
		<header>main-header</header>
		<section>
			<section>
				<article>article</article>
				<article>article</article>
				<article>article</article>
			</section>
			<section>section</section>
			<div style="clear: both;"></div>
		</section>
	</main>
	<footer>footer</footer>
</body>
</html>