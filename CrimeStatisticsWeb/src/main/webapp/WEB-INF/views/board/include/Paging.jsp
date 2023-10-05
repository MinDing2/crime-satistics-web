<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
  
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">

  <!-- Add Bootstrap CSS link -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- 페이징 -->
<div class="text-center mt-4">
   <ul class="pagination justify-content-center" id="paging">
   <!-- 처음/이전 -->
    <c:if test="${pageMaker.prev}">
     <li class="page-item">
        <a class="page-link" href="listpage?page=1&menu_id=${vo.menu_id}">처음</a>
     </li>
     <li class="page-item">
        <a class="page-link" href="listpage${pageMaker.makeQuery(pageMaker.startPage - 1)}&menu_id=${vo.menu_id}">이전</a>
     </li>
    </c:if>   
    <!-- 1 2 3 4 5 6 7 8 -->
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
     <li class="page-item"><a class="page-link" href="listpage${pageMaker.makeQuery(idx)}&menu_id=${vo.menu_id}">${idx}</a></li>
    </c:forEach>      
    <!-- 다음 마지막 -->
    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
     <li class="page-item">
        <a class="page-link" href="listpage${pageMaker.makeQuery(pageMaker.endPage + 1)}&menu_id=${vo.menu_id}">다음</a>
     </li>
     <li class="page-item">
        <a class="page-link" href="listpage?page=${endpageCount+1}&menu_id=${vo.menu_id}">마지막</a>
     </li>
    </c:if>   
   </ul>
</div>

  <!-- Add Bootstrap JavaScript and Popper.js -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>