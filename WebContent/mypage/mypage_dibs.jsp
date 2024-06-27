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
	section>article{
		height: auto;
	}
</style>
</head>
<body>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header>찜한 상품 목록</header>
				<article>
					<c:forEach var="dibsList" items="${dibsList }">
						<img src="${dibsList.product_imgurl }" width="100px;">
						<p>${dibsList.product_name }</p>
						<p>${dibsList.product_price }</p>
					</c:forEach>
					
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>