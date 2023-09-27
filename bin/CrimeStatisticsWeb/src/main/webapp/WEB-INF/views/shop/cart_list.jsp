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
	/* x 버튼 스타일 */
.deleteButton {
    background-color: transparent !important;
    border: none !important;
    outline: none !important;
    cursor: pointer;
}

/* 부모 td 요소의 스타일 */
td {
    position: relative;
}

/* x 버튼 위치 조정 */
.deleteButton {
    position: absolute;
    top: 0;
    right: 0;
    margin: 0;
}
</style>
</head>
<body style="background-color: #cccccc;">
	<header><%@ include file="../template/header.jsp"%></header>

	<main style="text-align: center; margin-top: 20px;">
		<table>
			<thead>
				<tr>
					<td><input type="checkbox" id="selectAll"></td>
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
					<input type="hidden" class="cartNum" value="${cart.cartNum}"/>
					<input type="hidden" class="memberid" value="${cart.memberid}"/>
					<tr>
						<td><input type="checkbox" class="itemCheckbox"></td>
						<td><img src="${cart.pdThumbImg}" width="100" height="100"></td>
						<td>${cart.pdName}</td>
						<td>${cart.cartStock}</td>
						<td>${cart.pdPrice}</td>
						<td>무료</td>
						<td>${cart.totalPrice}</td>
						<td>
							<button type="button" class="btn btn-secondary deleteButton">x</button>
							<button type="button" class="btn btn-danger">구매</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
		    $(".deleteButton").click(function() {
		    	var cartNum = $(this).closest("tbody").find(".cartNum").val();
		        var memberid = $(this).closest("tbody").find(".memberid").val();
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