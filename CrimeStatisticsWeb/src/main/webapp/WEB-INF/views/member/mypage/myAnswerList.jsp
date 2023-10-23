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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>마이페이지</title>
<style>
  /* 페이지 네비게이션을 가로 중앙 정렬 */
    .pagination {
         text-align: center;
         justify-content: center;
    }

    /* 페이지 번호 및 이전/다음 링크 스타일 조정 */
    .pagination a {
        text-decoration: none;
        margin: 0 5px;
    }

    .pagination b {
        font-weight: bold;
        margin: 0 5px;
    }



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
   position: sticky;
   top: 100px;
   height: 650px;
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

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer {
	background-color: white;
	display: flex;
	padding: 21px 16px;
	height: 90px;
	margin-bottom: 10px;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item {
	flex-grow: 1
}
/* 녹색 숫자 */
.summaryContainer .number {
	font-size: 19px;
	font-weight: bold;
	color: #DC3545;
}
/* 텍스트 */
.summaryContainer .item>div:nth-child(2) {
	font-size: 13px;
}

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer {
	padding: 21px 16px;
	background-color: white;
	margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status {
	display: flex;
	justify-content: space-between;
	margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item {
	display: flex;
}

.shippingStatusContainer .number {
	font-size: 31px;
	font-weight: 500;
	text-align: center;
}

.shippingStatusContainer .text {
	font-size: 12px;
	font-weight: normal;
	color: #c2c2c2;
	text-align: center;
}

.shippingStatusContainer .icon {
	display: flex;
	align-items: center;
	padding: 20px;
	width: 16px;
	height: 16px;
}

/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
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

/* 공지사항 이용안내 고객센터 */
.infoContainer {
	background-color: white;
	display: flex;
	height: 100px;
	margin-bottom: 10px;
}

.infoContainer .item {
	flex-grow: 1;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	font-size: 13px;
	text-decoration: none;
	color: black;
}

.infoContainer .item>div:first-child {
	margin-bottom: 2px;
}

/*  */
.listContainer .item:hover {
	background-color: #f8f8f8;
	
}

.infoContainer .item:hover {
	background-color: #f8f8f8;
	
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

.verticalSplit {
    display: flex;
    justify-content: space-between;
    height: 200px;
}

.splitColumn {
    flex: 1;
    /* text-align: center; */
    padding: 10px;
    border: 1px solid #ccc; /* 테두리 스타일 지정 */
}

.splitColumn:nth-child(1), .splitColumn:nth-child(2) {
    border-right: none;
}

h3 {
	margin-left: 25px;
}

.verticalSplit ul li {
    margin-top: 5px;
}

.splita {
	text-decoration: none;
	color: black;
}
footer{
  position: fixed;
  bottom: 0;
  width:100%
}
main{
font-family: 'IBM Plex Sans KR', sans-serif;
}

</style>
</head>
<body>
	<header><%@ include file="../../template/header.jsp"%></header>

	   <main style="display: flex; width: 65%; margin: 0 auto;">
      <div class="wrap" style="flex: 1; height:720px; ">
         <div class="grayContainer" style="display: flex; justify-content: center; align-items: center;">
             <div>
                 <div class="name" style="text-align: center;">MY페이지</div>
             </div>
         </div>
         <div class="listContainer">
            <a href="/shop/cart-list" class="item">
               <div class="icon">ii</div>
               <div class="text">
                  장바구니
               </div>
               <div class="right">></div>
            </a>
            <a href="/member/mypage/orderInfo" class="item">
               <div class="icon">ii</div>
               <div class="text">
                  주문목록
               </div>
               <div class="right">></div>
            </a> 
            <a href="/member/mypage/review" class="item">
               <div class="icon">ii</div>
               <div class="text">상품후기</div>
               <div class="right">></div>
            </a> 
         </div>
         <div class="listContainer">
            <a href="/member/mypage/point" class="item">
               <div class="icon">ii</div>
               <div class="text">
                  포인트
               </div>
               <div class="right">></div>
            </a>
            <a href="#" class="item">
               <div class="icon">ii</div>
               <div class="text">
                  쿠폰
               </div>
               <div class="right">></div>
            </a>
         </div>
         <div class="listContainer">
            <a href="/member/mypage/myboard" class="item">
               <div class="icon">ii</div>
               <div class="text">
                  작성게시물
               </div>
               <div class="right">></div>
            </a>
            <a href="/member/mypage/myreply" class="item">
               <div class="icon">ii</div>
               <div class="text">
                  작성댓글
               </div>
               <div class="right">></div>
            </a>
            <a href="/member/mypage/mylike" class="item">
               <div class="icon">ii</div>
               <div class="text">
                  좋아요 누른 게시물
               </div>
               <div class="right">></div>
            </a>
            
            <a href="/member/mypage/myanswer?num=1" class="item">
               <div class="icon">ii</div>
               <div class="text">
                  작성한 질문 <span class="circle"></span> 
               </div>
               <div class="right">></div>
            </a>
            
         </div>
         <div class="infoContainer">
            <a href="#" class="item">
               <div>icon</div>
               <div>공지사항</div>
            </a> <a href="#" class="item">
               <div>icos</div>
               <div>이용안내</div>
            </a> <a href="#" class="item">
               <div>icon</div>
               <div>고객센터</div>
            </a>
         </div>
      </div>

		<!-- 오른쪽 콘텐츠 영역 -->
		<div class="rightArea" style="flex: 4;">
			<div class="grayContainer">
				<div class="name" style="display: flex; justify-content: space-between;">
					<div class="left" style="display: flex; align-items: center;">
						<img src="/img/person.png"	style="width: 32px; height: 32px; margin-left: 15px; margin-right: 10px;">
						<div>${member.name}</div>
						<div style="font-weight: normal; margin-left: 5px;">고객님, 안녕하세요!</div>
					</div>
					<div class="right" style="display: flex; align-items: center; margin-left: 200px; font-weight: normal; font-size: 15px;">
						<div>${member.tel} / ${member.email}</div>
						<button type="button" id="btn" class="btn">회원정보수정</button>
					</div>
				</div>
			</div>
			<div class="verticalSplit">
			    <div class="splitColumn">
				    <h3 style="margin-top: 15px; font-weight: bold;">SHOPPING</h3>
				    <ul style="margin-left: 13px; margin-top: 20px;">
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>장바구니</div>
				                <div style="margin-right: 20px;">
				                	<a href="/shop/cart-list" class="splita">
				                		<span style="color: red; font-weight: bold;">${cartCnt} </span>개
				                	</a>
				                </div>
				            </div>
				        </li>
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>주문내역</div>
				                <div style="margin-right: 20px;">
				                	<a href="/member/mypage/orderInfo" class="splita">
				                		<span style="color: red; font-weight: bold;">${orderInfoCnt} </span>건
				                	</a>
				                </div>
				            </div>
				        </li>
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>상품후기</div>
				                <div style="margin-right: 20px;">
				                	<a href="/member/mypage/review" class="splita">
				                		<span style="color: red; font-weight: bold;">${reviewCnt} </span>건
				                	</a>
				                </div>
				            </div>
				        </li>
				    </ul>
				</div>
			    <div class="splitColumn">
			        <h3 style="margin-top: 15px; font-weight: bold;">BENEFIT</h3>
			        <ul style="margin-left: 13px; margin-top: 20px;">
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>포인트</div>
				                <div style="margin-right: 20px;">
				                	<a href="/member/mypage/point" class="splita">
				                		<span style="color: red; font-weight: bold;">${member.point } </span>포인트
				                	</a>
				                </div>
				            </div>
				        </li>
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>쿠폰</div>
				                <div style="margin-right: 20px;">
				                	<a href="#" class="splita">
				                		<span style="color: red; font-weight: bold;">0 </span>장
				                	</a>
				                </div>
				            </div>
				        </li>
				    </ul>
			    </div>
			    <div class="splitColumn">
			        <h3 style="margin-top: 15px; font-weight: bold;">INFO</h3>
			        <ul style="margin-left: 13px; margin-top: 20px;">
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>작성게시물</div>
				                <div style="margin-right: 20px;">
				                	<a href="/member/mypage/myboard" class="splita">
				                		<span style="color: red; font-weight: bold;">${myBoardCnt} </span>건
				                	</a>
				                </div>
				            </div>
				        </li>
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>작성댓글</div>
				                <div style="margin-right: 20px;">
				                	<a href="/member/mypage/myreply" class="splita">
				                		<span style="color: red; font-weight: bold;">${myReplyCnt} </span>건
				                	</a>
				                </div>
				            </div>
				        </li>
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>좋아요 누른 게시물</div>
				                <div style="margin-right: 20px;">
				                	<a href="/member/mypage/mylike" class="splita">
				                		<span style="color: red; font-weight: bold;">${myLikeCnt} </span>건
				                	</a>
				                </div>
				            </div>
				        </li>
				        
				        <li>
				            <div style="display: flex; justify-content: space-between; align-items: center;">
				                <div>작성 질문</div>
				                <div style="margin-right: 20px;">
				                	<a href="/member/mypage/myanswer?num=1" class="splita">
										<span style="color: red; font-weight: bold;">${questionCnt} </span>건
				                	</a>
				                </div>
				            </div>
				        </li>
				        
				        
				    </ul>
			    </div>
			</div>
			
			
			<div class="verticalSplit">
			    <!-- 여기에 콘텐츠 넣어보자 -->         
		        <!-- 게시물 목록 -->
			    <div class="container mt-5">
			        <h2 class="text-center">작성한 질문</h2>			        
			        <div class="main-content" style="margin-top:20px;">
			        <table class="table table-striped">
			            <thead>
			                <tr>
			                    <th scope="col">번호</th>
			                    <th scope="col">제목</th>
			                    <th scope="col">글쓴이</th>
			                    <th scope="col">등록일</th>			                    
			                    <th scope="col"></th>
			                    <th scope="col"></th>
			                </tr>
			            </thead>
			            <tbody>
			                <c:forEach items="${list}" var="list">
			                    <tr>
			                        <th scope="row">${list.question_id}</th>
			                        <td>
			                            <a href="/question/view?question_id=${list.question_id}" style="text-decoration: none; color:black;">
			                                ${ list.question_title }
			                            </a>
			                        </td>
			                        <td>${ list.nickname }</td>
			                        <td>${ list.create_date}</td>			                        
			                        <td><a href="/question/modify?question_id=${ list.question_id }" class="btn btn-warning">수정</a></td>
			                        <td><a href="/question/delete?question_id=${ list.question_id }" class="btn btn-danger">삭제</a></td>
			                    </tr>
			                </c:forEach>
			            </tbody>
			        </table>
			        
			        <div class = "pagination">
						<c:if test="${page.prev}">
							<span>[ <a
								href="/member/mypage/myanswer?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a>]</span>
						</c:if>

						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
							var="num">
							<span> <c:if test="${select != num}">
									<a
										href="/member/mypage/myanswer?num=${num}${page.searchTypeKeyword}">${num}</a>
								</c:if> <c:if test="${select == num}">
									<b>${num}</b>
								</c:if>
							</span>
						</c:forEach>

						<c:if test="${page.next}">
							<span>[ <a
								href="/member/mypage/myanswer?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>
								]
							</span>
						</c:if>
						</div>
			    <!-- 여기까지 오른쪽 컨텐츠 -->
	    			</div>
	    		</div>
	    	</div>
	    </div>
	</main>

	<footer><%@ include file="../../template/footer.jsp"%></footer>
	
	<script>
		$(document).ready(function(){
		    var telElement = $('.rightArea .name .right div:first-child');
		    var tel = telElement.text();
		    telElement.text(formatPhoneNumber(tel));
		    
		    $('#btn').on('click', function() {
		    	location.href = '/member/mypage/modify';
		    });
		});
		
		function formatPhoneNumber(phoneNumber) {
		    return phoneNumber.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');
		}		
		
	</script>
</body>
</html>