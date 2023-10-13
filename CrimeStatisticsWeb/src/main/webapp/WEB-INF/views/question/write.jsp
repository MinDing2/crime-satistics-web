<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<title>질문 작성 </title>

  <!-- 부트스트랩 5 CSS 링크 추가 -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
 
  <!-- 부트스트랩 5 JavaScript 및 Popper.js 추가 -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
  <style>


</style>
  
</head>
<body>
<header><%@ include file="../template/header.jsp"%></header>
  <main class ="container mt-3">		
	<form method="post" action="/question/write">
		
		<caption>
          <h2 style="text-align: center; padding:20px;">게시물 등록</h2>   
        </caption>
        
		
		
		<table class = "table">    
		<tr>	
			<th>제목</th>
			<td><input type="text" class = "form-control" name="question_title" style="width: 60%;" required /> </td>
			</tr>
		 	<tr>
            <th>글쓴이</th>
            <td><input type="text" class = "form-control" name="memberid" value="${ nickname }" style="width: 60%;" readonly /></td>
            </tr>
			<tr>
         	<th>내용</th>
         	<td> <textarea class="form-control" cols="50"  rows ="5" name="question_content"  style="width: 60%;" /></textarea></td>
         	</tr>
         	<tr>
		 	<td colspan ="2" >
		 		<button type="submit" class="btn btn-primary">작성</button>
				</td>
			</tr>
		</table>
	</form>
		
	</main>
	 <footer><%@ include file="../template/footer.jsp"%></footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>