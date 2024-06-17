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
<style type="text/css">
	table{
		width:100%;
		border: 1px solid black;
		border-collapse: collapse;
	}
	tr,td{
	border: 1px solid black;
	}
</style>
</head>
<body>
<%
	CommunityQNADTO cfdto = (CommunityQNADTO)request.getAttribute("read");
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
						<td>글쓴이</td>
						<td><%=cfdto.getCustomer_id() %></td>
					</tr>
					<tr>
						<td>작성시간</td>
						<td><%=cfdto.getQna_date() %></td>
					</tr>
					<tr>
						<td>글제목</td>
						<td><%=cfdto.getQna_title() %></td>
					</tr>
					<tr>
						<td>글내용</td>
						<td><%=cfdto.getQna_content() %></td>
					</tr>
				</table>
			</article>
			<article>
				<table>
					<tr>
						<td>답변내용</td>
					</tr>
					<tr>
						<td>
						<%
							if(cfdto.getQna_answer()==null){
						%>
							답변 존재X
						<%
							}else{
						%>
							<%=cfdto.getQna_answer() %>
						<%} %>
						</td>
					</tr>
				</table>
				<%
					if(mdao.adminChk(sid)){
				%>
				<form action="QNAAnswer.do">
					<input type="hidden" name="no" value="<%=cfdto.getQna_no()%>">
					<textarea name="answer" rows="10" cols="100"></textarea><br>
					<button type="submit">답변하기</button>
				</form>
				<%} %>
			</article>
			<nav>
				<button onclick="location.href='community_QNA.jsp'">목록으로</button>
				<%
					if(sid.equals(cfdto.getCustomer_id())){
				%>
				<button onclick="location.href='QNADelete.do?board=qna&no=<%=cfdto.getQna_no() %>'">삭제하기</button>
				<% } %>
				
			</nav>
		</section>
		
	</main>
</body>
</html>