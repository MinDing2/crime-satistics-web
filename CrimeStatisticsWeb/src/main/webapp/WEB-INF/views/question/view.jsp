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
    <style>
    
            .question-section {
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
        }

        .answer-section {
            background-color: #e6f7ff;
            padding: 15px;
            margin-top: 20px;
            border: 1px solid #b3e0ff;
        }

        .answer-content {
            margin-bottom: 10px;
        }   
    
    </style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>
	
    <!-- 질문 글 표시 -->	
    <h2 style="padding: 10px; border-radius: 5px;">질문</h2>
    <div class="container mt-4 question-section">
        
        <!--  
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
         -->
		
	
		
		<!-- 백그라운드 컬러 추가 및 스타일 변경 -->
	
		<div class="mb-3">
			<p class="fw-bold fs-5">제목: ${view.question_title}</p>
			<hr>
			<div class="d-flex justify-content-between">
				<!-- 닉네임과 날짜 간격 조절 -->
				<p class="fw-normal fs-7" style = "font-size:13px; margin: 0;">닉네임: ${view.nickname}</p>
				<p class="fw-normal fs-7" style = "font-size:13px; margin: 0;">날짜: ${view.create_date}</p>
				
			</div>
			<hr>
		</div>
		<div class="mb-3">
			<p class="fw-normal fs-5">내용: ${view.question_content}</p>
		</div>
		<hr>
		<!-- 섹션 간에 선 추가 -->


		<div class="mb-3">
            <a class="btn btn-primary" href="/question/modify?question_id=${view.question_id}">게시물 수정</a>
            <a class="btn btn-danger" href="/question/delete?question_id=${view.question_id}">게시물 삭제</a>
        </div>
		
        <!-- 답변 작성한 거 표시 -->
      
        <c:forEach items="${answer}" var="answer">
         <div class="container mt-4 answer-section">
            <hr>
            <div class="mb-3">
                <p>${answer.question_id}번게시물</p>
                <p>${answer.nickname}
                    /
                    <fmt:formatDate value="${answer.create_date}" pattern="yyyy-MM-dd" />
                </p>

                <div class="answer-content" data-answer-id="${answer.answer_id}">
                     <!--
                     
                     
                  	   <p id="answer_cont_" ${answer.answer_id}" data-answer-id="${answer.answer_id}" contenteditable="false">${answer.answer_cont}</p>  
                  		 <div id="answer_cont_" data-answer-id="${answer.answer_id}" contenteditable="false">${answer.answer_cont}</div>
                      -->
                  	 <span id="answer_cont_"  contenteditable="false">${answer.answer_cont}</span> 
   					  
   				<!-- 	-->
   					 <br>
   					 <button type="button" class="btn btn-primary editBtn"    data-answer-id="${answer.answer_id}" >수정</button>
                     <button type="button" class="btn btn-success confirmBtn" data-answer-id="${answer.answer_id}" style="display: none;">확인</button>
                      <a type="button" class="btn btn-danger" href="/answer/delete?answer_id=${answer.answer_id}&question_id=${answer.question_id}">삭제</a>
   
                <!-- <button type="button" class="btn btn-danger cancelBtn"   data-answer-id="${answer.answer_id}" style="display: none;">취소</button> -->
               </div>
                <!-- 삭제
                    <a type="button" class="btn btn-danger" href="/answer/delete?answer_id=${answer.answer_id}&question_id=${answer.question_id}">삭제</a>
                 -->
            </div>
       </div>
        </c:forEach>

        <!-- 답변 폼 -->
        <form method="post" action="/answer/writewAnswer" class="mb-5">
            <div class="mb-3">
                <label class="form-label">댓글 작성</label>
                <textarea rows="5" cols="50" id="coment-content" name="answer_cont" class="form-control"></textarea>
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
        var editBtn = $(this);
        var answerContent = editBtn.siblings("span");
        
        // 현재 답변 내용을 수정 가능하도록 contenteditable 속성을 토글
        var isEditable = answerContent.attr("contenteditable") === "true";
        answerContent.attr("contenteditable", !isEditable);
        
        // "수정" 버튼 토글
        editBtn.toggle();
        editBtn.siblings(".confirmBtn").toggle();
        //.cancelBtn
    });
    
    // "확인" 버튼 클릭 시
    $(".confirmBtn").click(function() {
        var confirmBtn = $(this);
        var answerContent = confirmBtn.siblings("span");
        var editBtn = confirmBtn.siblings(".editBtn");
        
        // 수정 내용을 서버로 전송하고, 업데이트
        var editedContent = answerContent.text();
        var answer_id = editBtn.data("answer-id");
        var question_id = $('#question_id').val();
        
        // contenteditable을 다시 false로 설정
        answerContent.attr("contenteditable", "false");
        
        // 서버로 수정 내용을 전송하고, 성공 시 버튼을 다시 토글
        $.ajax({
            type: "POST",
            url: "/answer/modify",
            data: {
                answer_id: answer_id,
                answer_cont: editedContent,
                question_id: question_id
            },
            success: function(response) {
                // 서버에서 성공적으로 업데이트된 경우
                confirmBtn.toggle();
                editBtn.toggle();
            },
            error: function(xhr, textStatus, errorThrown) {
                console.log("Error:", errorThrown);
                console.log(answer_id);
                console.log(editedContent);
                console.log(question_id);
            }
        });
    });
    
    // "취소" 버튼 클릭 시
    $(".cancelBtn").click(function() {
        var cancelBtn = $(this);
        var answerContent = cancelBtn.siblings("span");
        var editBtn = cancelBtn.siblings(".editBtn");
        
        // 수정 내용을 초기 상태로 복구
        answerContent.text(originalContent);
        answerContent.attr("contenteditable", "false");
        
        // 버튼 상태 복구
        cancelBtn.toggle();
        editBtn.toggle();
    });
});
</script>
</body>
</html>