<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메뉴 목록</title>
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<!-- 부트스트랩 CSS 링크 추가 -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 부트스트랩 JavaScript 및 jQuery 추가 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.menu-title {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
}

.button-container {
	text-align: right;
	margin-right: 20px;
	margin-bottom: 10px;
}

.table-container {
	background-color: #fff;
	border-radius: 5px;
}
/* 테이블 셀의 텍스트 정렬을 가운데로 설정합니다. */
.table-container table th, .table-container table td {
	text-align: center;
}
</style>
</head>
<body>
	<main>
		<h2 class="menu-title">메뉴 목록</h2>

		<div class="container">
			<div class="button-container">
				<a href="/menus/writeform" class="btn btn-primary">메뉴 등록</a> <a
					href="/" class="btn btn-primary">Home</a>
			</div>

			<div class="table-container">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th>게시판 번호</th>
							<th>게시판 이름</th>
							<th>카테고리</th>
							<th>삭제</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="menu" items="${menuList}">
							<tr>
								<td>${menu.menu_id}</td>
								<td><a href="/menus/view?menu_id=${menu.menu_id}">${menu.menu_name}</a></td>
								<td><c:choose>
										<c:when test="${menu.menu_cate == 1}">자유</c:when>
										<c:when test="${menu.menu_cate == 2}">지역</c:when>
									</c:choose></td>

								<td><a href="/menus/delete?menu_id=${menu.menu_id}"
									class="btn btn-danger">삭제</a></td>
								<td><a href="/menus/updateform?menu_id=${menu.menu_id}"
									class="btn btn-primary">수정</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</main>
</body>
</html>
