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
<title>Insert title here</title>
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

</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>

	<main style="margin-top: 40px; margin-bottom: 100px;">
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
					</tr>
					<tr style="border-bottom: 1px solid #ccc;">
						<td style="position: relative;">
							<input type="checkbox" class="itemCheckbox" style="position: absolute; transform: translateX(-50%) translateY(-300%); width: 20px; height: 20px;">
						</td>
						<td><img src="${cart.pdThumbImg}" width="100" height="100" style="margin-bottom: 10px;"></td>
						<td>${cart.pdName}</td>
						<td>${cart.cartStock}</td>
						<td>${cart.pdPrice}</td>
						<td>무료</td>
						<td>${cart.totalPrice}</td>
						<td>
							<div style="margin-left: 60px; margin-bottom: 5px;"><button type="button" class="close"></button></div>
							<div style="margin-bottom: 45px;"><button type="button" class="btn btn-danger" style="padding: 5px 30px;">구매</button></div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div style="display: flex; justify-content: space-between; width: 60%; margin-top: 30px;">
			<button id="select_delete">선택 삭제</button>
			<button id="show_detail">견적서 보기</button>
		</div>
		<hr>
		<div style="display: flex; justify-content: space-between; width: 60%; margin-top: 30px; text-align: center;">
		    <div>
		    	<div>총 주문 금액</div>
		    	<div>500000원</div>
		    </div>
		    <div><img src="/img/plus.png" alt="plus"></div>
		    <div>
		    	<div>배송비</div>
		    	<div>0원</div>
		    </div>
		    <div><img src="/img/equal.png" alt="plus"></div>
		    <div>
		    	<div>결제 예정 금액</div>
		    	<div>500000원</div>
		    </div>
		</div>
	</main>
	
	<footer><%@ include file="../template/footer.jsp"%></footer>
	
	<script>
		$(document).ready(function() {
			// 단일 체크박스가 클릭되었을 때
		    $(".itemCheckbox").click(function() {
		        // 전체 선택 체크박스의 상태를 확인하여 필요에 따라 업데이트합니다.
		        if ($(".itemCheckbox:checked").length === $(".itemCheckbox").length) {
		            $("#selectAll").prop('checked', true);
		        } else {
		            $("#selectAll").prop('checked', false);
		        }
		    });
			
		    // 전체 선택 체크박스가 클릭되었을 때
		    $("#selectAll").click(function() {
		        // 모든 하위 체크박스들의 상태를 전체 선택 체크박스의 상태와 동일하게 만듭니다.
		        $("tbody input[type='checkbox']").prop('checked', this.checked);
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
		});
		
	</script>
</body>
</html>