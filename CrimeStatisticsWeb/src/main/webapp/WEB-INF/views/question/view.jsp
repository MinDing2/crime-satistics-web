<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <title>게시물 조회</title>
    <!-- Add Bootstrap CSS link -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Add Bootstrap JS scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <div class="container mt-4">
        <h2>Q&A</h2>
        <div class="mb-3">
            <label class="form-label">제목</label>
            <p>${view.question_title}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">닉네임</label>
            <p>${view.nickname}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">내용</label>
            <p>${view.question_content}</p>
        </div>
        <div class="mb-3">
            <label class="form-label">날짜</label>
            <p>${view.create_date}</p>
        </div>
        <div class="mb-3">
            <a class="btn btn-primary" href="/question/modify?question_id=${view.question_id}">게시물 수정</a>
            
    
            <a class="btn btn-danger" href="/question/delete?question_id=${view.question_id}">게시물 삭제</a>
        </div>


		<!-- 답변 작성 나타내기 -->
		<c:forEach items="${answer}" var="answer">
			<hr>
			<div class="mb-3">
				<p>${answer.question_id}번게시물</p>
				<p>${answer.nickname}
					/
					<fmt:formatDate value="${answer.create_date}" pattern="yyyy-MM-dd" />
				</p>
				<div class="answer-content" data-answer-id="${answer.answer_id}">
					<span id = "answer_cont" >${answer.answer_cont }</span> 
				</div>
				<p>
					<a tpye="button" class="btn btn-primary editBtn"
						data-answer-id="${answer.answer_id}">수정</a> <a
						class="btn btn-danger"
						href="/answer/delete?answer_id=${answer.answer_id}&question_id=${answer.question_id}">삭제</a>
				</p>
			</div>
		</c:forEach>



		<!-- Answer Form -->
        <form method="post" action="/answer/writewAnswer" class="mb-5">
            <div class="mb-3">
                <label class="form-label">댓글 작성</label>
                <textarea rows="5" cols="50" name="answer_cont" class="form-control"></textarea>
            </div>
            <input type="hidden" name="adminid" value="${adminid}" readonly />
            <input type="hidden" id="question_id" name="question_id" value="${view.question_id}" />
            <button type="submit" class="btn btn-success">댓글 작성</button>
        </form>
    </div>
    
    
  	<script>
  	$(document).ready(function() {
  	    // 수정 버튼 클릭 시
  	    $(".editBtn").click(function() {
  	        var answerId = $(this).data("answer-id");
  	        var editedContent = prompt("댓글을 수정하세요:", $(`.answer-content[data-answer-id="${answerId}"]`).text());
			var question_id = $('#question_id').val();
			//var currentContent = $('#answer_cont').text(); // 기존 내용을 가져옵니다.
  	        if (editedContent !== null) {
  	            // 수정 내용이 비어있지 않을 때 AJAX 요청 전송
  	            $.ajax({
  	                type: "POST",
  	                url: "/answer/modify", // 수정을 처리하는 서버 측 URL로 변경
  	                data: {
  	                    answer_id  : answerId,
  	                    answer_cont: editedContent,
  	                    question_id: question_id
  	                },
  	                success: function(response) {
  	                    // 수정 완료 후, 화면에 업데이트된 내용 반영
  	                    $(`.answer-content[data-answer-id="${answerId}"]`).text(editedContent);
  	                    alert('수정 되었습니다!'); // 성공 메시지를 출력하거나 처리 결과에 따라 다른 작업을 수행할 수 있습니다.
  	                    location.href = '/question/view?question_id=' + question_id;
  	                },
  	                error: function(xhr, textStatus, errorThrown) {
  	                    // 에러 처리
  	                    console.log("Error:", errorThrown);
  	                }
  	            });
  	        }
  	    });
  	});
  	</script>


	
</body>
</html>