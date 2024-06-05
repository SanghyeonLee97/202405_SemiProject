<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.7.1.js"></script>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

	//input의 타입을 토글하는 함수 (password<-->text)
	function registerTextPwdToggle(registerPwdId) {
		let registerPwdId2 = document.getElementById(registerPwdId);
		
		//현재 text인가 password인가
		if(registerPwdId2.type=="password"){
			registerPwdId2.type="text";
		}else if(registerPwdId2.type=="text"){
			registerPwdId2.type="password";
		}
	}
	
	//뒤로가기 함수
	function registerGoBack() {
		window.history.back();
	}
	
	//비밀번호 확인 함수
	$(function(){
		$('#registerPwdVerify').on('focusout',function(){
			let Pwd = document.getElementById("registerPwd").value;
			let PwdVerify = document.getElementById("registerPwdVerify");
			if(Pwd!=PwdVerify.value){
				alert("비밀번호가 다릅니다.");
				PwdVerify.value="";
			}
		});
	});
</script>
<style type="text/css">
	main>section{
		width: 800px;
		background-color: #ddddff;
		margin-left: 200px;
	}
	main>section>header{
		width: 100%; height: 50px;
		background-color: #ddffff;
	}
	main>section>article{
		width: 100%; height: 550px;
	}
	main>section>nav{
		width: 100%; height: 100px;
		background-color: #ffffdd;
	}
</style>
</head>
<body>
	<main>
		<section>
			<header>
				<h1>회원가입</h1>
			</header>
			<article>
				<form id="registerForm"action="register.do" method="post">
					아이디 : <input type="text" name="id" required="required"><br>
					비밀번호 : <input id="registerPwd" type="password" name="password" required="required">
							<button type="button" onclick="registerTextPwdToggle('registerPwd')">test</button><br>
					비밀번호 확인 : <input id="registerPwdVerify" type="password" name="passwordVerify" required="required">
								<button type="button" onclick="registerTextPwdToggle('registerPwdVerify')">test</button><br>
					이름 : <input type="text" name="name" required="required"><br>
					전화번호 : <input type="text" placeholder="-없이 입력하세요" name="tel"><br>
					이메일 : <input type="email" placeholder="example@gmail.com" name="email"><br>
						
					<!-- addressAPI.js호출해서 사용 -->
					주소 : 
					<input type="text" id="addressPostcode" placeholder="우편번호" name="postcode" readonly="readonly">
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
						
				</form>
			</article>
			<nav>
				<button type="button" onclick="registerGoBack()">취소</button>
				<button type="submit" form="registerForm">회원가입</button>
			</nav>
		</section>
	</main>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="addressAPI.js"></script>
</body>
</html>