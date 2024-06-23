<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<style type="text/css">
.cart-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid #ccc;
	padding: 10px 0;
}
.cart-container img {
	width: 100px;
	height: 100px;
}
.cart-container div {
	margin: 0 15px;
}
.cart-product-container {
	width: 600px;
}
</style>
</head>
<body>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header>장바구니</header>
				<article>
				<c:forEach var="cart" items="${cartList }">
					<div class="cart-container">
						<div>
							<img src="${cart.product_imgurl }" alt="상품이미지(product_imgurl)">
						</div>
						<div class="cart-product-container">
							<p>상품명(product_name): ${cart.product_name }</p>
							<p>상품가격(product_price): ${cart.product_price }</p>
							<p>수량(product_quantity): ${cart.product_quantity }</p>
						</div>
						<div>
							<form action="/orderPayment.do">
								
							</form>
							<button>담기 취소</button>&nbsp;&nbsp;
							<button>바로 구매</button>
						</div>
					</div>
				</c:forEach>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>