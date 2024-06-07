<%@page import="DTO.CommunityQNADTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/community.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	CommunityQNADTO cfdto = (CommunityQNADTO)request.getAttribute("read");
%>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<article>
				글쓴이 <%=cfdto.getCustomer_id() %>
			</article>
			<article>
				작성시간 <%=cfdto.getQna_date() %>
			</article>
			<article>
				글제목 <%=cfdto.getQna_title() %>
			</article>
			<article>
				글내용 <%=cfdto.getQna_content() %>
			</article>
			<article>
				답변내용 <%=cfdto.getQna_answer() %>
			</article>
			<nav>
				<button onclick="location.href='community_QNA.jsp'">목록으로</button>
			</nav>
		</section>
		
	</main>
</body>
</html>