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

<!---------------- 본문 --------------->
<header><%@ include file="../template/header.jsp"%></header>
    <main class="container mt-5">
        <caption>
            <h2 style="text-align: center; padding:20px;">게시물 내용보기</h2>
        </caption>
        <table class="table">
            <tr>
                <th>글번호</th>
                <td>${ vo.bnum }</td>
                <th>조회수</th>
                <td>${ vo.readcount }</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${ vo.writer }</td>
                <th>날짜</th>
                <td>${ vo.regdate }</td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">${ vo.title }</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3" id="td_ta" style="height:300px;">${ vo.cont }</td>
            </tr>
            <tr>
                <td colspan="4" style="text-align:left">
                     <form method="GET" name="form" Style="display:inline-block;">    
                     <input type="hidden" name="menu_id" value="${vo.menu_id}">
                     <input type="button" id="write" class="btn btn-primary" value="새글쓰기">
                     </form>
                     <c:if test="${sessionScope.memberid != null}">
                      <a href="/board/updateform?menu_id=${ vo.menu_id }&bnum=${ vo.bnum }" class="btn btn-secondary">수정</a>
                      <a href="/board/delete?menu_id=${ vo.menu_id }&bnum=${ vo.bnum }" class="btn btn-danger" id="delete">삭제</a>
                     </c:if>                     
                    <a href="/board/listsearch?page=1&perPageNum=10&menu_id=${vo.menu_id}" class="btn btn-info">목록으로</a>
                    <a href="javascript:history.back()" class="btn btn-light">이전으로</a>
                </td>
            </tr>
        </table>
        <%@ include file="../board/include/reply.jsp"%>
    <script>
        
        document.getElementById("write").onclick = function(){
      	  var memberid = '<%= (String)session.getAttribute("memberid")%>';
      	  if(memberid == "null"){
      		  alert("로그인이 필요합니다");
      		  location.href="#";
      	  }else{
      		  form.action="/board/writeform";
      		  form.submit();
      	  }
        }
        document.getElementById("delete").onclick = function(){
      	  if(confirm("삭제하시겠습니까?")){      		  
      	  }
      }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>