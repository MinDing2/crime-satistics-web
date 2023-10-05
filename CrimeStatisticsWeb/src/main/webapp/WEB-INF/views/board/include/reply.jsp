<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩 JavaScript 및 jQuery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
        <!------------------------- 댓글 ---------------------------->
        <h3>댓글</h3>
        <button id="showCommentForm" class="btn btn-primary btn-sm">댓글 작성하기</button>
        <div id="reply">
        <!-- 댓글 목록 -->
            <ol class="replyList list-unstyled">
                <c:forEach items="${replyList}" var="reply">
                    <li class="mb-4">
                        <div class="card" style="width:600px; margin-left: <c:out value="${reply.redepth}"/>">
                            <div class="card-body">
                                <p class="card-text">
                                    <strong>작성자:</strong> ${reply.writer}<br />
                                    <strong>작성 날짜:</strong> <fmt:formatDate value="${reply.regdate}" pattern="yyyy-MM-dd" />
                                </p>
                                <p class="card-text">${reply.cont}</p>
                                <a href="#" class="btn btn-secondary" data-toggle="modal" data-target="#editModal"
                                    data-bnum="${reply.bnum}" data-rnum="${reply.rnum}" data-writer="${reply.writer}" data-cont="${reply.cont}">수정</a>
                                <a href="/reply/delete?rnum=${reply.rnum}&bnum=${reply.bnum}" class="btn btn-light">삭제</a>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ol>
        </div>
        <!-- 댓글작성 -->
        <div id="replydialog" style="display: none;">
            <form method="post" action="/reply/write">
                <div class="mb-3">
                    <label for="writer" class="form-label">댓글 작성자</label>
                    <input type="text" class="form-control" id="writer" name="writer" value="${nickname}" readonly required>
                </div>
                <div class="mb-3">
                    <label for="cont" class="form-label">댓글 내용</label>
                    <textarea class="form-control" id="cont" name="cont" rows="4" required></textarea>
                </div>
                <input type="hidden" name="bnum" value="${vo.bnum}">                
                <div class="mb-3">
                    <button id= "replywrite"type="submit" class="btn btn-primary">댓글 작성</button>
                </div>
            </form>
        </div>         
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editModalLabel">댓글 수정</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>                
                <!------------------------ 댓글 수정 모달 ------------------------>
                <div class="modal-body">
                    <!-- 수정 양식을 추가 -->
                    <form method="post" action="/reply/update">
                        <div class="mb-3">
                            <label for="editWriter" class="form-label">댓글 작성자</label>
                            <input type="text" class="form-control" id="editWriter" name="writer"value="${nickname}" readonly required>
                        </div>
                        <div class="mb-3">
                            <label for="editCont" class="form-label">댓글 내용</label>
                            <textarea class="form-control" id="editCont" name="cont" rows="4" required></textarea>
                        </div>
                        <input type="hidden" name="bnum" id="editBnum" value=${reply.bnum }>
                        <input type="hidden" name="rnum" id="editRnum" value=${reply.rnum }>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-primary">수정 완료</button>     
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>                       
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
      <script>
        $('#editModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var rnum = button.data('rnum');
            var bnum = button.data('bnum');
            var writer = button.data('writer');
            var cont = button.data('cont');
            var modal = $(this);
            modal.find('#editRnum').val(rnum);
            modal.find('#editBnum').val(bnum);
            modal.find('#editWriter').val(writer);
            modal.find('#editCont').val(cont);
        });
        
        document.getElementById("replywrite").onclick = function(){
        	  var memberid = '<%= (String)session.getAttribute("memberid")%>';
        	  if(memberid == "null"){
        		  alert("로그인이 필요합니다");
        		  return false;
        	  }
          }
        // Get a reference to the button and the comment section
        const showCommentFormButton = document.getElementById("showCommentForm");
        const replyDialog = document.getElementById("replydialog");

        // Add a click event listener to the button
        showCommentFormButton.addEventListener("click", function () {
            // Toggle the visibility of the comment section
            if (replyDialog.style.display === "none" || replyDialog.style.display === "") {
                replyDialog.style.display = "block"; // Show the comment section
            } else {
                replyDialog.style.display = "none"; // Hide the comment section
            }
        });
        
        
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>