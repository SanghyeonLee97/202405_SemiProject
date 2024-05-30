<%@page import="dao.DAO"%>
<%@page import="DTO.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/community.css" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section>article{
		height: 620px;
	}
	tr:hover {
		cursor: pointer;
}
</style>
</head>
<body>
	<%
		DAO dao = new DAO();
		ArrayList<noticeDTO> noticeArr = dao.test();
		
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
			noticeBoardPosts=(noticeArr.size()-1)%10;	//출력될 포스트수는 배열사이즈에서 10을 나눈 나머지
			noticeBoardLastNo=noticeBoardFirstNo-noticeBoardPosts;	//마지막글의 배열번호는 첫번째글 배열번호에서 출력될 포스트수를 뺀값
		}
	%>
	<main>
		<%@ include file="main_nav.jsp" %>
		<section>
			<%@ include file="main_section_header.jsp" %>
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
					<tr onclick="location.href='community_notice_read.jsp?noticeNo=<%=noticeArr.get(i).getNoticeNoticeNo() %>'">
						<td><%=noticeArr.get(i).getNoticeNoticeNo() %></td>
						<td><%=noticeArr.get(i).getNoticeCategoryNo() %></td>
						<td><%=noticeArr.get(i).getNoticeTitle() %></td>
						<td><%=noticeArr.get(i).getNoticeRegistrationDate() %></td>
						<td><%=noticeArr.get(i).getNoticeViews() %></td>
					</tr>
					<%} %>
				</table>
			</article>
			<nav>
				<button onclick="location.href='../product/product_list_page.jsp'">쇼핑하기</button>
				<%
					//현재페이지 네비게이션 위치 변수
					int noticeNavIndex=1; //기본 네비게이션 인덱스 위치는 1
					if(request.getParameter("navindex")!=null){	//index파라미터가 있을시
						noticeNavIndex=Integer.parseInt(request.getParameter("navindex"));	//현재페이지 변수를 index파라미터로
					}
					
					//최대 네비게이션 인덱스
					int noticeNavMaxIndex=(noticePage-1)/10+1;
					
					//현재 네비게이션 위치의 첫번째 페이지
					int noticeNavFirstPages=10*(noticeNavIndex-1)+1;
					
					//현재 네비게이션 위치의 마지막 페이지
					int noticeNavLastPages=noticeNavFirstPages+9;
					if(noticeNavIndex==noticeNavMaxIndex){	//네비게이션 인덱스가 최대 네비게이션 인덱스와 같다면
						noticeNavLastPages=noticePage;	//네비게이션 마지막 페이지를 총 페이지 개수로
					}
					
					if(noticeNavIndex!=1){	//네비게이션 인덱스가 1이 아니라면
					%>
				<a href="community_notice.jsp?index=<%=1%>&navindex=<%=1%>"><< </a>
				<a href="community_notice.jsp?index=<%=(noticeNavIndex-2)*10+1%>&navindex=<%=noticeNavIndex-1%>">< </a>
					<%
					}
					for(int i=noticeNavFirstPages;i<=noticeNavLastPages;i++){	//네비게이션 첫번째 페이지부터 마지막 페이지까지 반복
					%><a href="community_notice.jsp?index=<%=i%>&navindex=<%=noticeNavIndex%>"><%=i %></a> <%
					}
					if(noticeNavIndex!=noticeNavMaxIndex){	//네비게이션 인덱스가 최대 네비게이션 인덱스와 같지 않다면
					%>
				<a href="community_notice.jsp?index=<%=noticeNavIndex*10+1%>&navindex=<%=noticeNavIndex+1%>"> ></a>
				<a href="community_notice.jsp?index=<%=(noticeNavMaxIndex-1)*10+1%>&navindex=<%=noticeNavMaxIndex%>"> >></a>
					<%} %>
			</nav>
		</section>
	</main>
</body>
</html>