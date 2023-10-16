<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
    <style>
.{
 font-family: 'IBM Plex Sans KR', sans-serif;
}
h2 {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.container {
	margin-top: 20px;
}

.community-title {
	text-align: center;
	font-size: 28px;
	font-weight: bold;
	margin: 20px 0;
}

.search-container {
	margin: 10px 0;
	padding: 10px;
	background-color: #fff;
	border-radius: 5px;
}

select, input, button {
	margin: 5px 0;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.button-container {
	text-align: right;
	margin: 10px 0;
}
/* 모든 td에 폰트 적용 */
td {
	font-family: 'IBM Plex Sans KR', sans-serif;
}
/* 공지사항 부분의 td에 bold 적용 */
.notice-row td {
	font-weight: bold;
}
/* 공지사항 부분의 배경색 설정 */
.notice-row tr {
	background-color: #f2f2f2; /* 옅은 회색 배경색 */
}
/* 테이블 행을 hover할 때 스타일 변경 */
table.table-hover tbody tr:hover {
	background-color: #e5e5e5; /* hover시 배경색 변경 */
}

.input-group select, .input-group input, .input-group button {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

.sort-link {
	font-family: 'IBM Plex Sans KR', sans-serif;
}

#write {
	font-family: 'IBM Plex Sans KR', sans-serif;
	/* Change to your desired font for the "새글쓰기" button */
}


.table thead th {	
	color: #black; /* Change the text color to white */
	text-align: center;
}
.table thead {
 border-top: 5px solid #0F3A5F;
 border-bottom: 2px solid #0F3A5F;
}
.custom-sort-links a:hover {
 background-color: #0F3A5F;
}
footer{
  margin-top:200px;
  bottom: 0;
  width:100%
}

</style>
</head>
<body>
	<header>
		<%@ include file="../template/header.jsp"%>
	</header>
	<main style="margin:0 auto 50px;  width:900px; height:690px;">
		<!-- 제목 -->
		<div class="container">
			<h2 class="community-title">${name} 커뮤니티</h2>
		</div>

		<!-- 검색 -->
		<div class="container search-container"
			style="width: 60%; margin-bottom: 30px;">
			<div class="input-group">
				<div class="col-3 align-self-start">
					<select class="form-select" name="searchType">
						<option value="n">검색 옵션</option>
						<option value="t">제목</option>
						<option value="c">내용</option>
						<option value="w">작성자</option>
						<option value="tc">제목+내용</option>
					</select>
				</div>
				<input type="text" class="form-control" name="keyword"
					id="keywordInput" placeholder="검색어를 입력하세요">
				<button id="searchBtn" class="btn btn-danger" style="width: 80px;">검색</button>
			</div>
		</div>
		<!-- 정렬 버튼 -->
		<div class="container table-container">
			<div class="container table-container">
				<div class="d-flex justify-content-between align-items-center"
					style="width: 100%; margin-top: 10px; margin-bottom: 10px;">
					<div class="form-group" style="width: 30%;">
						<div class="custom-sort-links">
							<a class="btn btn-sm btn-outline-dark sort-link"
								href="/board/listsearch?menu_id=${vo.menu_id}&searchType=${scri.searchType}&keyword=${scri.keyword}&sort=bnum">최신순</a>
							<a class="btn btn-sm btn-outline-dark sort-link"
								href="/board/listsearch?menu_id=${vo.menu_id}&searchType=${scri.searchType}&keyword=${scri.keyword}&sort=readcount">조회순</a>
							<a class="btn btn-sm btn-outline-dark sort-link"
								href="/board/listsearch?menu_id=${vo.menu_id}&searchType=${scri.searchType}&keyword=${scri.keyword}&sort=likehit">추천순</a>
						</div>
					</div>
					<!-- 버튼 -->
					<div>
						<form method="GET" name="form" style="display: inline-block;">
							<input type="hidden" name="menu_id" value="${vo.menu_id}">
							<button id="write" class="btn btn-danger">새글쓰기</button>
						</form>
						<a href="/" id="main" class="btn btn-danger ml-2">메인</a>
					</div>
				</div>
			</div>
			<!-- 본문테이블 -->
			<table class="table table-hover">			    
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">글번호</th>
						<th scope="col" style="text-align: center;">제목</th>
						<th scope="col" style="text-align: center;">글쓴이</th>
						<th scope="col" style="text-align: center;">등록일</th>
						<th scope="col" style="text-align: center;">조회수</th>
						<th scope="col" style="text-align: center;">추천수</th>
					</tr>
				</thead>				
				<!-- 공지사항 -->
				<tbody>
					<c:forEach var="notice" items="${noticeList}">
						<tr class="notice-row">
							<th scope="row" style="text-align: center;">공지</th>
							<td><a href="/notice/view?nbnum=${notice.nbnum}"
								style="text-decoration: none; color: black;">
									${notice.title}</a></td>
							<td style="text-align: center;">${notice.writer}</td>
							<td style="text-align: center;">${notice.regdate}</td>
							<td style="text-align: center;">${notice.readcount}</td>
							<td style="text-align: center;">0</td>
						</tr>
					</c:forEach>
				</tbody>
				<!-- 게시물 -->
				<tbody>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td style="text-align: center;">${board.bnum}</td>
							<td><a href="/board/view?bnum=${board.bnum}"
								style="text-decoration: none; color:black;"> ${board.title}</a></td>
							<td style="text-align: center;">${board.writer}</td>
							<td style="text-align: center;">${board.regdate}</td>
							<td style="text-align: center;">${board.readcount}</td>
							<td style="text-align: center;">${board.likehit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<%@ include file="../board/include/SearchPaging.jsp"%>
	</main>
	<footer><%@ include file="../template/footer.jsp"%></footer>
</body>
<!-- 스크립트 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
					document.getElementById("write").onclick = function() {
						var memberid = '<%= (String)session.getAttribute("memberid")%>';
            if(memberid == "null"){
                alert("로그인이 필요합니다");
                location.href="#";
            }else{
                form.action="/board/writeform";
                form.submit();
            }
        }

        $(function(){
            $('#searchBtn').click(function() {	     
                self.location = "listsearch"
                + '${pageMaker.makeQuery(1)}'
                + "&searchType="
                + $("select option:selected").val()
                + "&keyword="
                + encodeURIComponent($('#keywordInput').val())
                + "&menu_id="
                + '${vo.menu_id}';
            });
        });
    </script>
</html>
