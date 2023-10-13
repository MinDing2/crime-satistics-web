<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 등록</title>

<!-- 부트스트랩 5 CSS 링크 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
  <!-- 부트스트랩 5 JavaScript 및 Popper.js 추가 -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	</script>
</body>
</html>