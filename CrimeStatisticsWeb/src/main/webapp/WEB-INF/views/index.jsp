
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
    .table-container {
            margin-top: 20px;
        }
        table.table {
            width: 100%;
            border-collapse: collapse;
        }
        table.table th, table.table td {
            padding: 10px;
            text-align: center;
        }
        table.table th {
            background-color: #f2f2f2;
        }
        table.table tbody tr:nth-child(odd) {
            background-color: #f9f9f9;
        }
        table.table tbody tr:nth-child(even) {
            background-color: #ffffff;
        }



   .chart-container {
  display: flex;
  justify-content: space-between;
  align-items: stretch; /* stretch로 변경하여 수직으로 높이를 늘립니다. */
}

.chart {
  flex: 1;
  padding: 5px;
  height:400px;
}

  .svg-container {
    display: flex;
    justify-content: flex-start; /* 왼쪽 정렬으로 변경 */
    align-items: center;
    height: 200vh; /* 원하는 높이로 조정하세요 */
  }
  #menu{font-size:30px; text-align: left;}
  #board{font-size:30px; text-align: left;}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body style="background-color: #cccccc; height: 150vh;">
   <header><%@ include file="template/header.jsp"%></header>


  <div class="row">
    <!-- 왼쪽 열: 지도 -->
    <div class="col-md-6"  style="width: 611px; height:900px; margin-left: 12%; margin-bottom: 0%; margin-top:0">
      <div class="svg-container" style="width:700px; height: 900px;  margin-top: 0">
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
        <td><span id="gangArrestRate">100</span></td>
      </tr>
      <tr>
        <td>강도</td>
        <td><span id="robberOccurrence">100</span></td>
        <td><span id="robberArrest"></span></td>
        <td><span id="robberArrestRate">100</span></td>
      </tr>
      <tr>
        <td>살인</td>
        <td><span id="murderOccurrence">100</span></td>
        <td><span id="murderArrest"></span></td>
        <td><span id="murderArrestRate">100</span></td>
      </tr>
      <tr>
        <td>절도</td>
        <td><span id="theftOccurrence">100</span></td>
        <td><span id="theftArrest"></span></td>
        <td><span id="theftArrestRate">100</span></td>
      </tr>
      <tr>
        <td>폭력</td>
        <td><span id="violentOccurrence">100</span></td>
        <td><span id="violentArrest"></span></td>
        <td><span id="violentArrestRate">100</span></td>
      </tr>
       </tbody>
     </table>
  </div>
         <div class="chart-container">
  <div class="chart" id="data">
    <canvas id="crimeDonutChart" ></canvas>
  </div>
  
  <div class="chart" id="data">
    <canvas id="arrChart" ></canvas>
  </div>
</div>
     </div>
  </div>
  <div>
  <a href = "/notice/writeform">공지글 등록</a>
  <a href = "/notice/list">공지글 목록</a>
  </div>  
   <footer><%@ include file="template/footer.jsp"%></footer>
   
</body>

<script>
var myChart; // 전역 변수로 차트 객체를 선언합니다.
var myArrChart;
window.onload = function() {
  // 초기 데이터로 차트를 생성합니다.
   createChart();
   arrChart();
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
    type: 'bar',
    data: data,
    options: {
       scales:{
          y:{
             type:'logarithmic',
          },
       },
    
      responsive: true,
      maintainAspectRatio: false,
      // 그 외 차트 옵션을 설정할 수 있습니다.
    },
  });
}
   
function arrChart(){
   // 검거율 데이터 (5개 데이터)
   var gangArrestRate    = parseFloat(document.getElementById('gangArrestRate').textContent);
   var robberArrestRate  = parseFloat(document.getElementById('robberArrestRate').textContent);
   var murderArrestRate  = parseFloat(document.getElementById('murderArrestRate').textContent);
   var theftArrestRate   = parseFloat(document.getElementById('theftArrestRate').textContent);
   var violentArrestRate = parseFloat(document.getElementById('violentArrestRate').textContent);

   // 검거율을 100%를 기준으로 만들고, 100%를 넘어가면 100%로 고정
   gangArrestRate    = Math.min(gangArrestRate, 100);
   robberArrestRate  = Math.min(robberArrestRate, 100);
   murderArrestRate  = Math.min(murderArrestRate, 100);
   theftArrestRate   = Math.min(theftArrestRate, 100);
   violentArrestRate = Math.min(violentArrestRate, 100);

    // 발생 건수 데이터를 가지고 있는 JavaScript 객체를 생성합니다.
     var data = {
       labels: ['강간', '강도', '살인', '절도', '폭력'],
       datasets: [{
         data: [gangArrestRate, robberArrestRate, murderArrestRate, theftArrestRate, violentArrestRate],
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
     if (myArrChart) {
        myArrChart.destroy();
     }
     
     //라인 차트 생성
     var ctx = document.getElementById('arrChart').getContext('2d');
     myArrChart = new Chart(ctx, {
       type: 'line',
       data: data,
       options: {
          maintainAspectRatio: false,
          scales:{
             y:{      
                min: 0,    // y-축 최소값
                max: 105   // y-축 최대값 
             },
          },
       },
     });
}





</script>

<script type="text/javascript" src="/js/api.js"></script>
</html>