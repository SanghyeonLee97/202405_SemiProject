<%@page import="DTO.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	ProductDTO product = (ProductDTO)request.getAttribute("product");
	float avgRating = (float)request.getAttribute("avgRating");
	List<ReviewDTO> reviewList = (List<ReviewDTO>)request.getAttribute("reviewList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
main>section {
	background-color: #ddddff;
}

main>section>header {
	width: 100%;
	height: 120px;
	background-color: #ddffff;
}

main>section>aside {
	width: 360px;
	height: 360px;
	margin-left: 40px;
	margin-top: 60px;
	background-color: #ffffdd;
	float: left;
}

main>section>section {
	width: 800px;
	background-color: #ddffdd;
	float: left;
}

main>section>section>article {
	width: 100%;
	background-color: #ffddff;
}

main>section>section>article:nth-child(1) {
	height: 100px;
}

main>section>section>article:nth-child(2) {
	height: 140px;
	margin-top: 40px;
}

main>section>section>article:nth-child(3) {
	height: 280px;
	margin-top: 40px;
}

.detail-nav {
	width: 100%;
	height: 70px;
	background-color: #ddddff;
}

.detail-nav a {
	margin: 0 15px;
	cursor: pointer;
	text-decoration: none;
	color: inherit;
}

.detail-section {
	width: 1200px;
	background-color: #ddffff;
}

.detail-section>article {
	display: none;
}

.detail-section>article.active {
	display: block;
}

.detail-section>article>nav {
	width: 100%;
	height: 50px;
	background-color: #ffdddd;
}

.detail-section>article>nav a {
	margin: 0 15px;
	cursor: pointer;
	text-decoration: none;
	color: inherit;
}

.quantity-selector {
	display: flex;
	align-items: center;
}

.quantity-selector button {
	width: 30px;
	height: 30px;
	font-size: 18px;
	margin: 0 5px;
}

.quantity-selector input {
	width: 50px;
	text-align: center;
}

.product-details table {
	width: 80%;
	border-collapse: collapse;
	margin: 0 auto;
}

.product-details table, .product-details th, .product-details td {
	border: 1px solid #000;
}

.product-details th {
	width: 20%;
}

.product-details td {
	width: 30%;
}

.product-details th, .product-details td {
	padding: 8px;
	text-align: left;
}

.review-container {
	width: 80%;
	margin: 0 auto;
	background-color: #f9f9f9;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.review-item {
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #ddd;
}

.review-item h4 {
	margin: 0 0 5px 0;
	font-size: 18px;
}

.review-item p {
	margin: 0;
	font-size: 14px;
}

.review-item .review-meta {
	margin-top: 10px;
	color: #666;
	font-size: 12px;
}
</style>
</head>
<body>
	<main>
		<section>
			<header>section-header</header>
			<aside>
				<img src="<%= product.getProduct_imgurl() %>" alt="상품 이미지" width="360" height="360">
			</aside>
			<section>
				<article>
					<h2><%= product.getProduct_name() %></h2>
					 <p>가격: <%= product.getProduct_price() %>원</p>
				</article>
				<article>
					<p><%= product.getProduct_name() %></p>
					<p>수량선택:</p>
					<div class="quantity-selector">
						<button onclick="changeQuantity(-1)">-</button>
						<input id="quantity" type="text" value="1" readonly>
						<button onclick="changeQuantity(+1)">+</button>
					</div>
					<p>선택한 수량에 따른 가격: <span id="totalPrice"><%= product.getProduct_price() %>원</span></p>
				</article>
				<article>
					<button onclick="addToCart()">장바구니</button>
					<button onclick="buyNow()">구매하기</button>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
		<nav class="detail-nav">
			<a onclick="showSection('detail')">상세정보</a>
			<a onclick="showSection('review')">리뷰</a>
			<a onclick="showSection('qna')">QNA</a>
		</nav>
		<section class="detail-section">
			<article id="detail" class="active">
				<h3>상세정보</h3>
				<p><%=product.getProduct_detail() %></p>
				<div class="product-details">
					<table>
						<tr>
							<th>상품번호</th><td><%= product.getProduct_no() %></td>
							<th>사이즈</th><td><%= product.getProduct_size() %></td>
						</tr>
						<tr>
							<th>제조사</th><td><%= product.getMaker() %></td>
							<th>제조일자</th><td><%= product.getProduct_mfd() %></td>
						</tr>
						<tr>
							<th>상품명</th><td><%= product.getProduct_name() %></td>
							<th>소비기한</th><td><%= product.getProduct_epd() %></td>
						</tr>
						<tr>
							<th>색상</th><td><%= product.getProduct_color() %></td>
							<th>제조국</th><td><%= product.getProduct_poo() %></td>
						</tr>
					</table>
				</div>
			</article>
			<article id="review">
				<h3>상품후기</h3>
				<p>평점: <%=avgRating %></p>
				<nav>
					<a href="#">전체보기</a>

				</nav>
				<article>
					<% if (reviewList != null && !reviewList.isEmpty()){ %>
						<div class="review-container">
							<% for (ReviewDTO review : reviewList){ %>
							<div class="review-item">
								<h4><%= review.getReview_title() %></h4>
								<p>평점: <%= review.getReview_rating() %></p>
								<p><%= review.getReview_content() %></p>
								<p class="review-meta">작성자: <%= review.getCustomer_name() %>&nbsp;&nbsp; 
								구매일: <%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(review.getPurchase_date()) %></p>
							</div>
							<%} %>
						</div>
					<% }else{ %>
						<p>리뷰가 없습니다</p>
					<% } %>
				</article>
			</article>
			<article id="qna">
				<h3>QNA</h3>
				<p>QNA 출력 예정</p>
			</article>
		</section>
	</main>
	<script type="text/javascript">
	function updateTotalPrice() {
		let price = <%= product.getProduct_price() %>;
		let quantity = parseInt(document.getElementById("quantity").value);
		let totalPrice = price * quantity;
		document.getElementById("totalPrice").innerText = totalPrice + "원";
	}
	function changeQuantity(delta) {
		let quantityInput = document.getElementById("quantity");
		let currentQuantity = parseInt(quantityInput.value);
		let newQuantity = currentQuantity + delta;
		if (newQuantity < 1){
			newQuantity = 1;
		}
		quantityInput.value = newQuantity;
		updateTotalPrice();
	}
	function addToCart() {
		alert("장바구니에 추가되었습니다.");
	}
	function buyNow(){
		alert("구매 페이지로 이동합니다.");
	}
	function showSection(sectionId) {
		let sections = document.querySelectorAll(".detail-section > article");
		sections.forEach(section =>{
			section.classList.remove('active');
		});
		document.getElementById(sectionId).classList.add('active');
	}

</script>
</body>
</html>