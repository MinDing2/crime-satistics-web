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
<title>게시물 조회</title>
</head>
<body>
	
	<label>제목</label>
		${view.question_title} <br />
	
	<label>닉네임</label>
		${view.nickname}<br />
	
	<label>내용</label><br />
		${view.question_content}<br />
 	
 	<label>날짜</label>
 		${view.create_date}<br />
 		
 	
 		
	<div>
		<a href="/question/modify?question_id=${view.question_id}">게시물 수정</a>, 
		<a href="/question/delete?question_id=${view.question_id}">게시물 삭제</a>
	</div>
	<%//테스트 %>
	<c:forEach items="${answer}" var="answer">
	<li>
		<hr>
		<div>
			<p>${answer.question_id }번 게시물</p>
			<p>${answer.nickname} / <fmt:formatDate value="${answer.create_date}" pattern="yyyy-MM-dd" /></p>
			<p>${answer.answer_cont }</p>
		
			<p>
				<a href="/answer/modify?question_id=${answer.question_id}&answer_id=${answer.answer_id}">수정</a> / <a href="/answer/delete?answer_id=${ answer.answer_id }&question_id=${answer.question_id}">삭제</a>
			</p>
			<hr>
		</div>
	</li>	
	</c:forEach>
	
	
	<form method="post" action="/answer/writewAnswer">
	
		<p>
		<br>
			${nickname}
		</p>
			
		<p>
			<textarea rows="5" cols="50" name ="answer_cont"></textarea>
		</p>
		
		<p>	
			<input type = "hidden" name ="adminid"       value="${adminid}"  readonly/>
			<input type = "hidden" name ="question_id"   value="${view.question_id}" />
			<button type = "submit">댓글 작성 </button>
		</p>
		
			
	</form>	
		
</body>
</html>