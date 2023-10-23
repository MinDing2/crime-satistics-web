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

.btninfo {
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

footer {
	margin-top: 40px;
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
		    <a href="/admin/products/manage" class="item">		      
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
             <div class="listGroupTitle">Q&A</div>
             <a href="/question/adminListPageSearch?num=1" class="item">
                <div class="text">Q&A 조회</div>
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
                  <div style="font-weight: normal; margin-left: 5px;">어서오세요!! CSW 관리자님</div>
               </div>              
            </div>           
         </div>
          <!-- 여기에 콘텐츠 넣어보자 -->
            <div>
			   <h2 class="community-title" style="text-align: center; margin-top: 30px;">메뉴 등록</h2>
			   <div class="container">
			      <form action="/menus/write" method="POST">
			         <div class="main-content">
			            <table class="table table-bordered">
			               <tbody>
			                  <tr>
			                     <td class="font-weight-bold">메뉴 이름</td>
			                     <td><input type="text" name="menu_name" class="form-control" /></td>
			                  </tr>
			                  <tr>
			                     <td class="font-weight-bold">메뉴 카테고리</td>
			                     <td><input type="number" name="menu_cate" class="form-control" min="1" max="2" /></td>
			                  </tr>
			                  <tr>
			                     <td colspan="2" class="text-center">
			                        <input id="write" type="submit" class="btn btn-danger" value="등록" />
			                     </td>
			                  </tr>
			               </tbody>
			            </table>
			         </div>
			      </form>
			      <div class="text-center">
			         <a href="/menus/list" class="btn btn-secondary">메뉴 목록으로 가기</a>
			         <a href="/admin/page" class="btn btn-secondary">관리자 페이지로 가기</a>
			      </div>
			   </div>
			</div>
      </div>
   </main>

   <footer><%@ include file="../template/footer.jsp"%></footer>
   
   <script>   
      
      function formatPhoneNumber(phoneNumber) {
          return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
      }
    
   </script>
</body>
</html>