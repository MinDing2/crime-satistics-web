<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 		
 	<c:forEach items="${answer}" var="answer">
<li>
	<div>
		<p>${answer.adminid} / ${answer.createDate}</p>
		<p>${answer.answer_cont }</p>
	</div>
</li>	
</c:forEach>	
 		
	<div>
		<a href="/question/modify?question_id=${view.question_id}">게시물 수정</a>, 
		<a href="/question/delete?question_id=${view.question_id}">게시물 삭제</a>
	</div>

</body>
</html>