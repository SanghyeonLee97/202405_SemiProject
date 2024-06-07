<%@page import="DTO.CommunityQNADTO"%>
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
<link href="../css/community.css" rel="stylesheet" type="text/css">
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
		CommunityDAO dao = new CommunityDAO();
		ArrayList<CommunityQNADTO> QNAArr = new ArrayList();
			
		//게시판 종류 변수
		String Communityboard="QNA";	//현재 qna게시판
			
		//검색 테이블속성 변수
		String communitySelect="qna_title";	//기본속성은 title
		if(request.getParameter("select")!=null){	//select파라미터가 있을시
			communitySelect=request.getParameter("select");	//검색 테이블속성 변수를 select파라미터로
		}
			
		//검색어 변수
		String communitySearch="";	//기본 검색어는 없음
		if(request.getParameter("search")!=null){	//search파라미터가 있을시
			communitySearch=request.getParameter("search");	//검색어 변수를 search파라미터로
		}
			
		QNAArr=dao.getQNAList(communitySelect,communitySearch);	//검색실행
		
		//현재페이지 위치 변수
		int FAQIndex=1;	//기본 페이지 위치는 1
		if(request.getParameter("index")!=null){	//index파라미터가 있을시
			FAQIndex=Integer.parseInt(request.getParameter("index"));	//현재페이지 변수를 index파라미터로
		}
		
		//총 페이지 개수
		int communityPage=(QNAArr.size()-1)/10+1;
		
		//현재페이지 게시판의 첫번째글의 ArrayList번호
		int FAQBoardFirstNo=QNAArr.size()-(10*(FAQIndex-1))-1;
		
		//현재페이지 게시판의 마지막글의 ArrayList번호
		int FAQBoardLastNo=FAQBoardFirstNo-9;
		
		//게시판에 출력될 글의 개수
		int FAQBoardPosts = 10;
		if(FAQIndex==communityPage){	//현재페이지가 총페이지랑 같을때
			FAQBoardPosts=(QNAArr.size()-1)%10;
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
						<td>글번호</td>
						<td>카테고리</td>
						<td>제목</td>
						<td>작성시간</td>
						<td>id</td>
						<td>답변여부</td>
					</tr>
					<%
						for(int i=FAQBoardFirstNo;i>=FAQBoardLastNo;i--){	//첫번째글 번호부터 마지막글 번호까지 반복
					%>
					<tr>
						<td><%=QNAArr.get(i).getQna_no() %></td>
						<td><%=QNAArr.get(i).getIqc_no() %></td>
						<td id="title" 
						onclick="location.href='QNA.do?no=<%=QNAArr.get(i).getQna_no() %>'">
						<%=QNAArr.get(i).getQna_title() %></td>
						<td><%=QNAArr.get(i).getQna_date() %></td>
						<td><%=QNAArr.get(i).getCustomer_id() %></td>
						<td>
							<%
								if(QNAArr.get(i).getQna_answer()=="" || QNAArr.get(i).getQna_answer()==null){
							%>
							미답변
							<% }else{ %>
							답변완료
							<% } %>
						</td>
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