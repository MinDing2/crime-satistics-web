<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>공지사항 조회</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
    <!-- 부트스트랩 JavaScript 및 jQuery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<style>
.post-container {
	border-top: 5px solid #0F3A5F;
    border-bottom: 2px solid #0F3A5F;
	padding: 20px;
	margin: 10px;
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
}

.post-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 10px;
}

.post-info {
	font-size: 14px;
	color: #777;
}

.post-content {
	margin-top: 10px;
	margin-left: 10px;
	font-size: 16px;
}
main{
font-family: 'Nanum Gothic Coding', monospace;
border-bottom:2px solid #0F3A5F;
}
</style>
<body>
<!---------------- 본문 --------------->
<header><%@ include file="../template/header.jsp"%></header>
    <main class="container mt-5" style="margin:0 auto 50px;  width:900px;">      
      <h2 style="text-align: center; padding:20px;">공지사항 보기</h2>        
       <div class="post-container">
       <input type="hidden" value="${nvo.nbnum}">       
        <div>
            <div class="post-title">
                ${nvo.title}
            </div>
            <div class="post-info">
                작성자: ${nvo.writer} | 조회: ${nvo.readcount} 
            </div>
	        <div class="post-info">
	            등록일: ${nvo.regdate} | 마감일: ${nvo.enddate}
	        </div>           
        </div>
    </div>
    <div class="post-content" style="height: 350px;">
        ${nvo.cont}
    </div>
    <div style="margin:15px;">
    <a href="/" class="btn btn-danger">메인화면으로</a>
    <a href="javascript:history.back()" class="btn btn-danger">이전으로</a>
    </div>
     </main>   
        <footer style="margin-top: 150px;"><%@ include file="../template/footer.jsp"%></footer>
    <script>        
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
