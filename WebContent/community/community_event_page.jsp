<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">

<style type="text/css">

	#photoreview{
		width: 800px;
		height: 800px;
		margin-left: 200px;
		margin-top: 100px; 

	
	}
	div{
		width: 100%;
		height: 300px;
	
	}
	#phreview{
		position: relative;
		left: 450px;
		top: 100px;
		width: 300px;
		height:80px;
		background: yellow;
	}

</style>
</head>
<body>
	
	<img id=photoreview src="/projectdengdeng/imagefile/PhotoEvent1.png">
	<img id=photoreview src="/projectdengdeng/imagefile/PhotoEvent2.png">
	<img id=photoreview src="/projectdengdeng/imagefile/PhotoEvent3.png">
	
	
	<div>
		<button id="phreview" type="button">
			<a href="/projectdengdeng/community/community_event_participate.jsp" style="color: black"><h3>이벤트 참여하러 가기</h3></a>
		</button>
	</div>
</body>
</html>