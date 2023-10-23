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

.btn {
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
	bottom: 0;
	width: 100%
}

</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>

	<main style="display: flex; width: 65%; margin: 0 auto;">
		<div class="wrap" style="flex: 1;">
			<div class="grayContainer"
				style="display: flex; justify-content: center; align-items: center;">
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
					</a> <a href="/menus/list" class="item">
						<div class="text">게시판 카테고리조회</div>
					</a>
				</div>

				<!-- Q & A 조회 추가 일단 num 안받고 리스트만 받기-->
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
					</a> <a href="/notice/list" class="item">
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
          </div>
			<!-- 여기에 콘텐츠 넣어보자 -->
			
		<!-- 제목 -->
		<div class="container" style="text-align: center; margin-top: 40px; margin-bottom: 40px;">
			<h2 class="community-title"> Q&A</h2>
		</div>
		<!-- 정렬 버튼 -->
		<div class="container table-container">
			<!-- 본문테이블 -->
			<table class="table table-hover">			    
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">글번호</th>
							<th scope="col" style="text-align: center;">답변</th>
						<th scope="col" style="text-align: center;">제목</th>
						<th scope="col" style="text-align: center;">글쓴이</th>
						<th scope="col" style="text-align: center;">등록일</th>
					</tr>
				</thead>	
				
				<!-- 게시물 -->
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr>
							<td style="text-align: center;">${ list.question_id }</td>
							<c:if test= "${list.answerCheck eq 0}">
								<td style="text-align: center;">No</td>
							</c:if>
							<c:if test= "${list.answerCheck ne 0}">
								<td style="text-align: center;">YES</td>
							</c:if>
							<td style="text-align: center;"> 
							<a href="/question/view?question_id=${list.question_id}"> 
							  ${ list.question_title }</a></td>
							<td style="text-align: center">${ list.nickname }</td>
							
							<td style="text-align: center;">${list.create_date }</td>
							
						</tr>
						
					</c:forEach>
					
				</tbody>
				
			</table>
			
	
			<%@ include file="include/adminSearchPaging2.jsp"%>
		</div>
	
		</div>
	</main>

	<footer><%@ include file="../template/footer.jsp"%></footer> 
  <script>
      $(document).ready(function(){
          var telElement = $('.rightArea .name .right div:first-child');
          var tel = telElement.text();
          telElement.text(formatPhoneNumber(tel));
          
          $('.btn').on('click', function() {
             location.href = '/member/mypage/modify';
          });
      });
      
      function formatPhoneNumber(phoneNumber) {
          return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
      }
   </script>
   
   <script>
        document.getElementById("searchBtn").onclick = function() {
            let searchType = document.getElementsByName("searchType")[0].value;
            let keyword = document.getElementsByName("keyword")[0].value;
            location.href = "/question/adminListPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
        };
    </script>
	
</body>

</html>