<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<title>home</title>
</head>
<body>
   <h2>Hello World!!!</h2>
   
   <c:choose>
   		<c:when test="${not empty sessionScope.memberid}">
   			<div><a href="/member/logout">로그아웃</a></div>
   			<div><a href="#">장바구니</a></div>
   			<div><a href="/member/mypage">마이페이지</a></div>
   		</c:when>
   		<c:otherwise>
   			<div><a href="/member/login-page">로그인</a></div>
   			<div><a href="/member/signup-page">회원가입</a></div>
   		</c:otherwise>
   </c:choose>
</body>
</html>