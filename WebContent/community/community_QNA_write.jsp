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
	main>section{
		padding-top:80px;
	}
	main>section>article{
		height: 680px;
		position: relative;
	}
</style>
</head>
<body>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<article>section-article</article>
			<nav>
				<button type="button" onclick="communityGoBack()">이전</button>
				<button type="submit">등록</button>
			</nav>
		</section>
		
	</main>
</body>
</html>