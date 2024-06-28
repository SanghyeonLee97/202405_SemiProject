<%@page import="DTO.product.CartDTO"%>
<%@page import="DTO.product.ProductDTO"%>
<%@page import="DTO.CategoryDTO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트 페이지</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>

<style type="text/css">
body>main {
	display: flex;
	justify-content: center;
	width: 100%;
}

main>section {
	display: flex;
	width: 100%;
	max-width: 1200px;
	background-color: #ddddff;
}

main>section>aside {
	width: 16.6666%;
	height: 800px;
	background-color: #ffffdd;
	position: sticky;
	top: 0;
	align-self: flex-start;
}

main>section>aside>header {
	width: 100%;
	height: 40px;
	background-color: #ffdddd;
}

main>section>section {
	width: 66.66%;
	height: auto;
	margin: 40px 10px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
}

.product-card {
	background-color: white;
	border: 1px solid #ddd;
	padding: 10px;
	height: 300px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

.product-card img {
	width: 100%;
	height: auto;
	flex-shrink: 0;
}

.product-card h5, .product-card p {
	margin: 10px 0;		/* 여기 마진 바꿔볼예정 */
	flex-shrink: 0;
}

.product-card h5 {
	font-size: 18px;
}

.pagination {
	display: flex;
	justify-content: center;
	list-style: none;
	padding: 0;
}

.pagination li {
	margin: 0 5px;
}

.pagination a {
	text-decoration: none;
	padding: 8px 16px;
	color: black;
	border: 1px solid #ddd;
}

.pagination .active a {
	background-color: #007bff;
	color: white;
	border-color: #007bff;
}
</style>
</head>
<body>
	<main>
		<section>
			<aside>
				<header>상품분류</header>
				<c:if test="${not empty subCategoryList }">
					<c:forEach var="category" items="${subCategoryList }">
						<div>
							<a href="list.do?pc_no=${category.pc_no }">${category.pc_name }</a>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${empty subCategoryList }">
					<p>상품리스트 없음</p>
				</c:if>
			</aside>
			<section>
				<c:if test="${not empty productList }">
					<c:set var="maxProductsPerPage" value="16" />
					<c:set var="productCount" value="${fn:length(productList)}"/>
					<c:set var="currentPage" value="${param.page != null ? param.page : 1}"/>
					<c:set var="start" value="${(currentPage - 1) * maxProductsPerPage}"/>
					<c:set var="end" value="${start + maxProductsPerPage < productCount ? start + maxProductsPerPage : productCount}"/>
					<c:forEach var="product" begin="${start}" end="${end - 1}" items="${productList}">
						<c:set var="isDibbed" value="false"/>
						<c:if test="${not empty dibsList}">
							<c:forEach var="dib" items="${dibsList}">
								<c:if test="${dib.product_no == product.product_no}">
									<c:set var="isDibbed" value="true"/>
								</c:if>
							</c:forEach>
						</c:if>	
						<div class="product-card">
							<a href="details.do?product_no=${product.product_no}">
								<img src="${product.product_imgurl}">
								<h5>${product.product_name}</h5>
								<p>
									${product.product_price}원&nbsp;&nbsp;&nbsp;
								</p>
							</a>
							<c:if test="${not empty sessionScope.no }">
								<form method="post" action="selectDibs.do">
									<input type="hidden" name="product_no" value="${product.product_no}">
									<input type="hidden" name="isChecked" value="${isDibbed}">
									<button type="submit">
										<c:choose>
											<c:when test="${isDibbed }">찜하기 취소</c:when>
											<c:otherwise>찜하기</c:otherwise>
										</c:choose>
									</button>
								</form>
							</c:if>
						</div>
					</c:forEach>
				</c:if>
			</section>
			<aside>
                <h4>최근 본 상품</h4>
                <c:if test="${not empty recentlyViewedProducts }">
                	<c:forEach var="product" items="${recentlyViewedProducts }">
                		<div class="recent-product">
		                	<figure style="text-align: center;">
		                    <a href="details.do?product_no=${product.product_no}">
		                        <img src="${product.product_imgurl}" alt="Product Img" width="180px">
		                        <figcaption>${product.product_name}</figcaption>
		                    </a>
		                    </figure>
		                </div>
                	</c:forEach>
                </c:if>
				<c:if test="${empty recentlyViewedProducts}">
					<p>최근 본 상품이 없습니다.</p>
				</c:if>
            </aside>
		</section>
	</main>
	<nav>
		<ul class="pagination">
			<c:set var="totalPages" value="${(productCount + maxProductsPerPage - 1) / maxProductsPerPage}"/>
			<c:forEach var="i" begin="1" end="${totalPages}">
				<li class="page-item ${i == currentPage ? 'active' : ''}">
					<a class="page-link" href="?page=${i}
							<c:if test="${not empty param.pc_parent_no}">&pc_parent_no=${param.pc_parent_no}</c:if>
							<c:if test="${not empty param.pc_no}">&pc_no=${param.pc_no}</c:if>">
						${i}
					</a>
				</li>
			</c:forEach>
		</ul>
	</nav>
	<script type="text/javascript">
		$(document).ready(function () {
			let $window = $(window);
			let $asideLeft = $('main>section>aside').first();
			let $asideRight = $('main>section>aside').last();
			let offset = $asideLeft.offset();
			
			$window.scroll(function(){
				let scrollTop = $window.scrollTop();
				if(scrollTop > offset.top){
					$asideLeft.stop().animate({top: scrollTop - offset.top + 10}, 'slow');
					$asideRight.stop().animate({top: scrollTop - offset.top + 10}, 'slow');
				}else{
					$asideLeft.stop().animate({top: 0}, 'slow');
					$asideRight.stop().animate({top: 0}, 'slow');
				}
			});
		});
	</script>
</body>
</html>