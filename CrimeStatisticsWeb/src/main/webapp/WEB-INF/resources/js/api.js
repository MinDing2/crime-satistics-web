
// 지도 클릭시 데이터 들고오기	
	let  objEl = document.querySelector('object');
	objEl.addEventListener("load", (e) => {
		  let svgDoc = objEl.contentDocument;
		  let ulSan  = svgDoc.querySelector('[title="Ulsan"]');    
		  ulSan.onclick = function() {    		  	
			  loadUlsan() ;
		  }
	    
	});
	
	objEl.addEventListener("load", (e) => {
	    	  let svgDoc = objEl.contentDocument;
	    	  let daeJeon  = svgDoc.querySelector('[title="Daejeon"]');    
	    	daeJeon.onclick = function() {    		  	
	    		loadDaejeon();
	    	  }  	       
	    });
	objEl.addEventListener("load", (e) => {
	    	  let svgDoc = objEl.contentDocument;
	    	  let inCheon  = svgDoc.querySelector('[title="Incheon"]');    
	    	  inCheon.onclick = function() {    		  	
	    		loadIncheon();
	    	  }  	       
	    });
	    
	objEl.addEventListener("load", (e) => {
	    	  let svgDoc = objEl.contentDocument;
	    	  let SG  = svgDoc.querySelector('[title="South Gyeongsang"]');    
	    	  SG.onclick = function() {    		  	
	    		loadSG();
	    	  }  	       
	    });
	objEl.addEventListener("load", (e) => {
	    	  let svgDoc = objEl.contentDocument;
	    	  let SG  = svgDoc.querySelector('[title="North Gyeongsang"]');    
	    	  SG.onclick = function() {    		  	
	    		loadNG();
	    	  }  	       
	    });        
	  objEl.addEventListener("load", (e) => {
	    	  let svgDoc = objEl.contentDocument;
	    	  let SJ  = svgDoc.querySelector('[title="South Jeonla"]');    
	    	  SJ.onclick = function() {    		  	
	    		 loadSJ();
	    	  }  	       
	    });    
	         
    
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
    	        //강간
    	        document.getElementById("gangOccurrence").innerText = gangData[0];
    	        document.getElementById("gangArrest").innerText = gangData[1];
    	        document.getElementById("gangArrestRate").innerText = (gangData[1] / gangData[0] * 100).toFixed(2) + "%";
    	        
				//강도
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
    	        });
    	}
    	
    	
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
    				
    	});			
    }
    
    
    //전북
        	function loadNJ(){
    		const url = "https://api.odcloud.kr/api/15040603/v1/uddi:c6e973d2-7a7d-4f46-8ec3-cff5d1b946ca?page=1&perPage=61&serviceKey=tqrjDF%252B9GEzjmzYZ98zwUwo4q47g7ik%252Brpdxbv5kuiyDnrNhOsPNhSczRPnu0sxbsDIujzBqMB2GCsuhlJJO6g%253D%253D";
    		
    		fetch(url)
    			.then((res)  => res.json())
    			.then((json) => {
    			// JSON 데이터를 변수에 저장
    			const jsonData = json.data;
    			
    		
    			
    				
    	});			
    }
 
    			
    				
    				
    
    
    
    
      