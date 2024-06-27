<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//현재페이지 네비게이션 위치 변수
	int communityNavIndex=1; //기본 네비게이션 인덱스 위치는 1
	if(request.getParameter("navindex")!=null){	//index파라미터가 있을시
		communityNavIndex=Integer.parseInt(request.getParameter("navindex"));	//현재페이지 변수를 index파라미터로
	}
					
	//최대 네비게이션 인덱스
	int communityNavMaxIndex=(communityPage-1)/10+1;
					
	//현재 네비게이션 위치의 첫번째 페이지
	int communityNavFirstPages=10*(communityNavIndex-1)+1;
					
	//현재 네비게이션 위치의 마지막 페이지
	int communityNavLastPages=communityNavFirstPages+9;
	if(communityNavIndex==communityNavMaxIndex){	//네비게이션 인덱스가 최대 네비게이션 인덱스와 같다면
		communityNavLastPages=communityPage;	//네비게이션 마지막 페이지를 총 페이지 개수로
	}
					
	if(communityNavIndex!=1){	//네비게이션 인덱스가 1이 아니라면
%>
<a href="/projectdengdeng/community/community_<%=communityBoard %>.jsp?
		index=<%=1%>&navindex=<%=1%>&search=<%=communitySearch%>&select=<%=communitySelect%>"><< </a>
<a href="/projectdengdeng/community/community_<%=communityBoard %>.jsp?
		index=<%=(communityNavIndex-2)*10+1%>&navindex=<%=communityNavIndex-1%>
		&search=<%=communitySearch%>&select=<%=communitySelect%>">< </a>
<%
	}
	for(int i=communityNavFirstPages;i<=communityNavLastPages;i++){	//네비게이션 첫번째 페이지부터 마지막 페이지까지 반복
%>
<a href="/projectdengdeng/community/community_<%=communityBoard %>.jsp?
		index=<%=i%>&navindex=<%=communityNavIndex%>&search=<%=communitySearch%>
		&select=<%=communitySelect%>"><%=i %></a> 
<%
	}
	if(communityNavIndex!=communityNavMaxIndex){	//네비게이션 인덱스가 최대 네비게이션 인덱스와 같지 않다면
%>
<a href="/projectdengdeng/community/community_<%=communityBoard %>.jsp?
		index=<%=communityNavIndex*10+1%>&navindex=<%=communityNavIndex+1%>
		&search=<%=communitySearch%>&select=<%=communitySelect%>"> ></a>
<a href="/projectdengdeng/community/community_<%=communityBoard %>.jsp?
		index=<%=(communityNavMaxIndex-1)*10+1%>&navindex=<%=communityNavMaxIndex%>
		&search=<%=communitySearch%>&select=<%=communitySelect%>"> >></a>
<%	} %>