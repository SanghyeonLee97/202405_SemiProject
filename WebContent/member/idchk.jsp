<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		let YN = <%=request.getAttribute("YN") %>;
		if(YN==true){
			opener.parent.idchk0();

		}else{
			opener.parent.idchk1();
		}
		window.close()
</script>
</head>
<body>
	
</body>
</html>