<%@page import="DTO.product.ProductQnaDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<ProductQnaDTO> qnaList = (List<ProductQnaDTO>)request.getAttribute("qnaList");
	
	int pageSize = 10;
	int pageNum = request.getParameter("pageNum") != null ? Integer.parseInt(request.getParameter("pageNum")) : 1;
	int totalQnaCount = qnaList.size();
	int pageCount = (int)Math.ceil(totalQnaCount / (double)pageSize);
	int startRow = (pageNum - 1) * pageSize;
	int endRow = Math.min(startRow + pageSize, totalQnaCount);
%>
<div class="qna-container">
	<table class="qna-table">
		<tr>
			<th>답변상태</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<% for(int i = startRow; i < endRow; i++) {
			ProductQnaDTO qna = qnaList.get(i);
			String status = qna.getPi_answer() != null ? "답변완료" : "미답변";
			
		%>
		<tr>
			<td><%= status %></td>
			<td class="qna-title" onclick="toggleContent('<%= i %>')"><%= qna.getPi_title() %></td>
			<td><%= qna.getCustomer_name() %></td>
			<td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(qna.getPi_date()) %></td>
		</tr>
		<tr id="content-<%= i %>" style="display: none;">
			<td colspan="4">
				<div>
					<p><strong>질문 내용:</strong></p>
					<p><%= qna.getPi_content() %></p>
					<% if (qna.getPi_answer() != null){ %>
					<p><strong>답변 내용:</strong></p>
					<p><%= qna.getPi_answer() %></p>
					<% } %>
				</div>
			</td>
		</tr>
		<% } %>
	</table>
	<div class="pagination">
		<% for (int i = 1; i <= pageCount; i++){ %>
			<a href="?pageNum=<%= i %>"><%= i %></a>
		<% } %>
	</div>
</div>

<script>
function toggleContent(index) {
	let contentRow = document.getElementById('content-' + index);
	if (contentRow.style.display === 'none') {
		contentRow.style.display = 'table-row';
	} else{
		contentRow.style.display = 'none';
	}
}
</script>

<style>
.qna-container {
    width: 80%;
    margin: 0 auto;
}

.qna-table {
    width: 100%;
    border-collapse: collapse;
}

.qna-table th, .qna-table td {
    border: 1px solid #000;
    padding: 8px;
    text-align: left;
}

.qna-table .qna-title {
    cursor: pointer;
    text-decoration: underline;
    color: blue;
}

.pagination {
	display: flex;
	justify-content: center;
    margin-top: 20px;
}

.pagination a {
    margin: 0 5px;
    text-decoration: none;
    color: blue;
}
</style>
