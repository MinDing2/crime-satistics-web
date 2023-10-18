<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>게시물 조회</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico">
    <!-- 부트스트랩 CSS 링크 추가 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Gothic+Coding&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Orbit&display=swap" rel="stylesheet">
    <!-- 부트스트랩 JavaScript 및 jQuery 추가 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

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
}
</style>
<body>
<!---------------- 본문 --------------->
<header><%@ include file="../template/header.jsp"%></header>
    <main class="container mt-5" style="margin:0 auto 50px;  width:900px;">      
      <h2 style="text-align: center; padding:20px;">게시물 내용보기</h2>        
       <div class="post-container">
       <input type="hidden" value="${vo.bnum}">
       <input type="hidden" value="${vo.menu_id}">
        <div>
            <div class="post-title">
                ${vo.title}
            </div>
            <div class="post-info">
                작성자: ${vo.writer} | 등록일: ${vo.regdate}
            </div>
        </div>
        <div class="post-info">
            조회: ${vo.readcount} | 추천: ${vo.likehit}
        </div>           
    </div>
    <div class="post-content" style="height: 300px;">
        ${vo.cont}
    </div>
        <c:if test="${sessionScope.memberid != null}">
         <div class="d-flex justify-content-center align-items-center" style="padding: 50px;">
             <c:if test="${likecheck eq 1 }">
                 <a href="#" onclick="updateLike(); return false;" class="text-decoration-none mr-2">
                     <img id="loglike" src="/img/Like.png" alt="추천" class="mr-1">
                 </a>
             </c:if>         
             <c:if test="${likecheck eq 0 }">
                 <a href="#" onclick="updateLike(); return false;" class="text-decoration-none mr-2">
                     <img id="loglike" src="/img/Unlike.png" alt="추천" class="mr-1">
                 </a>
             </c:if>
             <p class="mb-0" style="font-size:20px;">(${vo.likehit})</p>      
         </div>
        </c:if>
        <c:if test="${sessionScope.memberid == null}">
          <div class="d-flex justify-content-center align-items-center" style="padding: 50px;">
              <a>
              <img id="loglike" src="/img/Unlike.png" alt="추천" class="mr-1">
              </a>
              <p class="mb-0" style="font-size:20px;">(${vo.likehit})</p>
          </div>
      </c:if>
       <div style="margin-bottom: 30px;">
            <a href="/board/updateform?bnum=${vo.bnum}" id="update" class="btn btn-danger ml-2">수정</a>
          <button id="delete" class="btn btn-danger">삭제</button>
       </div>        
        <%@ include file="../board/include/reply.jsp"%>
     </main>   
        <footer style="margin-top: 150px;"><%@ include file="../template/footer.jsp"%></footer>
   
    <script>  
               
        let bnum = ${vo.bnum};
        let memberid = '<%= (String)session.getAttribute("memberid")%>';
        
       
            document.getElementById("delete").onclick = function () {               
               $.ajax({
                    url: '/board/delete',
                    type: 'POST',
               data:{
                  "bnum" : bnum                                    
               },                    
                    success: function () {
                        // 삭제 성공 시 실행할 동작 (예: 페이지 리로드)
                        location.href="/board/listsearch?menu_id="+ ${vo.menu_id};
                    },
                    error: function () {
                        // 삭제 실패 시 실행할 동작
                        alert('게시물 삭제 실패');
                    }
                });
        }

            function updateLike() {
                let likeImg = document.getElementById("likeimg");
                $.ajax({
                    type: "GET",
                    url: "/board/updatelike",
                    dataType: "json",
                    data: { 'bnum': bnum, 'memberid': memberid },
                    error: function () {
                        alert("통신 에러");
                    },
                    success: function (likeCheck) {
                        if (likeCheck == 0) {
                            alert("추천완료.");
                            location.reload();
                        } else if (likeCheck == 1) {
                            alert("추천취소");
                            location.reload();
                        }
                    }
                });
            }
        
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>