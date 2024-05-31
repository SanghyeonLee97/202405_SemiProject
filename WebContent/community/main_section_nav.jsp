<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<a href="/projectdengdeng/community/community_<%=Communityboard %>.jsp?
		index=<%=1%>&navindex=<%=1%>&search=<%=noticeSearch%>&select=<%=noticeSelect%>"><< </a>
<a href="/projectdengdeng/community/community_<%=Communityboard %>.jsp?
		index=<%=(noticeNavIndex-2)*10+1%>&navindex=<%=noticeNavIndex-1%>
		&search=<%=noticeSearch%>&select=<%=noticeSelect%>">< </a>
<%
	}
	for(int i=noticeNavFirstPages;i<=noticeNavLastPages;i++){	//네비게이션 첫번째 페이지부터 마지막 페이지까지 반복
%>
<a href="/projectdengdeng/community/community_<%=Communityboard %>.jsp?
		index=<%=i%>&navindex=<%=noticeNavIndex%>&search=<%=noticeSearch%>
		&select=<%=noticeSelect%>"><%=i %></a> 
<%
	}
	if(noticeNavIndex!=noticeNavMaxIndex){	//네비게이션 인덱스가 최대 네비게이션 인덱스와 같지 않다면
%>
<a href="/projectdengdeng/community/community_<%=Communityboard %>.jsp?
		index=<%=noticeNavIndex*10+1%>&navindex=<%=noticeNavIndex+1%>
		&search=<%=noticeSearch%>&select=<%=noticeSelect%>"> ></a>
<a href="/projectdengdeng/community/community_<%=Communityboard %>.jsp?
		index=<%=(noticeNavMaxIndex-1)*10+1%>&navindex=<%=noticeNavMaxIndex%>
		&search=<%=noticeSearch%>&select=<%=noticeSelect%>"> >></a>
<%	} %>