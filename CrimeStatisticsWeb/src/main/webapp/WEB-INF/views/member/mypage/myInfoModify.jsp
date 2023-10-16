<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>MyInfo</title>
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
.input{
float:right;
width:80%;
}
</style>
</head>
<body>
<header><%@ include file="../../template/header.jsp"%></header>
    <main style="display: flex; width: 65%; margin: 0 auto;">
      <div class="wrap" style="flex: 1; ">
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
                  <img src="/img/person.png"   style="width: 32px; height: 32px; margin-left: 15px; margin-right: 10px;">
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
                </ul>
             </div>
         </div>
         <div class="verticalSplit">
            <!-- 여기에 콘텐츠 넣어보자 -->
            <!-- 개인정보 수정 -->
            <div id="Infomodify" style="margin-top:20px; width: 900px;">
            <h2>회원정보수정</h2>
            <hr/>
            <form action="/member/mypage/modify" method="post" style="margin-bottom: 50px;">
               <div style="margin-bottom: 20px; margin-left: 10px;">이름                
               <input type="text" name="name" size="30" value="${member.name}" style ="float:right; width:80%;"readonly disabled />
               </div>
               <div style="margin-bottom: 20px; margin-left: 10px;">아이디               
               <input type="text" name="memberid" id="memberid" value="${member.memberid}" minlength="8" maxlength="16" style="float: right; width:80%;" readonly disabled />
               <input type="hidden" name="memberid" value="${member.memberid}" />               
               </div> 
               <div  style="margin-bottom: 20px; margin-left: 10px;">현재 비밀번호 
               <input type="password" name="passwd" id="password" value=""  style="float:right; width:80%; "/> 
               <span id="pwdcheck_blank" style="font-size: 10px;" style="float:right;"></span>
               </div>
               <div style="margin-bottom: 20px; margin-left: 10px;">새 비밀번호 
               <input type="password" name="newPasswd" id="newPassword" style="float:right; width:80%;" minlength="8" maxlength="16" autocomplete="off" placeholder="영문, 숫자, 특수문자 조합하여 8~16자"  disabled required />
               <span id="pwdcheck_blank1" style="font-size: 10px;"></span>
               </div>
               <div style="margin-bottom: 20px; margin-left: 10px;">새 비밀번호 확인
               <input type="password" name="newPasswordCheck" id="newPasswordCheck"  placeholder="비밀번호를 한번 더 입력해주세요" style="float:right; width:80%;" disabled required/> <br />
               <span id="pwdcheck_blank2" style="font-size: 10px;"></span>
               </div>
               
               <div style="margin-bottom: 20px; margin-left: 10px;">닉네임
               <div style="width:80%; float:right;">               
               <input type="text" name="nickname" id="nickname" value="${member.nickname}"  style="width:80%;" autocomplete="off" required />
               <button type="button" id="nicknameCheckDuplicate" style="width:15%;">중복확인</button>               
               </div>
               </div>               
               <div style="height:130px; margin-left: 10px;">주소               
               <div style="float:right; width:80%;">
               <input type="text" name="address_postcode" style="width:80%" value="${member.address_postcode}" placeholder="우편번호" readonly />
               <input type="button" value="주소검색" onclick="exePost()" style="margin-bottom: 10px; width:15%">
               <input type="text" id="address_primary" name="address_primary" value="${member.address_primary}" style="width:100%; margin-bottom:10px;" placeholder="기본주소" readonly />
               <input type="text" name="address_detail" style="width:100%" value="${member.address_detail}" autocomplete="off" placeholder="상세 주소(선택 사항)">
               </div>
               </div>               
               <div style="margin-bottom: 20px; margin-left: 10px;">번호
               <input type="text" name="tel" id="tel" value="${member.tel}" style="float:right; width:80%;" autocomplete="off" required />
               </div>
               
               <div style="margin-bottom: 20px; margin-left: 10px;height:80px;">이메일
               <div class="input">
               <input type="text" name="emailId" id="emailId" value="${member.emailId}" style="width:40%;"autocomplete="off" placeholder="아이디" required />@
               <input type="text" name="emailDomain" id="emailDomain" value="${member.emailDomain}"  style="width:35%;" placeholder="도메인" required />
               <select onclick="setEmailDomain(this.value);return false;">
                  <option value="">--직접입력--</option>
                   <option value="naver.com">naver.com</option>
                   <option value="gmail.com">gmail.com</option>
                   <option value="hanmail.net">hanmail.net</option>
                   <option value="hotmail.com">hotmail.com</option>
                   <option value="korea.com">korea.com</option>
                   <option value="nate.com">nate.com</option>
                   <option value="yahoo.com">yahoo.com</option>
               </select>
               <div style="margin-top: 20px;">
               <input type="button" value="인증코드 발송" onclick="sendEmail()" />
               <input type="text" id="codeInput" size="20" autocomplete="off" placeholder="인증번호 입력" disabled />
               <span id="codecheck_blank" style="font-size: 10px;"></span>
               </div>
               </div>
               </div>               
               <div style="margin-bottom: 20px;margin-left: 10px;">성별
               <div class="form-row" style="width: 80%; float: right;">
                   <div class="form-check col">
                       <input class="form-check-input" type="radio" name="sex" id="male" value="남성" checked>
                       <label class="form-check-label" for="male">남성</label>
                   </div>
                   <div class="form-check col">
                       <input class="form-check-input" type="radio" name="sex" id="female" value="여성">
                       <label class="form-check-label" for="female">여성</label>
                   </div>
               </div>
               </div>
               <div style="margin-top: 30px; text-align: center;">
                   <input type="submit" class="btn btn-danger" value="수정" />
                   <button type="button" class="btn btn-danger" onclick="location.href='/';">취소</button>
                   <button type="button" class="btn btn-danger" onclick="confirmDelete()">탈퇴</button>
               </div>            
            </form>
            </div>
            <!-- 여기까지 오른쪽 컨텐츠 -->
         </div>
      </div>
   </main>   
   <script>
      let code = "";   // 이메일 인증코드
      
      function confirmDelete() {
         let result = confirm("정말로 탈퇴하시겠습니까?");
         if (result) {
            // 확인 누르면 회원 탈퇴
            location.href = '/member/delete';
         } else {
            // 취소 누르면 아무것도 하지 않음
         }
      }
      
      $("#password").blur(function() {
         let password = $(this).val(); // 비밀번호 값 가져오기
         
         if (password) {
            $.ajax({
               url: "/member/password-check",
               type: "post",
               data: {'password': password},
               success: function(response) {
                  if (response == "success") {
                     $("#newPassword").prop("disabled", false);
                     $("#newPasswordCheck").prop("disabled", false);
                     
                     $("#pwdcheck_blank").css("color", "blue");
                     $("#pwdcheck_blank").text("비밀번호가 일치합니다");
                  } else if (response == "fail") {
                     $("#pwdcheck_blank").css("color", "red");
                     $("#pwdcheck_blank").text("비밀번호를 다시 입력하세요");
                  }
               },
               error: function () {
                  $("#pwdcheck_blank").css("color", "red");
                      $("#pwdcheck_blank").text("에러 발생");
               }
            });
         }
      });
      
      // 새 비밀번호 유효성 검사
      $("#newPassword").blur(function() {
          let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
          
          if ($("#newPassword").val() == "") {
               $("#pwdcheck_blank1").css("color", "red");
               $("#pwdcheck_blank1").text("비밀번호를 입력하세요");
               newPassword = false;
            }   
            else if (!pwdCheck.test($("#newPassword").val())) {
               $("#pwdcheck_blank1").css("color", "red");
              $("#pwdcheck_blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
              newPassword = false;
            }else {
               $("#pwdcheck_blank1").css("color", "blue");
              $("#pwdcheck_blank1").text("안전한 비밀번호 입니다. 아래에 한번 더 입력하세요");
              newPassword = true;
            }
       });
   
      
      // 새 비밀번호 확인
      $("#newPasswordCheck").blur(function() {
         if($("#newPasswordCheck").val() == "") {
            $("#pwdcheck_blank2").css("color", "red");
              $("#pwdcheck_blank2").text("필수정보입니다");
              newPasswordCheck = false;
         }
         else if(newPassword == true && $("#newPassword").val() == $("#newPasswordCheck").val()) {
            $("#pwdcheck_blank2").css("color", "blue");
            $("#pwdcheck_blank2").text("비밀번호가 일치합니다!");
            newPasswordCheck = true;
         }else {
            $("#pwdcheck_blank2").css("color", "red");
            $("#pwdcheck_blank2").text("비밀번호를 다시 확인해주세요");
            $("#passwordCheck").val("");
            newPasswordCheck = false;
         }
      });
      
      // 닉네임 중복체크
      $(document).ready(function() {
         $("#nicknameCheckDuplicate").click(function() {
            var nickname = $("#nickname").val();   // 입력된 아이디 가져오기
            
            if (nickname == "") {
               alert("닉네임을 입력해주세요");
            } else {
               $.ajax({
                  url: "/member/nickname-check-duplicate",
                  type: "POST",
                  data: {"nickname": nickname},
                  success: function(response) {
                     if (response == "duplicate") {
                        alert("이미 사용 중인 닉네임입니다.");
                        $("#nickname").val("");
                     } else {
                        alert("사용 가능한 닉네임입니다.");
                     }
                  },
                  error: function() {
                     alert("에러 발생. 다시 시도해주세요.");
                  }
               })
            }
         })
      })
      
      // 주소
      function exePost() {
          new daum.Postcode({
               oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
   
                  // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 도로명 조합형 주소 변수
   
                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                      extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                  }
                  // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if(extraRoadAddr !== ''){
                      extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }
                  // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                  if(fullRoadAddr !== ''){
                      fullRoadAddr += extraRoadAddr;
                  }
   
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  console.log(data.zonecode);
                  console.log(fullRoadAddr);
                  
                  $("[name=address_postcode]").val(data.zonecode);
                  $("[name=address_primary]").val(fullRoadAddr);
                  
                  /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                  document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                  document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
              }
           }).open();
      }
      
      // 이메일
      function setEmailDomain(domain){
             $("#emailDomain").val(domain);
      }
      
      function sendEmail() {
         var emailRule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         var emailId = $("#emailId").val();
         var emailDomain = $("#emailDomain").val();
         
         if(!emailId){
             alert("이메일을 입력해주세요");
             $("#emailId").focus();
             return false;
         } else if (!emailDomain) {
            alert("도메인을 입력해주세요");
            $("#emailDomain").focus();
            return false;
         }
         
         let email = emailId + '@' + emailDomain;  //입력한 이메일
         // $("#email").val(email);
         
         if(!emailRule.test(email)){
             alert("이메일을 형식에 맞게 입력해주세요.");
             return false;
         }
         
         $.ajax({
            url: "/mailSender",
            type: "get",
            data: {'email':email},
            success: function(rnum) {
               //alert("s");
               alert("기입하신 이메일로 인증번호를 전송했습니다.");
               
               $("#codeInput").attr("disabled", false); //입력칸 활성화
               code = rnum;
            },
            error: function () {
               alert("fail");
            }
         });
      }
      
      $("#codeInput").blur(function() {
         
         console.log(code);
         if(code == $("#codeInput").val()) { //인증번호 같다면
            $("#codecheck_blank").css("color", "blue");
            $("#codecheck_blank").text("인증되었습니다.");
            email = true;
         }else {
            $("#codecheck_blank").css("color", "red");
            $("#codecheck_blank").text("인증번호를 다시 입력해주세요.");
            email = false;
         }
      });
   </script>
</body>
</html>