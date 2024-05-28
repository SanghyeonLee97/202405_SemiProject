<%@page import="DTO.noticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAO"%>
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
	int noticeIndex = 1;
	if(request.getParameter("noticeIndex")!=null){
		noticeIndex = Integer.parseInt(request.getParameter("noticeIndex"));
	}
	int noticeFirstNo = (noticeIndex-1)*10;
	int noticeLastNo = noticeIndex*10-1;
	int noticePage = ((int)noticeArr.size()/10)+1;
	int noticeLastPagePost = noticeArr.size()%10;
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
					if(noticeIndex==noticePage){
						noticeLastNo=noticeFirstNo+noticeLastPagePost-1;
					}
					for(int i=noticeFirstNo;i<=noticeLastNo;i++){
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
			noticeIndex<%=noticeIndex %><br>
			noticePage<%=noticePage %><br>
			noticeFirstNo<%=noticeFirstNo %><br>
			noticeLastNo<%=noticeLastNo %><br>
			test<%=noticeFirstNo+noticeLastPagePost %>
			<button onclick="location.href='../product/product_list_page.jsp'">쇼핑하기</button>
			<%
				for(int i=1;i<=noticePage;i++){
			%>
			<a href="community_notice.jsp?noticeIndex=<%=i%>"><%=i%></a>
			<%} %>
			</nav>
		</section>
		
	</main>
</body>
</html>