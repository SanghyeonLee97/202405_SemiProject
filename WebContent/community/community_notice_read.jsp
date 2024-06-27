<%@page import="DTO.community.CommunityNoticeDTO"%>
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
		border: 1px solid lightgray;
	}
	#notitle {
		height: 50px;
	
	}
	#nowriter{
		height: 50px;
	}
	#nolist{
		height: 50px;
		width:  100px;
		margin-left: 550px;
		background: yellow;
	
	}

</style>
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
				<table border="1">
					<tr>
						<td id="notitle">제목</td><td><%=ndto.getCommunityTitle() %></td>
					</tr>
					<tr>
						<td id="nowriter">작성자</td><td>댕댕</td>
						<%=ndto.getCommunityNo() %>
					</tr>
						</article>
						<article>
							<tr><td colspan="2"><p><%=ndto.getCommunityContent() %></p></td></tr>
						</article>
				</table>
			<nav>
				<button id="nolist" onclick="location.href='community_notice.jsp'">목록으로</button>
				<%
					MemberDAO mdao = new MemberDAO();
					if(mdao.adminChk((String)session.getAttribute("id"))){
				%>
				<button onclick="location.href='QNADelete.do?board=notice&no=<%=ndto.getCommunityNo() %>'">삭제하기</button>
				<% } %>
			</nav>
		</section>
		
	</main>
</body>
</html>