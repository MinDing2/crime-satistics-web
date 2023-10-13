<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<title>Insert title here</title>
<style>
/* Add your styles for the sidebar here */
.sidebar {
    width: 300px;
    float: left; /* 왼쪽으로 부유시킵니다. */
    color: #0F3A5F;    
}

.sidebar a {
    display: block;
    color: #0F3A5F;
    text-decoration: none;
    margin-bottom: 10px;
}

.sidebar a:hover {
    font-size: 20px;
    font-weight:bold;
}
.sidebar h3 {
    color: #333; /* 섹션 제목의 색상 변경 */
    font-size: 30px; /* 섹션 제목의 글꼴 크기 변경 */
    margin-top: 20px; /* 섹션 제목 간격 추가 */
}
</style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h3>상품</h3>
        <a href="/admin/products/register">상품 등록</a>
        <h3>공지</h3>
        <a href="/notice/writeform">공지글 등록</a>
        <a href="/notice/list">공지글 목록</a>
        <h3>메뉴</h3>
        <a href="/menus/writeform">메뉴 등록</a>
        <a href="/menus/list">메뉴 리스트</a>
    </div>
</body>
</html>