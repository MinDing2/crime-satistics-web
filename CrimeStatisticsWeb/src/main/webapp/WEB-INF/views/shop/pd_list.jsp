<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="imaga/x-icon" href="/img/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>전체 호신용품</title>
<style>
ul, lo, li {
	margin: 0;
	padding: 0;
	list-style: none;
}
</style>
</head>
<body style="background-color: #cccccc;">
	<header><%@ include file="../template/header.jsp"%></header>

	<main>
		<ul>
			<li><a href="/shop/list">전체 호신용품</a></li>
			<li><a href="#">스프레이건</a></li>
			<li><a href="#">스프레이</a></li>
			<li><a href="#">전기충격기</a></li>
			<li><a href="#">삼단봉</a></li>
		</ul>

		<div>
			<ul>
				<c:forEach items="${allProductList}" var="pd">
					<li>
						<div class="productsThumb">
							<img src="${pd.pdThumbImg}">
						</div>
						<div class="productsName">
							<a href="/shop/view?n=${pd.pdNum}">${pd.pdName}</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</main>

	<footer><%@ include file="../template/footer.jsp"%></footer>
</body>
</html>