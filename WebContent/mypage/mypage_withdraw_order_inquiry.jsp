<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	
	#inquirybox{
		text-align: center;
	}
	
	table{
		border-collapse: collapse;
		margin: auto;
		margin-top : 20px;
		height: 500px;
		width: 600px;
	}
	h6{
		margin:0;
	}
	
	select{
		margin-top:5px;
		width:100px;
		height: 28px;
	}
	input[type=submit]{
		width: 100px;
		height: 40px;
		border: none;
		margin: 15px;
	}
	tr{
		background: white;
	}
	.leftside_inquiry{
		background: #ffEB5A;
	}
	#cancle_inquiry{
		background: lightgray;
		color : black;
	}
	#submit_inquiry{
		background: black;
		color : white;
	}
</style>
</head>
<body>
	<h2 align="center">상품 문의</h2>
	<hr>
	<form action="productinquiry.do">
		<div id="inquirybox" style="clear: both;">
			<table border="1px solid black">
				<tr>
					<td class="leftside_inquiry"><h5>문의유형</h5></td>
					<td>
						<h6>※문의 유형 선택 후 문의 내용을 자세하게 작성해 주세요</h6>
						<select name="category">
							<option value="1">환불</option>
							<option value="2">반품</option>
							<option value="3">문의</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="leftside_inquiry"><h5>주문번호</h5></td>
					<td><input type="text" name="order_no" value="<%=request.getAttribute("order_no") %>"><br></td>
				</tr>
				
				<tr>
					<td class="leftside_inquiry"><h5>문의제목</h5></td>
					<td><input type="text" name="title"><br></td>
				</tr>
				
				<tr>
					<td class="leftside_inquiry"><h5>문의내용</h5></td>
					<td><textarea name="content" rows="10" cols="50">test</textarea><br></td>
				</tr>
			</table>		
			<input type="submit" value="취소" id="cancle_inquiry">
			<input type="submit" value="제출" id="submit_inquiry">
		</div>	
	</form>
</body>
</html>