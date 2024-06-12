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
	section>article{
		height: 540px;
	}
</style>
</head>
<body>	
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header>
					<h3>회원정보 수정</h3>
				</header>
				<article>
					■ 표시는 필수 입력사항 입니다.<br>
					■ 아이디: asasd<br>
					■ 비밀번호: <input><br>
					■ 비밀번호 확인: <input><br>
					■ 이름: <input><br>
					전화번호: <input><br>
					■ 주소: <input><br>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
</body>
</html>