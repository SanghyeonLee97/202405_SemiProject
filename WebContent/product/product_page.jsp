<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/product_css/product_page.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	let productPrice = ${product.product_price};
	let productNo = ${product.product_no};
</script>
<script src="./product_js/product_page.js"></script>
</head>
<body>
	<main>
		<section>
			<header></header>
			<aside>
				<img id="productimg" src="${product.product_imgurl}" alt="상품 이미지">
			</aside>
			<section>
				<article>
					<h2 style="text-align: center;">${product.product_name}</h2><br>
					 <p><h3 id="pricewon">가격: ${product.product_price}원</h3></p>
					 <hr>
				</article>
				<article>
					 <div id="pricesection">
						<p><h5>${product.product_name}</h5></p>
						<p><h4 id="pricenumber">구매수량선택:</h4></p>
						<div class="quantity-selector">
							<button id="productbt" onclick="changeQuantity(-1)">-</button>
							<input id="quantity" type="text" value="1" readonly>
							<button id="productbt" onclick="changeQuantity(+1)">+</button>
						</div>
						<br><br>
						<div id="pricep">
							<p><h4>총 상품 금액</h4><h5><span id="totalPrice">${product.product_price}원</span></h5></p>
						</div>
					</div>
				</article>
				<article>
					<button id="productbtb" onclick="addToCart()">장바구니 추가</button>
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
				<p>${product.product_detail}</p>
				<div class="product-details">
					<table>
						<tr>
							<th>상품번호</th><td>${product.product_no}</td>
							<th>사이즈</th><td>${product.product_size}</td>
						</tr>
						<tr>
							<th>제조사</th><td>${product.maker}</td>
							<th>제조일자</th><td><fmt:formatDate value="${product.product_mfd}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<th>상품명</th><td>${product.product_name}</td>
							<th>소비기한</th><td><fmt:formatDate value="${product.product_epd}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<th>색상</th><td>${product.product_color}</td>
							<th>제조국</th><td>${product.product_poo}</td>
						</tr>
					</table>
				</div>
			</article>
			<article id="review">
				<h3>상품후기</h3>
				<p>평점: ${avgRating}</p>
				<nav>
					<a href="#">전체보기</a>
				</nav>
				<article>
					<c:choose>
						<c:when test="${!empty reviewList}">
							<div class="review-container">
								<c:forEach var="review" items="${reviewList}">
									<div class="review-item">
										<h4>${review.review_title}</h4>
										<p>평점: ${review.review_rating}</p>
										<p>${review.review_content}</p>
										<p class="review-meta">
											작성자: ${review.customer_name}&nbsp;&nbsp;
											작성일: <fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd"/>
										</p>
									</div>
								</c:forEach>
							</div>
							<div class="pagination">
								<c:forEach begin="1" end="${pageCount }" var="pageNum">
									<a href="javascript:void(0);" onclick="loadReviews(${pageNum})">${pageNum }</a>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<p>리뷰가 없습니다</p>
						</c:otherwise>
					</c:choose>
				</article>
			</article>
			<article id="qna">
				<h3>QNA</h3>
				<div class="qna-container">
					<table class="qna-table">
						<tr>
							<th>답변상태</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
						<c:forEach var="qna" items="${qnaList}" varStatus="status">
							<tr>
								<td>
									<c:choose>
										<c:when test="${not empty qna.pi_answer}">답변완료</c:when>
										<c:otherwise>미답변</c:otherwise>
									</c:choose>
								</td>
								<td class="qna-title" onclick="toggleContent(${status.index})">${qna.pi_title}</td>
								<td>${qna.customer_name}</td>
								<td><fmt:formatDate value="${qna.pi_date}" pattern="yyyy-MM-dd"/></td>
							</tr>
							<tr id="content-${status.index}" style="display: none;">
								<td colspan="4">
									<div>
										<p><strong>질문 내용:</strong></p>
										<p>${qna.pi_content}</p>
										<c:if test="${not empty qna.pi_answer}">
											<p><strong>답변 내용:</strong></p>
											<p>${qna.pi_answer}</p>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
					<div class="pagination">
						<c:forEach begin="1" end="${pageCount }" var="pageNum">
							<a href="javascript:void(0);" onclick="loadQna(${pageNum})">${pageNum }</a>
						</c:forEach>
					</div>
				</div>
			</article>
		</section>
	</main>
</body>
</html>