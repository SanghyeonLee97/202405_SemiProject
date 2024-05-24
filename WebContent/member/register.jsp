<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 
 	240524 차지민 비밀번호 표시,사라지는 기능 작업
  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
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
				<form action="">
					아이디 : <input type="text"><br>
					비밀번호 : <input id="registerPwd" type="password">
							<button type="button" onclick="registerTextPwdCK('registerPwd')">test</button><br>
					비밀번호 확인 : <input id="registerPwdVerify" type="password">
								<button type="button" onclick="registerTextPwdCK('registerPwdVerify')">test</button><br>
					<script type="text/javascript">
						let registerPwdSw = 0, registerPwdVerifySw = 0;
						function registerTextPwdCK(registerPwdId) {
							let registerPwdId2 = document.getElementById(registerPwdId);
							if(registerPwdId=="registerPwd"){
								if(registerPwdSw==0){
									registerPwdId2.type="text";
									registerPwdSw=1;
								}else if(registerPwdSw==1){
									registerPwdId2.type="password";
									registerPwdSw=0;
								}
							}else if(registerPwdId=="registerPwdVerify"){
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
					이름 : <input type="text"><br>
					전화번호 : <input type="text" placeholder="-없이 입력하세요" ><br>
					주소 : <input type="text"> <button onclick="">우편번호검색</button><br>
					<br><br>
					반려동물 이름 : <input type="text"><br>
					견종 : <input type="text"><br>
					<button>취소</button>
					<button type="submit">회원가입</button>
				</form>
			</article>
			<nav>section-nav</nav>
		</section>
	</main>
	<footer>footer</footer>
</body>
</html>