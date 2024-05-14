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
		padding-bottom: 10px;
	}
	main>nav{
		width: 100%; height: 70px;
		background-color: #ddddff;
	}
	main>section{
		width: 1120px;
		margin-top:10px;
		margin-left:40px;
		background-color: #ddffff;
		padding-bottom: 20px;
	}
	main>section>article{
		width:100%;
		background-color: #ddffdd;
	}
	main>section>article:nth-child(1) {
		height: 200px;
	}
	main>section>nav{
		width:100%; height:50px;
		margin-top:10px;
		background-color: #ffdddd;
	}
	main>section>article:nth-child(3) {
		height: 820px;
		margin-top:10px;
		
	}
</style>
</head>
<body>
	<header>header</header>
	<main>
		<nav>nav</nav>
		<section>
			<article>article</article>
			<nav>nav</nav>
			<article>article</article>
		</section>
	</main>
	<footer>footer</footer>
</body>
</html>