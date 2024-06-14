<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">

	.register_success{
		text-align: center;
		position: relative;
		width: 100%;
		margin: 20px;
	}

	#mainhompage{
		background : lightgray;
		color : black;
		border: none;
		width: 125px;
		height: 50px;
		
	}
	#logingo{
		background: black;
		color : white;
		border: none;
		width: 125px;
		height: 50px;
		
	}
</style>
</head>
<body>
	<div class="register_success">
		<img src="../imagefile/checkmark.png" style="width:70px; height: 70px;">
		<h4>회원가입이 완료 되었습니다</h4>
		<h6>회원가입을 축하합니다</h6>
		<h6>더 좋은 서비스로 찾아뵙겠습니다 즐거운 쇼핑되세요</h6>
		
		<hr>
		<br>	
		<button onclick="location.href='../index.jsp'" id="mainhompage">메인</button>
		<button onclick="location.href='login.jsp'" id="logingo">로그인</button>
	</div>
</body>
</html>