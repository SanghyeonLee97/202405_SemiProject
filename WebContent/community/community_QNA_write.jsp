<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/community.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	
	//뒤로가기 함수
	function communityGoBack() {
		window.history.back();
	}
</script>
<style type="text/css">
	main>section>article{
		height: 680px;
		position: relative;
	}
	input{
		width: 100%;
	}
	textarea {
		width: 100%; height: 500px;
	}
</style>
</head>
<body>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<article>
				<form id="QNAForm" action="QNAWrite.do">
					카테고리 
					<select name="category">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
					<br>
					제목 <input type="text" name="title"><br>
					내용 <br><textarea name="content"></textarea>
					이미지첨부-구현후순위<br>
					파일첨부-구현후순위
				</form>
			</article>
			<nav>
				<button type="button" onclick="communityGoBack()">이전</button>
				<button type="submit" form="QNAForm">등록</button>
			</nav>
		</section>
		
	</main>
</body>
</html>