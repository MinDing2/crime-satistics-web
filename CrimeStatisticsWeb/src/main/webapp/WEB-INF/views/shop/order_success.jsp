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
<title>결제 완료</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
main {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
    height: auto;
}


table {
    width: 65%;
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

td {
    position: relative;
}

#text {
	margin-top: 60px;
	margin-bottom: 100px;
}

#text h1 {
	font-family: 'Nanum Gothic', sans-serif;
    color: #dc3545;
    font-weight: bold;
    font-size: 50px;
}

#buttonDiv {
	margin-top: 30px;
	margin-bottom: 134px;
}

#homeBtn {
	background-color: transparent !important;
    border-color: gray !important;
    color: gray !important;
    margin-right: 15px;
}

</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>
	
	<main style="margin-top: 40px;">
		<div id="header" style="width: 65%; margin-bottom: 40px; display: flex; justify-content: space-between; align-items: center;">
		    <h1>주문완료</h1>
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
		                <img src="/img/before-credit-card.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: gray;">주문/결제</div>
		        </span>
		        <hr style="width: 50px; height: 2px; color: gray; background-color: gray; border: none; margin: 0; margin-bottom: 25px;">
		        <span style="text-align: center; display: block;">
		            <div>
		                <img src="/img/check.png" style="width: 50px; height: 50px; display: block; margin: 0 auto;">
		            </div>
		            <div style="color: black;">주문완료</div>
		        </span>
		    </div>
		</div>
		<div id="text">
			<h1>"결제가 완료되었습니다!"</h1>
		</div>
    	<table style="text-align: center;">
			<thead>
				<tr>
					<td>주문번호</td>
					<td></td>
					<td>제품명</td>
					<td>구매수량</td>
					<td>배송비</td>
					<td>주문금액</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderDetail}" var="orderDetail">
					<tr style="border-bottom: 1px solid #ccc;">
						<td class="orderid">${orderDetail.orderid}</td>
						<td class="pdThumbImg"><img src="${orderDetail.pdThumbImg}" width="100" height="100" style="margin-top: 5px; margin-bottom: 5px;"></td>
						<td class="pdName">${orderDetail.pdName}</td>
						<td class="cartStock">${orderDetail.cartStock}</td>
						<td>무료</td>
						<td class="totalPrice">${orderDetail.totalPrice}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="buttonDiv">
			<button type="button" id="homeBtn" class="btn btn-light">홈으로</button>
			<button type="button" id="continueBtn" class="btn btn-danger">쇼핑 계속하기</button>
		</div>
	</main>
	
	<footer><%@ include file="../template/footer.jsp"%></footer>
	
	<script>
		$(document).ready(function() {
			// 쉼표 추가
			function addCommasToNumber(number) {
			    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			
			$('.totalPrice').each(function() {
				var totalPrice = $(this).text();
				var formattedPrice = addCommasToNumber(totalPrice);
				$(this).text(formattedPrice);
			});
			
			$('#homeBtn').click(function() {
				location.href = '/';
			});
			
			$('#continueBtn').click(function() {
				location.href = '/shop/list'
			})
		})
	</script>
</body>
</html>