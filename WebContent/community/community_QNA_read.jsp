<%@page import="DTO.community.CommunityDTO"%>
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
	table{
		text-align: center;
		margin-left: 250px;
		margin-top: 100px;
		margin-bottom: 100px;
		border: 1px solid lightgray;
		border-collapse: collapse;
		width: 700px;
		
	}
	tr,td{
	border: 1px solid lightgray;
	}
	
	#qnalist{
		
		height: 50px;
		width:  100px;
		margin-left: 550px;
		background: yellow;
	
	}
	
	
</style>
</head>
<body>
<%
	CommunityDTO cfdto = (CommunityDTO)request.getAttribute("read");
	MemberDAO mdao = new MemberDAO();
	String sid="";
	if(session.getAttribute("id")!=null){
		sid=(String)session.getAttribute("id");
	}
%>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<article>
				<table>
					<tr>
						<td height="30px;">글쓴이</td>
						<td><%=cfdto.getCustomer_id() %></td>
					</tr>
					<tr>
						<td height="30px;">작성시간</td>
						<td><%=cfdto.getCommunityDate() %></td>
					</tr>
					<tr>
						<td height="50px;">글제목</td>
						<td><%=cfdto.getCommunityTitle() %></td>
					</tr>
					<tr>
						<td height="400px;">글내용</td>
						<td><%=cfdto.getCommunityContent() %></td>
					</tr>
				</table>
			</article>
			<article>
				<table>
					<tr>
						<td height="50px;">답변내용</td>
					</tr>
					<tr>
						<td height="150px;">
						<%
							if(cfdto.getCommunityanswer()==null){
						%>
							답변 존재X
						<%
							}else{
						%>
							<%=cfdto.getCommunityanswer() %>
						<%} %>
						</td>
					</tr>
				</table>
				<%
					if(mdao.adminChk(sid)){
				%>
				<!-- 운영자 답변용 디자인X -->
				<form action="QNAAnswer.do">
					<input type="hidden" name="no" value="<%=cfdto.getCommunityNo()%>">
					<textarea name="answer" rows="10" cols="100"></textarea><br>
					<button type="submit">답변하기</button>
				</form>
				<!-- 운영자 답변 -->
				<%} %>
			</article>
			<nav>
				<button id="qnalist" onclick="location.href='community_QNA.jsp'">목록으로</button>
				<%
					if(sid.equals(cfdto.getCustomer_id())){
				%>
				<button onclick="location.href='QNADelete.do?board=qna&no=<%=cfdto.getCommunityNo() %>'">삭제하기</button>
				<% } %>
				
			</nav>
		</section>
		
	</main>
</body>
</html>