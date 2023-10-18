<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>



  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>  
  
</head>
<style>
/* CSS 스타일 */
.speech-bubble {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	border: 1px solid #ccc;
	padding: 10px;
	max-width: 300px;
	z-index: 1;
	right:300px;
		
}

.speech-bubble:after {
	content: "";
	position: absolute;
	bottom: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #f9f9f9 transparent transparent transparent;
}
</style>
<body>
<header><%@ include file="../template/header.jsp"%></header>
  <main class="container mt-5" style="margin:0 auto 50px;  width:900px;">    
    <form action="/board/update" method="POST">        
          <h2 style="text-align: center; padding:20px;">글 수정</h2>			
			<input type="hidden" name="menu_id" value="${vo.menu_id}" />        
			<input type="hidden" name="bnum" value="${vo.bnum}" />        
			<input type="hidden" name="regdate" value="${vo.regdate}" />        
			<input type="hidden" name="readcount" value="${vo.readcount}" />        
      <table class="table">
        <tr>
          <th>제목</th>
          <td><input type="text" class="form-control" name="title" required value="${vo.title}" /></td>
        </tr>
        <tr>
          <th>글쓴이</th>
          <td><input type="text" class="form-control" name="writer" value="${nickname}" readonly /></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea class="form-control" name="cont" rows="17" required >${vo.cont}</textarea></td>
        </tr>  
        <tr>
          <td colspan="2">
            <button type="submit" class="btn btn-danger">수정</button>
            <button type="button" class="btn btn-danger" onclick="history.back()">취소</button>
          </td>
        </tr>
      </table>
    </form> 
  </main>
 <footer><%@ include file="../template/footer.jsp"%></footer>


</body>
</html>