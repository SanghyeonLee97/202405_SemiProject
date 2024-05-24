<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>데이터 출력</h1>
	id: <%=request.getParameter("id") %><br>
	password: <%=request.getParameter("password") %><br>
	idSave: <%=request.getParameter("idSave") %>
</body>
</html>