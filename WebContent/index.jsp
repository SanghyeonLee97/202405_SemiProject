<%@page import="java.util.Random"%>
<%@page import="DTO.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.Temp"%>
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
	body{
		overflow-x: hidden;
	}
	main>section:first-child{
		margin-left: calc(-50vw + 50%);
		width: 100vw;
		height: 360px;
	}
	main>section:last-child{
		margin-top: 20px;
	}
	main>section>article{
		width: 100%; height: 350px;
		margin-top: 20px;
		padding : 0px;
		position: relative;
		text-align: center;
		display: inline-block;
	}
	main>section>article:first-child{
		margin-top: 0px;
	}
	main>section>article>div{
		width:150px; height: 250px; 
		display:inline-block;
		position: relative;
		margin-right:100px;
		left:50px;
		margin-top: 20px;
		top:50px;
		overflow: hidden;
		margin-bottom: 70px;

		
	}
	.indeximg img{
		height: 150px;
		width: 150px;
		
		
	}
	
</style>
</head>
<body>
	<%
		int count = 4;
		Temp temp = new Temp();
		ArrayList<ProductDTO> pcArr1 = new ArrayList();
		int a[] = new int[count];
		Random r = new Random();
		MemberDAO mdao = new MemberDAO();
		if(session.getAttribute("id")!=null){
			String id = (String)session.getAttribute("id");
			if(mdao.adminChk(id)==true){
	%>
	<a href='/projectdengdeng/admin.jsp'>관리자페이지</a>
	<%
			}
		}
	%>
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
							<img src="/projectdengdeng/imagefile/banner1.png" class="d-block w-100" height="330px" width="100%">
							<div class="carousel-caption d-none d-md-block"></div>
						</div>
						<div class="carousel-item">
							<img src="/projectdengdeng/imagefile/banner2.png" class="d-block w-100" height="330px" width="100%" >
							<div class="carousel-caption d-none d-md-block"></div>
						</div>
						<div class="carousel-item">
							<img src="/projectdengdeng/imagefile/banner3.png" class="d-block w-100" height="330px" width="100%" >
							<div class="carousel-caption d-none d-md-block"></div>
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
				<%
					pcArr1 = temp.getMypageMain(1);
					for(int i=0; i<count; i++){
						a[i] = r.nextInt(pcArr1.size());
						for(int j=0; j<i; j++){
							if(a[i] == a[j]){
								i--;
							}
						}
					}
					for(int i=0; i<count; i++){
				%>
				<div class="indeximg">
					<img src="<%=pcArr1.get(a[i]).getProduct_imgurl() %>" >
					<a href="product/details.do?product_no=<%=pcArr1.get(a[i]).getProduct_no()%>">
					<%=pcArr1.get(a[i]).getProduct_name() %><br>
					<%=pcArr1.get(a[i]).getProduct_price() %>원</a>
				</div>
				<%
					}
				%>
			</article>
			<article>
				<h4>간식추천</h4>
				<%
					pcArr1 = temp.getMypageMain(2);
					for(int i=0; i<count; i++){
						a[i] = r.nextInt(pcArr1.size());
						for(int j=0; j<i; j++){
							if(a[i] == a[j]){
								i--;
							}
						}
					}
					for(int i=0; i<count; i++){
				%>
				<div class="indeximg">
					<img src="<%=pcArr1.get(a[i]).getProduct_imgurl() %>"  >
					<a href="product/details.do?product_no=<%=pcArr1.get(a[i]).getProduct_no()%>">
					<%=pcArr1.get(a[i]).getProduct_name() %><br>
					<%=pcArr1.get(a[i]).getProduct_price() %>원</a>
				</div>
				<%
					}
				%>
			</article>
			<article>
				<h4>장난감추천</h4>
				<%
					pcArr1 = temp.getMypageMain(3);
					for(int i=0; i<count; i++){
						a[i] = r.nextInt(pcArr1.size());
						for(int j=0; j<i; j++){
							if(a[i] == a[j]){
								i--;
							}
						}
					}
					for(int i=0; i<count; i++){
				%>
				<div class="indeximg">
					<img src="<%=pcArr1.get(a[i]).getProduct_imgurl() %>" >
					<a  href="product/details.do?product_no=<%=pcArr1.get(a[i]).getProduct_no()%>">
					<%=pcArr1.get(a[i]).getProduct_name() %><br>
					<%=pcArr1.get(a[i]).getProduct_price() %>원</a>
				</div>
				<%
					}
				%>
			</article>
		</section>
	</main>
</body>
</html>