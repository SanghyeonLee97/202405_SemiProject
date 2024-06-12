<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage header Module</title>
<script type="text/javascript">
	function chk() {
		alert("비정상적인 접근");
		location.href="/projectdengdeng/index.jsp";
	}
</script>
</head>
<body onload="
	<%
		if(session.getAttribute("id")==null){
	%>
chk()
	<%} %>
">
	<%
		String sessionid = (String)session.getAttribute("id");
	%>
	<header>
        <h1><%=sessionid %>님</h1>
        <article>header-article</article>
        <article>header-article</article>
        <article>header-article</article>
        <article>header-article</article>
    </header>
</body>
</html>