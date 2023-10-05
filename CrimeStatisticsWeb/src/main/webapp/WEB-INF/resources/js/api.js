
	// 지도 클릭시 데이터 들고오기	
	let  objEl = document.querySelector('object');
	
	//울산
	objEl.addEventListener("load", (e) => {
	    let svgDoc = objEl.contentDocument;
	    let ulSan  = svgDoc.querySelector('[title="Ulsan"]');    
	    ulSan.onclick = function() {    		  	
	      loadUlsan();	            	      
	    }
	    
	});
	//대전
	objEl.addEventListener("load", (e) => {
	      let svgDoc = objEl.contentDocument;
	      let daeJeon  = svgDoc.querySelector('[title="Daejeon"]');    
	      daeJeon.onclick = function() {    		  	
	       loadDaejeon();	       	    		
	     }  	       
	  });

	//인천
	objEl.addEventListener("load", (e) => {
	        let svgDoc = objEl.contentDocument;
	        let inCheon  = svgDoc.querySelector('[title="Incheon"]');    
	        inCheon.onclick = function() {    		  	
	        loadIncheon();
	        }  	       
	    });
    
	//강원    
	  objEl.addEventListener("load", (e) => {
	  let svgDoc = objEl.contentDocument;
	  let gangWon  = svgDoc.querySelector('[title="Gangwon"]');    
	  gangWon.onclick = function() {    		  	
	    loadGangwon() ;
	  }
	  
	    });
    
	//서울    
	  objEl.addEventListener("load", (e) => {
	  let svgDoc = objEl.contentDocument;
	  let seoUl  = svgDoc.querySelector('[title="Seoul"]');    
	  seoUl.onclick = function() {    		  	
	    loadSeoul();
	          
	  }
	  
	    });
	//경기    
	  objEl.addEventListener("load", (e) => {
	  let svgDoc = objEl.contentDocument;
	  let gyeongGi  = svgDoc.querySelector('[title="Gyeonggi"]');    
	  gyeongGi.onclick = function() {    		  	
	    loadGyeonggi();
	  }
	  
	    });
	    
	//세종    
	  objEl.addEventListener("load", (e) => {
	  let svgDoc = objEl.contentDocument;
	  let seJong  = svgDoc.querySelector('[title="Sejong"]');    
	  seJong.onclick = function() {    		  	
	    loadSejong();
	  }
	  
	    });
    
	//충남    
	  objEl.addEventListener("load", (e) => {
	  let svgDoc = objEl.contentDocument;
	  let chungNam  = svgDoc.querySelector('[title="South Chungcheong"]');    
	  chungNam.onclick = function() {    		  	
	    loadChungnam();
	  }
	  
	    });
	    
	//충북
	  objEl.addEventListener("load", (e) => {
	  let svgDoc = objEl.contentDocument;
	  let chungbuk  = svgDoc.querySelector('[title="North Chungcheong"]');    
	  chungbuk.onclick = function() {    		  	
	    loadChungbuk();
	  }
	  
	    });
	//경남 클릭
	  objEl.addEventListener("load", (e) => {
	          let svgDoc = objEl.contentDocument;
	          let SG  = svgDoc.querySelector('[title="South Gyeongsang"]');    
	          SG.onclick = function() {               
	           loadSG();
	          }            
	     });
	     
	//경북 클릭 
	  objEl.addEventListener("load", (e) => {
	          let svgDoc = objEl.contentDocument;
	          let SG  = svgDoc.querySelector('[title="North Gyeongsang"]');    
	          SG.onclick = function() {               
	           loadNG();
	          }            
	     });    
	     
	 //전남 클릭 
	   objEl.addEventListener("load", (e) => {
	          let svgDoc = objEl.contentDocument;
	          let SJ  = svgDoc.querySelector('[title="South Jeonla"]');    
	          SJ.onclick = function() {               
	            loadSJ();
	          }            
	     });    
	     
	 //전북 클릭
	       objEl.addEventListener("load", (e) => {
	          let svgDoc = objEl.contentDocument;
	          let NJ  = svgDoc.querySelector('[title="North Jeonla"]');    
	          NJ.onclick = function() {               
	            loadNJ();
	          }            
	     });    
	    
	//제주 클릭
	      objEl.addEventListener("load", (e) => {
	          let svgDoc = objEl.contentDocument;
	          let Jeju  = svgDoc.querySelector('[title="Jeju"]');    
	          Jeju.onclick = function() {               
	            loadJeju();
	          }            
	     });    
	     
	//광주 클릭
	       objEl.addEventListener("load", (e) => {
	          let svgDoc = objEl.contentDocument;
	          let Gj  = svgDoc.querySelector('[title="Gwangju"]');    
	          Gj.onclick = function() {               
	            loadGj();
	          }            
	     });          
	     
	//부산 클릭
	       objEl.addEventListener("load", (e) => {
	          let svgDoc = objEl.contentDocument;
	          let BuSan  = svgDoc.querySelector('[title="Busan"]');    
	          BuSan.onclick = function() {               
	           loadBusan()
	          }            
	     });       
	     
	//대구 클릭
	       objEl.addEventListener("load", (e) => {
	          let svgDoc = objEl.contentDocument;
	          let Daegu  = svgDoc.querySelector('[title="Daegu"]');    
	          Daegu.onclick = function() {               
	           loadDaegu()
	          }            
	     });    

//--- API 부분 ---   
    
    
   // 울산  
    function loadUlsan() {    
    const url =
        "https://api.odcloud.kr/api/15007067/v1/uddi:0442405a-fbfb-4920-b0e6-89aadeb7ea03?page=1&perPage=64&returnType=JSON&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"

    fetch(url)
        .then((res) => res.json())
        .then((json) => {
            // JSON 데이터를 변수에 저장
            const jsonData = json.data;

            // 연도가 2021인 데이터 필터링
            const filteredData = jsonData.filter(item => item.연도 === 2021);

            // 데이터별 추출하여 배열에 저장
            const gangData = filteredData.map(item => item.강간);
            const robberData = filteredData.map(item => item.강도);
            const murderData = filteredData.map(item => item.살인);
            const theftData = filteredData.map(item => item.절도);
            const violentData = filteredData.map(item => item.폭력);

            // 결과를 콘솔에 출력
            console.log(filteredData);

            // 필터링 결과를 문자열로 변환하여 HTML에 표시
            // const filteredDataString = JSON.stringify(filteredData, null, 1);
            // document.getElementById("data").innerText = filteredDataString;

            // 각 데이터를 해당하는 <span> 요소에 넣어주기
            // 강간
            document.getElementById("gangOccurrence").innerText = gangData[0];
            document.getElementById("gangArrest").innerText = gangData[1];
            document.getElementById("gangArrestRate").innerText = (gangData[1] / gangData[0] * 100).toFixed(2) + "%";

            // 강도
            document.getElementById("robberOccurrence").innerText = robberData[0];
            document.getElementById("robberArrest").innerText = robberData[1];
            document.getElementById("robberArrestRate").innerText = (robberData[1] / robberData[0] * 100).toFixed(2) + "%";

            // 살인
            document.getElementById("murderOccurrence").innerText = murderData[0];
            document.getElementById("murderArrest").innerText = murderData[1];
            document.getElementById("murderArrestRate").innerText = (murderData[1] / murderData[0] * 100).toFixed(2) + "%";

            // 절도
            document.getElementById("theftOccurrence").innerText = theftData[0];
            document.getElementById("theftArrest").innerText = theftData[1];
            document.getElementById("theftArrestRate").innerText = (theftData[1] / theftData[0] * 100).toFixed(2) + "%";

            // 폭력
            document.getElementById("violentOccurrence").innerText = violentData[0];
            document.getElementById("violentArrest").innerText = violentData[1];
            document.getElementById("violentArrestRate").innerText = (violentData[1] / violentData[0] * 100).toFixed(2) + "%";

            createChart();	
            arrChart();
        });
}

    

    
    // 대전
          function loadDaejeon() {
      const url =
        "https://api.odcloud.kr/api/15073507/v1/uddi:b2344882-92be-4364-bf79-cc9c59d9bf23?page=1&perPage=64&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"

        fetch(url)
          .then((res) => res.json())
          .then((json) => {
            // JSON 데이터를 변수에 저장
            const jsonData = json.data;
            // 연도가 2021인 데이터 필터링
            const filteredData = jsonData.filter(item => item.연도별 === "2021년");
            const arrData = filteredData.filter(item => item.구분 === "검거건수");
            const occData = filteredData.filter(item => item.구분 === "발생건수");
            
            //강간 발생 건수
            let occGangSum = 0;
            occData.forEach(item => {
              occGangSum += item.강간강제추행;
            });
            //강간 검거 건수
            let arrGangSum = 0;
            arrData.forEach(item => {
              arrGangSum += item.강간강제추행;
            });
            //강도 발생 건수
            let occrobberSum = 0;
            occData.forEach(item => {
              occrobberSum += item.강도;
            });
            //강도 검거 건수
            let arrrobberSum = 0;
            arrData.forEach(item => {
              arrrobberSum += item.강도;
            });    	        
            //살인 발생 건수
            let occMurderSum = 0;
            occData.forEach(item => {
              occMurderSum += item.살인;
            });
            //살인 검거 건수
            let arrMurderSum = 0;
            arrData.forEach(item => {
              arrMurderSum += item.살인;
            });
            //절도 발생 건수
            let occTheftSum = 0;
            occData.forEach(item => {
              occTheftSum += item.절도;
            });
            //절도 검거 건수
            let arrTheftSum = 0;
            arrData.forEach(item => {
              arrTheftSum += item.절도;
            });
            //폭력 발생 건수
            let occViolentSum = 0;
            occData.forEach(item => {
              occViolentSum += item.폭력;
            });
            //폭력 검거 건수
            let arrViolentSum = 0;
            arrData.forEach(item => {
              arrViolentSum += item.폭력;
            });
            
            // 화면에 데이터 넣기
            
            //강간                
            //발생
            document.getElementById("gangOccurrence").innerText = occGangSum;
            //검거
            document.getElementById("gangArrest").innerText = arrGangSum;
            //검거율
            document.getElementById("gangArrestRate").innerText = (arrGangSum / occGangSum * 100).toFixed(2) + "%";
            
      		//강도
     		//발생
            document.getElementById("robberOccurrence").innerText = occrobberSum;
      		//검거
            document.getElementById("robberArrest").innerText = arrrobberSum;
      		//검거율
            document.getElementById("robberArrestRate").innerText = (arrrobberSum / occrobberSum * 100).toFixed(2) + "%";
            
            //살인 발생
            document.getElementById("murderOccurrence").innerText = occMurderSum;
            //검거
            document.getElementById("murderArrest").innerText = arrMurderSum;    	        
            //검거율
            document.getElementById("murderArrestRate").innerText = (arrMurderSum / occMurderSum * 100).toFixed(2) + "%";

            // 절도 발생
            document.getElementById("theftOccurrence").innerText = occTheftSum;
            // 검거
            document.getElementById("theftArrest").innerText = arrTheftSum;
            // 검거율
            document.getElementById("theftArrestRate").innerText = (arrTheftSum / occTheftSum * 100).toFixed(2) + "%";

            // 폭력 발생
            document.getElementById("violentOccurrence").innerText = occViolentSum;
            // 검거 
            document.getElementById("violentArrest").innerText = arrViolentSum;
            // 검거율
            document.getElementById("violentArrestRate").innerText = (arrViolentSum / occViolentSum * 100).toFixed(2) + "%";
            
            createChart();          
            arrChart();

          });

    }
    //인천
    function loadIncheon() {
      const url =
        "https://api.odcloud.kr/api/15070377/v1/uddi:1f3d3417-50f3-45cd-8bc5-88209aea7afc?page=1&perPage=64&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"

        fetch(url)
          .then((res) => res.json())
          .then((json) => {
            // JSON 데이터를 변수에 저장
            const jsonData = json.data;
            
      // 발생 , 검거 데이터
      //강간.강제추행
            const occgangData = jsonData.filter(item => item.구분 === "강간.강제추행" && item.발생검거 === "발생");
            const arrgangData = jsonData.filter(item => item.구분 === "강간.강제추행" && item.발생검거 === "검거");
            //강도
            const occRobberData = jsonData.filter(item => item.구분 === "강도" && item.발생검거 === "발생");
            const arrRobberData = jsonData.filter(item => item.구분 === "강도" && item.발생검거 === "검거");
            //살인
            const occMurderData = jsonData.filter(item => item.구분 === "살인" && item.발생검거 === "발생");
            const arrMurderData = jsonData.filter(item => item.구분 === "살인" && item.발생검거 === "검거");
            //절도
            const occTheftData = jsonData.filter(item => item.구분 === "절도" && item.발생검거 === "발생");
            const arrTheftData = jsonData.filter(item => item.구분 === "절도" && item.발생검거 === "검거");
            //폭력
            const occViolData = jsonData.filter(item => item.구분 === "폭력" && item.발생검거 === "발생");
            const arrViolData = jsonData.filter(item => item.구분 === "폭력" && item.발생검거 === "검거");
      

            
            //강간 발생 건수
            let occGangSum = 0;
            occgangData.forEach(item => {
              occGangSum+= item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });
            //강간 검거 건수
            let arrGangSum = 0;
            arrgangData.forEach(item => {
              arrGangSum += item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });    	        
            //강도 발생 건수
            let occrobberSum = 0;
            occRobberData.forEach(item => {
              occrobberSum += item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });
            //강도 검거 건수
            let arrrobberSum = 0;
            arrRobberData.forEach(item => {
              arrrobberSum += item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });    	        
            //살인 발생 건수
            let occMurderSum = 0;
            occMurderData.forEach(item => {
              occMurderSum+= item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });
            //살인 검거 건수
            let arrMurderSum = 0;
            arrMurderData.forEach(item => {
              arrMurderSum += item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });    	        
            //절도 발생 건수
            let occTheftSum = 0;
            occTheftData.forEach(item => {
              occTheftSum+= item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });
            //절도 검거 건수
            let arrTheftSum = 0;
            arrTheftData.forEach(item => {
              arrTheftSum += item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });    	        
            //폭력 발생 건수
            let occViolentSum = 0;
            occViolData.forEach(item => {
              occViolentSum+= item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;
            });
            //폭력 검거 건수
            let arrViolentSum = 0;
            arrViolData.forEach(item => {
              arrViolentSum += item.강화서 + item.계양서 + item.남동서 + item.논현서 + item.미추홀서 + item.부평서 + item.삼산서 + item.서부서 + item.연수서 + item.중부서;             
            });    	        
            
      // 화면에 데이터 넣기
            
              //강간                
              //발생
            document.getElementById("gangOccurrence").innerText = occGangSum;
            //검거
            document.getElementById("gangArrest").innerText = arrGangSum;
            //검거율
            document.getElementById("gangArrestRate").innerText = (arrGangSum / occGangSum * 100).toFixed(2) + "%";
            
      //강도
      //발생
            document.getElementById("robberOccurrence").innerText = occrobberSum;
      //검거
            document.getElementById("robberArrest").innerText = arrrobberSum;
      //검거율
            document.getElementById("robberArrestRate").innerText = (arrrobberSum / occrobberSum * 100).toFixed(2) + "%";
            
            //살인 발생
            document.getElementById("murderOccurrence").innerText = occMurderSum;
            //검거
            document.getElementById("murderArrest").innerText = arrMurderSum;    	        
            //검거율
            document.getElementById("murderArrestRate").innerText = (arrMurderSum / occMurderSum * 100).toFixed(2) + "%";

            // 절도 발생
            document.getElementById("theftOccurrence").innerText = occTheftSum;
            // 검거
            document.getElementById("theftArrest").innerText = arrTheftSum;
            // 검거율
            document.getElementById("theftArrestRate").innerText = (arrTheftSum / occTheftSum * 100).toFixed(2) + "%";

            // 폭력 발생
            document.getElementById("violentOccurrence").innerText = occViolentSum;
            // 검거 
            document.getElementById("violentArrest").innerText = arrViolentSum;
            // 검거율
            document.getElementById("violentArrestRate").innerText = (arrViolentSum / occViolentSum * 100).toFixed(2) + "%";
            
            createChart();
            arrChart();
          });

    }

// 강원
  function loadGangwon() {
      const url =
        "https://api.odcloud.kr/api/15070037/v1/uddi:96b3d548-a371-4e6c-a4bc-e7cf713ee5bf?page=1&perPage=64&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"
  
        fetch(url)
          .then((res) => res.json())
          .then((json) => {
            // JSON 데이터를 변수에 저장
            const jsonData = json.data;
  
            // 연도가 2021인 데이터 필터링
            const filteredData = jsonData.filter(item => item.연도 === 2021);
            
  
              
            // 데이터별 추출하여 배열에 저장   
              
            //강간
            const occgangData = filteredData.map(item => item["강간 발생"]);
            const arrgangData = filteredData.map(item => item["강간 검거"]);
            //강도
            const occrobberData = filteredData.map(item => item["강도 발생"]);
            const arrrobberData = filteredData.map(item => item["강도 검거"]);
            //살인
            const occmurderData = filteredData.map(item => item["살인 발생"]);
            const arrmurderData = filteredData.map(item => item["살인 검거"]);
            //절도
            const occtheftData = filteredData.map(item => item["절도 발생"]);
            const arrtheftData = filteredData.map(item => item["절도 검거"]);	        
            //폭력
            const occviolentData = filteredData.map(item => item["폭력 발생"]);
            const arrviolentData = filteredData.map(item => item["폭력 검거"]);
  
  
            // 결과를 콘솔에 출력
            //console.log(filteredData);
            // 필터링 결과를 문자열로 변환하여 HTML에 표시
            //const filteredDataString = JSON.stringify(occgangData, null, 1);
              //document.getElementById("data").innerText = filteredDataString;
  
            
            // 각 데이터를 해당하는 <span> 요소에 넣어주기
            //강간
            document.getElementById("gangOccurrence").innerText = occgangData[0];
            document.getElementById("gangArrest").innerText = arrgangData[0];
            document.getElementById("gangArrestRate").innerText = (arrgangData[0] / occgangData[0] * 100).toFixed(2) + "%";
            
        //강도
            document.getElementById("robberOccurrence").innerText = occrobberData[0];
            document.getElementById("robberArrest").innerText = arrrobberData[0];
            document.getElementById("robberArrestRate").innerText = (occrobberData[0] / arrrobberData[0] * 100).toFixed(2) + "%";
            
            // 살인
            document.getElementById("murderOccurrence").innerText = occmurderData[0];
            document.getElementById("murderArrest").innerText = arrmurderData[0];
            document.getElementById("murderArrestRate").innerText = (arrmurderData[0] / occmurderData[0] * 100).toFixed(2) + "%";
  
            // 절도
            document.getElementById("theftOccurrence").innerText = occtheftData[0];
            document.getElementById("theftArrest").innerText = arrtheftData[0];
            document.getElementById("theftArrestRate").innerText = (arrtheftData[0] / occtheftData[0] * 100).toFixed(2) + "%";
  
            // 폭력
            document.getElementById("violentOccurrence").innerText = occviolentData[0];
            document.getElementById("violentArrest").innerText = arrviolentData[0];
            document.getElementById("violentArrestRate").innerText = (arrviolentData[0] / occviolentData[0] * 100).toFixed(2) + "%";
            
            createChart();	
            arrChart();
        });
  }
  
  //서울    
     function loadSeoul() {
    const url =
    "https://api.odcloud.kr/api/15054738/v1/uddi:6dbf4308-5426-4eec-9dc9-b9d435537d8f?page=1&perPage=310&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"

    fetch(url)
      .then((res) => res.json())
      .then((json) => {
        // JSON 데이터를 변수에 저장
        const jsonData = json.data;
        
        // 데이터별 추출하여 배열에 저장     
        //강간
        const occgangData = jsonData.filter(item => item.죄종 === "강간,추행" && item.발생검거 === "발생");
        const arrgangData = jsonData.filter(item => item.죄종 === "강간,추행" && item.발생검거 === "검거");
        //강도
        const occrobberData = jsonData.filter(item => item.죄종 === "강도" && item.발생검거 === "발생");        
        const arrrobberData = jsonData.filter(item => item.죄종 === "강도" && item.발생검거 === "검거");        
        //살인
        const occmurderData = jsonData.filter(item => item.죄종 === "살인" && item.발생검거 === "발생"); 
        const arrmurderData = jsonData.filter(item => item.죄종 === "살인" && item.발생검거 === "검거"); 
        //절도
        const occtheftData = jsonData.filter(item => item.죄종 === "절도" && item.발생검거 === "발생"); 
        const arrtheftData = jsonData.filter(item => item.죄종 === "절도" && item.발생검거 === "검거"); 
        //폭력
        const occviolentData = jsonData.filter(item => item.죄종 === "폭력" && item.발생검거 === "발생");
        const arrviolentData = jsonData.filter(item => item.죄종 === "폭력" && item.발생검거 === "검거");
        
        //강간 발생 건수
        let occGangSum = 0;
        occgangData.forEach(item => {
          occGangSum += item.건수;
        });
        //강간 검거 건수
        let arrGangSum = 0;
        arrgangData.forEach(item => {
          arrGangSum += item.건수;
        });
        //강도 발생 건수
        let occrobberSum = 0;
        occrobberData.forEach(item => {
          occrobberSum += item.건수;
        });
        //강도 검거 건수
        let arrrobberSum = 0;
        arrrobberData.forEach(item => {
          arrrobberSum += item.건수;
        });    	        
        //살인 발생 건수
        let occMurderSum = 0;
        occmurderData.forEach(item => {
          occMurderSum += item.건수;
        });
        //살인 검거 건수
        let arrMurderSum = 0;
        arrmurderData.forEach(item => {
          arrMurderSum += item.건수;
        });
        //절도 발생 건수
        let occTheftSum = 0;
        occtheftData.forEach(item => {
          occTheftSum += item.건수;
        });
        //절도 검거 건수
        let arrTheftSum = 0;
        arrtheftData.forEach(item => {
          arrTheftSum += item.건수;
        });
        //폭력 발생 건수
        let occViolentSum = 0;
        occviolentData.forEach(item => {
          occViolentSum += item.건수;
        });
        //폭력 검거 건수
        let arrViolentSum = 0;
        arrviolentData.forEach(item => {
          arrViolentSum += item.건수;
        });
        
     // 화면에 데이터 넣기
        
          //강간                
          //발생
        document.getElementById("gangOccurrence").innerText = occGangSum;
        //검거
        document.getElementById("gangArrest").innerText = arrGangSum;
        //검거율
        document.getElementById("gangArrestRate").innerText = (arrGangSum / occGangSum * 100).toFixed(2) + "%";
        
    //강도
    //발생
        document.getElementById("robberOccurrence").innerText = occrobberSum;
    //검거
        document.getElementById("robberArrest").innerText = arrrobberSum;
    //검거율
        document.getElementById("robberArrestRate").innerText = (arrrobberSum / occrobberSum * 100).toFixed(2) + "%";
        
        //살인 발생
        document.getElementById("murderOccurrence").innerText = occMurderSum;
        //검거
        document.getElementById("murderArrest").innerText = arrMurderSum;    	        
        //검거율
        document.getElementById("murderArrestRate").innerText = (arrMurderSum / occMurderSum * 100).toFixed(2) + "%";

        // 절도 발생
        document.getElementById("theftOccurrence").innerText = occTheftSum;
        // 검거
        document.getElementById("theftArrest").innerText = arrTheftSum;
        // 검거율
        document.getElementById("theftArrestRate").innerText = (arrTheftSum / occTheftSum * 100).toFixed(2) + "%";

        // 폭력 발생
        document.getElementById("violentOccurrence").innerText = occViolentSum;
        // 검거 
        document.getElementById("violentArrest").innerText = arrViolentSum;
        // 검거율
        document.getElementById("violentArrestRate").innerText = (arrViolentSum / occViolentSum * 100).toFixed(2) + "%";
     
       // 필터링 결과를 문자열로 변환하여 HTML에 표시
        //const filteredDataString = JSON.stringify(occGangSum, null, 1);
        //document.getElementById("data").innerText = filteredDataString;
        
         createChart();	
         arrChart();
      });
}
//경기
function loadGyeonggi() {
    const url =
        "https://api.odcloud.kr/api/15086006/v1/uddi:299cd7e8-40a6-4636-85ad-91e9cb774196?page=1&perPage=64&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"

      fetch(url)
        .then((res) => res.json())
        .then((json) => {
          // JSON 데이터를 변수에 저장
          const jsonData = json.data;

          // 연도가 2021인 데이터 필터링
          const filteredData = jsonData.filter(item => item.연도 === 2022);

          // 데이터별 추출
          const gangData = filteredData.find(item => item.범죄유형 === "성범죄");
          const robberData = filteredData.find(item => item.범죄유형 === "강도");
          const murderData = filteredData.find(item => item.범죄유형 === "살인");
          const theftData = filteredData.find(item => item.범죄유형 === "절도");
          const violentData = filteredData.find(item => item.범죄유형 === "폭력");
          
          //성범죄
          const occGangSum = gangData ? gangData.발생건수 : 0;
          const arrGangSum = gangData ? gangData.검거건수 : 0;
          //강도
          const occrobberSum = robberData ? robberData.발생건수 : 0;
          const arrrobberSum = robberData ? robberData.검거건수 : 0;
          //살인
          const occMurderSum = murderData ? murderData.발생건수 : 0;
          const arrMurderSum = murderData ? murderData.검거건수 : 0;
          //절도
          const occTheftSum = theftData ? theftData.발생건수 : 0;
          const arrTheftSum = theftData ? theftData.검거건수 : 0;
          //폭력
          const occViolentSum = violentData ? violentData.발생건수 : 0;
          const arrViolentSum = violentData ? violentData.검거건수 : 0;


          // 필터링 결과를 문자열로 변환하여 HTML에 표시
         //const filteredDataString = JSON.stringify(occGangSum, null, 1);
         //document.getElementById("data").innerText = filteredDataString;

         
       // 화면에 데이터 넣기
          
            //강간                
            //발생
          document.getElementById("gangOccurrence").innerText = occGangSum;
          //검거
          document.getElementById("gangArrest").innerText = arrGangSum;
          //검거율
          document.getElementById("gangArrestRate").innerText = (arrGangSum / occGangSum * 100).toFixed(2) + "%";
          
      //강도
      //발생
          document.getElementById("robberOccurrence").innerText = occrobberSum;
      //검거
          document.getElementById("robberArrest").innerText = arrrobberSum;
      //검거율
          document.getElementById("robberArrestRate").innerText = (arrrobberSum / occrobberSum * 100).toFixed(2) + "%";
          
          //살인 발생
          document.getElementById("murderOccurrence").innerText = occMurderSum;
          //검거
          document.getElementById("murderArrest").innerText = arrMurderSum;    	        
          //검거율
          document.getElementById("murderArrestRate").innerText = (arrMurderSum / occMurderSum * 100).toFixed(2) + "%";

          // 절도 발생
          document.getElementById("theftOccurrence").innerText = occTheftSum;
          // 검거
          document.getElementById("theftArrest").innerText = arrTheftSum;
          // 검거율
          document.getElementById("theftArrestRate").innerText = (arrTheftSum / occTheftSum * 100).toFixed(2) + "%";

          // 폭력 발생
          document.getElementById("violentOccurrence").innerText = occViolentSum;
          // 검거 
          document.getElementById("violentArrest").innerText = arrViolentSum;
          // 검거율
          document.getElementById("violentArrestRate").innerText = (arrViolentSum / occViolentSum * 100).toFixed(2) + "%";
          
          createChart();	
          arrChart();
      });
}

//세종
function loadSejong() {
  const url =
      "https://api.odcloud.kr/api/15107580/v1/uddi:2d9d8771-5c7d-4c4b-bbce-d44726634d10?page=1&perPage=64&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"

    fetch(url)
      .then((res) => res.json())
      .then((json) => {
        // JSON 데이터를 변수에 저장
        const jsonData = json.data;

        // 연도가 2021인 데이터 필터링
        const filteredData = jsonData.filter(item => item.년도별 === 2021);
        // 범죄 발생
        const occData = filteredData.filter(item => item.유형 === "발생");	        
        // 범죄 검거
        const arrData = filteredData.filter(item => item.유형 === "검거");	 

      
      //성범죄
      const occGangSum = occData[0]["강간추행"];
      const arrGangSum = arrData[0]["강간추행"];
      //강도
      const occrobberSum = occData[0]["강도"];
      const arrrobberSum = arrData[0]["강도"];
      //살인
      const occMurderSum = occData[0]["살인"];
      const arrMurderSum = arrData[0]["살인"];
      //절도
      const occTheftSum = occData[0]["절도"];
      const arrTheftSum = arrData[0]["절도"];
      //폭력
      const occViolentSum = occData[0]["폭력"];
      const arrViolentSum = arrData[0]["폭력"];


        // 필터링 결과를 문자열로 변환하여 HTML에 표시
        //const filteredDataString = JSON.stringify(occrobber, null, 1);
        // document.getElementById("data").innerText = filteredDataString;
        //console.log(occGangSum);

       
   // 화면에 데이터 넣기
        
        //강간                
        //발생
        document.getElementById("gangOccurrence").innerText = occGangSum;
        //검거
        document.getElementById("gangArrest").innerText = arrGangSum;
        //검거율
        document.getElementById("gangArrestRate").innerText = (arrGangSum / occGangSum * 100).toFixed(2) + "%";
        
    //강도
    //발생
        document.getElementById("robberOccurrence").innerText = occrobberSum;
    //검거
        document.getElementById("robberArrest").innerText = arrrobberSum;
    //검거율
        document.getElementById("robberArrestRate").innerText = (arrrobberSum / occrobberSum * 100).toFixed(2) + "%";
        
        //살인 발생
        document.getElementById("murderOccurrence").innerText = occMurderSum;
        //검거
        document.getElementById("murderArrest").innerText = arrMurderSum;    	        
        //검거율
        document.getElementById("murderArrestRate").innerText = (arrMurderSum / occMurderSum * 100).toFixed(2) + "%";

        // 절도 발생
        document.getElementById("theftOccurrence").innerText = occTheftSum;
        // 검거
        document.getElementById("theftArrest").innerText = arrTheftSum;
        // 검거율
        document.getElementById("theftArrestRate").innerText = (arrTheftSum / occTheftSum * 100).toFixed(2) + "%";

        // 폭력 발생
        document.getElementById("violentOccurrence").innerText = occViolentSum;
        // 검거 
        document.getElementById("violentArrest").innerText = arrViolentSum;
        // 검거율
        document.getElementById("violentArrestRate").innerText = (arrViolentSum / occViolentSum * 100).toFixed(2) + "%";
        
        createChart();	
     	arrChart();
  });
}
//충남
function loadChungnam() {
  const url =
      "https://api.odcloud.kr/api/15029375/v1/uddi:8f05d30a-4912-4e3d-a799-d3a81c17dcac?page=1&perPage=64&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"

    fetch(url)
      .then((res) => res.json())
      .then((json) => {
        // JSON 데이터를 변수에 저장
        const jsonData = json.data;

        // 연도가 2021인 데이터 필터링
        const filteredData = jsonData.filter(item => item.년도별 === "2022년");
        // 범죄 발생
        const occData = filteredData.filter(item => item.유형 === "발생");	        
        // 범죄 검거
        const arrData = filteredData.filter(item => item.유형 === "검거");	 

      
      //성범죄
      const occGangSum = occData[0]["성범죄"];
      const arrGangSum = arrData[0]["성범죄"];
      //강도
      const occrobberSum = occData[0]["강도"];
      const arrrobberSum = arrData[0]["강도"];
      //살인
      const occMurderSum = occData[0]["살인"];
      const arrMurderSum = arrData[0]["살인"];
      //절도
      const occTheftSum = occData[0]["절도"];
      const arrTheftSum = arrData[0]["절도"];
      //폭력
      const occViolentSum = occData[0]["폭력"];
      const arrViolentSum = arrData[0]["폭력"];


        // 필터링 결과를 문자열로 변환하여 HTML에 표시
        //const filteredDataString = JSON.stringify(occGangSum, null, 1);
        //document.getElementById("data").innerText = filteredDataString;
        //console.log(occGangSum);

   
   // 화면에 데이터 넣기
        
        //강간                
        //발생
        document.getElementById("gangOccurrence").innerText = occGangSum;
        //검거
        document.getElementById("gangArrest").innerText = arrGangSum;
        //검거율
        document.getElementById("gangArrestRate").innerText = (arrGangSum / occGangSum * 100).toFixed(2) + "%";
        
    //강도
    //발생
        document.getElementById("robberOccurrence").innerText = occrobberSum;
    //검거
        document.getElementById("robberArrest").innerText = arrrobberSum;
    //검거율
        document.getElementById("robberArrestRate").innerText = (arrrobberSum / occrobberSum * 100).toFixed(2) + "%";
        
        //살인 발생
        document.getElementById("murderOccurrence").innerText = occMurderSum;
        //검거
        document.getElementById("murderArrest").innerText = arrMurderSum;    	        
        //검거율
        document.getElementById("murderArrestRate").innerText = (arrMurderSum / occMurderSum * 100).toFixed(2) + "%";

        // 절도 발생
        document.getElementById("theftOccurrence").innerText = occTheftSum;
        // 검거
        document.getElementById("theftArrest").innerText = arrTheftSum;
        // 검거율
        document.getElementById("theftArrestRate").innerText = (arrTheftSum / occTheftSum * 100).toFixed(2) + "%";

        // 폭력 발생
        document.getElementById("violentOccurrence").innerText = occViolentSum;
        // 검거 
        document.getElementById("violentArrest").innerText = arrViolentSum;
        // 검거율
        document.getElementById("violentArrestRate").innerText = (arrViolentSum / occViolentSum * 100).toFixed(2) + "%";
        
        createChart();	
        arrChart();
  });
}
// 충북
function loadChungbuk() {
  const url =
      "https://api.odcloud.kr/api/15039488/v1/uddi:0860cbf2-aac4-481f-bb46-954e5f6d6579?page=1&perPage=64&serviceKey=MEl7DCwa%2BWQZbPRWiVN001l3m%2B9GLW%2B%2BW2TB%2BBuKqd29E%2BDMAJQU07WMZsZHVdLkGbMTffeKQ5jr1WI5VevffA%3D%3D"

    fetch(url)
      .then((res) => res.json())
      .then((json) => {
        // JSON 데이터를 변수에 저장
        const jsonData = json.data;

        // 연도가 2022인 데이터 필터링
        const filteredData = jsonData.filter(item => item.연도 === 2022);



      //성범죄
      const occGangSum = filteredData[0]["강간발생"];
      const arrGangSum = filteredData[0]["강간검거"];
      //강도
      const occrobberSum = filteredData[0]["강도발생"];
      const arrrobberSum = filteredData[0]["강도검거"];
      //살인
      const occMurderSum = filteredData[0]["살인발생"];
      const arrMurderSum = filteredData[0]["살인검거"];
      //절도
      const occTheftSum = filteredData[0]["절도발생"];
      const arrTheftSum = filteredData[0]["절도검거"];
      //폭력
      const occViolentSum = filteredData[0]["폭력발생"];
      const arrViolentSum = filteredData[0]["폭력검거"];


        // 필터링 결과를 문자열로 변환하여 HTML에 표시
        //const filteredDataString = JSON.stringify(filteredData, null, 1);
        //document.getElementById("data").innerText = filteredDataString;
        //console.log(occGangSum);

   
   // 화면에 데이터 넣기
        
        //강간                
        //발생
        document.getElementById("gangOccurrence").innerText = occGangSum;
        //검거
        document.getElementById("gangArrest").innerText = arrGangSum;
        //검거율
        document.getElementById("gangArrestRate").innerText = (arrGangSum / occGangSum * 100).toFixed(2) + "%";
        
    //강도
    //발생
        document.getElementById("robberOccurrence").innerText = occrobberSum;
    //검거
        document.getElementById("robberArrest").innerText = arrrobberSum;
    //검거율
        document.getElementById("robberArrestRate").innerText = (arrrobberSum / occrobberSum * 100).toFixed(2) + "%";
        
        //살인 발생
        document.getElementById("murderOccurrence").innerText = occMurderSum;
        //검거
        document.getElementById("murderArrest").innerText = arrMurderSum;    	        
        //검거율
        document.getElementById("murderArrestRate").innerText = (arrMurderSum / occMurderSum * 100).toFixed(2) + "%";

        // 절도 발생
        document.getElementById("theftOccurrence").innerText = occTheftSum;
        // 검거
        document.getElementById("theftArrest").innerText = arrTheftSum;
        // 검거율
        document.getElementById("theftArrestRate").innerText = (arrTheftSum / occTheftSum * 100).toFixed(2) + "%";

        // 폭력 발생
        document.getElementById("violentOccurrence").innerText = occViolentSum;
        // 검거 
        document.getElementById("violentArrest").innerText = arrViolentSum;
        // 검거율
        document.getElementById("violentArrestRate").innerText = (arrViolentSum / occViolentSum * 100).toFixed(2) + "%";
        
        createChart();	
        arrChart();
  });
}
//경남
    function loadSG() {
         const apiUrl = "https://api.odcloud.kr/api/15037364/v1/uddi:5d03dd4c-a549-4ea5-9de1-8fdb2c78cb4b?page=1&perPage=24&serviceKey=tqrjDF%2B9GEzjmzYZ98zwUwo4q47g7ik%2Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%3D%3D";

         fetch(apiUrl)
             .then((response) => response.json())
             .then((json) => {
                 const data = json.data;

                 let totalCrimeOccurrence = 0;
                 let totalCrimeArrest = 0;
                 let totalMurderOccurrence = 0;
                 let totalMurderArrest = 0;
                 let totalRobberyOccurrence = 0;
                 let totalRobberyArrest = 0;
                 let totalRapeOccurrence = 0;
                 let totalRapeArrest = 0;
                 let totalTheftOccurrence = 0;
                 let totalTheftArrest = 0;
                 let totalViolenceOccurrence = 0;
                 let totalViolenceArrest = 0;

                 data.forEach((item) => {
                     const 범죄발생건수 = item["5대범죄발생건수"];
                     const 범죄검거건수 = item["5대범죄검거건수"];
                     const 살인발생건수 = item.살인발생건수;
                     const 살인검거건수 = item.살인검거건수;
                     const 강도발생건수 = item.강도발생건수;
                     const 강도검거건수 = item.강도검거건수;
                     const 강간발생건수 = item.강간발생건수;
                     const 강간검거건수 = item.강간검거건수;
                     const 절도발생건수 = item.절도발생건수;
                     const 절도검거건수 = item.절도검거건수;
                     const 폭력발생건수 = item.폭력발생건수;
                     const 폭력검거건수 = item.폭력검거건수;

                     // 데이터 합계 값 계산
                     totalCrimeOccurrence += 범죄발생건수;
                     totalCrimeArrest += 범죄검거건수;
                     totalMurderOccurrence += 살인발생건수;
                     totalMurderArrest += 살인검거건수;
                     totalRobberyOccurrence += 강도발생건수;
                     totalRobberyArrest += 강도검거건수;
                     totalRapeOccurrence += 강간발생건수;
                     totalRapeArrest += 강간검거건수;
                     totalTheftOccurrence += 절도발생건수;
                     totalTheftArrest += 절도검거건수;
                     totalViolenceOccurrence += 폭력발생건수;
                     totalViolenceArrest += 폭력검거건수;
                 });

                 // 검거율 계산
                 const crimeArrestRate = (totalCrimeArrest / totalCrimeOccurrence) * 100;

                 // 결과를 HTML 표에 업데이트
                 document.getElementById("gangOccurrence").innerText = totalRapeOccurrence;
                 document.getElementById("gangArrest").innerText = totalRapeArrest;
                 document.getElementById("gangArrestRate").innerText = (totalRapeArrest / totalRapeOccurrence * 100).toFixed(2) + "%";

                 document.getElementById("robberOccurrence").innerText = totalRobberyOccurrence;
                 document.getElementById("robberArrest").innerText = totalRobberyArrest;
                 document.getElementById("robberArrestRate").innerText = (totalRobberyOccurrence / totalRobberyArrest * 100).toFixed(2) + "%";

                 document.getElementById("murderOccurrence").innerText = totalMurderOccurrence;
                 document.getElementById("murderArrest").innerText = totalMurderArrest;
                 document.getElementById("murderArrestRate").innerText = (totalMurderArrest / totalMurderOccurrence * 100).toFixed(2) + "%";

                 document.getElementById("theftOccurrence").innerText = totalTheftOccurrence;
                 document.getElementById("theftArrest").innerText = totalTheftArrest;
                 document.getElementById("theftArrestRate").innerText = (totalTheftArrest / totalTheftOccurrence * 100).toFixed(2) + "%";

                 document.getElementById("violentOccurrence").innerText = totalViolenceOccurrence;
                 document.getElementById("violentArrest").innerText = totalViolenceArrest;
                 document.getElementById("violentArrestRate").innerText = (totalViolenceArrest / totalViolenceOccurrence * 100).toFixed(2) + "%";
                 
                 createChart();	
                 arrChart();
             });
     }
     
     
     //경북
     function loadNG(){
        const url = "https://api.odcloud.kr/api/15022209/v1/uddi:f7875f10-5f42-4d99-a28a-b4cad84a6db5?page=1&perPage=105&serviceKey=tqrjDF%2B9GEzjmzYZ98zwUwo4q47g7ik%2Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%3D%3D";
        
        fetch(url)
           .then((res)  => res.json())
           .then((json) => {
           // JSON 데이터를 변수에 저장
           const jsonData = json.data;
           
              
              //살인
              const occMurderData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "살인");
              const arrMurderData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "살인");
              
              //강도
              const occRobberData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "강도");
              const arrRobberData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "강도");
              
              //성범죄
              const occgangData   = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "성범죄");
              const arrgangData   = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "성범죄");
              
              //절도 
              const occTheftData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "절도");
              const arrTheftData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "절도");
              
              //폭력
              const occViolData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "폭력");
              const arrViolData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "폭력");
              
              //살인 발생건수 
                 oMSum = 0;
                 occMurderData.forEach(item =>{
                 oMSum += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
                 });
              
              //살인 검거 건수 
                 aMSum = 0;
                 arrMurderData.forEach(item =>{
                 aMSum += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
                 });
              
              
              //강도 발생건수 
              oRSum = 0;
                 occRobberData.forEach(item =>{
                 oRSum  += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
                 });
              
              //강도 검거 건수 
              aRSum = 0;
                 arrRobberData.forEach(item =>{
                 aRSum  += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
                 });
              
              //성범죄 발생건수 
              oGSum = 0;
                 occgangData.forEach(item =>{
                 oGSum += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
                 });
                 
              //성범죄 검거 건수 
              aGSum = 0;
                 arrgangData.forEach(item =>{
                 aGSum += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
                 });
              
              //절도 발생건수 
              oTSum = 0;
                 occTheftData.forEach(item =>{
                 oTSum += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
                 });
              //절도 검거 건수 
              aTSum = 0;
                 arrTheftData.forEach(item =>{
                 aTSum += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
                 });
              
              //폭력 발생건수 
              let oVSum = 0;     
              occViolData.forEach(item =>{
                 oVSum += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
              });
              
              //폭력 검거 건수 
              let aVSum = 0;     
              arrViolData.forEach(item =>{
                 aVSum += item.경북청 + item.경산 + item.경주 + item.고령 +
                 item.구미 + item.군위 + item.김천 + item.문경 + item.봉화 + 
                 item.상주 + item.성주 + item.안동 + item.영덕 + item.영양 +
                 item.영주 + item.영천 + item.예천 + item.울릉 + item.울진 + 
                 item.의성 + item.청도 + item.청송 + item.칠곡 + item.포항남부 + item.포항북부;
              });
              console.log(occRobberData);
              console.log(arrRobberData);
              
              // 화면에 데이터 넣기
              
              //살인 
               
               //발생
               document.getElementById("murderOccurrence").innerText = oMSum;
               //검거
               document.getElementById("murderArrest").innerText = aMSum;
               //검거율
               document.getElementById("murderArrestRate").innerText = (aMSum / oMSum * 100).toFixed(2) + "%";
              
              //강도 
               
               //발생
               document.getElementById("robberOccurrence").innerText = oRSum;
               //검거
               document.getElementById("robberArrest").innerText = aRSum;
               //검거율
               document.getElementById("robberArrestRate").innerText = (aRSum / oRSum * 100).toFixed(2) + "%";
              
              //성범죄
               
               //발생
               document.getElementById("gangOccurrence").innerText = oGSum;
               //검거
               document.getElementById("gangArrest").innerText = aGSum;
               //검거율
               document.getElementById("gangArrestRate").innerText = (aGSum / oGSum * 100).toFixed(2) + "%";
              
              //절도 
               
               //발생
               document.getElementById("theftOccurrence").innerText = oTSum;
               //검거
               document.getElementById("theftArrest").innerText = aTSum;
               //검거율
               document.getElementById("theftArrestRate").innerText = ( aTSum / oTSum * 100).toFixed(2) + "%";
              
              //폭력 
               
               //발생
               document.getElementById("violentOccurrence").innerText = oVSum;
               //검거
               document.getElementById("violentArrest").innerText     = aVSum;
               //검거율
               document.getElementById("violentArrestRate").innerText = (aVSum / oVSum * 100).toFixed(2) + "%";
               
               createChart();	
               arrChart();      
     });         
  }
  
  
        //전남
         function loadSJ(){
        const url = "https://api.odcloud.kr/api/15078210/v1/uddi:cb666cac-0784-40a4-a269-fcb394bc31f8?page=1&perPage=64&serviceKey=tqrjDF%2B9GEzjmzYZ98zwUwo4q47g7ik%2Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%3D%3D";
        
        fetch(url)
           .then((res)  => res.json())
           .then((json) => {
           // JSON 데이터를 변수에 저장
           const jsonData = json.data;
           
              
              //살인
              const occMurderData = jsonData.filter(item => item.연도 === 2021 && item.분류 === "살인");
              
              //강도
              const occRobberData = jsonData.filter(item => item.연도 === 2021  && item.분류 === "강도");
              
              //성범죄
              const occgangData   = jsonData.filter(item => item.연도 === 2021 && item.분류 === "강간,강제추행");
              
              //절도 
              const occTheftData = jsonData.filter(item => item.연도 === 2021 && item.분류 === "절도");
              
              //폭력
              const occViolData = jsonData.filter(item => item.연도 === 2021 && item.분류 === "폭력");
              
              //살인
              //발생건수 
                 oMSum = 0;
                 occMurderData.forEach(item =>{
                 oMSum = item["발생건수"];
                 });
              
              //검거 수 
              aMSum = 0; 
              occMurderData.forEach(item=>{
                 aMSum = item["검거건수"];
              });
              
              //강도
              //발생건수 
                 oRSum = 0;
                 occRobberData.forEach(item =>{
                 oRSum = item["발생건수"];
                 });
              
              //검거 수 
              aRSum = 0; 
              occRobberData.forEach(item=>{
                 aRSum = item["검거건수"];
              });
              
              //성범죄
              //발생건수 
                 oGSum = 0;
                 occgangData.forEach(item =>{
                 oGSum = item["발생건수"];
                 });
              
              //검거 수 
              aGSum = 0; 
              occgangData.forEach(item=>{
                 aGSum = item["검거건수"];
              });
              
              //절도
              //발생건수 
                 oTSum = 0;
                 occTheftData.forEach(item =>{
                 oTSum = item["발생건수"];
                 });
              
              //검거 수 
              aTSum = 0; 
              occTheftData.forEach(item=>{
                 aTSum = item["검거건수"];
              });
              
              //폭력
              //발생건수 
                 oVSum = 0;
                 occViolData.forEach(item =>{
                 oVSum = item["발생건수"];
                 });
              
              //검거 수 
              aVSum = 0; 
              occViolData.forEach(item=>{
                 aVSum = item["검거건수"];
              });
              
              
               // 화면에 데이터 넣기
              
              //살인 
               
               //발생
               document.getElementById("murderOccurrence").innerText = oMSum;
               //검거
               document.getElementById("murderArrest").innerText = aMSum;
               //검거율
               document.getElementById("murderArrestRate").innerText = (aMSum / oMSum * 100).toFixed(2) + "%";
              
              //강도 
               
               //발생
               document.getElementById("robberOccurrence").innerText = oRSum;
               //검거
               document.getElementById("robberArrest").innerText = aRSum;
               //검거율
               document.getElementById("robberArrestRate").innerText = (aRSum / oRSum * 100).toFixed(2) + "%";
              
              //성범죄
               
               //발생
               document.getElementById("gangOccurrence").innerText = oGSum;
               //검거
               document.getElementById("gangArrest").innerText = aGSum;
               //검거율
               document.getElementById("gangArrestRate").innerText = (aGSum / oGSum * 100).toFixed(2) + "%";
              
              //절도 
               
               //발생
               document.getElementById("theftOccurrence").innerText = oTSum;
               //검거
               document.getElementById("theftArrest").innerText = aTSum;
               //검거율
               document.getElementById("theftArrestRate").innerText = ( aTSum / oTSum * 100).toFixed(2) + "%";
              
              //폭력 
               
               //발생
               document.getElementById("violentOccurrence").innerText = oVSum;
               //검거
               document.getElementById("violentArrest").innerText     = aVSum;
               //검거율
               document.getElementById("violentArrestRate").innerText = (aVSum / oVSum * 100).toFixed(2) + "%";
               
               createChart();	
               arrChart();
     });         
  }
  
  
  //제주 
  function loadJeju(){
  
  
     const url = "https://api.odcloud.kr/api/15039458/v1/uddi:e454cf04-9f26-497b-a117-8fc7378d296c?page=1&perPage=64&serviceKey=tqrjDF%2B9GEzjmzYZ98zwUwo4q47g7ik%2Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%3D%3D";
        
        fetch(url)
           .then((res)  => res.json())
           .then((json) => {
           // JSON 데이터를 변수에 저장
           const jsonData = json.data;
           
              
              //살인
              const occMurderData = jsonData.filter(item => item.년도 === 2022);
              
              //강도
              const occRobberData = jsonData.filter(item => item.년도 === 2022);
              
              //성범죄
              const occgangData   = jsonData.filter(item => item.년도 === 2022);
              
              //절도 
              const occTheftData = jsonData.filter(item => item.년도 === 2022);
              
              //폭력
              const occViolData = jsonData.filter(item => item.년도 === 2022);
              
              console
              //살인
              //발생건수 
                 oMSum = 0;
                 occMurderData.forEach(item =>{
                 oMSum = item["살인발생"];
                 });
              
              //검거 수 
              aMSum = 0; 
              occMurderData.forEach(item=>{
                 aMSum = item["살인검거"];
              });
              
              //강도
              //발생건수 
                 oRSum = 0;
                 occRobberData.forEach(item =>{
                 oRSum = item["강도발생"];
                 });
              
              //검거 수 
              aRSum = 0; 
              occRobberData.forEach(item=>{
                 aRSum = item["강도검거"];
              });
              
              //성범죄
              //발생건수 
                 oGSum = 0;
                 occgangData.forEach(item =>{
                 oGSum = item["강간_강제추행 발생"];
                 });
              
              //검거 수 
              aGSum = 0; 
              occgangData.forEach(item=>{
                 aGSum = item["강간_강제추행 검거"];
              });
              
              //절도
              //발생건수 
                 oTSum = 0;
                 occTheftData.forEach(item =>{
                 oTSum = item["절도발생"];
                 });
              
              //검거 수 
              aTSum = 0; 
              occTheftData.forEach(item=>{
                 aTSum = item["절도검거"];
              });
              
              //폭력
              //발생건수 
                 oVSum = 0;
                 occViolData.forEach(item =>{
                 oVSum = item["폭력발생"];
                 });
              
              //검거 수 
              aVSum = 0; 
              occViolData.forEach(item=>{
                 aVSum = item["폭력검거"];
              });
              
              
               // 화면에 데이터 넣기
              
              //살인 
               
               //발생
               document.getElementById("murderOccurrence").innerText = oMSum;
               //검거
               document.getElementById("murderArrest").innerText = aMSum;
               //검거율
               document.getElementById("murderArrestRate").innerText = (aMSum / oMSum * 100).toFixed(2) + "%";
              
              //강도 
               
               //발생
               document.getElementById("robberOccurrence").innerText = oRSum;
               //검거
               document.getElementById("robberArrest").innerText = aRSum;
               //검거율
               document.getElementById("robberArrestRate").innerText = (aRSum / oRSum * 100).toFixed(2) + "%";
              
              //성범죄
               
               //발생
               document.getElementById("gangOccurrence").innerText = oGSum;
               //검거
               document.getElementById("gangArrest").innerText = aGSum;
               //검거율
               document.getElementById("gangArrestRate").innerText = (aGSum / oGSum * 100).toFixed(2) + "%";
              
              //절도 
               
               //발생
               document.getElementById("theftOccurrence").innerText = oTSum;
               //검거
               document.getElementById("theftArrest").innerText = aTSum;
               //검거율
               document.getElementById("theftArrestRate").innerText = ( aTSum / oTSum * 100).toFixed(2) + "%";
              
              //폭력 
               
               //발생
               document.getElementById("violentOccurrence").innerText = oVSum;
               //검거
               document.getElementById("violentArrest").innerText     = aVSum;
               //검거율
               document.getElementById("violentArrestRate").innerText = (aVSum / oVSum * 100).toFixed(2) + "%";
         
			   createChart();	
			   arrChart();
         });   
  }
  
//광주 

  function loadGj(){
  const url = "https://api.odcloud.kr/api/15118790/v1/uddi:632b4f00-e743-49f8-994c-a16167830ac8?page=1&perPage=90&serviceKey=tqrjDF%2B9GEzjmzYZ98zwUwo4q47g7ik%2Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%3D%3D";
        
        fetch(url)
           .then((res)  => res.json())
           .then((json) => {
           // JSON 데이터를 변수에 저장
           const jsonData = json.data;
           
              
              //살인
              const occMurderData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "살인");
              const arrMurderData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "살인");
              
              //강도
              const occRobberData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "강도");
              const arrRobberData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "강도");
              
              //성범죄
              const occgangData   = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "성범죄");
              const arrgangData   = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "성범죄");
              
              //절도 
              const occTheftData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "절도");
              const arrTheftData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "절도");
              
              //폭력
              const occViolData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "발생건수" && item.범죄유형 === "폭력");
              const arrViolData = jsonData.filter(item => item.연도 === 2022 && item.구분 === "검거건수" && item.범죄유형 === "폭력");
              
              //살인 발생건수 
                 oMSum = 0;
                 occMurderData.forEach(item =>{
                 oMSum += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
                 });
              
              //살인 검거 건수 
                 aMSum = 0;
                 arrMurderData.forEach(item =>{
                 aMSum += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
                 });
              
              
              //강도 발생건수 
              oRSum = 0;
                 occRobberData.forEach(item =>{
                 oRSum  += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
                 });
              
              //강도 검거 건수 
              aRSum = 0;
                 arrRobberData.forEach(item =>{
                 aRSum  += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
                 });
              
              //성범죄 발생건수 
              oGSum = 0;
                 occgangData.forEach(item =>{
                 oGSum += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
                 });
                 
              //성범죄 검거 건수 
              aGSum = 0;
                 arrgangData.forEach(item =>{
                 aGSum += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
                 });
              
              //절도 발생건수 
              oTSum = 0;
                 occTheftData.forEach(item =>{
                 oTSum += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
                 });
              //절도 검거 건수 
              aTSum = 0;
                 arrTheftData.forEach(item =>{
                 aTSum += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
                 });
              
              //폭력 발생건수 
              let oVSum = 0;     
              occViolData.forEach(item =>{
                 oVSum += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
              });
              
              //폭력 검거 건수 
              let aVSum = 0;     
              arrViolData.forEach(item =>{
                 aVSum += item.광주경찰청 + item.광주광산경찰서 + item.광주남부경찰서 + item.광주동부경찰서 +
                 item.광주북부경찰서 + item.광주서부경찰서;
              });
              
              
              // 화면에 데이터 넣기
              
              //살인 
               
               //발생
               document.getElementById("murderOccurrence").innerText = oMSum;
               //검거
               document.getElementById("murderArrest").innerText = aMSum;
               //검거율
               document.getElementById("murderArrestRate").innerText = (aMSum / oMSum * 100).toFixed(2) + "%";
              
              //강도 
               
               //발생
               document.getElementById("robberOccurrence").innerText = oRSum;
               //검거
               document.getElementById("robberArrest").innerText = aRSum;
               //검거율
               document.getElementById("robberArrestRate").innerText = (aRSum / oRSum * 100).toFixed(2) + "%";
              
              //성범죄
               
               //발생
               document.getElementById("gangOccurrence").innerText = oGSum;
               //검거
               document.getElementById("gangArrest").innerText = aGSum;
               //검거율
               document.getElementById("gangArrestRate").innerText = (aGSum / oGSum * 100).toFixed(2) + "%";
              
              //절도 
               
               //발생
               document.getElementById("theftOccurrence").innerText = oTSum;
               //검거
               document.getElementById("theftArrest").innerText = aTSum;
               //검거율
               document.getElementById("theftArrestRate").innerText = ( aTSum / oTSum * 100).toFixed(2) + "%";
              
              //폭력 
               
               //발생
               document.getElementById("violentOccurrence").innerText = oVSum;
               //검거
               document.getElementById("violentArrest").innerText     = aVSum;
               //검거율
               document.getElementById("violentArrestRate").innerText = (aVSum / oVSum * 100).toFixed(2) + "%";
               
               createChart();	
               arrChart();

  });   

}


  //전북 
  function loadNJ(){
  
     const url = "https://api.odcloud.kr/api/15040603/v1/uddi:693a488d-ff6d-48a3-8550-a67f5b0edf03?page=1&perPage=64&serviceKey=tqrjDF%2B9GEzjmzYZ98zwUwo4q47g7ik%2Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%3D%3D";
     
     fetch(url)
           .then((res)  => res.json())
           .then((json) => {
           // JSON 데이터를 변수에 저장
           const jsonData = json.data;
           
              
              //살인
              const occMurderData = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "발생");
              const arrMurderData = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "검거");
              
              //강도
              const occRobberData = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "발생");
              const arrRobberData = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "검거");
              
              //성범죄
              const occgangData   = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "발생");
              const arrgangData   = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "검거");
              
              //절도 
              const occTheftData = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "발생");
              const arrTheftData = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "검거");
              
              //폭력
              const occViolData = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "발생");
              const arrViolData = jsonData.filter(item => item.년도별 === "2022년" && item.유형  === "검거");
              
        
              //살인 발생건수 
                 oMSum = 0;
                 occMurderData.forEach(item =>{
                 oMSum += item["살인"];
                 });
              
              //살인 검거 건수 
                 aMSum = 0;
                 arrMurderData.forEach(item =>{
                 aMSum += item["살인"];
                 });
              
              
              //강도 발생건수 
              oRSum = 0;
                 occRobberData.forEach(item =>{
                 oRSum  += item["강도"];
                 });
              
              //강도 검거 건수 
              aRSum = 0;
                 arrRobberData.forEach(item =>{
                 aRSum  += item["강도"];
                 });
              
              //강간추행 발생건수 
              oGSum = 0;
                 occgangData.forEach(item =>{
                 oGSum += item["강간추행"];
                 });
                 
              //성범죄 검거 건수 
              aGSum = 0;
                 arrgangData.forEach(item =>{
                 aGSum += item["강간추행"];
                 });
              
              //절도 발생건수 
              oTSum = 0;
                 occTheftData.forEach(item =>{
                 oTSum += item["절도"];
                 });
              //절도 검거 건수 
              aTSum = 0;
                 arrTheftData.forEach(item =>{
                 aTSum += item["절도"];
                 });
              
              //폭력 발생건수 
              let oVSum = 0;     
              occViolData.forEach(item =>{
                 oVSum += item["폭력"];
              });
              
              //폭력 검거 건수 
              let aVSum = 0;     
              arrViolData.forEach(item =>{
                 aVSum += item["폭력"];
              });
              
              
              // 화면에 데이터 넣기
              
              //살인 
               
               //발생
               document.getElementById("murderOccurrence").innerText = oMSum;
               //검거
               document.getElementById("murderArrest").innerText = aMSum;
               //검거율
               document.getElementById("murderArrestRate").innerText = (aMSum / oMSum * 100).toFixed(2) + "%";
              
              //강도 
               
               //발생
               document.getElementById("robberOccurrence").innerText = oRSum;
               //검거
               document.getElementById("robberArrest").innerText = aRSum;
               //검거율
               document.getElementById("robberArrestRate").innerText = (aRSum / oRSum * 100).toFixed(2) + "%";
              
              //성범죄
               
               //발생
               document.getElementById("gangOccurrence").innerText = oGSum;
               //검거
               document.getElementById("gangArrest").innerText = aGSum;
               //검거율
               document.getElementById("gangArrestRate").innerText = (aGSum / oGSum * 100).toFixed(2) + "%";
              
              //절도 
               
               //발생
               document.getElementById("theftOccurrence").innerText = oTSum;
               //검거
               document.getElementById("theftArrest").innerText = aTSum;
               //검거율
               document.getElementById("theftArrestRate").innerText = ( aTSum / oTSum * 100).toFixed(2) + "%";
              
              //폭력 
               
               //발생
               document.getElementById("violentOccurrence").innerText = oVSum;
               //검거
               document.getElementById("violentArrest").innerText     = aVSum;
               //검거율
               document.getElementById("violentArrestRate").innerText = (aVSum / oVSum * 100).toFixed(2) + "%";
               
               createChart();	
			   arrChart();
     });
  }
//부산
function loadBusan(){

  const url = "https://api.odcloud.kr/api/15084772/v1/uddi:741386bf-69b6-4916-830a-eddb64c55b61?page=1&perPage=64&serviceKey=tqrjDF%2B9GEzjmzYZ98zwUwo4q47g7ik%2Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%3D%3D";
     
     fetch(url)
           .then((res)  => res.json())
           .then((json) => {
           // JSON 데이터를 변수에 저장
           const jsonData = json.data;
           
              
              //살인
              const occMurderData = jsonData.filter(item => item.범죄분류 === "살인(기수)");
              const arrMurderData = jsonData.filter(item => item.범죄분류 === "살인(기수)");
              
              //강도
              const occRobberData = jsonData.filter(item => item.범죄분류 === "강도");
              const arrRobberData = jsonData.filter(item => item.범죄분류 === "강도");
              
              //성범죄
              const occgangData   = jsonData.filter(item => item.범죄분류 === "강간");
              const arrgangData   = jsonData.filter(item => item.범죄분류 === "강간");
              
              //절도 
              const occTheftData = jsonData.filter(item => item.범죄분류 === "절도");
              const arrTheftData = jsonData.filter(item => item.범죄분류 === "절도");
              
              //폭력
              const occViolData = jsonData.filter(item => item.범죄분류 === "폭행");
              const arrViolData = jsonData.filter(item => item.범죄분류 === "폭행");
              
              console.log(occMurderData);
              
              //살인 발생건수 
                 oMSum = 0;
                 occMurderData.forEach(item =>{
                 oMSum += item["지휘관할_발생건수(건)"];
                 });
              
              //살인 검거 건수 
                 aMSum = 0;
                 arrMurderData.forEach(item =>{
                 aMSum += item["지휘관할_검거건수(건)"];
                 });
              
              
              //강도 발생건수 
              oRSum = 0;
                 occRobberData.forEach(item =>{
                 oRSum  += item["지휘관할_발생건수(건)"];
                 });
              
              //강도 검거 건수 
              aRSum = 0;
                 arrRobberData.forEach(item =>{
                 aRSum  += item["지휘관할_검거건수(건)"];
                 });
              
              //강간 발생건수 
              oGSum = 0;
                 occgangData.forEach(item =>{
                 oGSum += item["지휘관할_발생건수(건)"];
                 });
                 
              //강간 검거 건수 
              aGSum = 0;
                 arrgangData.forEach(item =>{
                 aGSum += item["지휘관할_검거건수(건)"];
                 });
              
              //절도 발생건수 
              oTSum = 0;
                 occTheftData.forEach(item =>{
                 oTSum += item["지휘관할_발생건수(건)"];
                 });
              //절도 검거 건수 
              aTSum = 0;
                 arrTheftData.forEach(item =>{
                 aTSum += item["지휘관할_검거건수(건)"];
                 });
              
              //폭력 발생건수 
              let oVSum = 0;     
              occViolData.forEach(item =>{
                 oVSum += item["지휘관할_발생건수(건)"];
              });
              
              //폭력 검거 건수 
              let aVSum = 0;     
              arrViolData.forEach(item =>{
                 aVSum += item["지휘관할_검거건수(건)"];
              });
              
              
              // 화면에 데이터 넣기
              
              //살인 
               
               //발생
               document.getElementById("murderOccurrence").innerText = oMSum;
               //검거
               document.getElementById("murderArrest").innerText = aMSum;
               //검거율
               document.getElementById("murderArrestRate").innerText = (aMSum / oMSum * 100).toFixed(2) + "%";
              
              //강도 
               
               //발생
               document.getElementById("robberOccurrence").innerText = oRSum;
               //검거
               document.getElementById("robberArrest").innerText = aRSum;
               //검거율
               document.getElementById("robberArrestRate").innerText = (aRSum / oRSum * 100).toFixed(2) + "%";
              
              //성범죄
               
               //발생
               document.getElementById("gangOccurrence").innerText = oGSum;
               //검거
               document.getElementById("gangArrest").innerText = aGSum;
               //검거율
               document.getElementById("gangArrestRate").innerText = (aGSum / oGSum * 100).toFixed(2) + "%";
              
              //절도 
               
               //발생
               document.getElementById("theftOccurrence").innerText = oTSum;
               //검거
               document.getElementById("theftArrest").innerText = aTSum;
               //검거율
               document.getElementById("theftArrestRate").innerText = ( aTSum / oTSum * 100).toFixed(2) + "%";
              
              //폭력 
               
               //발생
               document.getElementById("violentOccurrence").innerText = oVSum;
               //검거
               document.getElementById("violentArrest").innerText     = aVSum;
               //검거율
               document.getElementById("violentArrestRate").innerText = (aVSum / oVSum * 100).toFixed(2) + "%";
               
               createChart();	
               arrChart();
  });
}
  


//대구 

function loadDaegu(){

  const url = "https://api.odcloud.kr/api/15084771/v1/uddi:21f7532c-7e0e-4818-89d6-b65d5a83a6fa?page=1&perPage=64&serviceKey=tqrjDF%2B9GEzjmzYZ98zwUwo4q47g7ik%2Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%3D%3D";
     
     fetch(url)
           .then((res)  => res.json())
           .then((json) => {
           // JSON 데이터를 변수에 저장
           const jsonData = json.data;
           
              
              //살인
              const occMurderData = jsonData.filter(item => item.범죄분류 === "살인(기수)");
              const arrMurderData = jsonData.filter(item => item.범죄분류 === "살인(기수)");
              
              //강도
              const occRobberData = jsonData.filter(item => item.범죄분류 === "강도");
              const arrRobberData = jsonData.filter(item => item.범죄분류 === "강도");
              
              //성범죄
              const occgangData   = jsonData.filter(item => item.범죄분류 === "강간");
              const arrgangData   = jsonData.filter(item => item.범죄분류 === "강간");
              
              //절도 
              const occTheftData = jsonData.filter(item => item.범죄분류 === "절도");
              const arrTheftData = jsonData.filter(item => item.범죄분류 === "절도");
              
              //폭력
              const occViolData = jsonData.filter(item => item.범죄분류 === "폭행");
              const arrViolData = jsonData.filter(item => item.범죄분류 === "폭행");
              
              console.log(occMurderData);
              
              //살인 발생건수 
                 oMSum = 0;
                 occMurderData.forEach(item =>{
                 oMSum += item["지휘관할_발생건수(건)"];
                 });
              
              //살인 검거 건수 
                 aMSum = 0;
                 arrMurderData.forEach(item =>{
                 aMSum += item["지휘관할_검거건수(건)"];
                 });
              
              
              //강도 발생건수 
              oRSum = 0;
                 occRobberData.forEach(item =>{
                 oRSum  += item["지휘관할_발생건수(건)"];
                 });
              
              //강도 검거 건수 
              aRSum = 0;
                 arrRobberData.forEach(item =>{
                 aRSum  += item["지휘관할_검거건수(건)"];
                 });
              
              //강간 발생건수 
              oGSum = 0;
                 occgangData.forEach(item =>{
                 oGSum += item["지휘관할_발생건수(건)"];
                 });
                 
              //강간 검거 건수 
              aGSum = 0;
                 arrgangData.forEach(item =>{
                 aGSum += item["지휘관할_검거건수(건)"];
                 });
              
              //절도 발생건수 
              oTSum = 0;
                 occTheftData.forEach(item =>{
                 oTSum += item["지휘관할_발생건수(건)"];
                 });
              //절도 검거 건수 
              aTSum = 0;
                 arrTheftData.forEach(item =>{
                 aTSum += item["지휘관할_검거건수(건)"];
                 });
              
              //폭력 발생건수 
              let oVSum = 0;     
              occViolData.forEach(item =>{
                 oVSum += item["지휘관할_발생건수(건)"];
              });
              
              //폭력 검거 건수 
              let aVSum = 0;     
              arrViolData.forEach(item =>{
                 aVSum += item["지휘관할_검거건수(건)"];
              });
              
              
              // 화면에 데이터 넣기
              
              //살인 
               
               //발생
               document.getElementById("murderOccurrence").innerText = oMSum;
               //검거
               document.getElementById("murderArrest").innerText = aMSum;
               //검거율
               document.getElementById("murderArrestRate").innerText = (aMSum / oMSum * 100).toFixed(2) + "%";
              
              //강도 
               
               //발생
               document.getElementById("robberOccurrence").innerText = oRSum;
               //검거
               document.getElementById("robberArrest").innerText = aRSum;
               //검거율
               document.getElementById("robberArrestRate").innerText = (aRSum / oRSum * 100).toFixed(2) + "%";
              
              //성범죄
               
               //발생
               document.getElementById("gangOccurrence").innerText = oGSum;
               //검거
               document.getElementById("gangArrest").innerText = aGSum;
               //검거율
               document.getElementById("gangArrestRate").innerText = (aGSum / oGSum * 100).toFixed(2) + "%";
              
              //절도 
               
               //발생
               document.getElementById("theftOccurrence").innerText = oTSum;
               //검거
               document.getElementById("theftArrest").innerText = aTSum;
               //검거율
               document.getElementById("theftArrestRate").innerText = ( aTSum / oTSum * 100).toFixed(2) + "%";
              
              //폭력 
               
               //발생
               document.getElementById("violentOccurrence").innerText = oVSum;
               //검거
               document.getElementById("violentArrest").innerText     = aVSum;
               //검거율
               document.getElementById("violentArrestRate").innerText = (aVSum / oVSum * 100).toFixed(2) + "%";
                 createChart();
                 arrChart();	
  });
}
    				
    
    
    
    
      