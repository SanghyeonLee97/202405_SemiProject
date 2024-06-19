<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
main>header {
	width: 100%;
	height: 180px;
	background-color: #ddffdd;
	position: relative;
	text-align: center;
	line-height: 180px;
	font-size: 24px;
	font-weight: bold;
}

main>section {
	width: 100%;
	margin-top: 20px;
	background-color: #ddddff;
	display: flex;
	justify-content: space-between;
}

.payment-main {
	width: 60%;
	background-color: #ffddff;
}

.payment-article {
	background-color: #ddffff;
	padding: 20px;
	margin-bottom: 20px;
}

.payment-article p {
	display: flex;
	justify-content: start;
}
.payment-article p span{
	margin-right: 20px;
}
.payment-article p span:first-child {
	width: 100px;
}
.payment-aside {
	width: 35%;
	background-color: #ffffdd;
	padding: 20px;
}

.payment-article input[type="button"]
	{
	width: calc(100% - 20px);
	padding: 10px;
	margin: 5px 0;
}

.payment-aside img {
	width: 100%;
}

.payment-aside div {
	margin-top: 20px;
}

.payment-aside button {
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	background-color: #ddddff;
	border: none;
	font-size: 16px;
}
</style>
</head>
<body>
	<main>
		<header>주문/결제</header>
		<section>
			<div class="payment-main">
				<article class="payment-article">
					<h3>회원정보</h3><hr>
					<p>홍길동</p>
					<p>전화번호</p>
					<p>주소</p>
				</article>
				<article class="payment-article">
					<h3>할인 및 적립금 사용</h3><hr>
					<p><span>자동 할인</span><span>8000원</span></p>
					<p>
						<span>쿠폰 할인</span>
						<span>
							<select name="couponName">
								<option>쿠폰사용</option>
								<option>쿠폰1</option>
								<option>쿠폰2</option>
								<option>쿠폰3</option>
							</select>
						</span>
					</p>
					<p>
						<span>적립금</span>
						<span><input type="text"></span>
						<span><button>전액사용</button></span>
					</p>
					<p>
						<span>보유잔액</span><span>12000원</span>
					</p>
				</article>
				<article class="payment-article">
					<h3>결제수단</h3><hr>
					<button>카드결제</button>
					<button>카카오 페이</button>
                    <button>네이버 페이</button>
                    <button>휴대폰 결제</button>
				</article>
			</div>
			<aside class="payment-aside">
				<h3>주문상품</h3><hr>
				<div>
					<img src="#" alt="주문상품-이미지">
					<p>상품명</p>
					<p>가격</p>
				</div><hr>
				<div>
					<p>상품금액</p>
					<p>할인금액</p><hr>
					<p>총 결재금액</p>
				</div>
				<button>취소</button>
				<button>결제</button>
			</aside>
		</section>
	</main>
</body>
</html>