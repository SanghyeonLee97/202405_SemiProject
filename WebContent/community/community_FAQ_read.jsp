<%@page import="DTO.CommunityFAQDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/projectdengdeng/css/style2.css" rel="stylesheet" type="text/css">
<link href="/projectdengdeng/css/community.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	CommunityFAQDTO cfdto = (CommunityFAQDTO)request.getAttribute("read");
%>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<article>
				<%=cfdto.getFaqTitle() %>
			</article>
			<article>
				<%=cfdto.getFaqContent() %>
			</article>
			<nav>
				<button onclick="location.href='community_FAQ.jsp'">목록으로</button>
				<%
					MemberDAO mdao = new MemberDAO();
					if(mdao.adminChk((String)session.getAttribute("id"))){
				%>
				<button onclick="location.href='QNADelete.do?board=faq&no=<%=cfdto.getFaqNo() %>'">삭제하기</button>
				<% } %>
			</nav>
		</section>
		
	</main>
</body>
</html>