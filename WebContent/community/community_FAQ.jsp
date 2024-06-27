<%@page import="DTO.community.CommunityFAQDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style2.css" rel="stylesheet" type="text/css">
<link href="../css/community.css?after" rel="stylesheet" type="text/css">
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
		margin-left: 100px;	
			
	}
	tr,td{
		padding:10px;
		border: 1px solid lightgray;
		
		
	}
	#bts{
		width: 100px;
		height: 40px;
		text-align: center;
		margin-left: 150px;
		margin-top: 20px;
	
	}
	
</style>
</head>
<body>
	<%@ include file="body_before.jsp" %>
	<%
		ArrayList<CommunityFAQDTO> FAQArr = new ArrayList();
			
		//게시판 종류 변수
		communityBoard="FAQ";	//현재 FAQ게시판
			
		communitySelect="faq_title";	//기본속성은 title
	%>
	<%
		if(request.getParameter("select")!=null){	//select파라미터가 있을시
			communitySelect=request.getParameter("select");	//검색 테이블속성 변수를 select파라미터로
		}
		
		if(request.getParameter("search")!=null){	//search파라미터가 있을시
			communitySearch=request.getParameter("search");	//검색어 변수를 search파라미터로
		}
			
		FAQArr=ndao.getFAQList(communitySelect,communitySearch);	//검색실행
		
		//현재페이지 위치 변수
		int FAQIndex=1;	//기본 페이지 위치는 1
		if(request.getParameter("index")!=null){	//index파라미터가 있을시
			FAQIndex=Integer.parseInt(request.getParameter("index"));	//현재페이지 변수를 index파라미터로
		}
		
		//총 페이지 개수
		int communityPage=(FAQArr.size()-1)/10+1;
		
		//현재페이지 게시판의 첫번째글의 ArrayList번호
		int FAQBoardFirstNo=FAQArr.size()-(10*(FAQIndex-1))-1;
		
		//현재페이지 게시판의 마지막글의 ArrayList번호
		int FAQBoardLastNo=FAQBoardFirstNo-9;
		
		//게시판에 출력될 글의 개수
		int FAQBoardPosts = 10;
		if(FAQIndex==communityPage){	//현재페이지가 총페이지랑 같을때
			FAQBoardPosts=(FAQArr.size()-1)%10;
			FAQBoardLastNo=FAQBoardFirstNo-FAQBoardPosts;
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
						<td width="80px;">글번호</td>
						<td width="150px;" >카테고리</td>
						<td width="600px;">제목</td>
					</tr>
					<%
						for(int i=FAQBoardFirstNo;i>=FAQBoardLastNo;i--){	//첫번째글 번호부터 마지막글 번호까지 반복
					%>
					<tr>
						<td><%=FAQArr.get(i).getFaqNo() %></td>
						<td><%=FAQArr.get(i).getFaqIQCNo() %></td>
						<td id="title" 
						onclick="location.href='FAQ.do?no=<%=FAQArr.get(i).getFaqNo() %>'">
						<%=FAQArr.get(i).getFaqTitle() %></td>
					</tr>
					<%} %>
				</table>
			</article>
			<nav>
				<button id="bts" onclick="location.href='/projectdengdeng/product/product_list_page.jsp'">쇼핑하기</button>
				<%@ include file="main_section_nav.jsp" %>
			</nav>
		</section>
	</main>
</body>
</html>