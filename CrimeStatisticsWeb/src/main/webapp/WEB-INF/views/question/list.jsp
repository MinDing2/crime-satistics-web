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
          <td>
          	<a href="/question/view?question_id=${list.question_id}">${ list.question_title } </a>
          </td>
          <td>${ list.nickname }</td>
          <td>${ list.create_date }</td>    
       </tr>
    </c:forEach>
    </tbody>
	</table>
</body>
</html>

