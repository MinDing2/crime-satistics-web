<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>관리자 상품 상세조회</title>
<style>
ul, lo, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

body {
	background-color: #cccccc;
}

#container {
	text-align: center;
}

/* 추가한 스타일 */
ul.category-list {
	display: flex;
	justify-content: center;
	padding: 10px 0; /* 상하 여백 추가 */
}

ul.category-list li {
	margin: 0 10px;
	background-color: #fff; /* 배경색 추가 */
	position: relative;
}

#container {
	background-color: #fff; /* 흰색 배경색 */
	padding: 20px; /* 내부 여백 추가 */
	border: 5px solid black;
	border-radius: 10px; /* 둥근 테두리 추가 */
	max-width: 1200px; /* 최대 너비 설정 */
	margin: 0 auto; /* 가운데 정렬을 위한 마진 설정 */
}
</style>
</head>
<body style="background-color: #cccccc;">
	<header><%@ include file="../../template/header.jsp"%></header>

	<main>
		<ul class="category-list">
			<li><a href="/shop/list">전체 호신용품</a></li>
			<li><a href="/shop/list/100">스프레이건</a></li>
			<li><a href="/shop/list/200">스프레이</a></li>
			<li><a href="/shop/list/300">전기충격기</a></li>
			<li><a href="/shop/list/400">삼단봉</a></li>
		</ul>
		<div id="container"
			style="display: flex; align-items: center; max-width: 1200px; margin: 0 auto;">
			<div style="flex: 1; text-align: left;">
				<img src="${product.pdThumbImg}"
					style="width: 500px; height: auto;">
			</div>
			<div style="flex: 1; text-align: center; padding: 0 20px;">
				<div style="font-size: 30px; font-weight: bold;">${product.pdName}</div>
				<hr style="margin: 10px 0;"><br>
				<div>
					<span style="float: left; font-size: 20px; margin-left: 100px;">판매가</span>
	                <span style="float: right; margin-right: 100px; font-size: 20px;">${product.pdPrice}</span>
	                <div style="clear: both;"></div>
				</div>
				<br>
				<div>
					<span style="float: left; font-size: 20px; margin-left: 100px;">재고</span>
	                <span style="float: right; margin-right: 100px; font-size: 20px;">${product.pdStock}</span>
	                <div style="clear: both;"></div>
				</div>
				<br>
				<div>
					<span style="float: left; font-size: 20px; margin-left: 100px;">수량</span>
	                <span style="float: right; margin-right: 100px; font-size: 20px;">
	                	<input type="number" id="num" name="num" value="0" min="0" max="${product.pdStock}" />
	                </span>
	                <div style="clear: both;"></div>
				</div>
				<br>
				<hr style="margin: 10px 0;"><br>
				<div>
					<span style="float: left; font-size: 24px; font-weight: bold; margin-left: 200px;">총 결제금액</span>
	                <span style="float: right;  font-size: 24px; font-weight: bold; margin-right: 100px;"><span id="totalPrice" name="totalPrice"></span>원</span>
	                <div style="clear: both;"></div>
				</div>
				<div style="text-align: right; margin-top: 20px;">
				    <span style="float: right; margin-right: 100px;">
				        <button type="button" class="btn btn-danger" id="pdDelete" style="font-size: 24px; padding: 10px 130px;">상품 삭제</button>
				    </span>
				    <div style="clear: both;"></div>
				</div>
			</div>
		</div>

	</main>

	<footer><%@ include file="../../template/footer.jsp"%></footer>

	<script>
		// 총 금액 바뀌는 로직
		function updateTotalPrice() {
			var pdPrice = ${product.pdPrice};
			var num = document.getElementById("num").value;

			var totalPrice = pdPrice * num;

			var totalElement = document.getElementById("totalPrice");
			totalElement.textContent = totalPrice;
		}

		window.onload = updateTotalPrice;
		document.getElementById("num").addEventListener("input", updateTotalPrice);
		
		$("#pdUpdate").click(function() {
			var pdNum = ${product.pdNum};
			location.href="/admin/products/update?n=" + pdNum;
		});
		
		// 상품 삭제 버튼
		$("#pdDelete").click(function() {
    		var confirmed = confirm("삭제하시겠습니까?");
    		if (confirmed) {
    			var pdNum = ${product.pdNum};
		        location.href="/admin/products/delete?n=" + pdNum;
		        alert("삭제되었습니다!")
    		} else {
    			
    		}
		});
	</script>
</body>
</html>
