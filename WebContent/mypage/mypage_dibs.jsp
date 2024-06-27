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
section>article {
	height: auto;
}

.table-container{
	width: 100%;
}
tr{
	text-align: center;
	border-bottom: 1px solid #ccc;
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
					<table class="table-container">
						<tr>
							<th></th>
							<th>상품명</th>
							<th>상품가격</th>
							<th>옵션</th>
						</tr>
						<c:forEach var="dibsList" items="${dibsList }">
							<tr>
								<td><img src="${dibsList.product_imgurl }" width="100px;"></td>
								<td>${dibsList.product_name }</td>
								<td>${dibsList.product_price }원</td>
								<td>
									<button>하트 취소</button><br>
									<button>장바구니 담기</button>
								</td>
							</tr>
						</c:forEach>
					</table>

				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>