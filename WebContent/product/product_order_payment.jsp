<%@page import="DTO.product.ProductDTO"%>
<%@page import="DTO.CustomerDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/product_css/product_order_payment.css" rel="stylesheet" type="text/css">
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>

</head>
<body>
    <main>
        <header>주문/결제</header>
        <section>
            <div class="payment-main">
                <article class="payment-article">
                    <h3>회원정보</h3><hr>
                    <p>${customer.customer_name }</p>
                    <p>${customer.customer_tel}</p>
                    <p>
                        ${customer.address_road}&nbsp;
                        ${customer.address_detail}
                        (${customer.postal_code})
                    </p>
                </article>
                <article class="payment-article">
                    <h3>할인 및 적립금 사용</h3><hr>
                    <p><span>자동 할인</span><span>8000원</span></p>
                    <p>
                        <span>쿠폰 할인</span>
                        <span>
                            <select name="couponName">
                                <option value="0" data-discount="0">쿠폰사용</option>
                                <!-- 쿠폰정보 동적추가 -->
                                <c:forEach var="coupon" items="${coupon }">
                                    <option value="${coupon.coupon_no }" data-discount="${coupon.coupon_discount }">${coupon.coupon_name }</option>
                                </c:forEach>
                            </select>
                        </span>
                    </p>
                    <p>
                        <span>적립금</span>
                        <span><input type="text" name="pointUsage" value="0"></span>
                        <span><button type="button" name="useAllPoints">전액사용</button></span>
                    </p>
                    <p>
                        <span>보유잔액</span>
                        <span>${customerPoint}원</span>
                        <input type="hidden" id="maxPoints" value="${customerPoint}">
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
                    <img src="${product.product_imgurl}" alt="주문상품-이미지">
                    <p>상품명: ${product.product_name}</p>
                    <p>상품수량: ${productQuantity}</p>
                    <p>가격: ${product.product_price}원</p>
                    <input type="hidden" id="productPrice" value="${product.product_price}">
                    <input type="hidden" id="productQuantity" value="${productQuantity}">
                </div><hr>
                <div>
                    <p>상품금액: ${product.product_price * productQuantity}원</p>
                    <p>할인금액: <span id="totalDiscount">8000원</span></p><hr>
                    <p>총 결제금액: <span id="totalPrice">${product.product_price * productQuantity - 8000}원</span></p>
                </div>
                <button onclick="window.history.back()">취소</button>
                <button>결제</button>
            </aside>
        </section>
    </main>
<script>
	var customerPoint = ${customerPoint};
</script>
<script src="./product_js/product_order_payment.js"></script>
</body>
</html>