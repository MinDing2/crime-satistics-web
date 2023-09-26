<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String memberid = (String) session.getAttribute("memberid");
String responseJSON = "{\"loggedIn\": " + (memberid != null) + "}";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <title>home</title>
    <style>
        .svg-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 45vh; /* 원하는 높이로 조정하세요 */
        }
    </style>
</head>
<body style="background-color: #cccccc;">
    <header><%@ include file="template/header.jsp"%></header>
    
    <div class="svg-container" style="margin-top: 100px;">
        <object data="/img/southKoreaHigh.svg" width="500" height="800"></object>
    </div>
    <p><a href="/question/list">질문 리스트</a></p>           
    <button type="button" id="writeform">질문 작성</button>
    <footer><%@ include file="template/footer.jsp"%></footer>

    <script>
        var responseData = <%= responseJSON %>; // JSON 데이터를 JavaScript 객체로 파싱

        // 버튼 클릭 이벤트 리스너 추가
        document.getElementById("writeform").addEventListener("click", function() {
            // 사용자 정보가 null이 아닌 경우
            if (responseData.loggedIn) {
                location.href = '/question/writeform'; // 작성 폼으로 이동
            } else {
                alert('로그인을 먼저 해주세요'); // 로그인 되지 않은 경우 경고 메시지 표시
                location.href = '/member/login-page';
            }
        });
        
    </script>
   현수 컴퓨터로 테스트 
</body>
</html>
