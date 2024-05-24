<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section{
		background-color: #ffffdd;
	}
	main>section:first-child{
		width: 100%; height: 360px;
	}
	main>section:last-child{
		margin-top: 40px;
	}
	main>section>article{
		width: 100%; height: 160px;
		margin-top: 20px;
		background-color: #ddffff;
		position: relative;
	}
	main>section>article:first-child{
		margin-top: 0px;
	}
	main>section>article>div{
		width: 140px; height: 100px;
		background-color: #ddffdd;
		position: absolute;
	}
	main>section>article>div:nth-child(1){
		left: 220px;
	}
	main>section>article>div:nth-child(2){
		left: 420px;
	}
	main>section>article>div:nth-child(3){
		left: 620px;
	}
	main>section>article>div:nth-child(4){
		left: 820px;
	}
</style>
</head>
<body>
	<main>
		<section>section</section>
		<section>
			<article>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
				section-article
			</article>
			<article>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
				section-article
			</article>
			<article>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
				<div>section-article-div</div>
				section-article
			</article>
		</section>
	</main>
</body>
</html>