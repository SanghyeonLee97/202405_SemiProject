<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<form action="/projectdengdeng/community/community_<%=Communityboard %>.jsp">
		<select name="select">
			<option value="<%=Communityboard %>_title">제목</option>
			<option value="<%=Communityboard %>_content">내용</option>
			<%
				if(Communityboard.equals("QNA")){
			%>
			<option value="<%=Communityboard %>_category">카테고리</option>
			<option value="<%=Communityboard %>_id">글쓴이</option>
			<%
				}else if(Communityboard.equals("FAQ")){
			%>
			<option value="<%=Communityboard %>_category">카테고리</option>
			<% } %>
		</select>
		<input type="text" name="search" value="">
		<button type="submit">검색</button>
	</form>
</header>