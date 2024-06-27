<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(request.getParameter("select")!=null){	//select파라미터가 있을시
			communitySelect=request.getParameter("select");	//검색 테이블속성 변수를 select파라미터로
		}
	
		if(request.getParameter("search")!=null){	//search파라미터가 있을시
			communitySearch=request.getParameter("search");	//검색어 변수를 search파라미터로
		}
		
		communityArr=ndao.getCommunityList(communityBoard,communitySelect,communitySearch);	//검색실행
		
		//현재페이지 위치 변수
		if(request.getParameter("index")!=null){	//index파라미터가 있을시
			communityIndex=Integer.parseInt(request.getParameter("index"));	//현재페이지 변수를 index파라미터로
		}
		
		//총 페이지 개수
		int communityPage=(communityArr.size()-1)/10+1;
		
		//현재페이지 게시판의 첫번째글의 ArrayList번호
		int communityBoardFirstNo=communityArr.size()-(10*(communityIndex-1))-1;
		
		//현재페이지 게시판의 마지막글의 ArrayList번호
		int communityBoardLastNo=communityBoardFirstNo-9;
		
		//게시판에 출력될 글의 개수
		int communityBoardPosts = 10;
		if(communityIndex==communityPage){	//현재페이지가 총페이지랑 같을때
			communityBoardPosts=(communityArr.size()-1)%10;
			communityBoardLastNo=communityBoardFirstNo-communityBoardPosts;
		}
	%>
</body>
</html>