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
.btn-primary {
	margin-bottom: 10px;
    background-color: transparent !important;
    border-color: gray !important;
    color: gray !important;

}

#primary {
	padding: 10px 150px;
}

.btn-primary:hover {
	background-color: #f0f0f0 !important;
}
footer{
	position: fixed;
	bottom: 0;
	width: 100%;
}
</style>
</head>
<body>
	<header><%@ include file="../../template/header.jsp"%></header>

	<main style="margin-top: 100px;">
		
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
				<hr style="margin: 10px 0;"><br>
				<div style="text-align: right; margin-top: 20px;">
				    <span style="float: right; margin-right: 100px;">
				    <button type="button" id="primary" class="btn btn-primary">이전</button>
				        <button type="button" class="btn btn-danger" id="pdDelete" style="font-size: 16px; padding: 10px 131px;">상품 삭제</button>
				        
				    </span>
				    <div style="clear: both;"></div>
				</div>
			</div>
		</div>

	</main>

	<footer><%@ include file="../../template/footer.jsp"%></footer>

	<script>
		$(document).ready(function() {
			
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

			$('#primary').on('click', function() {
				window.history.back();
			})
		})
	</script>
</body>
</html>
