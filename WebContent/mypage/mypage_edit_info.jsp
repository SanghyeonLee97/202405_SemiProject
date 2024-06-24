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
	
	#mypagetable{
		
		width: 500px;
		height: 500px;
		position: relative;
		left: 200px;
		bottom:150px;
	
	}
	
	#mypageupdateb{
		width: 100px;
		height: 40px;
		background: yellow;
		margin-left: 200px;
		border: none;
		
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
						<table id="mypagetable">
							<tr><td>■ 표시는 필수 입력사항 입니다.</td></tr>
							<tr><td> 아이디:<%=sessionid %></td></tr><br>
							<tr><td >■ 비밀번호:<input id="updateInfoPwd" type="password" name="password" required="required">
										<button type="button" onclick="updateTextPwdToggle('updateInfoPwd')">test</button></td></tr><br>
							<tr><td>■ 비밀번호 확인:<input id="updateInfoPwdVerify" type="password" name="passwordVerify" required="required">
										<button type="button" onclick="updateTextPwdToggle('updateInfoPwdVerify')">test</button></td></tr><br>
							<tr><td>■ 이름: <input type="text" name="name" required="required"></td></tr><br>
							<tr><td>전화번호: <input type="text" placeholder="-없이 입력하세요" name="tel"></td></tr><br>
							<!-- addressAPI.js호출해서 사용 -->
							<tr><td>■ 주소:
							<input type="text" id="addressPostcode" placeholder="우편번호" name="postcode" readonly="readonly" required="required">
							<input type="button" onclick="addressExecDaumPostcode()" value="우편번호 찾기"></td></tr><br>
							<tr><td><input type="text" id="addressRoadAddress" placeholder="도로명주소" 
									name="roadAddress" readonly="readonly"></td></tr>
									<tr><td ><input type="text" id="addressDetailAddress" placeholder="상세주소" 
									name="detailAddress" ></td></tr>
							<tr><td><input type="hidden" id="addressJibunAddress" placeholder="지번주소" 
									name="jibunAddress" readonly="readonly"></td></tr><br>
							<tr><td ><span id="guide" style="color:#999;display:none"></span></td></tr>
							<tr><td ><input type="hidden" id="addressExtraAddress" placeholder="참고항목" 
									name="extraAddress" readonly="readonly"></td></tr>
							<!-- addressAPI.js호출해서 사용 -->
							<tr><td><button id="mypageupdateb" type="submit">정보 수정</button></td></tr>
						</table>
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