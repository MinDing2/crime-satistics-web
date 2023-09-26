<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
  
    
<!DOCTYPE html>
<html>
<head>
  <title>게시판</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">

  <!-- Add Bootstrap CSS link -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style></style>
</head>
<body>
<header><%@ include file="../template/header.jsp"%></header>

  <!-- 게시물 목록 -->
  <div class="container mt-5">
  <h2 class="text-center">${name} 커뮤니티</h2>
    </div>  
      <div class="text-end" style="width:95%;margin:auto;">
      <form method="GET" name="form" Style="display:inline-block;">    
      <input type="hidden" name="menu_id" value="${vo.menu_id}">
      <input type="button" id="write" class="btn btn-primary" value="새글쓰기">
      </form>
      <a href="/" class="btn btn-primary">메인</a>
    </div>
<!-- 검색창 -->
<div class="search text-center p-3" style="width: 30%;">
    <div class="input-group">
        <select class="form-select" name="searchType">
            <option value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}" /> >-----</option>
            <option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}" /> >제목</option>
            <option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}" /> >내용</option>
            <option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}" /> >작성자</option>
            <option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}" /> >제목+내용</option>
        </select>
        <input type="text" class="form-control" name="keyword" id="keywordInput" value="${scri.keyword}" style="width: 50%;" />
        <button id="searchBtn" class="btn btn-primary">검색</button>
    </div>
</div>
<div>
    <table class="table table-hover" style="width:95%; margin:auto;">
      <thead>
        <tr>          
          <th scope="col">글번호</th>
          <th scope="col">제목</th>
          <th scope="col">글쓴이</th>
          <th scope="col">날짜</th>
          <th scope="col">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="board" items="${boardList}">
          <tr>
          <td>${board.bnum}</td>            
            <td>
              <a href="/board/view?bnum=${board.bnum}" style="text-decoration: none;">
                ${board.title}
              </a>
            </td>
            <td>${board.writer}</td>
            <td>${board.regdate}</td>            
            <td>${board.readcount}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
<!-- 페이징 -->  
<%@ include file="../board/include/SearchPaging.jsp"%>




  <!-- 부트스트랩 & 자바스크립트 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
	 $(function(){
		  $('#searchBtn').click(function() {	     
		   self.location = "listsearch"
		     + '${pageMaker.makeQuery(1)}'
		     + "&searchType="
		     + $("select option:selected").val()
		     + "&keyword="
		     + encodeURIComponent($('#keywordInput').val())
		     + "&menu_id="
		     + '${vo.menu_id}';
		    });
		 });   
  </script>
</body>
</html>






