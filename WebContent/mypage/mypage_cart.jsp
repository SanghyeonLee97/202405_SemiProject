<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.7.1.js"></script>
<script type="text/javascript">
	//상품수량 +,- 구현
	function count(type)  {
	  // 결과를 표시할 element
	  const resultElement = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  let number = resultElement.innerText;
	  
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
	    number = parseInt(number) - 1; 
	    if(number <= 0){	
	       	number = 0;
	    }	
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	}

</script>
<link href="../css/style2.css?after" rel="stylesheet" type="text/css">
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<style type="text/css">



	input[type=button]{
		width: 28px;
	}
	
	
	table{
		width: 100%;
	}
	
	tr{
		text-align: center;
		border-bottom: 1px solid #ccc;
	}
button{
	border: none;
	margin : 10px;
	width: 115px;
	height: 30px;
}
</style>
</head>
<body>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<table>
					<tr>
						<th class="t_width_1"></th>
						<th class="t_width_2">상품명</th>
						<th class="t_width_3">상품가격</th>
						<th class="t_width_4">수량</th>
						<th class="t_width_5">옵션</th>
					</tr>
					<c:forEach var="cart" items="${cartList }">
					<tr>
						<td>
							<div>
								<img src="${cart.product_imgurl }" alt="상품이미지(product_imgurl)" width="100px" height="100px">
							</div>
						</td>
						<td>${cart.product_name }</td>
						<td>${cart.product_price }원</td>
						<td>
							<input type='button' onclick='count("plus")' value='+'>
							<input type="text" id='result' value='${cart.product_quantity }' readonly>
							<input type='button' onclick='count("minus")' value='-'>
						</td>
						<td>
							<div>
								<form action="deleteCart.do" method="post" onsubmit="return confirm('정말로 장바구니에서 삭제하시겠습니까?')">
									<input type="hidden" name="cart_no" value="${cart.cart_no }">
									<button type="submit">담기 취소</button>
								</form>
								<form action="/projectdengdeng/product/orderPayment.do" method="post">
									<input type="hidden" name="product_no" value="${cart.product_no }">
									<input type="hidden" name="product_quantity" value="${cart.product_quantity }">
									<button>바로 구매</button>
								</form>
							</div>
						</td>
					</tr>
					</c:forEach>
				</table>	
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>