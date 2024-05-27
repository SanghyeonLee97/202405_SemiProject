<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/community.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section>article{
		height: 620px;
	}
	main>section>nav:nth-child(4){
		height: 40px;
		margin-top:20px;
	}
</style>
</head>
<body>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<%@ include file="main_section_header.jsp" %>
			<article>section-article</article>
			<nav>
				<button onclick="location.href='../product/product_list_page.jsp'">쇼핑하기</button>
				<button onclick="location.href='community_QNA_write.jsp'">글쓰기</button>
			</nav>
			<nav>
				
			</nav>
		</section>
		
	</main>
</body>
</html>