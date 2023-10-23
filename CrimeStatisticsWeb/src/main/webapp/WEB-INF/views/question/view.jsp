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
   <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>   
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>    

    
    
    <style>
.question-section {
	background-color: white;
	padding: 20px;
	margin-bottom: 20px;
}

.post-container {
	border-top: 5px solid #0F3A5F;
	border-bottom: 2px solid #0F3A5F;
	padding: 20px;
	margin: 10px;
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
}
</style>
</head>
<body>
	<%
		String adminid = (String) session.getAttribute("adminid"); // adminid를 세션에서 가져옴
		String memberid = (String) session.getAttribute("memberid");
		
	%>
	<header><%@ include file="../template/header.jsp"%></header>	
	<main class="container mt-5" style="margin:0 auto 50px;  width:900px;">
	  <h2 style="text-align: center; padding:20px;">Q&A</h2><br>      
	   
    <!-- 질문 글 표시 -->	
		<!-- 제목 작성자 날짜-->
		<div class="post-container">

			<div class="mb-3" style="margin-bottom: 0;">
				<p class="fw-bold fs-5" style="margin-bottom: 40px;">제목:
					${view.question_title}</p>
				<p class="fw-normal fs-7" style="font-size: 13px; margin: 0;">작성자:
					${view.nickname}</p>
			</div>
			<div class="d-flex justify-content-between" style="margin-bottom: 0%">
				<!-- 닉네임과 날짜 간격 조절 -->
				<p class="fw-normal fs-7"
					style="font-size: 13px; margin: 0; margin-top: 5px;">날짜:
					${view.create_date}</p>
			</div>
		</div>
		
		<!-- 내용 -->
		<div class="mb-3">
			<p style="height:500px;" class="fw-normal fs-5">&nbsp ${view.question_content}</p>
		</div>
		
		<!-- 섹션 간에 선 추가 -->
		<c:if test="${sessionScope.nickname eq view.nickname}">
		<div class="mb-3">
            <a class="btn btn-primary" href="/question/modify?question_id=${view.question_id}">수정</a>
            <a class="btn btn-danger" href="/question/delete?question_id=${view.question_id}">삭제</a>
       	</div>
        </c:if>
       
         <% if (adminid != null) { %>
			<hr style="border: 1px solid  #000000;">
			<h3 style="margin-top: 20px;">답변</h3>
			<hr style="border: 1px solid  #000000;">
		<% }else { %>
		    <hr style="border: 2px solid #0F3A5F;">
		<%} %>
		
		<!-- 답변 내용 -->
	</main>
	
	<!-- 답변 작성한 거 표시 -->
      <main class="container mt-5" style="margin:0 auto 50px;  width:900px;">      
      <c:if test="${sessionScope.nickname eq view.nickname || sessionScope.adminid ne null }">
        <c:forEach items="${answer}" var="answer">
         <div class="container mt-4 answer-section">
            <hr>
            <div class="mb-3">
               
                <p>${answer.nickname}
                    /
                    <fmt:formatDate value="${answer.create_date}" pattern="yyyy-MM-dd" />
                </p>

                <div class="answer-content" data-answer-id="${answer.answer_id}">
                     <!--
                     
                     
                  	   <p id="answer_cont_" ${answer.answer_id}" data-answer-id="${answer.answer_id}" contenteditable="false">${answer.answer_cont}</p>  
                  		 <div id="answer_cont_" data-answer-id="${answer.answer_id}" contenteditable="false">${answer.answer_cont}</div>
                      -->					
                  	  <span id="answer_cont_" contenteditable="false">${answer.answer_cont}</span>   					
   				<!-- 	-->
   					 <br>
   					 <c:if test = "${sessionScope.adminid ne null }">
   						 <button type="button" class="btn btn-primary editBtn"    data-answer-id="${answer.answer_id}" >수정</button>
                    	 <button type="button" class="btn btn-success confirmBtn" data-answer-id="${answer.answer_id}" style="display: none;">확인</button>
                    	 <a type="button" class="btn btn-danger" href="/answer/delete?answer_id=${answer.answer_id}&question_id=${answer.question_id}">삭제</a>
   					 </c:if>
                <!-- <button type="button" class="btn btn-danger cancelBtn"   data-answer-id="${answer.answer_id}" style="display: none;">취소</button> -->
               </div>
                <!-- 삭제
                    <a type="button" class="btn btn-danger" href="/answer/delete?answer_id=${answer.answer_id}&question_id=${answer.question_id}">삭제</a>
                 -->
            </div>
       </div>
        </c:forEach>
	</c:if>
        <!-- 답변 폼 -->
        <form method="post" action="/answer/writewAnswer" class="mb-5" style = "margin-top:0;">
       	
        	
            <% if (adminid != null) { %>
  			<textarea rows="5" cols="50" id="comment-content" name="answer_cont" class="form-control" ></textarea>
  			<br>
  			<button type="submit" class="btn btn-success">답글 작성</button>
			<% } %>
			
            
            <input type="hidden" name="adminid" value="${adminid}" readonly />
            <input type="hidden" id="question_id" name="question_id" value="${view.question_id}" />
           
           
        </form>
        </main>
        <footer><%@ include file="../template/footer.jsp"%></footer>
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





