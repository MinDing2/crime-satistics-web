<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f0f0f0;
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

        .table-container {
            background-color: #fff;
            border-radius: 5px;
            margin-top: 10px;
        }       
        .sort-link {
        text-decoration: none;
        color: #333;
        margin-left: 10px;
        font-weight: bold;
       }

	    /* Style for the sort links on hover */
	    .sort-link:hover {
	        color: #007bff;
	   } 
    </style>
</head>
<body>
    <header>
        <%@ include file="../template/header.jsp"%>        
    </header>

    <div class="container">
        <h2 class="community-title">${name} 커뮤니티</h2>
    </div>
	<div class="container search-container" style="width: 50%; margin-bottom: 30px;">
	    <div class="input-group">
	        <div class="col-3 align-self-start"> <!-- Adjust the width by changing the col-* class -->
	            <select class="form-select" name="searchType">
	                <option value="n">검색 옵션</option>
	                <option value="t">제목</option>
	                <option value="c">내용</option>
	                <option value="w">작성자</option>
	                <option value="tc">제목+내용</option>
	            </select>
	        </div>
	        <input type="text" class="form-control" name="keyword" id="keywordInput" placeholder="검색어를 입력하세요">
	        <button id="searchBtn" class="btn btn-primary" style="width: 80px;">검색</button>
	    </div>
	</div>
    <div class="container table-container">
		<div class="container table-container">
			<!-- 정렬 , 버튼 -->
			<div class="d-flex justify-content-between align-items-center"
				style="width: 100%; margin-top: 10px; margin-bottom: 10px;">
				<div class="form-group" style="width: 20%;">
				    <div class="custom-sort-links">
				        <a class="btn btn-sm btn-outline-dark sort-link" href="/board/listsearch?menu_id=${vo.menu_id}&searchType=${scri.searchType}&keyword=${scri.keyword}&sort=bnum">최신순</a>
						<a class="btn btn-sm btn-outline-dark sort-link" href="/board/listsearch?menu_id=${vo.menu_id}&searchType=${scri.searchType}&keyword=${scri.keyword}&sort=readcount">조회순</a>
						<a class="btn btn-sm btn-outline-dark sort-link" href="/board/listsearch?menu_id=${vo.menu_id}&searchType=${scri.searchType}&keyword=${scri.keyword}&sort=likehit">추천순</a>
				    </div>
				</div>
				<div>
					<form method="GET" name="form" style="display: inline-block;">
						<input type="hidden" name="menu_id" value="${vo.menu_id}">
						<button id="write" class="btn btn-primary">새글쓰기</button>
					</form>
					<a href="/" class="btn btn-primary ml-2">메인</a>
				</div>
			</div>
		</div>

		<!-- 게시물 -->
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">글번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">글쓴이</th>
                    <th scope="col">날짜</th>
                    <th scope="col">조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="board" items="${boardList}">
                    <tr>
                        <td>${board.bnum}</td>
                        <td>
                            <a href="/board/view?bnum=${board.bnum}" style="text-decoration: none;">
                                ${board.title}
                            </a>
                        </td>
                        <td>${board.writer}</td>
                        <td>${board.regdate}</td>
                        <td>${board.readcount}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <%@ include file="../board/include/SearchPaging.jsp"%>
    <!-- 스크립트 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById("write").onclick = function(){
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
</body>
</html>
