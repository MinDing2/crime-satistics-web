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
	<div>
		<a href="/question/modify?question_id=${view.question_id}">게시물 수정</a>, 
		<a href="/question/delete?question_id=${view.question_id}">게시물 삭제</a>
	</div>
	
	<!-- 댓글 시작 -->
	<hr />
	<ul>
		<li>
			<div>
				<p>첫번째 댓글 작성자</p>
				<p>첫번째 댓글</p>
			</div>
		</li>
		<li>
			<div>
				<p>두번째 댓글 작성자</p>
				<p>두번째 댓글</p>
			</div>
		</li>
		<li>
			<div>
				<p>세번째 댓글 작성자</p>
				<p>세번째 댓글</p>
			</div>
		</li>
	</ul>

	<ul>
		<li>첫번째 댓글</li>
		<li>두번째 댓글</li>
		<li>세번째 댓글</li>
	</ul>

	<div>
		<p>
			<label>댓글 작성자</label> <input type="text">
		</p>
		<p>
			<textarea rows="5" cols="50"></textarea>
		</p>
		<p>
			<button type="button">댓글 작성</button>
		</p>
	</div>
	<!--  댓글 끝 -->
</body>
</html>