<%@page import="DTO.CommunityFAQDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	table{
		width: 700px;
		height: 500px;
		text-align: center;
		margin-left: 250px;
		margin-top: 100px;
		margin-bottom: 100px;
		border-collapse: collapse;
	}
	#faqtitle {
		height: 70px;
	
	}


</style>
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
			<table border="1">
				<article>
					<tr><td id="faqtitle"><%=cfdto.getFaqTitle() %></td></tr>
				</article>
				<article>
					<tr><td><%=cfdto.getFaqContent() %></td></tr>
				</article>
			</table>
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