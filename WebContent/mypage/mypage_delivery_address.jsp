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
	main>section{
		font-weight: bolder;
		text-align: center;
	}
	#delivery_address{
		width:700px;
		height:300px;
		background: #f5f5f5;
	}
	input[type=submit]{
		border: none;
		cursor: pointer;
		background-color: #ffEB5A;
		margin: 10px;
		box-shadow: 0 0 2px #333;
	}
	#delivery_address{
		margin: 0 auto;
		margin-right: 155px;
	}
	#delivery_update{
		width: 90px;
		height: 35px;
	}
	#delivery_delete{
		width: 90px;
		height: 35px;
	} 
	#delivery_add{
		width: 120px;
		height: 35px;
	}
</style>
</head>
<body>
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<h2>배송지 관리</h2>
			<div id="delivery_address">
				<table>
					<tr>
						<td>
							<img src="../imagefile/location.png" width="50px;" height="50px;"><span>기본 배송지</span><br><br><br>
						</td>
					</tr>	
					
					<tr>
						<td><span>받으시는 분</span></td>
						<td><span>홍길동</span>&nbsp;&nbsp;&nbsp;<br></td>
					</tr>
						
					<tr>
						<td><span>연락처</span></td>
						<td><span>010-1234-5678</span></td>
					</tr>		
						
					<tr>
						<td><span>배송지 주소</span>
						<td><span>서울시 구로구 디지털로 30길 31 코오롱디지털타워빌란트2차 203호~205호</span></td>
					</tr>	
				</table>
					<br><br><br><input type="submit" value="배송지 수정" id="delivery_update">
					<input type="submit" value="배송지 삭제" id="delivery_delete" ><br><br>
			</div>
					<input type="submit" value="배송지 추가하기" id="delivery_add">
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>