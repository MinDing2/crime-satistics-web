<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="imaga/x-icon" href="/img/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>주문서 작성</title>
<style>
main {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    height: auto; /* 이렇게 하면 전체 화면 높이를 차지합니다 */
}

#content {
	border-top: 3px solid black;
}

.deliveryInfo {
	margin-top: 40px;
	border-bottom: 1px solid lightgray;
	padding-bottom: 40px;
}

.custom-checkbox {
    transform: scale(1.5); /* 크기 조절 */
    margin-right: 5px; /* 옆 여백 */
}

.custom-label {
	color: blue;
}

.leftArea {
	border-right: 2px solid lightgray;
}

.orderInfo {
	margin-top: 40px;
	border-bottom: 1px solid lightgray;
	padding-bottom: 40px;
}

.finalPayment {
	margin-top: 40px;
	padding-bottom: 40px;
	padding-left: 70px;
	border-bottom: 1px solid lightgray;
}

.paymentMethod {
	margin-top: 40px;
	padding-bottom: 40px;
	padding-left: 70px;
}

.orderPdInfo {
	margin-top: 40px;
	padding-bottom: 40px;
	padding-left: 70px;
	border-bottom: 1px solid lightgray;
}

.custom-button input[type="button"] {
  border: none;
  background-color: gray;
  color: white;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.customBtn {
  border: none;
  background-color: #dc3545;
  color: white;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

.buttonContainer {
    display: flex;
    justify-content: start;
    flex-wrap: wrap;
}

.buttonArea {
    border: 1px solid lightgray;
    cursor: pointer;
}

#creditCard {
	padding-left: 15px;
	line-height: 50px;
	width: 200px;
	height: 50px;
}

#samsungPay {
	padding-left: 15px;
	line-height: 50px;
	width: 200px;
	height: 50px;
}

#kakaoPay {
	padding-left: 15px;
	line-height: 50px;
	width: 200px;
	height: 50px;
}

#tossPay {
	padding-left: 15px;
	line-height: 50px;
	width: 200px;
	height: 50px;
}
.btn-primary {
    background-color: transparent !important;
    border-color: gray !important;
    color: gray !important;
    margin-top: 25px;
    margin-right: 10px;
    margin-left: 70px;
}

#primary {
	padding: 10px 150px;
}

.btn-primary:hover {
	background-color: #f0f0f0 !important;
}

#payment {
	margin-left: 70px;
	margin-top: 10px;
	padding: 10px 134px;
}
</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>

	<main style="margin-top: 40px; margin-bottom: 100px;">
		<div id="header" style="width: 65%; margin-bottom: 40px; display: flex; justify-content: space-between; align-items: center;">
		    <h1>주문/결제</h1>
		    <div style="display: flex; justify-content: flex-end; align-items: center;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/before-shopping-cart.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: gray;">장바구니</div>
		        </span>
		        <hr style="width: 50px; height: 2px; color: gray; background-color: gray; border: none; margin: 0; margin-bottom: 25px;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/credit-card.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: black;">주문/결제</div>
		        </span>
		        <hr style="width: 50px; height: 2px; color: gray; background-color: gray; border: none; margin: 0; margin-bottom: 25px;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/before-check.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: gray;">주문완료</div>
		        </span>
		    </div>
		</div>
		<div id="content" style="width: 65%; display: flex; justify-content: space-between;">
			<div class="leftArea" style="flex: 1;">
				<div class="orderInfo">
					<div>
			        	<h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">주문 정보</h4>
			        </div>
			        <div>
			        	<input id="order_name" type="text"  name="name" placeholder="ex) 홍길동" style="width: 270px; height: 40px; padding-left: 15px;">
			        	<input id="order_tel" type="text"  name="tel"  placeholder="ex) 01012345678" style="width: 270px; height: 40px; padding-left: 15px;"/>
			        </div>
			        <div style="margin-top: 10px;">
			        	<input id="order_email" type="email" name="email" placeholder="ex) abcd@naver.com" style="width: 546px; height: 40px; padding-left: 15px;" />
			        </div>
				</div>
				<div class="deliveryInfo">
					<div style="display: flex; justify-content: space-between;">
			        	<h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">배송지 정보</h4>
			        	<div style="margin-right: 70px;">
			        		<input type="checkbox" class="custom-checkbox" name="sameAsBilling" id="sameAsBilling">
					        <label for="sameAsBilling" class="custom-label">주문자 정보와 일치</label>
			        	</div>
			        </div>
			        <div>
			        	<input type="text"  id="name" name="name" placeholder="ex) 홍길동" style="width: 270px; height: 40px; padding-left: 15px;">
			        	<input type="text"  id="tel" name="tel"  placeholder="ex) 01012345678" style="width: 270px; height: 40px; padding-left: 15px;"/>
			        </div>
			        <div style="margin-top: 20px; margin-bottom: 10px; font-size: 12px;">
			        	주소
			        </div>
			        <div class="custom-button">
			        	<input type="text"  id="address_postcode" name="address_postcode" placeholder="우편번호" style="width: 270px; height: 40px; padding-left: 15px;" disabled />
			        	<input type="button" value="주소검색" onclick="exePost()" style="width: 100px; height: 40px;" />
			        </div>
			        <div style="margin-top: 10px;">
			        	<input type="text" id="address_primary" name="address_primary" style="width: 546px; height: 40px; padding-left: 15px;" placeholder="기본주소" disabled />
			        </div>
			        <div style="margin-top: 10px;">
			        	<input type="text" id="address_detail" name="address_detail" style="width: 546px; height: 40px; padding-left: 15px;" autocomplete="off" placeholder="상세 주소(선택 사항)" />
			        </div>
			        <div style="margin-top: 20px; margin-bottom: 10px; font-size: 12px;">
			        	이메일
			        </div>
			        <div>
			        	<input type="email" id="email" name="email" style="width: 546px; height: 40px; padding-left: 15px;" placeholder="ex) abcd@naver.com" />
			        </div>
				</div>
				<div class="coupon_point">
				    <div style="margin-top: 40px;">
				        <h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">쿠폰/포인트</h4>
				    </div>
				    <div style="margin-top: 20px; margin-bottom: 10px; font-size: 14px;">
				        쿠폰
				    </div>
				    <div>
				        <input type="text" name="couponCode" value="0" style="width:430px; height: 40px; padding-left: 15px;" />
				        <button class="customBtn" style="width: 100px; height: 40px; margin-left: 10px;">쿠폰적용</button>
				    </div>
				    <div style="margin-top: 20px; margin-bottom: 10px; font-size: 14px;">
				        쿠폰 번호
				    </div>
				    <div>
				        <input type="text" name="verificationCode" placeholder="쿠폰 번호 입력" style="width:430px; height: 40px; padding-left: 15px;" />
				        <button class="customBtn" style="width: 100px; height: 40px; margin-left: 10px;">번호확인</button>
				    </div>
				    <div style="margin-top: 20px; margin-bottom: 10px; font-size: 14px;">
				        포인트
				    </div>
				    <div>
				        <input type="text" id="pointUsage" value="0" style="width:430px; height: 40px; padding-left: 15px;" />
				        <button id="allPointUsage" class="customBtn" style="width: 100px; height: 40px; margin-left: 10px;">전액사용</button>
				    </div>
				    <div style="margin-top: 20px;">
				        보유 포인트 : <span id="point">${member.point}</span> 점
				    </div>
				</div>
		    </div>
		    <div class="rightArea" style="flex: 1;">
		        <div class="orderPdInfo">
				    <div>
				        <h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">주문 상품 정보</h4>
				    </div>
				    <div style="display: flex;">
				        <div style="flex: 0.5;">
				            <img src="${cart.pdThumbImg}" style="width: 150px; height: 150px;">
				        </div>
				        <div style="flex: 1.5; margin-top: 30px; margin-left: 20px;">
				            <div id="pdName" style="font-size: 25px;">${cart.pdName}</div>
				            <div style="margin-top: 5px;">
				            	<span>수량</span>
				            	<span id="pdCnt" style="margin-left: 20px;">${cart.cartStock}</span>개
				            </div>
				            <div id="orderPay" style="font-weight: bold; margin-top: 5px;">${cart.totalPrice}원</div>
				        </div>
				    </div>
				</div>
				<div class="finalPayment">
					<div>
				        <h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">최종 결제 금액</h4>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-right: 250px;">
				    	<span style="color: gray;">상품가격</span>
				    	<span id="totalPrice">${cart.totalPrice}원</span>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-top: 5px; margin-right: 250px;">
				    	<span style="color: gray;">쿠폰 할인</span>
				    	<span>0원</span>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-top: 5px; margin-right: 250px;">
				    	<span style="color: gray;">포인트 사용</span>
				    	<span id="payPoint">0원</span>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-top: 5px; margin-right: 250px; border-bottom: 1px solid lightgray; padding-bottom: 20px;">
				    	<span style="color: gray;">배송비</span>
				    	<span>0원</span>
				    </div>
				    <div style="display: flex; justify-content: space-between; margin-top: 15px; margin-right: 250px;">
				    	<span style="font-size: 20px;">총 결제금액</span>
				    	<span id="totalPay" style="color: #dc3545; font-size: 20px; font-weight: bold;">${cart.totalPrice}원</span>
				    </div>
				    <div style="margin-right: 250px; margin-top: 10px;">
				    	<span id="accumulatePoint" style="color: #dc3545; font-size: 20px;"></span> 포인트 적립예정
				    </div>
				</div>
				<div class="paymentMethod">
					<div>
				        <h4 style="font-size: 20px; font-weight: bold; margin-bottom: 20px;">결제 수단</h4>
				    </div>
				    <div class="buttonContainer">
				        <div class="buttonArea" id="creditCard">
						    <img src="/img/card.png" style="margin-bottom: 5px; width: 35px; height: 35px; display: inline-block;">
						    <span style="display: inline-block; margin-left: 10px;">신용카드</span>
						</div>
						<div class="buttonArea" id="kakaoPay">
						    <img src="/img/kakao_pay.png" style="height: 30px; display: inline-block; margin-bottom: 5px;">
						    <span style="display: inline-block; margin-left: 20px; margin-bottom: 5px;">카카오페이</span>
						</div>
				    </div>
				    <div class="buttonContainer">
				    	<div class="buttonArea" id="samsungPay">
						    <img src="/img/Samsung_Pay_icon.svg" style="margin-bottom: 5px; width: 35px; height: 35px; display: inline-block;">
						    <span style="display: inline-block; margin-left: 10px;">삼성페이</span>
						</div>
						<div class="buttonArea" id="tossPay">
						    <img src="/img/toss_pay.png" style=" height: 30px; display: inline-block; margin-bottom: 5px;">
						    <span style="display: inline-block; margin-left: 10px; margin-bottom: 5px;">토스페이</span>
						</div>
				    </div>
				</div>
				<div style="padding-left: 70px;">
					<input type="checkbox" id="agreeCheckbox" style="transform: scale(1.3);">
				    <label for="agreeCheckbox" style="font-size: 17px; margin-left: 5px;">
				        구매조건 확인 및 결제진행에 동의
				    </label>
				</div>
				<div>
					<button type="button" id="primary" class="btn btn-primary">이전</button>
				</div>
				<div>
					<button type="button" id="payment" class="btn btn-danger">결제하기</button>
				</div>
		    </div>
		</div>
	</main>
	
	<footer><%@ include file="../template/footer.jsp"%></footer>
	
	<script>
		$(document).ready(function() {
			// 쉼표 추가
			function addCommasToNumber(number) {
			    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			var orderPayElement = document.getElementById('orderPay');
			var totalPriceElement = document.getElementById('totalPrice');
			var totalPayElement = document.getElementById('totalPay');
			var orderPayValue = parseFloat(${cart.totalPrice}); // totalPrice가 숫자 형식이라고 가정합니다.
			var totalPriceValue = parseFloat(${cart.totalPrice}); // totalPrice가 숫자 형식이라고 가정합니다.
			var totalPayValue = parseFloat(${cart.totalPrice}); // totalPrice가 숫자 형식이라고 가정합니다.
			var formattedOrderPay = addCommasToNumber(orderPayValue);
			var formattedTotalPrice = addCommasToNumber(totalPriceValue);
			var formattedTotalPay = addCommasToNumber(totalPayValue);
			$('#point').text(addCommasToNumber($('#point').text()));
			
			
			// 포맷된 값을 id="totalPrice"의 텍스트로 설정합니다.
			orderPayElement.textContent = formattedOrderPay + '원';
			totalPriceElement.textContent = formattedTotalPrice + '원';
			totalPayElement.textContent = formattedTotalPay + '원';
			
			// 적립예정 포인트
		    function accumlatePoint() {
		    	var totalPay = parseInt($('#totalPay').text().replace(/[^0-9]/g, ''));
			    var accumulatePoint = Math.floor(totalPay * 0.05);
			    $('#accumulatePoint').text(addCommasToNumber(accumulatePoint));
		    }
			
		 	// 초기 적립예정 포인트
		    accumlatePoint();
		 	
		 	// 사용 포인트 값
		    $('#pointUsage').on('keyup', function() {
			    var inputVal = parseInt($(this).val());
			    var memberPoint = parseInt('${member.point}');
			    
			    if (inputVal > ${cart.totalPrice}) {
			    	alert('상품 가격까지만 포인트 사용이 가능합니다');
			    	$(this).val(0);
			    	$('#payPoint').text(0 + '원');
			    	$('#totalPay').text(addCommasToNumber(${cart.totalPrice}) + '원');
			    	accumlatePoint();
			    	return;
			    }
			    
			    if (inputVal > memberPoint) {
			        alert('보유 포인트를 초과하였습니다');
			        $(this).val(0);
			        $('#payPoint').text(0 + '원'); // 보유 포인트 초과 시 0원으로 표시
			        $('#totalPay').text(addCommasToNumber(${cart.totalPrice}) + '원');
			        accumlatePoint();
			    } else if (inputVal <= memberPoint && inputVal > 0) {
			    	$('#payPoint').text('-' + addCommasToNumber(inputVal) + '원');
			    	$('#totalPay').text(addCommasToNumber(${cart.totalPrice} - inputVal) + '원');
			    	accumlatePoint();
			    } else {
			    	$('#payPoint').text(0 + '원');
			    	$('#totalPay').text(addCommasToNumber(${cart.totalPrice}) + '원');
			    	accumlatePoint();
			    } 
			});
		 	
		 	// 전액사용 버튼 클릭
		    $('#allPointUsage').on('click', function() {
		    	var allPoint = ${member.point};
		    	if (allPoint > ${cart.totalPrice}) {
		    		alert('상품 가격까지만 포인트 사용이 가능합니다');
		    		return;
		    	}
		    	$('#pointUsage').val(allPoint);
		    	$('#payPoint').text('-' + addCommasToNumber(allPoint) + '원');
		    	$('#totalPay').text(addCommasToNumber(${cart.totalPrice} - allPoint) + '원');
		    	
		    	accumlatePoint();
		    });
		 
		 	// 주문자 정보와 일치
			$('#sameAsBilling').change(function() {
				if (this.checked) {
					var name  = $('#order_name').val();
					var tel   = $('#order_tel').val();
					var email = $('#order_email').val();
					
					$.ajax({
						url: '/member/find-by-orderinfo',
						type: 'POST',
						data: {
							name: name,
							tel: tel,
							email: email
						},
						success: function(data) {
							if (data !== 'error') {
								$('#name').val(data.name);
								$('#tel').val(data.tel);
								$('#email').val(data.email);
								$('#address_postcode').val(data.address_postcode);
								$('#address_primary').val(data.address_primary);
								$('#address_detail').val(data.address_detail);
							} else {
								alert('기입하신 주문자 정보가 일치하지 않습니다');
							}
						},
						error: function() {
							alert('에러 발생');
						}
					});
				} else {
					$('#name').val('');
					$('#tel').val('');
					$('#email').val('');
					$('#address_postcode').val('');
					$('#address_primary').val('');
					$('#address_detail').val('');
				}
			});

			// 버튼 클릭 시 동작
			$('.buttonArea').click(function() {
			    const isSelected = $(this).data('selected');

			    if (isSelected) {
			        $(this).css('border', '1px solid lightgray');
			    } else {
			        $('.buttonArea').not(this).css('border', '1px solid lightgray');
			        $(this).css('border', '2px solid #dc3545');
			        $('.buttonArea').data('selected', false);
			        $(this).data('selected', true);
			    }
			});
			
			// 이전
			$('#primary').click(function() {
				history.back();
			});
			
			// 결제하기
			$('#payment').click(function() {
				var creditCardSelected = $('#creditCard').data('selected');
				var kakaoPaySelected   = $('#kakaoPay').data('selected');
				var tossPaySelected    = $('#tossPay').data('selected');
				var samsungPaySelected = $('#samsungPay').data('selected');
				
				if (creditCardSelected) {
					iamport_inicis();
				} else if (kakaoPaySelected) {
					iamport_kakaopay();
				} else if (tossPaySelected) {
					iamport_tossPay();
				} else if (samsungPaySelected) {
					iamport_samsungPay();
				} else {
					alert('결제 수단을 선택해주세요');
				}
			});
		});
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
		
		// kg이니시스
		function iamport_inicis(){
			var totalPay = parseInt($('#totalPay').text().replace(/[^0-9]/g, ''));
			//가맹점 식별코드
			IMP.init('imp52104544');
			IMP.request_pay({
			    pg : 'html5_inicis',
			    pay_method : 'card',
			    merchant_uid : '${merchant_uid}_' + new Date().getTime(),
			    name : '${cart.pdName}' , //결제창에서 보여질 이름
			    amount : totalPay, //실제 결제되는 가격
			    buyer_email : '${member.email}',
			    buyer_name : '${member.name}',
			    buyer_tel : '${member.tel}',
			    buyer_addr : '${member.address_primary}' + ' ' + '${member.address_detail}',
			    buyer_postcode : '${member.address_postcode}'
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var memberid = '${member.memberid}';
			    	var name = $('#name').val();
			    	var tel = $('#tel').val();
			    	var address_postcode = $('#address_postcode').val();
			    	var address_primary = $('#address_primary').val();
			    	var address_detail = $('#address_detail').val();
			    	var address = address_primary + ' ' + address_detail;
			    	var email = $('#email').val();
			    	var totalPrice = totalPay;
			    	var cartNum = ${cart.cartNum};
			    	// 포인트
			    	var accumulatePoint = parseInt($('#accumulatePoint').text().replace(/[^0-9]/g, ''));
			    	var pointUsage = $('#pointUsage').val();
			    	
			    	/*
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        */
			        $.ajax({
			        	url : '/shop/pay',
			        	type : 'POST',
			        	data : {
			        		memberid : memberid,
			        		name : name,
			        		tel : tel,
			        		address : address,
			        		address_postcode : address_postcode,
			        		address_primary : address_primary,
			        		address_detail : address_detail,
			        		email : email,
			        		totalPrice : totalPrice,
			        		cartNum : cartNum,
			        		accumulatePoint : accumulatePoint,
			        		pointUsage : pointUsage
			        	},
			        	success : function(orderid) {
			        		location.href = '/shop/order/success?orderid=' + orderid;
			        	},
			        	error : function() {
			        		alert('에러발생');
			        	}
			        	
			        })
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			         alert(msg);
			    }
			});
		};
		
		// 카카오페이
		function iamport_kakaopay(){
			var totalPay = parseInt($('#totalPay').text().replace(/[^0-9]/g, ''));
			//가맹점 식별코드
			IMP.init('imp52104544');
			IMP.request_pay({
			    pg : 'kakaopay',
			    pay_method : 'card',
			    merchant_uid : '${merchant_uid}_' + new Date().getTime(),
			    name : '${cart.pdName}' , //결제창에서 보여질 이름
			    amount : totalPay, //실제 결제되는 가격
			    buyer_email : '${member.email}',
			    buyer_name : '${member.name}',
			    buyer_tel : '${member.tel}',
			    buyer_addr : '${member.address_primary}' + ' ' + '${member.address_detail}',
			    buyer_postcode : '${member.address_postcode}'
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var memberid = '${member.memberid}';
			    	var name = $('#name').val();
			    	var tel = $('#tel').val();
			    	var address_postcode = $('#address_postcode').val();
			    	var address_primary = $('#address_primary').val();
			    	var address_detail = $('#address_detail').val();
			    	var address = address_primary + ' ' + address_detail;
			    	var email = $('#email').val();
			    	var totalPrice = totalPay;
			    	var cartNum = ${cart.cartNum};
			    	// 포인트
			    	var accumulatePoint = parseInt($('#accumulatePoint').text().replace(/[^0-9]/g, ''));
			    	var pointUsage = $('#pointUsage').val();
			    	
			    	/*
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        */
			        $.ajax({
			        	url : '/shop/pay',
			        	type : 'POST',
			        	data : {
			        		memberid : memberid,
			        		name : name,
			        		tel : tel,
			        		address : address,
			        		address_postcode : address_postcode,
			        		address_primary : address_primary,
			        		address_detail : address_detail,
			        		email : email,
			        		totalPrice : totalPrice,
			        		cartNum : cartNum,
			        		accumulatePoint : accumulatePoint,
			        		pointUsage : pointUsage
			        	},
			        	success : function(orderid) {
			        		location.href = '/shop/order/success?orderid=' + orderid;
			        	},
			        	error : function() {
			        		alert('에러발생');
			        	}
			        	
			        })
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			         alert(msg);
			    }
			});
		};
		
		// 토스페이
		function iamport_tossPay(){
			var totalPay = parseInt($('#totalPay').text().replace(/[^0-9]/g, ''));
			//가맹점 식별코드
			IMP.init('imp52104544');
			IMP.request_pay({
			    pg : 'tosspay',
			    pay_method : 'card',
			    merchant_uid : '${merchant_uid}_' + new Date().getTime(),
			    name : '${cart.pdName}' , //결제창에서 보여질 이름
			    amount : totalPay, //실제 결제되는 가격
			    buyer_email : '${member.email}',
			    buyer_name : '${member.name}',
			    buyer_tel : '${member.tel}',
			    buyer_addr : '${member.address_primary}' + ' ' + '${member.address_detail}',
			    buyer_postcode : '${member.address_postcode}'
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var memberid = '${member.memberid}';
			    	var name = $('#name').val();
			    	var tel = $('#tel').val();
			    	var address_postcode = $('#address_postcode').val();
			    	var address_primary = $('#address_primary').val();
			    	var address_detail = $('#address_detail').val();
			    	var address = address_primary + ' ' + address_detail;
			    	var email = $('#email').val();
			    	var totalPrice = totalPay;
			    	var cartNum = ${cart.cartNum};
			    	// 포인트
			    	var accumulatePoint = parseInt($('#accumulatePoint').text().replace(/[^0-9]/g, ''));
			    	var pointUsage = $('#pointUsage').val();
			    	
			    	/*
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        */
			        $.ajax({
			        	url : '/shop/pay',
			        	type : 'POST',
			        	data : {
			        		memberid : memberid,
			        		name : name,
			        		tel : tel,
			        		address : address,
			        		address_postcode : address_postcode,
			        		address_primary : address_primary,
			        		address_detail : address_detail,
			        		email : email,
			        		totalPrice : totalPrice,
			        		cartNum : cartNum,
			        		accumulatePoint : accumulatePoint,
			        		pointUsage : pointUsage
			        	},
			        	success : function(orderid) {
			        		location.href = '/shop/order/success?orderid=' + orderid;
			        	},
			        	error : function() {
			        		alert('에러발생');
			        	}
			        })
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			         alert(msg);
			    }
			});
		};
		
		// 삼성페이
		function iamport_samsungPay(){
			var totalPay = parseInt($('#totalPay').text().replace(/[^0-9]/g, ''));
			//가맹점 식별코드
			IMP.init('imp52104544');
			IMP.request_pay({
				pg: 'kcp',
			    pay_method : 'samsung',
			    merchant_uid : '${merchant_uid}_' + new Date().getTime(),
			    name : '${cart.pdName}' , //결제창에서 보여질 이름
			    amount : totalPay, //실제 결제되는 가격
			    buyer_email : '${member.email}',
			    buyer_name : '${member.name}',
			    buyer_tel : '${member.tel}',
			    buyer_addr : '${member.address_primary}' + ' ' + '${member.address_detail}',
			    buyer_postcode : '${member.address_postcode}'
			}, function(rsp) {
				console.log(rsp);
			    if ( rsp.success ) {
			    	var memberid = '${member.memberid}';
			    	var name = $('#name').val();
			    	var tel = $('#tel').val();
			    	var address_postcode = $('#address_postcode').val();
			    	var address_primary = $('#address_primary').val();
			    	var address_detail = $('#address_detail').val();
			    	var address = address_primary + ' ' + address_detail;
			    	var email = $('#email').val();
			    	var totalPrice = totalPay;
			    	var cartNum = ${cart.cartNum};
			    	// 포인트
			    	var accumulatePoint = parseInt($('#accumulatePoint').text().replace(/[^0-9]/g, ''));
			    	var pointUsage = $('#pointUsage').val();
			    	
			    	/*
			    	var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        */
			        $.ajax({
			        	url : '/shop/pay',
			        	type : 'POST',
			        	data : {
			        		memberid : memberid,
			        		name : name,
			        		tel : tel,
			        		address : address,
			        		address_postcode : address_postcode,
			        		address_primary : address_primary,
			        		address_detail : address_detail,
			        		email : email,
			        		totalPrice : totalPrice,
			        		cartNum : cartNum,
			        		accumulatePoint : accumulatePoint,
			        		pointUsage : pointUsage
			        	},
			        	success : function(orderid) {
			        		location.href = '/shop/order/success?orderid=' + orderid;
			        	},
			        	error : function() {
			        		alert('에러발생');
			        	}
			        });
			    } else {
			    	 var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			         alert(msg);
			    }
			});
		};
	</script>
</body>
</html>