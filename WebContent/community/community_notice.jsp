<%@page import="DTO.CommunitySearchDTO"%>
<%@page import="dao.NoticeDAO"%>
<%@page import="DTO.CommunityNoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/projectdengdeng/css/style2.css" rel="stylesheet" type="text/css">
<link href="/projectdengdeng/css/community.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section>article{
		height: 620px;
		padding: 40px;
	}
	#title {
		cursor: pointer;
	}
	table{
		border: 1px solid lightgray;
		border-collapse: collapse;
	}
	tr,td{
		padding:10px;
		border: 1px solid lightgray;
	}
</style>
</head>
<body>
	<%
		NoticeDAO ndao = new NoticeDAO();
		CommunitySearchDTO csdto = new CommunitySearchDTO();
		ArrayList<CommunityNoticeDTO> noticeArr = new ArrayList();
		
		//게시판 종류 변수
		String Communityboard="notice";	//현재 notice게시판
		csdto.setCommunitySearchDTOBoard(Communityboard);	//검색객체에 게시판종류 입력
		
		//검색 테이블속성 변수
		String noticeSelect="title";	//기본속성은 title
		if(request.getParameter("select")!=null){	//select파라미터가 있을시
			noticeSelect=request.getParameter("select");	//검색 테이블속성 변수를 select파라미터로
		}
		csdto.setCommunitySearchDTOSelect(noticeSelect);	//검색객체에 검색테이블 입력
		
		//검색어 변수
		String noticeSearch="";	//기본 검색어는 없음
		if(request.getParameter("search")!=null){	//search파라미터가 있을시
			noticeSearch=request.getParameter("search");	//검색어 변수를 search파라미터로
		}
		csdto.setCommunitySearchDTOSearch(noticeSearch);	//검색객체에 검색어 입력
		
		noticeArr=ndao.getNoticeList(csdto);	//검색실행
			
		//현재페이지 위치 변수
		int noticeIndex=1;	//기본 페이지 위치는 1
		if(request.getParameter("index")!=null){	//index파라미터가 있을시
			noticeIndex=Integer.parseInt(request.getParameter("index"));	//현재페이지 변수를 index파라미터로
		}
			
		//총 페이지 개수
		int noticePage=(noticeArr.size()-1)/10+1;
			
		//현재페이지 게시판의 첫번째글의 ArrayList번호
		int noticeBoardFirstNo=noticeArr.size()-(10*(noticeIndex-1))-1;
			
		//현재페이지 게시판의 마지막글의 ArrayList번호
		int noticeBoardLastNo=noticeBoardFirstNo-9;
			
		//게시판에 출력될 글의 개수
		int noticeBoardPosts = 10;
		if(noticeIndex==noticePage){	//현재페이지가 총페이지랑 같을때
			noticeBoardPosts=(noticeArr.size()-1)%10;
			noticeBoardLastNo=noticeBoardFirstNo-noticeBoardPosts;
		}
	%>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<header>
				<%@ include file="main_section_header.jsp" %>
			</header>
			<article>
				<table>
					<tr>
						<td>글번호</td>
						<td>카테고리</td>
						<td>제목</td>
						<td>날짜</td>
						<td>조회수</td>
					</tr>
					<%
						for(int i=noticeBoardFirstNo;i>=noticeBoardLastNo;i--){	//첫번째글 번호부터 마지막글 번호까지 반복
					%>
					<tr>
						<td><%=noticeArr.get(i).getNoticeNoticeNo() %></td>
						<td><%=noticeArr.get(i).getNoticeCategoryNo() %></td>
						<td id="title" 
						onclick="location.href='/projectdengdeng/community/community_notice_read.jsp?noticeNo=<%=noticeArr.get(i).getNoticeNoticeNo() %>'">
						<%=noticeArr.get(i).getNoticeTitle() %></td>
						<td><%=noticeArr.get(i).getNoticeRegistrationDate() %></td>
						<td><%=noticeArr.get(i).getNoticeViews() %></td>
					</tr>
					<%} %>
				</table>
			</article>
			<nav>
				<button onclick="location.href='/projectdengdeng/product/product_list_page.jsp'">쇼핑하기</button>
				<%@ include file="main_section_nav.jsp" %>
			</nav>
		</section>
	</main>
</body>
</html>