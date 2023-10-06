<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
  <title>Insert title here</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">

  <!-- Add Bootstrap CSS link -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  a:hover{
    font-weight: bold;
  }
</style>
</head>
<body>
    <header>
        <%@ include file="../template/header.jsp"%>        
    </header>
  <!-- 게시물 목록 -->
  <div class="container mt-5">
    <h2 class="text-center">공지사항</h2>
    <div class="text-end">
      <a href="/notice/writeform" class="btn btn-primary">공지 쓰기</a>
    </div>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">번호</th>
          <th scope="col">제목</th>
          <th scope="col">글쓴이</th>
          <th scope="col">등록일</th>
          <th scope="col">마감일</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="notice" items="${NoticeList}">
          <tr>
            <th scope="row">${notice.nbnum}</th>
            <td>
              <a href="/notice/view?nbnum=${notice.nbnum}" style="text-decoration: none; color:black;">
                ${notice.title}
              </a>
            </td>
            <td>${notice.writer}</td>
            <td>${notice.regdate}</td>
            <td>${notice.enddate}</td>
            <td><a href="/notice/updateform?nbnum=${notice.nbnum}" class="btn btn-warning">수정</a></td>
            <td><a href="/notice/delete?nbnum=${notice.nbnum}" class="btn btn-danger">삭제</a></td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

  <!-- Add Bootstrap JavaScript and Popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>






