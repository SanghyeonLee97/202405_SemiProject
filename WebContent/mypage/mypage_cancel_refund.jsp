<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<style type="text/css">
</style>
</head>
<body>
	
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header>취소/반품/교환</header>
				<article>
					상품이름<br>
					72000원<br>
					구매일<br>
					<button onclick="location.href='cancelrefund.do'">구매 취소</button>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>