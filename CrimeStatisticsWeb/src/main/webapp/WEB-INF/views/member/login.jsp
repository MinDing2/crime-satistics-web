<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="icon" type="imaga/x-icon" href="/img/favicon.ico">
<title>Insert title here</title>
</head>
<body>
	<h2>Login</h2>
	<form id="loginForm" action="/member/login" method="post">
		<div>아이디</div>
		<input type="text" name="memberid" autocomplete="off" placeholder="아이디를 입력해주세요." /><br /><br />
		<div>비밀번호</div>
		<input type="password" name="passwd" autocomplete="off" placeholder="비밀번호를 입력해주세요." /><br />
		<span id="loginCheck" style="font-size: 10px;"></span><br />
		<input type="submit" value="Login">
	</form>
	
	<script>
		$(document).ready(function() {
			$('#loginForm').submit(function(event) {
				// 폼 제출 기본 동작 막기
				event.preventDefault();
				
				// 폼 데이터 가져오기
				var formData = $(this).serialize();
				
				$.ajax({
					type: 'POST',
					url:  '/member/login',
					data:  formData,
					success: function(response) {
						window.location.href = '/';
					},
					error: function(xhr, status, error) {
						$('#loginCheck').html('아이디 또는 비밀번호가 맞지 않습니다.');
						$('#loginCheck').css('color', 'red');
					}
				})
			})
		})
	</script>
</body>
</html>