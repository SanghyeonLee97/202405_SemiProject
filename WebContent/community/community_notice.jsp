<%@page import="dao.CommunityDAO"%>
<%@page import="DTO.community.CommunityDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/projectdengdeng/css/style2.css" rel="stylesheet" type="text/css">
<link href="/projectdengdeng/css/community.css?after" rel="stylesheet" type="text/css">
<style type="text/css">
	main>section>article{
		padding: 40px;
	}
	#title {
		cursor: pointer;
	}
	table{
		border: 1px solid lightgray;
		border-collapse: collapse;
		margin-left:100px;
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
		ArrayList<CommunityDTO> communityArr = new ArrayList<CommunityDTO>();
			communityBoard="notice";	//현재 notice게시판
			communitySelect="notice_title";	//기본속성은 title
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
						<td width="550px;">제목</td>
						<td width="150px;">작성시간</td>
						<td width="100px;">조회수</td>
					</tr>
					<%
						for(int i=communityBoardFirstNo;i>=communityBoardLastNo;i--){	//첫번째글 번호부터 마지막글 번호까지 반복
					%>
					<tr>
						<td><%=communityArr.get(i).getCommunityNo() %></td>
						<td id="title" 
						onclick="location.href='notice.do?no=<%=communityArr.get(i).getCommunityNo() %>&board=notice'">
						<%=communityArr.get(i).getCommunityTitle() %></td>
						<td><%=communityArr.get(i).getCommunityDate() %></td>
						<td><%=communityArr.get(i).getCommunityViews() %></td>
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