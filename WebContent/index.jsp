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
		background-color: #ffEB5A;
	}
	main>section:first-child{
		width: 100%; height: 360px;
	}
	main>section:last-child{
		margin-top: 40px;
	}
	main>section>article{
		width: 100%; height: 250px;
		margin-top: 20px;	
		padding : 0px;
		background-color:  #ffffb1;
		position: relative;
		text-align: center;
		
	}
	main>section>article:first-child{
		margin-top: 0px;
	}
	main>section>article>div{
		width:150px; height: 150px; 
		background-color: #ddffdd;
		display:inline-block;
		position: relative;
		margin-right:100px;
		left: 0;
		
	}
	
</style>
</head>
<body>
	<main>
		<section>section</section>
		<section>
			<article>
			<h3>사료추천</h3>
					<div><img src="imagefile/image1.png" width="150px" height="150px" ><a href="">프리미엄사료<br>50900원</a></div>
					<div><img src="imagefile/image3.png" width="150px" height="150px"><a href="">어덜트사료<br>32000원</a></div>
					<div><img src="imagefile/image4.png" width="150px" height="150px"><a href="">소프트사료<br>20900원</a></div>
					<div style="margin-right: 0"><img src="imagefile/image5.png" width="150px" height="150px"><a href="">소프트사료<br>20900원</a></div>
			</article>
			<article>
			<h3>간식추천</h3>
				<div><img src="imagefile/image6.png" width="150px" height="150px"><a href="">간식<br>8000원</a></div>
				<div><img src="imagefile/image7.png" width="150px" height="150px"><a href="">간식<br>8000원</a></div>
				<div><img src="imagefile/image8.png" width="150px" height="150px"><a href="">간식<br>5900원</a></div>
				<div style="margin-right: 0"><img src="imagefile/image10.png" width="150px" height="150px"><a href="">간식<br>7900원</a></div>
				
			</article>
			<article>
			<h3>장난감추천</h3>
				<div><img src="imagefile/image12.png" width="150px" height="150px"><a href="">장난감인형<br>8900원</a></div>
				<div><img src="imagefile/image14.png" width="150px" height="150px"><a href="">장난감인형<br>8900원</a></div>
				<div><img src="imagefile/image16.png" width="150px" height="150px"><a href="">나무장난감<br>20900원</a></div>
				<div style="margin-right: 0"><img src="imagefile/image20.png" width="150px" height="150px"><a href="">브러쉬<br>9900원</a></div>
				
			</article>
		</section>
	</main>
</body>
</html>