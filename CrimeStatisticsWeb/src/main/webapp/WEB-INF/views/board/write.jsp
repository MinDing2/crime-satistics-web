<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 5 CSS 링크 추가 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
  <!-- 부트스트랩 5 JavaScript 및 Popper.js 추가 -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</head>
<title>게시물 등록</title>
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
<body>
<header><%@ include file="../template/header.jsp"%></header>
  <main class="container mt-5" style="margin:0 auto 50px;  width:900px;">    
    <form action="/board/write" method="POST">        
          <h2 style="text-align: center; padding:20px;">글 쓰기</h2>
			<p style="color: gray;">
				※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.
				<button type="button" class="layer_show" layer="copyright_law">[저작권법 안내]</button>
			</p>
			<div id="copyright-law-content" class="speech-bubble">
				<h3>저작권법 안내</h3>
				<p>이용자가 불법복제물을 게재, 유통하면 이에 대한 경고 및 불법복제물의 삭제 또는 전송 중단 조치를 할 수
					있으며, 경고를 받은 이용자에게 사용 정지를 할 수 있습니다. (관련 법률: 저작권법 제133조 의 제1항 및 제2항)</p>
			</div>
			<input type="hidden" name="menu_id" value="${vo.menu_id}" />        
      <table class="table">
        <tr>
          <th>제목</th>
          <td><input type="text" class="form-control" name="title" required placeholder="제목을 입력해주세요." /></td>
        </tr>
        <tr>
          <th>글쓴이</th>
          <td><input type="text" class="form-control" name="writer" value="${nickname}" readonly /></td>
        </tr>
        <tr>
          <th>내용</th>
          <td><textarea class="form-control" name="cont" rows="17" required></textarea></td>
        </tr>  
        <tr>
          <td colspan="2">
            <button type="submit" class="btn btn-danger">등록</button>
            <button type="button" class="btn btn-danger" onclick="history.back()">취소</button>
          </td>
        </tr>
      </table>
    </form> 
  </main>
 <footer><%@ include file="../template/footer.jsp"%></footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		// JavaScript를 사용하여 버튼을 클릭할 때 내용을 표시하도록 합니다.
		const copyrightLawButton = document
				.querySelector('button[layer="copyright_law"]');
		const copyrightLawContent = document
				.getElementById('copyright-law-content');

		copyrightLawButton.addEventListener('click', function() {
			if (copyrightLawContent.style.display === 'none'
					|| copyrightLawContent.style.display === '') {
				copyrightLawContent.style.display = 'block';
			} else {
				copyrightLawContent.style.display = 'none';
			}
		});
	</script>
</body>
</html>