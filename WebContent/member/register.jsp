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
	let idchk=0;
	
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
	
	//ID중복체크함수
	$(function(){
		$('#registerId').on('focusout',function(){
			let id = document.getElementById("registerId");
			window.open("idchk.do?id="+id.value, "_blank", "width=1, height=1, top=100000, left=100000");
		});
	});
	
	//ID중복체크 팝업용함수1
	function idchk0(){
		let registerIdChkText = document.getElementById("registerIdChkText");
		registerIdChkText.innerHTML = '<span> 중복된 ID입니다.</span>'
		idchk=0;
	}
	
	//ID중복체크 팝업용함수2
	function idchk1(){
		let registerIdChkText = document.getElementById("registerIdChkText");
		registerIdChkText.innerHTML = '<span></span>'
		idchk=1;
	}
	
	//ID중복시 가입 막는 함수
	function checkForm(){
		if(idchk==0){
			return false;
		}
	}
</script>
<style type="text/css">
	main{
		text-align: center;
	}

	h1{
		top : 15px;
		color: #6A24FE;
		text-align: center;
		font-size: 32px;
		margin:120px 0 80px 0 ;
		position: relative;
	}
	
	#addressRoadAddress{
		margin-top: 10px;	
	}
	#registerId,#registerPwd,#registerPwdVerify,#name,#tel,#email,#addressPostcode,#addressRoadAddress,#addressDetailAddress{
		width: 250px;
		height: 25px;
	}
	
	i{
		color : rgb(238,106,123);
	}
	main>section{
		width: 800px;
		
		margin-left: 200px;
	}
	main>section>header{
		width: 100%; height: 70px;
		
	}
	main>section>article{
		width: 100%; height: 550px;
	}
	
	main>section>article>form>input{
		font-size:15px;
		box-sizing: border-box;
	}
	
	#cancle{
		background: lightgray;
		color : black;
		border: none;
		width: 100px;
		height: 50px;
	}
	#regist{
		background : black;
		color : white;
		border: none;
		width: 100px;
		height: 50px;
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
				<form id="registerForm" action="register.do" method="post" onsubmit="return checkForm()">
					<br>아이디<i>*</i>&nbsp;&nbsp;&nbsp;<input type="text" id="registerId" placeholder="아이디를 입력해주세요" name="id" required="required"><br>
					<div id="registerIdChkText"></div>
					<br>비밀번호<i>*</i>&nbsp;&nbsp;&nbsp;<input id="registerPwd" type="password" placeholder="비밀번호를 입력해주세요" name="password" required="required">
							<img src="../imagefile/eyehidden.png" style="height: 30px; width:20px;" onclick="registerTextPwdToggle('registerPwd')"><br>
					<br>비밀번호 확인<i>*</i>&nbsp;&nbsp;&nbsp; <input id="registerPwdVerify" type="password" placeholder="비밀번호를  한번 더 입력해주세요" name="passwordVerify" required="required">
								<img src="../imagefile/eyehidden.png" style="height: 30px; width:20px;" onclick="registerTextPwdToggle('registerPwdVerify')"><br>
					<br>이름<i>*</i> &nbsp;&nbsp;&nbsp;<input type="text" name="name" placeholder="이름을 입력해주세요" required="required"><br>
					<br>전화번호<i>*</i> &nbsp;&nbsp;&nbsp;<input type="text" placeholder="-없이 입력하세요" name="tel"><br>
					<br>이메일  &nbsp;&nbsp;&nbsp;<input type="email" placeholder="example@gmail.com" name="email"><br>
						
					<!-- addressAPI.js호출해서 사용 -->
					<br>주소<i>*</i> &nbsp;&nbsp;&nbsp;
					<input type="text" id="addressPostcode" placeholder="우편번호" name="postcode" readonly="readonly">
					<input type="button" onclick="addressExecDaumPostcode()" value="우편번호 찾기">
					<br><input type="text" id="addressRoadAddress" placeholder="도로명주소" 
							name="roadAddress" readonly="readonly">&nbsp;
							<input type="text" id="addressDetailAddress" placeholder="상세주소" 
							name="detailAddress" >
					<input type="hidden" id="addressJibunAddress" placeholder="지번주소" 
							name="jibunAddress" readonly="readonly"><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="hidden" id="addressExtraAddress" placeholder="참고항목" 
							name="extraAddress" readonly="readonly"><br><br>
					<!-- addressAPI.js호출해서 사용 -->
					<div>					
						<button id="cancle" type="button" onclick="registerGoBack()">취소</button>
						<button id="regist" type="submit" form="registerForm">회원가입</button>
					</div>	
				</form>
			</article>
		</section>
	</main>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="addressAPI.js"></script>
</body>
</html>