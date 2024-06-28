<%@page import="dao.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		CommunityDAO ndao = new CommunityDAO();
		//게시판 종류 변수
		String communityBoard;
		//검색 테이블속성 변수
		String communitySelect;
		//검색어 변수
		String communitySearch="";	//기본 검색어는 없음
		//현재페이지 위치 변수
		int communityIndex=1;	//기본 페이지 위치는 1
	%>
</body>
</html>