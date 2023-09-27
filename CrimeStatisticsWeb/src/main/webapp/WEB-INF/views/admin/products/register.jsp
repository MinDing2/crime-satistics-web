<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="imaga/x-icon" href="/img/favicon.ico">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>상품 등록</title>
</head>
<body style="background-color: #cccccc;">
	<header><%@ include file="../../template/header.jsp"%></header>

	<main>
		<form action="/admin/products/register" method="post" autocomplete="off" enctype="multipart/form-data">
			<div class="inputArea">
				<label>카테고리</label>
				<select class="category1" name="cateCode">
					<c:forEach items="${category}" var="category">
						<option value="${category.cateCode}">${category.cateName}</option>
					</c:forEach>
				</select>
			</div>

			<div class="inputArea">
				<label for="pdName">상품명</label> <input type="text" id="pdName"
					name="pdName" />
			</div>

			<div class="inputArea">
				<label for="pdPrice">상품가격</label> <input type="text" id="pdPrice"
					name="pdPrice" />
			</div>

			<div class="inputArea">
				<label for="pdStock">상품수량</label> <input type="text" id="pdStock"
					name="pdStock" />
			</div>

			<div class="inputArea">
				<label for="pdDes">상품소개</label>
				<textarea rows="5" cols="50" id="pdDes" name="pdDes"></textarea>
			</div>

			<div class="inputArea">
				<label for="pdImg">이미지</label> <input type="file" id="pdImg"
					name="file" />
				<div class="select_img">
					<img src="" />
				</div>
				<script>
					$("#pdImg").change(
							function() {
								if (this.files && this.files[0]) {
									var reader = new FileReader();
									reader.onload = function(data) {
										$(".select_img img").attr("src",
												data.target.result).width(300).height(300);
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
				</script>
			</div>

			<div class="inputArea">
				<input type="submit" value="등록" />
			</div>
		</form>
	</main>

	<footer><%@ include file="../../template/footer.jsp"%></footer>


</body>
</html>