<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<title>게시물 수정</title>
<style>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <header><%@ include file="../template/header.jsp"%></header>
   <main class="container mt-5" style="margin:0 auto 50px;  width:900px;">
	<form method="post">
	   <h2 style="text-align: center; padding:20px;">글 수정</h2>	
	   <table class = "table">
	   <tr>
		 <th>제목</th>
		 <td><input type="text" class="form-control" name="question_title" value ="${view.question_title}" required/></td>
	   </tr>
	   <tr>
		 <th>닉네임</th>
		  <td>${view.nickname}</td>
	   </tr>
	   <tr>
		<th>내용</th>
		<td><textarea class="form-control" rows="17" name="question_content" required>${view.question_content}</textarea></td>
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



 

