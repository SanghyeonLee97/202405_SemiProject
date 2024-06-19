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
	/* background-color: #ddddff; */
}

main>section>header {
	width: 100%;
	height: 120px;
	/* background-color: #ddffff; */
}

main>section>aside {
	width: 460px;
	height: 460px;
	/* background-color: #ffffdd; */
	float: left;
}

main>section>section {
	width: 740px;
	/* background-color: #ddffdd; */
	float: left;
}

main>section>section>article {
	width: 100%;
	/* background-color: #ffddff; */
	
}

main>section>section>article:nth-child(1) {
	height: 100px;
	
}

main>section>section>article:nth-child(2) {
	height: 140px;
	margin-top: 40px;
	text-align: center;
}

main>section>section>article:nth-child(3) {
	height: 280px;
	margin-top: 40px;
	text-align: center;
}

.detail-nav {
	width: 100%;
	height: 70px;
	

}

.detail-nav a {
	margin: 0 15px;
	cursor: pointer;
	text-decoration: underline;
	color: inherit;
	margin-left: 200px;
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
	color: inherit;
}

.quantity-selector {
	display: flex;
	align-items: center;
	margin-left: 250px;
	position: relative;
	bottom: 5px;
	
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
 #productimg{

	width: 460px;
	height: 460px;
	
}
#pricewon {
	margin-left: 450px;
}
#productbt{
	width: 60px;
	height: 30px;
	background: yellow;
	border: none;
	
	
	
}
 #productbtb {
	width: 150px;
	height: 50px;
	background: yellow;
	position: relative;
	top: 150px;
	left: 100px;
	border: none;
	margin-left: 10px;
} 
#pricep{
	position: relative;
	left:120px; 
	
}
 #pricenumber{
	position: relative;
	right: 50px;
	top: 40px;
}
#pricesection{
	
	width: 400px;
	height: 150px;
	background: #FAFAD2;
	position: relative;
	left: 250px;
	top:70px;
	

}
#detaila{
	font-size: 35px;
	text-decoration: underline;


}


</style>
</head>
<body>
	<main>
		<section>
			<header></header>
			<aside>
				<img id="productimg" src="<%= product.getProduct_imgurl() %>" alt="상품 이미지" >
			</aside>
			<section>
				<article>
					<h2 style="text-align: center;"><%= product.getProduct_name() %></h2><br>
					 <p><h3 id="pricewon">가격: <%= product.getProduct_price() %>원</h3></p>
					 <hr>
				</article>
				<article>
					 <div id="pricesection">
						<p><h5><%= product.getProduct_name() %></h5></p> 
						<p><h4 id="pricenumber">구매수량선택:</h4></p>
						<div class="quantity-selector">
							<button id="productbt" onclick="changeQuantity(-1)">-</button>
							<input id="quantity" type="text" value="1" readonly>
							<button id="productbt" onclick="changeQuantity(+1)">+</button>
						</div>
						<br><br>
						<div id="pricep"><p><h4>총 상품 금액 </h4><h5><span id="totalPrice"><%= product.getProduct_price() %>원</span></h5></p></div>
					</div>
				</article>
				<article>
					<button id="productbtb" onclick="addToCart()">장바구니</button>
					<button id="productbtb" onclick="buyNow()">구매하기</button>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
		<nav class="detail-nav">
			<a id="detaila" onclick="showSection('detail')" >상세정보</a>
			<a id="detaila" onclick="showSection('review')"  >리뷰</a>
			<a id="detaila" onclick="showSection('qna')"  >QNA</a>
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