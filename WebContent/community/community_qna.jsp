<%@page import="DTO.community.CommunityDTO"%>
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
	#bts2{
		width: 150px;
		height: 50px;
		text-align: center;
		margin-left: 250px;
		margin-top: 20px;
		background: yellow;
	
	}
	
</style>
<script type="text/javascript">
	function QNAwrite() {
		<%
			if(session.getAttribute("id")==null){
		%>
		alert("로그인이 필요합니다");
		location.href="/projectdengdeng/member/login.jsp";
		<%
			}else{
		%>
		location.href="/projectdengdeng/community/community_QNA_write.jsp";
		<%
			}
		%>
	}
</script>
</head>
<body>
	<%@ include file="body_before.jsp" %>
	<%
		ArrayList<CommunityDTO> communityArr = new ArrayList<CommunityDTO>();
		communityBoard="qna";	//현재 qna게시판
		communitySelect="qna_title";	//기본속성은 title
	%>
	<%@ include file="body_after.jsp" %>
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
						<td width="120px;">카테고리</td>
						<td width="450px;">제목</td>
						<td width="150px;">작성시간</td>
						<td width="120px;">id</td>
						<td width="120px;">답변여부</td>
					</tr>
					<%
						for(int i=communityBoardFirstNo;i>=communityBoardLastNo;i--){	//첫번째글 번호부터 마지막글 번호까지 반복
					%>
					<tr>
						<td><%=communityArr.get(i).getCommunityNo() %></td>
						<td><%=communityArr.get(i).getIQCNo() %></td>
						<td id="title" 
						onclick="location.href='QNA.do?no=<%=communityArr.get(i).getCommunityNo() %>'">
						<%=communityArr.get(i).getCommunityTitle() %></td>
						<td><%=communityArr.get(i).getCommunityDate() %></td>
						<td><%=communityArr.get(i).getCustomer_id() %></td>
						<td>
							<%
								if(communityArr.get(i).getCommunityanswer()=="" || communityArr.get(i).getCommunityanswer()==null){
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
				<button id=bts onclick="location.href='/projectdengdeng/product/product_list_page.jsp'">쇼핑하기</button>
				<%@ include file="main_section_nav.jsp" %>
				<button id=bts2 type="button" onclick="QNAwrite()">글쓰기</button>
			</nav>
		</section>
	</main>
</body>
</html>