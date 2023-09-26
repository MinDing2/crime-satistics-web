<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="icon" type="image/x-icon" href="images/favicon.ico">

<title>게시물 목록</title>
</head>

<div id="nav">
 <%@ include file="../include/nav.jsp" %>
</div>

<body>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>닉네임</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${ list.question_id }</td>
					<td><a href="/question/view?question_id=${list.question_id}">${ list.question_title }
					</a></td>
					<td>${ list.nickname }</td>
					<td>${ list.create_date }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div>

		<c:if test="${page.prev}">
			<span>[ <a
				href="/question/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
				]
			</span>
		</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
			var="num">
			<span> <c:if test="${select != num}">
					<a href="/question/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${page.next}">
			<span>[ <a
				href="/question/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
				]
			</span>
		</c:if>

		<%-- <c:forEach begin="1" end="${pageNum}" var="num">
			<span> <a href="/question/listPage?num=${num}">${num}</a>
			</span>
		</c:forEach>--%>

		<div>
			<select name="searchType">
				<option value="question_title"
					<c:if test="${page.searchType eq 'question_title'}">selected</c:if>>제목</option>
				<option value="question_content"
					<c:if test="${page.searchType eq 'question_content'}">selected</c:if>>내용</option>
				<option value="title_content"
					<c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
				<option value="m.nickname"
					<c:if test="${page.searchType eq 'm.nickname'}">selected</c:if>>작성자</option>
			</select> <input type="text" name="keyword" value="${page.keyword}" />

			<button type="button" id="searchBtn">검색</button>
		</div>
		<script>
	
		     document.getElementById("searchBtn").onclick = function() {

			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;

			location.href = "/question/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
		};
		
	</script>

</body>
</html>

