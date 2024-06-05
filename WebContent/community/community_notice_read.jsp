<%@page import="DTO.CommunityNoticeDTO"%>
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
	CommunityNoticeDTO ndto = (CommunityNoticeDTO)request.getAttribute("read");
%>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<article>
				<table>
					<tr>
						<td>제목</td><td><%=ndto.getNoticeTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td><td>댕댕</td>
					</tr>
				</table>
			</article>
			<article>
				<p><%=ndto.getNoticeContent() %></p>
			</article>
			<nav>
				<button onclick="location.href='community_notice.jsp'">목록으로</button>
			</nav>
		</section>
		
	</main>
</body>
</html>