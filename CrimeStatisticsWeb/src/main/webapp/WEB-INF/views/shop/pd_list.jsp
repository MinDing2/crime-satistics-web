<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>전체 호신용품</title>
<style>
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.productsSet {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.productsSet li {
	width: 30%;
	margin-bottom: 100px;
}

.productsName {
	text-align: center; /* 상품 이름 가운데 정렬 */
	margin-top: 20px; /* 필요시 이미지와의 간격 조정 */
}

.categoryTabs {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.categoryTabs li {
	flex: 1;
	text-align: center;
}

.categoryTabs a {
	display: block;
	padding: 10px;
	background-color: #f8f9fa;
	text-decoration: none;
	color: #000;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.categoryTabs a:hover {
	background-color: #343a40;
	color: #fff;
}

.categoryTabs li a.active {
	background-color: #343a40;
	color: #fff;
}

.productsSet a {
	text-decoration: none;
	color: black;
	font-size: 23px;
	font-weight: bold;
}

.productsSet li {
  transition: border-color 0.5s ease; /* 변화가 일어나는 시간과 이징 효과 지정 */
}

.productsSet li:hover {
  border: 2px solid #87CEFA; /* 하늘색으로 변경 */
}
</style>
</head>
<body>
	<header><%@ include file="../template/header.jsp"%></header>

	<main style="width: 70%; margin: 0 auto; margin-top: 50px;">
		<ul class="categoryTabs" style="font-size: 20px;">
			<li><a href="/shop/list">전체 호신용품</a></li>
			<li><a href="/shop/list/100">스프레이건</a></li>
			<li><a href="/shop/list/200">스프레이</a></li>
			<li><a href="/shop/list/300">전기충격기</a></li>
			<li><a href="/shop/list/400">삼단봉</a></li>
		</ul>

		<div class="productsSet" style="margin-top: 80px;">
			<c:forEach items="${list}" var="pd">
				<li>
					<div class="productsThumb">
					  <c:choose>
					    <c:when test="${not empty sessionScope.adminid}">
					      <a href="/admin/products/view?n=${pd.pdNum}"><img src="${pd.pdThumbImg}"></a>
					    </c:when>
					    <c:otherwise>
					      <a href="/shop/view?n=${pd.pdNum}"><img src="${pd.pdThumbImg}"></a>
					    </c:otherwise>
					  </c:choose>
					</div>
					
					<div class="productsName">
						<c:choose>
							<c:when test="${not empty sessionScope.adminid}">
								<a href="/admin/products/view?n=${pd.pdNum}">${pd.pdName}</a>
							</c:when>
							<c:otherwise>
								<a href="/shop/view?n=${pd.pdNum}">${pd.pdName}</a>
							</c:otherwise>
						</c:choose>
						<div class="pdPrice" style="font-size: 18px;">${pd.pdPrice}원</div>
					</div>
				</li>
			</c:forEach>
		</div>
	</main>

	<footer><%@ include file="../template/footer.jsp"%></footer>

	<script>
		$(document).ready(function() {
			$('.pdPrice').each(function() {
				var priceText = $(this).text();
				var formattedPrice = addCommasToNumber(priceText);
				$(this).text(formattedPrice);
			});
		});
		
		//쉼표 추가
		function addCommasToNumber(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		//JavaScript로 현재 URL을 가져오는 함수
		function getCurrentURL() {
			return window.location.pathname;
		}

		// 현재 URL에 따라 링크에 active 클래스를 추가하는 함수
		function setActiveLink() {
			var currentURL = getCurrentURL();
			var links = document.querySelectorAll('.categoryTabs li a');

			links.forEach(function(link) {
				if (link.getAttribute('href') === currentURL) {
					link.classList.add('active');
				}
			});
		}

		// 페이지 로드 시 실행
		window.addEventListener('load', setActiveLink);
	</script>
</body>
</html>
