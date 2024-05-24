<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
 	240524 12:28차지민 비밀번호 표시,사라지는 기능 작업
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	let registerPwdSw = 0, registerPwdVerifySw = 0;
	
	//비밀번호,비밀번호확인 타입을 토글하는 함수
	function registerTextPwdCK(registerPwdId) {
		let registerPwdId2 = document.getElementById(registerPwdId);
		//비밀번호인가 비밀번호 확인인가
		if(registerPwdId=="registerPwd"){
			//현재 text인가 password인가
			if(registerPwdSw==0){
				registerPwdId2.type="text";
				registerPwdSw=1;
			}else if(registerPwdSw==1){
				registerPwdId2.type="password";
				registerPwdSw=0;
			}
		}else if(registerPwdId=="registerPwdVerify"){
			//현재 text인가 password인가
			if(registerPwdVerifySw==0){
				registerPwdId2.type="text";
				registerPwdVerifySw=1;
			}else if(registerPwdVerifySw==1){
				registerPwdId2.type="password";
				registerPwdVerifySw=0;
			}
		}
	}
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
	<header>header</header>
	<main>
		<section>
			<header>section-header</header>
			<article>
				<form action="register_backend.jsp" method="post">
					아이디 : <input type="text" name="id"><br>
					비밀번호 : <input id="registerPwd" type="password" name="password">
							<button type="button" onclick="registerTextPwdCK('registerPwd')">test</button><br>
					비밀번호 확인 : <input id="registerPwdVerify" type="password" name="passwordVerify">
								<button type="button" onclick="registerTextPwdCK('registerPwdVerify')">test</button><br>
					이름 : <input type="text" name="name"><br>
					전화번호 : <input type="text" placeholder="-없이 입력하세요" name="tel"><br>
					
					<!-- addressAPI.js호출해서 사용 -->
					주소 : 
					<input type="text" id="addressPostcode" placeholder="우편번호" name="postcode">
					<input type="button" onclick="addressExecDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="addressRoadAddress" placeholder="도로명주소" name="roadAddress">
					<input type="text" id="addressJibunAddress" placeholder="지번주소" name="jibunAddress"><br>
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="addressDetailAddress" placeholder="상세주소" name="detailAddress">
					<input type="text" id="addressExtraAddress" placeholder="참고항목" name="extraAddress">
					<!-- addressAPI.js호출해서 사용 -->
					
					<br><br>
					반려동물 이름 : <input type="text" name="petName"><br>
					견종 : <input type="text" name="breed"><br>
					<button>취소</button><!-- 뒤로가기 쓰면 될듯 -->
					<button type="submit">회원가입</button>
				</form>
			</article>
			<nav>section-nav</nav>
		</section>
	</main>
	<footer>footer</footer>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="addressAPI.js"></script>
</body>
</html>