<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<form action="/projectdengdeng/community/community_<%=Communityboard %>.jsp">
					<select name="select">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="search" value="">
					<button type="submit">검색</button>
				</form>
</header>