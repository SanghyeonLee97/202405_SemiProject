<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/projectdengdeng/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script src="js/bootstrap.bundle.min.js"></script>
<link href="/projectdengdeng/css/style2.css?after" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section{
		
	}
	main>section:first-child{
		width: 100%; height: 360px;
	}
	main>section:last-child{
		margin-top: 20px;
	}
	main>section>article{
		width: 100%; height: 250px;
		margin-top: 20px;	
		padding : 0px;
		position: relative;
		text-align: center;
		
	}
	main>section>article:first-child{
		margin-top: 0px;
	}
	main>section>article>div{
		width:150px; height: 150px; 
		display:inline-block;
		position: relative;
		margin-right:100px;
		left: 0;
		
	}
	
</style>
</head>
<body>
	<main>
		<section>
			<div>
				<div id="carouselExampleCaptions" class="carousel slide">
			      <div class="carousel-indicators">
			        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-label="Slide 1" aria-current="true"></button>
			        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
			        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3" class=""></button>
			      </div>
			      <div class="carousel-inner">
			        <div class="carousel-item active">
			          <img src="/projectdengdeng/imagefile/배너1.jpg" class="d-block w-100" height="330px" width="100%">
			          <div class="carousel-caption d-none d-md-block">
			          </div>
			        </div>
			        <div class="carousel-item">
			         <img src="/projectdengdeng/imagefile/배너2.jpg" class="d-block w-100" height="330px" width="100%" >
			          <div class="carousel-caption d-none d-md-block">
			          </div>
			        </div>
			        <div class="carousel-item">
			         <img src="/projectdengdeng/imagefile/배너3.jpg" class="d-block w-100" height="330px" width="100%" >
			          <div class="carousel-caption d-none d-md-block">
			          </div>
			        </div>
			      </div>
			      
			      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			        <span class="visually-hidden">Previous</span>
			      </button>
			      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			        <span class="carousel-control-next-icon" aria-hidden="true"></span>
			        <span class="visually-hidden">Next</span>
			      </button>
    			</div>
			</div>
		</section>
		<section>
			<article>
			<h4>사료추천</h4>
					<div><img src="imagefile/image1.png" width="150px" height="150px" ><a href="">프리미엄사료<br>50900원</a></div>
					<div><img src="imagefile/image3.png" width="150px" height="150px"><a href="">어덜트사료<br>32000원</a></div>
					<div><img src="imagefile/image4.png" width="150px" height="150px"><a href="">소프트사료<br>20900원</a></div>
					<div style="margin-right: 0"><img src="imagefile/image5.png" width="150px" height="150px"><a href="">소프트사료<br>20900원</a></div>
			</article>
			<article>
			<h4>간식추천</h4>
				<div><img src="imagefile/image6.png" width="150px" height="150px"><a href="">간식<br>8000원</a></div>
				<div><img src="imagefile/image7.png" width="150px" height="150px"><a href="">간식<br>8000원</a></div>
				<div><img src="imagefile/image8.png" width="150px" height="150px"><a href="">간식<br>5900원</a></div>
				<div style="margin-right: 0"><img src="imagefile/image10.png" width="150px" height="150px"><a href="">간식<br>7900원</a></div>
				
			</article>
			<article>
			<h4>장난감추천</h4>
				<div><img src="imagefile/image12.png" width="150px" height="150px"><a href="">장난감인형<br>8900원</a></div>
				<div><img src="imagefile/image14.png" width="150px" height="150px"><a href="">장난감인형<br>8900원</a></div>
				<div><img src="imagefile/image16.png" width="150px" height="150px"><a href="">나무장난감<br>20900원</a></div>
				<div style="margin-right: 0"><img src="imagefile/image20.png" width="150px" height="150px"><a href="">브러쉬<br>9900원</a></div>
				
			</article>
		</section>
	</main>
</body>
</html>