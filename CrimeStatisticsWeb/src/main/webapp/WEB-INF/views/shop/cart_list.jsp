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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>장바구니</title>
<style>
main {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    height: auto; /* 이렇게 하면 전체 화면 높이를 차지합니다 */
}

table {
    width: 60%;
    border-collapse: collapse; /* 테이블 셀 경계를 합칩니다. */
    border-spacing: 0; /* 테이블 셀 사이의 간격을 없앱니다. */
    border-top: 2px solid #000; /* 위쪽 테두리를 2px 두께의 검은색으로 설정합니다. */
    border-bottom: 2px solid #000; /* 아래쪽 테두리를 2px 두께의 검은색으로 설정합니다. */
    background-color: white;
}
thead {
	background-color: #cccc;
	height: 60px;
}

tbody td {
	height: 15px;
}

thead th {
    border: 1px solid #ccc; /* 테이블 셀의 테두리를 설정합니다. */
}

/* 부모 td 요소의 스타일 */
td {
    position: relative;
}

.close {display:inline-block;*display:inline;background-color: transparent;
    border: none;cursor: pointer;}
.close:after {display: inline-block;content: "\00d7"; font-size:20pt;}
.close:hover {
    color: olive; 
}

#select_delete {
	border: 0.5px solid gray;
	padding: 7px 10px;
	background-color: white;
}

#select_delete:active {
    background-color: lightgray;
    color: black;
}

#show_detail {
	background-color: black;
	padding: 7px 10px;
	color: white;
}

#show_detail:active {
    background-color: darkgray;
    color: white;
}

.btn-primary {
    background-color: transparent !important;
    border-color: gray !important;
    color: gray !important;
    margin-right: 10px;"
}

#primary {
	padding: 10px 30px;
}

.btn-primary:hover {
	background-color: #f0f0f0 !important;
}

#danger {
	margin-left: 10px;
	padding: 10px 30px;
}

</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>

	<main style="margin-top: 40px; margin-bottom: 153px;">
		<div style="width: 60%; margin-bottom: 40px; display: flex; justify-content: space-between; align-items: center;">
		    <h1>장바구니</h1>
		    <div style="display: flex; justify-content: flex-end; align-items: center;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/shopping-cart.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: black;">장바구니</div>
		        </span>
		        <hr style="width: 50px; height: 2px; color: gray; background-color: gray; border: none; margin: 0; margin-bottom: 25px;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/before-credit-card.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: gray;">주문/결제</div>
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
		<table style="text-align: center;">
			<thead>
				<tr>
					<td><input type="checkbox" id="selectAll" style="width: 20px; height: 20px;"></td>
					<td></td>
					<td>제품명</td>
					<td>수량</td>
					<td>제품금액</td>
					<td>배송비</td>
					<td>주문금액</td>
					<td>선택</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cartList}" var="cart">
					<tr>
					<td><input type="hidden" class="cartNum" value="${cart.cartNum}"/></td>
					<td><input type="hidden" class="memberid" value="${cart.memberid}"/></td>
					<td><input type="hidden" class="pdNum" value="${cart.pdNum}"/></td>
					</tr>
					<tr style="border-bottom: 1px solid #ccc;">
						<td style="position: relative;">
							<input type="checkbox" class="itemCheckbox" style="position: absolute; transform: translateX(-50%) translateY(-300%); width: 20px; height: 20px;">
						</td>
						<td class="pdThumbImg"><img src="${cart.pdThumbImg}" width="100" height="100" style="margin-bottom: 10px;"></td>
						<td class="pdName">${cart.pdName}</td>
						<td class="cartStock">${cart.cartStock}</td>
						<td class="pdPrice">${cart.pdPrice}</td>
						<td>무료</td>
						<td class="totalPrice">${cart.totalPrice}</td>
						<td>
							<div style="margin-left: 60px; margin-bottom: 5px;"><button type="button" class="close"></button></div>
							<div style="margin-bottom: 45px;"><button type="button" class="btn btn-danger purchaseOne" style="padding: 5px 30px;">구매</button></div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="display: flex; justify-content: space-between; width: 60%; margin-top: 30px;">
			<button id="select_delete">선택 삭제</button>
			<button id="show_detail">견적서 보기</button>
		</div>
		<hr style="width: 60%; height: 2px; color: gray; background-color: black; border: none; margin-top: 50px; margin-bottom: 25px;">
		<div style="display: flex; justify-content: space-between; width: 60%; margin-top: 30px; text-align: center;">
		    <div>
		    	<div>총 주문 금액</div>
		    	<div><span id="orderPrice" style="font-size: 40px;">0</span>원</div>
		    </div>
		    <div><br><img src="/img/plus.png" alt="plus"></div>
		    <div>
		    	<div>배송비</div>
		    	<div><span id="deliveryFee" style="font-size: 40px;">0</span>원</div>
		    </div>
		    <div><br><img src="/img/equal.png" alt="plus"></div>
		    <div>
		    	<div>결제 예정 금액</div>
		    	<div><span id="paymentPrice" style="font-size: 40px;">0</span>원</div>
		    </div>
		</div>
		<hr style="width: 60%; height: 2px; color: gray; background-color: black; border: none; margin-top: 50px; margin-bottom: 25px;">
		<div>
			<button type="button" id="primary" class="btn btn-primary selctPurchase">선택 제품 주문</button>
			<button type="button" id="danger" class="btn btn-danger allPurchase">전체 제품 주문</button>
		</div>
	</main>
	
	<footer><%@ include file="../template/footer.jsp"%></footer>
	
	<script>
		$(document).ready(function() {
			
			var pay = 0;
			
			// 쉼표 추가
			function addCommasToNumber(number) {
			    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			// 쉼표 추가
			$('tbody tr').each(function() {
			    $(this).find('.pdPrice').text(addCommasToNumber($(this).find('.pdPrice').text()));
			    $(this).find('.totalPrice').text(addCommasToNumber($(this).find('.totalPrice').text()));
			});

			
			// 단일 체크박스가 클릭되었을 때
		    $(".itemCheckbox").click(function() {
		        
		        if ($(".itemCheckbox:checked").length === $(".itemCheckbox").length) {
		            $("#selectAll").prop('checked', true);
		        } else {
		            $("#selectAll").prop('checked', false);
		        }
		        
		        var cartNum = $(this).closest('tr').prev().find('.cartNum').val();
		        var memberid = $(this).closest('tr').prev().find('.memberid').val();
		        
		     	// 체크박스가 선택되었을 때
		        if ($(this).is(":checked")) {
		            $.ajax({
		                url : "/shop/calc",
		                type : "POST",
		                data : {
		                    memberid : memberid,
		                    cartNum : cartNum
		                },
		                success : function(paymentPrice) {
		                    pay += paymentPrice;
		                    $("#orderPrice").text(addCommasToNumber(pay));
		                    $("#paymentPrice").text(addCommasToNumber(pay));
		                },
		                error : function() {
		                    alert('에러 발생');
		                }
		            });
		        } else { // 체크박스가 해제되었을 때
		            $.ajax({
		                url : "/shop/calc",
		                type : "POST",
		                data : {
		                    memberid : memberid,
		                    cartNum : cartNum
		                },
		                success : function(paymentPrice) {
		                    pay -= paymentPrice;
		                    $("#orderPrice").text(addCommasToNumber(pay));
		                    $("#paymentPrice").text(addCommasToNumber(pay));
		                },
		                error : function() {
		                    alert('에러 발생');
		                }
		            });
		        }
		    });
			
		    // 전체 선택 체크박스가 클릭되었을 때
		    $("#selectAll").click(function() {
		    	
		        // 모든 하위 체크박스들의 상태를 전체 선택 체크박스의 상태와 동일하게 만듭니다.
		        $("tbody input[type='checkbox']").prop('checked', this.checked);
		        var memberid = "${sessionScope.memberid}";
		        if ($(this).is(":checked")) {
		        	$.ajax({
		        		url : "/shop/calc/all",
		        		type : "POST",
		        		data : {
		        			memberid : memberid
		        		},
		        		success : function(totalPaymentPrice) {
		        			pay = totalPaymentPrice;
		        			$("#orderPrice").text(addCommasToNumber(pay));
		        			$("#paymentPrice").text(addCommasToNumber(pay));
		        		},
		        		error : function() {
		        			alert('에러가 발생했습니다');
		        		}
		        	});
		        } else {
		        	pay = 0;
		        	$("#orderPrice").text(addCommasToNumber(pay));
		        	$("#paymentPrice").text(addCommasToNumber(pay));
		        }
		    });
		    
		    // 장바구니 삭제
		    $(".close").click(function() {
		    	var cartNum = $(this).closest('tr').prev().find('.cartNum').val();
		        var memberid = $(this).closest('tr').prev().find('.memberid').val();
		    	$.ajax({
		    		url : "/shop/cart-list/delete",
		    		type : "POST",
		    		data : {
		    			memberid : memberid,
		    			cartNum  : cartNum
		    		},
		    		success : function() {
		    			location.href = "/shop/cart-list";
		    		},
		    		error : function() {
		    			alert("에러 발생")
		    		}
		    	});
		    });
		    
		 // 장바구니 선택삭제
		    $("#select_delete").click(function() {
		    	
		    	// 선택된 체크박스 순회
		    	$("tbody input.itemCheckbox:checked").each(function() {
		    		var cartNum = $(this).closest("tr").prev().find('.cartNum').val();
		    		var memberid = $(this).closest("tr").prev().find('.memberid').val();
		    		
		    		$.ajax({
		    			url: "/shop/cart-list/select-delete",
		    			type: "POST",
		    			data: {
		    				memberid: memberid,
		    				cartNum: cartNum
		    			},
		    			success: function() {
		    				location.href = "/shop/cart-list";
		    			},
		    			error: function() {
		    				alert("에러 발생");
		    			}
		    		});
		    	})
		    });
		 
		    // 단일 구매버튼
		    $(".purchaseOne").on("click", function() {
		        // 해당 카트의 정보 가져오기
		        var cartNum = $(this).closest("tr").prev().find(".cartNum").val();
		        var memberid = $(this).closest("tr").prev().find(".memberid").val();
		        
		        // 이동할 URL 생성
		        var redirectURL = '/shop/order?memberid=' + memberid + '&cartNum=' + cartNum;
		        
		        // 페이지 이동
		        window.location.href = redirectURL;
		    });
		    
		    // 선택 제품 주문 버튼
		    $(".selctPurchase").on("click", function() {
		        var selectedItems = $("tbody input.itemCheckbox:checked");

		        if (selectedItems.length === 0) {
		            alert("선택된 제품이 없습니다.");
		            return;
		        }

		        var cartNums = [];
		        var memberids = [];

		        selectedItems.each(function() {
		            var cartNum = $(this).closest("tr").prev().find(".cartNum").val();
		            var memberid = $(this).closest("tr").prev().find(".memberid").val();

		            cartNums.push(cartNum);
		            memberids.push(memberid);
		        });

		        var redirectURL = '/shop/select-order?cartNum=' + cartNums.join('&cartNum=') + '&memberid=' + memberids.join('&memberid=');
		        window.location.href = redirectURL;
		    });
		    
		    // 전체 제품 주문 버튼
		    $(".allPurchase").on("click", function() {
		    	var cartNums = [];
		    	var memberids = [];
		    	
		    	$("tbody .memberid").each(function() {
		    		var memberid = $(this).val();
		    		memberids.push(memberid);
		    	});
		    	
		    	$("tbody .cartNum").each(function() {
		    		var cartNum = $(this).val();
		    		cartNums.push(cartNum);
		    	});
		    	
		    	var redirectURL = '/shop/select-order?cartNum=' + cartNums.join('&cartNum=') + '&memberid=' + memberids.join('&memberid=');
		        window.location.href = redirectURL;
		    })
		});
		
	</script>
</body>
</html>