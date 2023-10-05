
<%
String memberid = (String) session.getAttribute("memberid");
String responseJSON = "{\"loggedIn\": " + (memberid != null) + "}";
%>

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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body style="background-color: #cccccc; height: 150vh;">
	<header><%@ include file="template/header.jsp"%></header>

  <h2>범죄 데이터 통계</h2>
  <div class="row">
    <!-- 왼쪽 열: 지도 -->
    <div class="col-md-6">
      <div class="svg-container">
        <object id= "mapSvg "data="/img/southKoreaHigh.svg" width="100%" height="100%"></object>
      </div>
    </div>
    
    <!-- 오른쪽 열: 표 -->
    <div class="col-md-6">
    	<div class = "table-container">
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
        <td><span id="gangOccurrence">100</span></td>
        <td><span id="gangArrest"></span></td>
        <td><span id="gangArrestRate"></span></td>
      </tr>
      <tr>
        <td>강도</td>
        <td><span id="robberOccurrence">100</span></td>
        <td><span id="robberArrest"></span></td>
        <td><span id="robberArrestRate"></span></td>
      </tr>
      <tr>
        <td>살인</td>
        <td><span id="murderOccurrence">100</span></td>
        <td><span id="murderArrest"></span></td>
        <td><span id="murderArrestRate"></span></td>
      </tr>
      <tr>
        <td>절도</td>
        <td><span id="theftOccurrence">100</span></td>
        <td><span id="theftArrest"></span></td>
        <td><span id="theftArrestRate"></span></td>
      </tr>
      <tr>
        <td>폭력</td>
        <td><span id="violentOccurrence">100</span></td>
        <td><span id="violentArrest"></span></td>
        <td><span id="violentArrestRate"></span></td>
      </tr>
  	  </tbody>
  	</table>
  </div>
   		<div class = "chart-container" id="data">
    		<canvas id="crimeDonutChart" width="400" height="400"></canvas>
  		</div>
     </div>
  </div>
  


  <button type="button" onclick="loadUlsan()">울산 범죄 데이터 불러오기</button>
  <button type="button" onclick="loadChungbuk()">범죄 데이터 불러오기</button>
	<footer><%@ include file="template/footer.jsp"%></footer>
	
	 <p><a href="/question/list">질문 리스트</a></p>           
    <button type="button" id="writeform">질문 작성</button>
	
</body>

<script>

var responseData = <%= responseJSON %>; // JSON 데이터를 JavaScript 객체로 파싱

// 버튼 클릭 이벤트 리스너 추가
document.getElementById("writeform").addEventListener("click", function() {
    // 사용자 정보가 null이 아닌 경우
    if (responseData.loggedIn) {
        location.href = '/question/writeform'; // 작성 폼으로 이동
    } else {
        alert('로그인을 먼저 해주세요'); // 로그인 되지 않은 경우 경고 메시지 표시
        location.href = '/member/login-page';
    }
});



var myChart; // 전역 변수로 차트 객체를 선언합니다.

window.onload = function() {
  // 초기 데이터로 차트를 생성합니다.
  createChart();
};

function createChart() {
  // 표의 데이터를 JavaScript 객체로 추출합니다.
  var gangOccurrence = parseInt(document.getElementById('gangOccurrence').textContent);
  var robberOccurrence = parseInt(document.getElementById('robberOccurrence').textContent);
  var murderOccurrence = parseInt(document.getElementById('murderOccurrence').textContent);
  var theftOccurrence = parseInt(document.getElementById('theftOccurrence').textContent);
  var violentOccurrence = parseInt(document.getElementById('violentOccurrence').textContent);

  // 발생 건수 데이터를 가지고 있는 JavaScript 객체를 생성합니다.
  var data = {
    labels: ['강간', '강도', '살인', '절도', '폭력'],
    datasets: [{
      data: [gangOccurrence, robberOccurrence, murderOccurrence, theftOccurrence, violentOccurrence],
      backgroundColor: [  
    	   'rgb(255, 99, 132)',   // Red (강간)
    	    'rgb(54, 162, 235)',   // Blue (절도)
    	    'rgb(255, 205, 86)',   // Yellow (폭력 - Changed to Yellow)
    	    'rgb(75, 192, 192)',   // Teal (살인 - Changed to Teal)
    	    'rgb(255, 159, 64)',   // Orange (강도)   
    	    ],
    }],
  };

  // 기존 차트 객체를 삭제합니다.
  if (myChart) {
    myChart.destroy();
  }

  // 도넛 차트를 생성합니다.
  var ctx = document.getElementById('crimeDonutChart').getContext('2d');
  myChart = new Chart(ctx, {
    type: 'pie',
    data: data,
    options: {
      responsive: true,
      maintainAspectRatio: false,
      // 그 외 차트 옵션을 설정할 수 있습니다.
    },
  });
}
	

</script>
<script type="text/javascript" src="/js/api.js"></script>
</html>
