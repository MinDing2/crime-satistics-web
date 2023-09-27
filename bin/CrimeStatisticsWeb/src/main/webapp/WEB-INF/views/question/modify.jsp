<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<title>게시물 수정</title>
</head>
<body>

	<form method="post">
	   
		<label>제목</label>
		<input type="text" name="question_title" value ="${view.question_title}" /> <br />
		<label> 닉네임 </label>
		${view.nickname}<br />
		
		<label>내용</label>
		<textarea cols="50"  rows ="5" name="question_content"/>${view.question_content}</textarea><br />
		
		<button type="submit">완료</button>
	
	</form>
	
</body>
</html>