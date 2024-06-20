<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body{
		text-align: center;
	}
	h2{
		margin:20px;	
	}
	#myform fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#reviewContents {
	  width: 400px;
	  box-sizing: border-box;
	  display:flex;
	  margin: 15px auto;
	  background: #F3F4F8;
	  border: 0;
	  border-radius: 10px;
	  height: 100px;
	  resize: none;
	  padding: 15px;
	  font-size: 13px;
	  font-family: sans-serif;
	}
	.btn02 {
	  display:flex;
	  width: 400px;
	  font-weight: bold;
	  border: 0;
	  border-radius: 10px;
	  max-height: 50px;
	  padding: 15px 0;
	  margin: 15px auto;
	  font-size: 1.1em;
	  background:bisque;
	  cursor: pointer;
	  
	}
}
</style>
</head>
<body>
	<h2>리뷰작성</h2>
	<form class="mb-3" name="myform" id="myform" method="get" action="">
		<fieldset>
			<span class="text-bold">별점을 선택해주세요</span>
			<input type="radio" name="reviewStar" value="5" id="rate1"><label
				for="rate1">★</label>
			<input type="radio" name="reviewStar" value="4" id="rate2"><label
				for="rate2">★</label>
			<input type="radio" name="reviewStar" value="3" id="rate3"><label
				for="rate3">★</label>
			<input type="radio" name="reviewStar" value="2" id="rate4"><label
				for="rate4">★</label>
			<input type="radio" name="reviewStar" value="1" id="rate5" checked="checked"><label
				for="rate5">★</label>
		</fieldset>
		<textarea type="text" id="reviewContents" placeholder="리뷰 내용을 작성해주세요." ></textarea>
		<input type="submit" class="btn02" value="리뷰 등록"/>
	</form>	
</body>
</html>