<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="imaga/x-icon" href="/img/favicon.ico">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>관리자 페이지</title>
<style>
body {
   padding: 0;
   margin: 0;
}

div {
   box-sizing: border-box;
}

/* alert badge */
.circle {
   display: inline-block;
   width: 5px;
   height: 5px;
   border-radius: 2.5px;
   background-color: #ff0000;
   position: absolute;
   top: -5px;
   left: 110%;
}

/* 녹색 텍스트 */
.green {
   color: #24855b;
}

.red {
   color: #DC3545;
}

.wrap {
   margin-top: 60px;
   margin-bottom: 60px;
   background-color: #F8F8F8;
   border: 1px solid #ccc;
}
/* 어두운 회색 배경 */
.grayContainer {
   height: 70px;
   background-color: #373B46;
   display: flex;
   align-items: flex-end;
   padding: 16px;
}

.grayContainer .name {
   font-size: 20px;
   font-weight: bold;
   color: #ffffff;
}

.grayContainer .modify {
   margin-left: auto;
}



/*=================== 좌측 부분 스타일 ==================*/
.listContainer {
   padding: 0;
   background-color: #ffffff;
   margin-bottom: 10px;
}

.listContainer .item {
   display: flex;
   align-items: center;
   padding: 16px;
   color: black;
   text-decoration: none;
   height: 56px;
   box-sizing: border-box;
}

.listContainer .icon {
   margin-right: 14px;
}

.listContainer .text {
   font-size: 16px;
   position: relative;
}

.listContainer .right {
   margin-left: auto;
}

/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
.listContainer .smallLight {
   font-size: 14px;
   color: #c2c2c2;
}

.listContainer .smallLight>span {
   margin-left: 10px;
}

.listContainer .right .blct {
   font-size: 14px;
   font-weight: bold;
   margin-right: 5px;
}


.rightArea {
   margin-left: 40px;
   margin-top: 60px;
}

#btn {
    background-color: transparent !important;
    border-color: white !important;
    color: white !important;
    font-size: 13px !important;
    margin-left: 30px;
}

/* listGroupTitle에 스타일 추가 */
.listGroupTitle {
  background-color: #333; /* 배경색 설정 */
  color: #fff; /* 텍스트 색상 설정 */
  padding: 12px; /* 내부 여백 설정 */
  font-weight: bold; /* 폰트 굵기 설정 */
  font-size: 20px;
}
footer{
  margin-top:250px;
  bottom: 0;
  width:100%
}
</style>
</head>
<body>
   <header><%@ include file="../template/header.jsp"%></header>

   <main style="display: flex; width: 65%; margin: 0 auto;">
      <div class="wrap" style="flex: 1;">
         <div class="grayContainer" style="display: flex; justify-content: center; align-items: center;">
             <div>
                 <div class="name" style="text-align: center;">MY페이지</div>
             </div>
         </div>     
         
         <div class="listContainer">
		  <div class="listGroup">
		    <div class="listGroupTitle">상품</div>
		    <a href="/admin/products/register" class="item">		      
		      <div class="text">상품등록</div>		      
		    </a>		    
		    <a href="#" class="item">		      
		      <div class="text">상품재고관리</div>		      
		    </a>
		  </div>		  
		  <div class="listGroup">
		    <div class="listGroupTitle">메뉴</div>
		    <a href="/menus/writeform" class="item">		      
		      <div class="text">게시판 카테고리등록</div>		      
		    </a>
		    <a href="/menus/list" class="item">		      
		      <div class="text">게시판 카테고리조회</div>		      
		    </a>
		  </div>
		  		  
		  <div class="listGroup">
		    <div class="listGroupTitle">공지사항</div>
		    <a href="/notice/writeform" class="item">		      
		      <div class="text">공지사항 등록</div>		      
		    </a>
		    <a href="/notice/list" class="item">		      
		      <div class="text">공지사항 목록</div>		      
		    </a>
		  </div>
		</div>         
      </div>

     <!-- 오른쪽 콘텐츠 영역 -->
      <div class="rightArea" style="flex: 4;">
         <div class="grayContainer">
            <div class="name" style="display: flex; justify-content: space-between;">
               <div class="left" style="display: flex; align-items: center;">                  
                  <div style="font-weight: normal; margin-left: 0 auto; text-align: center;">어서오세요!! CSW 관리자님</div>
               </div>               
            </div>
        <!-- 여기에 콘텐츠 넣어보자 -->         
        <!-- 게시물 목록 -->
        <div>
	    <form action="/notice/update" method="POST" name="form">          
           <h2 style="text-align: center; padding:10px;">공지사항 수정</h2>               
            <table class="table">
                <tr>
                    <th>글번호</th>
                    <td colspan="2"><input type="text" class="form-control" name="nbnum" value="${ nvo.nbnum }" readonly /></td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td colspan="2"><input type="text" class="form-control" name="title" value="${ nvo.title }"/></td>
                </tr>
                <tr>
                    <th>글쓴이</th>
                    <td colspan="2"><input type="text" class="form-control" value="${ nvo.writer }" readonly /></td>
                </tr>
                <tr>
                    <th>등록일</th>
                    <td colspan="2"><input type="text" class="form-control" value="${ nvo.regdate }" readonly /></td>
                </tr>
                <tr>
                    <th>마감일</th>
                    <td><input type="date" class="form-control" name="enddate"value="${ nvo.enddate }" id="endDate" /></td>                  
                </tr>
                <tr>
                    <th>조회수</th>
                    <td colspan="2"><input type="text" class="form-control" value="${ nvo.readcount }" readonly /></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="2"><textarea class="form-control" name="cont" rows="10">${ nvo.cont }</textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" class="btn btn-danger" id="update" value="수정" />
                        <a href="/notice/list" class="btn btn-secondary">목록</a>
                        <button type="button" class="btn btn-secondary" onclick="history.back()">이전으로</button>
                    </td>
                </tr>
            </table>
        </form> 
        </div>
	    <!-- 여기까지 오른쪽 컨텐츠 -->
      </div>
   </main>
   <footer><%@ include file="../template/footer.jsp"%></footer>
   <script>
      $(document).ready(function(){
          var telElement = $('.rightArea .name .right div:first-child');
          var tel = telElement.text();
          telElement.text(formatPhoneNumber(tel));
          
          $('#btn').on('click', function() {
             location.href = '/member/mypage/modify';
          });
      });
      // $('#endDate').val(new Date().toISOString().substring(0,10));
      $('#endDate').val(new Date().toISOString().substring(0,10));
      
      function formatPhoneNumber(phoneNumber) {
          return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
      }

   </script>
</body>
</html>