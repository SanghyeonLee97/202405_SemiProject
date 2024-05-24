<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>데이터 출력</h1>
	id: <%=request.getParameter("id") %> <br>
	password: <%=request.getParameter("password") %><br>
	passwordVerify: <%=request.getParameter("passwordVerify") %><br>
	name: <%=request.getParameter("name") %><br>
	tel: <%=request.getParameter("tel") %><br>
	postcode: <%=request.getParameter("postcode") %><br>
	roadAddress <%=request.getParameter("roadAddress") %><br>
	jibunAddress <%=request.getParameter("jibunAddress") %><br>
	detailAddress <%=request.getParameter("detailAddress") %><br>
	extraAddress <%=request.getParameter("extraAddress") %><br>
	petName <%=request.getParameter("petName") %><br>
	breed <%=request.getParameter("breed") %><br>
</body>
</html>