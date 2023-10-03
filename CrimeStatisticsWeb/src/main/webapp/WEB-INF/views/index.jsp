<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<title>home</title>
<style>
  .svg-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80vh; /* 원하는 높이로 조정하세요 */
  }
  #menu{font-size:30px; text-align: left;}
  #board{font-size:30px; text-align: left;}
</style>

</head>
<body style="background-color: #cccccc; height: 150vh;">
	<header><%@ include file="template/header.jsp"%></header>

  <h2>범죄 데이터 통계</h2>
  <div class="row">
    <!-- 왼쪽 열: 지도 -->
    <div class="col-md-6">
      <div class="svg-container">
        <object data="/img/southKoreaMap.svg" width="100%" height="100%"></object>
      </div>
    </div>
    
    <!-- 오른쪽 열: 표 -->
    <div class="col-md-6">
      <table class="table table-bordered">
    <thead>
      <tr>
        <th>범죄 유형</th>
        <th>발생 건수</th>
        <th>검거 건수</th>
        <th>검거율</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>강간</td>
        <td><span id="gangOccurrence"></span></td>
        <td><span id="gangArrest"></span></td>
        <td><span id="gangArrestRate"></span></td>
      </tr>
      <tr>
        <td>강도</td>
        <td><span id="robberOccurrence"></span></td>
        <td><span id="robberArrest"></span></td>
        <td><span id="robberArrestRate"></span></td>
      </tr>
      <tr>
        <td>살인</td>
        <td><span id="murderOccurrence"></span></td>
        <td><span id="murderArrest"></span></td>
        <td><span id="murderArrestRate"></span></td>
      </tr>
      <tr>
        <td>절도</td>
        <td><span id="theftOccurrence"></span></td>
        <td><span id="theftArrest"></span></td>
        <td><span id="theftArrestRate"></span></td>
      </tr>
      <tr>
        <td>폭력</td>
        <td><span id="violentOccurrence"></span></td>
        <td><span id="violentArrest"></span></td>
        <td><span id="violentArrestRate"></span></td>
      </tr>
    </tbody>
  </table>
    </div>
  </div>
  <div id="data"></div>
  <button type="button" onclick="loadUlsan()">울산 범죄 데이터 불러오기</button>
  <button type="button" onclick="loadIncheon()">인천 범죄 데이터 불러오기</button>
	 <div id="menu"><a href="/menus/list">메뉴 목록</a></div>
     <div id="menu"><a href="/menus/writeform">메뉴 등록</a></div>
     <a href="/board/listpage">글 목록(페이징)</a>
     <a href="/board/listsearch?menu_id=1">글 목록(페이징&검색)</a>
	<footer><%@ include file="template/footer.jsp"%></footer>
</body>
<script type="text/javascript" src="/js/api.js"></script>
</html>