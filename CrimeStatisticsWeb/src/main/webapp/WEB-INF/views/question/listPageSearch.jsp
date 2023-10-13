<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="images/favicon.ico">
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <title>Q&A 게시판</title>
    
    <!-- Add Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>
    
	   /* 페이지 네비게이션을 가로 중앙 정렬 */
    .pagination {
         text-align: center;
         justify-content: center;
    }

    /* 페이지 번호 및 이전/다음 링크 스타일 조정 */
    .pagination a {
        text-decoration: none;
        margin: 0 5px;
    }

    .pagination b {
        font-weight: bold;
        margin: 0 5px;
    }
    
</style>

<body>
		<header><%@ include file="../template/header.jsp"%></header>
		
    <div class="container mt-4">
        <h2>Q&A 게시판</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">닉네임</th>
                    <th scope="col">날짜</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="list">
                    <tr>
                        <td scope="row">${ list.question_id }</td>
                        <td><a href="/question/view?question_id=${list.question_id}">${ list.question_title }</a></td>
                        <td>${ list.nickname }</td>
                        <td>${ list.create_date }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
	
	<div class = "pagination">
        <c:if test="${page.prev}">
            <span>[ <a href="/question/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
        </c:if>

        <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
            <span>
                <c:if test="${select != num}">
                    <a href="/question/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
                </c:if>
                <c:if test="${select == num}">
                    <b>${num}</b>
                </c:if>
            </span>
        </c:forEach>

       	 <c:if test="${page.next}">
       	     <span>[ <a href="/question/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
       	 </c:if>
        </div>
        
        
		
        <div class="mt-3" >
            <form class="d-flex">
                <select class="form-select me-2" name="searchType">
                    <option value="question_title" <c:if test="${page.searchType eq 'question_title'}">selected</c:if>>제목</option>
                    <option value="question_content" <c:if test="${page.searchType eq 'question_content'}">selected</c:if>>내용</option>
                    <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
                    <option value="m.nickname" <c:if test="${page.searchType eq 'm.nickname'}">selected</c:if>>작성자</option>
                </select>
                <input type="text" class="form-control me-2" name="keyword" value="${page.keyword}" />
                <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
               
            </form>
        </div>
    </div>
    
	 <footer><%@ include file="../template/footer.jsp"%></footer>
	
    <!-- Add Bootstrap JS scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
   
    <script>
        document.getElementById("searchBtn").onclick = function() {
            let searchType = document.getElementsByName("searchType")[0].value;
            let keyword = document.getElementsByName("keyword")[0].value;
            location.href = "/question/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
        };
    </script>
</body>

<script type="text/javascript" src="/js/api.js"></script>
</html>

