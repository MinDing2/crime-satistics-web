<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/common.css" />

<style>
   .container {
       margin-top: 20px;
   }

   td:first-child { width: 20%; }
   td:last-child  { width: 80%; }
   input[type=text], input[type=number] { width: 100%; }
</style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<title>메뉴 등록</title>
</head>
<body>
  <header>
    <%@ include file="../template/header.jsp"%>
  </header>

  <div class="container">
    <h2 class="community-title">${name} 메뉴 등록</h2>
  </div>

  <main>
    <div class="container">
      <form action="/menus/write" method="POST">
        <div class="table-container">
          <table class="table table-bordered">
            <tbody>
              <tr>
                <td class="font-weight-bold">메뉴 이름</td>
                <td><input type="text" name="menu_name" class="form-control" /></td>
              </tr>
              <tr>
                <td class="font-weight-bold">메뉴 카테고리</td>
                <td><input type="number" name="menu_cate" class="form-control" min="1" max="2" /></td>
              </tr>
              <tr>
                <td colspan="2" class="text-center">
                  <input type="submit" class="btn btn-primary" value="등록" />
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </form>
      <div class="text-center">
        <a href="/menus/list" class="btn btn-secondary">메뉴 목록으로 가기</a>
        <a href="/admin/page" class="btn btn-secondary">관리자 페이지로 가기</a>
      </div>
    </div>
  </main>

  <script>
    document.getElementById("write").onclick = function(){
      var memberid = '<%= (String)session.getAttribute("memberid")%>';
      if(memberid == "null"){
        alert("로그인이 필요합니다");
        location.href="#";
      }
    }
  </script>
</body>
</html>
