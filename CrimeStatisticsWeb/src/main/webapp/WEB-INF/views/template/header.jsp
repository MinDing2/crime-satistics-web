<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&family=Nanum+Pen+Script&family=Orbit&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"></script>
  <style>
    /* Change background color of .navbar-dark class */
    .navbar-dark {
      background-color: #003a5e !important; /* Use !important to overwrite existing styles */
    }

    .navbar-nav a.nav-link {
      font-size: 20px;
      font-weight: bold; /* Make text bold */
      color: #fff; /* Set text color to white */
    }

    /* Increase spacing between nav items */
    .navbar-nav {
      margin: 9px; /* Center the navbar items */
      gap: 35px; /* Increase spacing between items */
    }

    .navbar {
      height: 96px; /* Set a fixed height for the navbar */
    }

    .navbar-brand img {
      max-height: 100%; /* Ensure the logo image fits within the navbar height */
    }

    .offcanvas.offcanvas-end {
      left: 0; /* Align the offcanvas to the left */
    }

    .login-link {
      color: #fff;
      text-decoration: none;
      margin-right: 35px; /* Add space to the right of the login link */
    }
    
    .navbar-collapse {
      justify-content: center; /* Center navigation items */
    }

    .navbar-toggler {
      order: 0; /* Change the order to appear in the center */
      margin-right: 45px; /* Add some space to the right of the toggle button */
    }

    .ml-auto {
      order: 2; /* Change the order of the login links to appear slightly off the right */
    }
    img { display: block; margin: 0px auto; }
    .custom-mt {
    margin-top: 6.00rem; /* 7rem 크기의 위쪽 마진을 설정합니다. */
   }
   .custom-a{
    margin-bottom: 1.9rem;
    margin-left: 3rem;
   }
   .custom-b{
    background-color: #003a5e
   }
   
   .custom-close-btn {
    position: absolute;
    right: 15px;
    font-size: 20px;
}
#Info{
font-family: 'IBM Plex Sans KR', sans-serif;
}
#navbarDropdown{
 color: white;
}
.dropdown{
margin-right: 150px;
}
#cate{
display: flex; 
justify-content: center; 
margin-bottom: 30px; 
margin-left: 300px;
font-family: 'Nanum Gothic', sans-serif;
font-size:20px;
font-weight: 500;
}

  </style>
</head>
<body>
<nav class="navbar navbar-dark custom-c" style="background-color: #0f5485;">
  <div class="container-fluid">
    <div style="margin-left: 20px;"> <!-- Align the logo to the left -->
      <a class="navbar-brand" href="/">
        <img src="/img/logo.png" alt="Logo" height="80" width="80"> <!-- Set the height of the logo to match the navbar height -->
      </a>
    </div>
   <div id="cate">
    <div class="dropdown">
	  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    쇼 핑 몰
	  </a>
	  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	   <a class="dropdown-item" href="/shop/list" >전체 호신용품</a>
		<hr class="dropdown-divider">
		<a class="dropdown-item" href="/shop/list/100" >스프레이건</a>
		<hr class="dropdown-divider">
		<a class="dropdown-item" href="/shop/list/200" >스프레이</a>
		<hr class="dropdown-divider">
		<a class="dropdown-item" href="/shop/list/300" >전기충격기</a>
		<hr class="dropdown-divider">
		<a class="dropdown-item" href="/shop/list/400" >삼단봉</a>
	  </div>
	</div>   
	<div style="margin-right: 150px;">
	<a href="/board/listsearch?menu_id=1" style="text-decoration: none; color:white;">자유 게시판</a>
	</div>
    <div class="dropdown">
	  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    지역 커뮤니티
	  </a>
	  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	    <a  class="dropdown-item" href="/board/listsearch?menu_id=2">서울</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=3">부산</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=4">대구</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=5">인천</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=6">광주</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=7">대전</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=8">울산</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=9">경기</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=10">강원</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=11">충북</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=12">충남</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=13">전북</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=14">전남</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=15">경북</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=16">경남</a>
            <hr class="dropdown-divider">
            <a  class="dropdown-item" href="/board/listsearch?menu_id=17">제주</a>
            <hr class="dropdown-divider"> 
	  </div>
	</div>   
    <div class="dropdown">
	  <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    Q & A
	  </a>
	  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	      <a  class="dropdown-item" href="/question/listPageSearch?num=1">Q&A</a>
          <hr class="dropdown-divider">
          <a  class="dropdown-item" href="/question/writeform">질문 작성</a>
	  </div>
	</div>
	</div>   
    <div id ="Info" class="ml-auto  custom-a"> <!-- Align the login/sign-up links slightly off the right -->
      <c:choose>
      	<c:when test="${not empty sessionScope.naverid}">
      		<style>
        		.navbar-toggler {
        			margin-rignt: 200px;
        		}
        	</style>
      		<a class="login-link" href="/member/naver-logout">로그아웃</a>
      		<a class="login-link" href="/shop/cart-list">장바구니</a>
      	</c:when>
      	<c:when test="${not empty sessionScope.googleid}">
      		<style>
        		.navbar-toggler {
        			margin-rignt: 200px;
        		}
        	</style>
      		<a class="login-link" href="/member/google-logout">로그아웃</a>
      		<a class="login-link" href="/shop/cart-list">장바구니</a>
      	</c:when>
        <c:when test="${not empty sessionScope.memberid and empty sessionScope.adminid}">
          <style>
            .navbar-toggler {
              margin-right: 200px; 
            }
          </style>  
          <a class="login-link" href="/member/logout">로그아웃</a>
          <a class="login-link" href="/shop/cart-list">장바구니</a>
          <a class="login-link" href="/member/mypage">마이페이지</a>
        </c:when>
        <c:when test="${not empty sessionScope.adminid and empty sessionScope.memberid}">
        	<style>
        		.navbar-toggler {
        			margin-rignt: 200px;
        		}
        	</style>
        	<a class="login-link" href="/admin/page">관리자 페이지</a>
        	<a class="login-link" href="/admin/logout">로그아웃</a>
        </c:when>
        <c:otherwise>
          <a class="login-link" href="/member/login-page">로그인</a>
          <a class="login-link" href="/member/signup-page">회원가입</a>
        </c:otherwise>
      </c:choose>
    </div>       
    </div>
</nav>

</body>
</html>