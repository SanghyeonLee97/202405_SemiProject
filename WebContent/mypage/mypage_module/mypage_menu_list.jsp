<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage menuList module</title>
<style>
	.menu_list li {
		margin-left: 40px;
	}
</style>
</head>
<body>
	<aside>
		<h5>My쇼핑</h5>
		<ul class="menu_list">
			<li><a href="#">하트</a></li>
			<li><a href="cartList.do">장바구니</a></li>
			<li><a href="cancelrefund.do">주문 취소</a></li>
			<li><a href="productinquirylist.do">1:1문의</a></li>
		</ul>
		<h5>My정보</h5>
		<ul class="menu_list">
			<li><a href="updateInfo.do">회원정보 수정</a></li>
		</ul>
		
	</aside>
</body>
</html>