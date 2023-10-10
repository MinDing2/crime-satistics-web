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
<title>게시물 수정</title>
</head>
<body>
	
	
	
	<form method="post" action="/answer/modify">
	
		<p>
			<label>댓글 작성자</label> <input type="text" name="adminid"  value="${answer.nickname}" readonly="readonly">
		</p>
			
		<p>
			<textarea rows="5" cols="50" name ="answer_cont">${ answer.answer_cont }</textarea>
		</p> 
		
		<p>
			<input type = "hidden" name ="answer_id"     value="${answer.answer_id}"  />
			<input type = "hidden" name="question_id"    value="${answer.question_id}"  />
			
			<button type = "submit">댓글 수정</button>
		</p>	
	</form>	
</body>
</html>