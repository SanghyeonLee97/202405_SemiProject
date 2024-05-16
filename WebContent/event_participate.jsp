<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		background-color: #ffffdd;
	}
	main>section>article{
		width: 100%; height: 780px;
		margin-top:80px;
		background-color: #ddffdd;
	}
	main>section>nav:nth-child(2){
		width: 100%; height: 80px;
		background-color: #ddffff;
	}
	main>section>nav:nth-child(3){
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
			section
			<article>section-article</article>
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