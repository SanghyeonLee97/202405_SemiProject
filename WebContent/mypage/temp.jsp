<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="productinquiry.do">
		<select name="category">
			<option value="1">환불</option>
			<option value="2">반품</option>
			<option value="3">문의</option>
		</select>
		<br>
		<input type="text" name="order_no" value="<%=request.getAttribute("order_no") %>"><br>
		<input type="text" name="title"><br>
		<textarea name="content" rows="10" cols="50">test</textarea><br>
		<input type="submit">
	</form>
</body>
</html>