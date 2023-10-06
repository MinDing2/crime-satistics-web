<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 조회</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 JavaScript 및 jQuery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<header>
    <%@ include file="../template/header.jsp"%>
</header>

<main class="container mt-5">
    <h2 class="text-center">게시물 내용보기</h2>
    <table class="table">
        <tr>
            <th style="width: 15%;">글번호</th>
            <td style="width: 35%;">${nvo.nbnum}</td>
            <th style="width: 15%;">조회수</th>
            <td style="width: 35%;">${nvo.readcount}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${nvo.writer}</td>
            <th>등록일 / 마감일</th>
            <td>${nvo.regdate} / ${nvo.enddate}</td>
        </tr>
        <tr>
            <th>제목</th>
            <td colspan="3">${nvo.title}</td>
        </tr>
        <tr>
            <th>내용</th>
            <td colspan="4" id="td_ta" style="height:300px;">${nvo.cont}</td>
        </tr>
        <tr>
            <td colspan="4" style="text-align:left">
                <form method="GET" name="form" style="display:inline-block;">
                    <input type="button" id="write" class="btn btn-primary" value="새글쓰기">
                </form>
                <a href="/notice/list" class="btn btn-info">목록으로</a>
                <a href="javascript:history.back()" class="btn btn-light">이전으로</a>
            </td>
        </tr>
    </table>
</main>

<script>
    document.getElementById("write").onclick = function(){
        var memberid = '<%= (String)session.getAttribute("memberid")%>';
        if(memberid == "null"){
            alert("로그인이 필요합니다");
            return false;
        }else{
            form.action="/notice/writeform";
            form.submit();
        }
    }

    let memberid = '<%= (String)session.getAttribute("memberid")%>';
    if (memberid != null) {
        document.getElementById("delete").onclick = function () {
            if (confirm("삭제하시겠습니까?")) {
                // 삭제를 실행하는 코드 추가
            }
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
