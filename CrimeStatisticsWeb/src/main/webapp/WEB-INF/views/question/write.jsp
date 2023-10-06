<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<title>질문 작성 </title>
</head>
<body>
	<form method="post" action="/question/write">
		   	
		<label>제목</label>
		<input type="text" name="question_title" /> <br />
		<input type="text" name="memberid" value="${ nickname }" readonly /> <br />
		<label>내용</label>
		<textarea cols="50"  rows ="5" name="question_content" /></textarea><br />
		
		<button type="submit">작성</button>
		
	</form>
</body>
</html>