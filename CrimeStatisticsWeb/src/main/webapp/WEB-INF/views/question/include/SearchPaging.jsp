<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="text-center mt-4">
  <ul class="pagination justify-content-center">
    <c:if test="${page.prev}">
      <li class="page-item">
        <a class="page-link" href="/question/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>
      </li>
    </c:if>

    <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
      <li class="page-item">
        <c:choose>
          <c:when test="${select == num}">
            <span class="page-link"><b>${num}</b></span>
          </c:when>
          <c:otherwise>
            <a class="page-link" href="/question/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
          </c:otherwise>
        </c:choose>
      </li>
    </c:forEach>

    <c:if test="${page.next}">
      <li class="page-item">
        <a class="page-link" href="/question/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
      </li>
    </c:if>
  </ul>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>