<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.7.1.js"></script>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	//input의 타입을 토글하는 함수 (password<-->text)
	function updateTextPwdToggle(updateInfoPwdId) {
		let updateInfoPwdId2 = document.getElementById(updateInfoPwdId);
		
		//현재 text인가 password인가
		if(updateInfoPwdId2.type=="password"){
			updateInfoPwdId2.type="text";
		}else if(updateInfoPwdId2.type=="text"){
			updateInfoPwdId2.type="password";
		}
	}
	
	//비밀번호 확인 함수
	$(function(){
		$('#updateInfoPwdVerify').on('focusout',function(){
			let Pwd = document.getElementById("updateInfoPwd").value;
			let PwdVerify = document.getElementById("updateInfoPwdVerify");
			if(Pwd!=PwdVerify.value){
				alert("비밀번호가 다릅니다.");
				PwdVerify.value="";
			}
		});
	});
</script>
<style type="text/css">
	section>article{
		height: 540px;
	}
</style>
</head>
<body>	
	<main>
		<%@ include file="./mypage_module/mypage_header.jsp" %>
		<section>
			<%@ include file="./mypage_module/mypage_menu_list.jsp" %>
			<section>
				<header>
					<h3>회원정보 수정</h3>
				</header>
				<article>
					<form action="updateInfo.do?id=<%=sessionid %>" method="post">
						■ 표시는 필수 입력사항 입니다.<br>
						■ 아이디: <%=sessionid %><br>
						■ 비밀번호: <input id="updateInfoPwd" type="password" name="password" required="required">
									<button type="button" onclick="updateTextPwdToggle('updateInfoPwd')">test</button><br>
						■ 비밀번호 확인: <input id="updateInfoPwdVerify" type="password" name="passwordVerify" required="required">
									<button type="button" onclick="updateTextPwdToggle('updateInfoPwdVerify')">test</button><br>
						■ 이름: <input type="text" name="name" required="required"><br>
						전화번호: <input type="text" placeholder="-없이 입력하세요" name="tel"><br>
						<!-- addressAPI.js호출해서 사용 -->
						■ 주소: 
						<input type="text" id="addressPostcode" placeholder="우편번호" name="postcode" readonly="readonly" required="required">
						<input type="button" onclick="addressExecDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="addressRoadAddress" placeholder="도로명주소" 
								name="roadAddress" readonly="readonly">
								<input type="text" id="addressDetailAddress" placeholder="상세주소" 
								name="detailAddress" >
						<input type="hidden" id="addressJibunAddress" placeholder="지번주소" 
								name="jibunAddress" readonly="readonly"><br>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="hidden" id="addressExtraAddress" placeholder="참고항목" 
								name="extraAddress" readonly="readonly">
						<!-- addressAPI.js호출해서 사용 -->
						<button type="submit">정보 수정</button>
					</form>
				</article>
			</section>
			<div style="clear: both;"></div>
		</section>
	</main>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="/projectdengdeng/js/addressAPI.js"></script>
</body>
</html>