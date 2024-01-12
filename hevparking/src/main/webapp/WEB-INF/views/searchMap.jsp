<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS폴더 경로 -->
<link rel="stylesheet" href="css/searchMap.css">
  	
<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">

<!-- JQuery 로딩  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Bootstrap 5.2.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=806291fdb8dda426155eab0ff89245c1&libraries=services"></script>
<jsp:include page="adminheader.jsp"></jsp:include> 
</head>

<body>

<img src="image/map/mapbg.png" id="mapbg">
<div id="shadowbox"></div>
<div class="map_wrap">
<div id="map"></div>
<div id="menu_wrap" class="bg_white">
<div id="sideGroup">
<br/>
<div class="form-floating mb-3" style="display:flex;background:white;">
  
  <input type="text" class="form-control" style="width:300px; height:50px;" id="keyword" placeholder="강남/서대문구..."/>
  <label for="keyword">주소나 키워드를 입력하세요</label>
   <button class="btn btn-outline-primary" style="width:90px; height:50px;" id="searchBtn" onclick="searchLocation()">검색</button>
</div>
<div>
<h6><Strong>지역 선택</Strong></h6>
<hr/>
<select id="selectRegval" class="form-select" aria-label="Default select example">
	<option value="11110" data-lat="37.572707607267354" data-lng="126.97812986200847" selected>종로구</option>
	<option value="11140" data-lat="37.562582436665856" data-lng="127.00095074687017">중구</option>
	<option value="11170" data-lat="37.53533479812064" data-lng="126.98153506933663">용산구</option>
	<option value="11200" data-lat="37.550675" data-lng="127.040962">성동구</option>
	<option value="11215" data-lat="37.548144" data-lng="127.085753">광진구</option>
	<option value="11230" data-lat="37.583801" data-lng="127.050700">동대문구</option>
	<option value="11260" data-lat="37.606991" data-lng="127.092442">중랑구</option>
	<option value="11290" data-lat="37.606377" data-lng="127.027457">성북구</option>
	<option value="11305" data-lat="37.639938" data-lng="127.025508">강북구</option>
	<option value="11320" data-lat="37.665861" data-lng="127.031767">도봉구</option>
	<option value="11350" data-lat="37.654259" data-lng="127.056294">노원구</option>
	<option value="11380" data-lat="37.617612" data-lng="126.927273">은평구</option>
	<option value="11410" data-lat="37.579469" data-lng="126.936771">서대문구</option>
	<option value="11440" data-lat="37.562291" data-lng="126.908780">마포구</option>
	<option value="11470" data-lat="37.527062" data-lng="126.856153">양천구</option>
	<option value="11500" data-lat="37.565761" data-lng="126.822656">강서구</option>
	<option value="11530" data-lat="37.495486" data-lng="126.858121">구로구</option>
	<option value="11545" data-lat="37.460097" data-lng="126.901342">금천구</option>
	<option value="11560" data-lat="37.518010" data-lng="126.888465">영등포구</option>
	<option value="11590" data-lat="37.512674" data-lng="126.939179">동작구</option>
	<option value="11620" data-lat="37.478013" data-lng="126.951542">관악구</option>
	<option value="11650" data-lat="37.480982" data-lng="127.032121">서초구</option>
	<option value="11680" data-lat="37.518421" data-lng="127.047222">강남구</option>
	<option value="11710" data-lat="37.514620" data-lng="127.105606">송파구</option>
	<option value="11740" data-lat="37.530492" data-lng="127.123837">강동구</option>  
</select>
</div>
<hr/>
<br/>


<h6><strong>충전소 키워드</strong></h6>
<hr/>
<div style="display:flex;">
<select id="selectChargeType" class="form-select" aria-label="Default select example" style="width:180px;margin-bottom: 15px; margin-right:10px;">
	<option value="" selected>충전기 타입(전체)</option>
	<option value="01">DC차데모</option>
	<option value="02">AC완속</option>
	<option value="03">DC차데모+AC3상</option>
	<option value="04">DC콤보</option>
	<option value="05">DC차데모+DC콤보</option>
	<option value="06">DC차데모+AC3상+DC콤보</option>
	<option value="07">AC3상</option>
	<option value="89">H2</option>
</select>

<select id="selectChargeSpeed" class="form-select" aria-label="Default select example" style="width:180px;margin-bottom: 15px;">
	<option value="" selected>충전 속도(전체)</option>
	<option value="완속">완속</option>
	<option value="3">3kW</option>
	<option value="7">7kW</option>
	<option value="11">11kW</option>
	<option value="50">50kW</option>
	<option value="100">100kW</option>
	<option value="200">200kW</option>
	<option value="300">300kW</option>
</select>
</div>

<div id="filterbtnGroup">
<input type="checkbox" class="btn-check" id="using"  autocomplete="off">
<label class="btn btn-outline-primary" for="using">사용 가능</label>&nbsp;&nbsp;

<input type="checkbox" class="btn-check" id="parkingfree" autocomplete="off">
<label class="btn btn-outline-primary" for="parkingfree">무료 주차</label>&nbsp;&nbsp;

<input type="checkbox" class="btn-check" id="outsidersFree" autocomplete="off">
<label class="btn btn-outline-primary" for="outsidersFree">외부인 사용 가능</label>
<hr/>
</div>

</div><!-- sideGroup끝 -->
<div id="list">
<br/>
<h6><Strong>충전소 리스트</Strong></h6>
<hr/>
<ul id="chargerList"></ul>
</div>
</div>
</div>

<script type="text/javascript">
//쿠키오류뜰때 
document.cookie = "safeCookie1=foo; SameSite=Lax"; 
document.cookie = "safeCookie2=foo"; 
document.cookie = "crossCookie=bar; SameSite=None; Secure";
/*20년 2월 4일 릴리즈된 구글 크롬(Google Chrome)80버전부터 새로운 쿠키 정책이 적용 되어 Cookie의 SameSite 속성의 기본값이 "None"에서 "Lax"로 변경되었다.*/

//지역 선택 변경 이벤트 처리
document.addEventListener('DOMContentLoaded', function() {
    var selectRegion = document.getElementById('selectRegval');
    var usingCheckbox = document.getElementById('using');
    var parkingFreeCheckbox = document.getElementById('parkingfree');
    var outsidersFreeCheckbox = document.getElementById('outsidersFree');
    
    selectRegion.addEventListener('change', function() {
    	usingCheckbox.checked = false;
        parkingFreeCheckbox.checked = false;				// 체크박스 해제되면 마커 복구
    	
        var selectReg = selectRegion.value; // 선택된 지역 값
        ChargerInfo(selectReg);
        
     	// 선택된 지역으로 화면 이동
        var selectedOption = selectRegion.options[selectRegion.selectedIndex];
        var latitude = parseFloat(selectedOption.getAttribute('data-lat'));
        var longitude = parseFloat(selectedOption.getAttribute('data-lng'));
        var mapCenter = new kakao.maps.LatLng(latitude, longitude);
        map.setCenter(mapCenter);
        
    });
    // 초기 로딩 시 선택된 지역 값을 기반으로 충전소 정보 표시
    var initialSelectReg = selectRegion.value;
    ChargerInfo(initialSelectReg);
});

//공공데이터 포털에서 xml형식 데이터 가져오기
function ChargerInfo(selectReg) {
	var xhr = new XMLHttpRequest();
	var url = 'http://apis.data.go.kr/B552584/EvCharger/getChargerInfo'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'QysHpp2xmRCCVg%2BYEJjNWM8HUghbWhii202cCKsu%2FNcE8MXwOFqMgRQ7kyJCRgLzVeOkoGmHL%2BymeERLaCdvag%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('400'); /* 지도에 보이는 충전소 개수*/
	queryParams += '&' + encodeURIComponent('period') + '=' + encodeURIComponent('5'); /**/
	queryParams += '&' + encodeURIComponent('zcode') + '=' + encodeURIComponent('11'); /* 시 코드*/
	queryParams += '&' + encodeURIComponent('zscode') + '=' + encodeURIComponent(selectReg); /* 지역 코드*/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	    	clearMarkersAndOverlays();
	    	ChargingStation(this);
	    }
	};
	xhr.send();
}

//모든 마커를 지도에서 제거하는 함수
function clearMarkersAndOverlays() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
        customOverlays[i].setMap(null);
    }
    markers = []; // 기존 마커 배열 비우기
    customOverlays = []; // 기존 커스텀오버레이 배열 비우기
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.572707607267354, 126.97812986200847), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);

//마커 배열
var markers = [];
var customOverlays = [];

// 충전소 리스트 배열
var chargeList = [];

//전기차 충전소 정보
function ChargingStation(xml) {
    var xmlDoc = xml.responseXML;
    var statnm = xmlDoc.getElementsByTagName('statNm');
    var loclat = xmlDoc.getElementsByTagName('lat');
    var loclng = xmlDoc.getElementsByTagName('lng');
    var statId = xmlDoc.getElementsByTagName('statId');
    var chgerId = xmlDoc.getElementsByTagName('chgerId');
    var chgerType = xmlDoc.getElementsByTagName('chgerType');
    var addr = xmlDoc.getElementsByTagName('addr');
    var useTime = xmlDoc.getElementsByTagName('useTime');
    var busiNm = xmlDoc.getElementsByTagName('busiNm');
    var busiCall = xmlDoc.getElementsByTagName('busiCall');
    var stat = xmlDoc.getElementsByTagName('stat');
    var output = xmlDoc.getElementsByTagName('output');
    var method = xmlDoc.getElementsByTagName('method');
    var parkingFree = xmlDoc.getElementsByTagName('parkingFree');
    var note = xmlDoc.getElementsByTagName('note');
    var kind = xmlDoc.getElementsByTagName('kind');
    var kindDetail = xmlDoc.getElementsByTagName('kindDetail');
	
    var chargerList = document.getElementById('chargerList');
    chargerList.innerHTML = '';//목록 초기화
    
    
    // 충전기 '사용가능' 체크박스
	var usingCheckbox = document.getElementById("using");
	
    // '무료 주차' 여부 체크박스
	var parkingFreeCheckbox = document.getElementById("parkingfree");
	
    // '외부인 사용 가능' 여부 체크박스
	var outsidersFreeCheckbox = document.getElementById("outsidersFree");
	
	// 충전기 타입 선택 변경 이벤트 처리
	var selectChargeType = document.getElementById('selectChargeType');
	selectChargeType.addEventListener('change', function() {
	var selectedChargeType = selectChargeType.value; // 선택된 충전기 타입 값
	    filterMarkers(usingCheckbox.checked, parkingFreeCheckbox.checked, selectedChargeType);
	});
	
	// 충전 속도 선택 변경 이벤트 처리
	var selectChargeSpeed = document.getElementById('selectChargeSpeed');
	selectChargeSpeed.addEventListener('change', function() {
	    var selectedChargeSpeed = selectChargeSpeed.value; // 선택된 충전 속도 값
	    filterMarkers(usingCheckbox.checked, parkingFreeCheckbox.checked, selectChargeType.value, selectedChargeSpeed);
	});

	function containsForbiddenWords(text) {
		  // 금지된 단어 목록
		  var forbiddenWords = ["불가", "전용", "금지", "제한"];	// 단어가 포함되어있는 note

		  for (var i = 0; i < forbiddenWords.length; i++) {
		    if (text.includes(forbiddenWords[i])) {
		      return true; 
		    }
		  }

		  return false;
		}

	// 필터링 함수 업데이트
	function filterMarkers(showUsingOnly, showParkingFreeOnly, selectedChargeType, selectedChargeSpeed,showOutsidersFreeOnly) {
	    
		for (var i = 0; i < markers.length; i++) {
	        var isUsingOnly = !showUsingOnly || stat[i].textContent === "2";
	        var isParkingFreeOnly = !showParkingFreeOnly || parkingFree[i].textContent === "Y";
	        var isOutsidersFreeOnly = !showOutsidersFreeOnly || !containsForbiddenWords(note[i].textContent);
	        var isMatchingChargeType = selectedChargeType === "" || chgerType[i].textContent === selectedChargeType;
	        var isMatchingChargeSpeed = selectedChargeSpeed === "" || output[i].textContent.includes(selectedChargeSpeed);

	        if (isUsingOnly && isParkingFreeOnly && isOutsidersFreeOnly && isMatchingChargeType && isMatchingChargeSpeed) {
	            markers[i].setMap(map);
	            customOverlays[i].setMap(map);
	        } else {
	            markers[i].setMap(null);
	            customOverlays[i].setMap(null);
	        }
	    }
	}

	// 충전기 '사용가능' 체크박스 이벤트 처리
	usingCheckbox.addEventListener("change", function () {
	    filterMarkers(usingCheckbox.checked, parkingFreeCheckbox.checked, selectChargeType.value, selectChargeSpeed.value);
	});
	
	// '무료 주차' 여부 체크박스 이벤트 처리
	parkingFreeCheckbox.addEventListener("change", function () {
	    filterMarkers(usingCheckbox.checked, parkingFreeCheckbox.checked, selectChargeType.value, selectChargeSpeed.value);
	});
	
	// '외부인 사용 가능' 여부 체크박스 이벤트 처리
	outsidersFreeCheckbox.addEventListener("change", function () {
	    filterMarkers(usingCheckbox.checked, parkingFreeCheckbox.checked, selectChargeType.value, selectChargeSpeed.value, outsidersFreeCheckbox.checked);
	});

	// 충전기 타입 선택 변경 이벤트 처리
	selectChargeType.addEventListener('change', function() {
	    var selectedChargeType = selectChargeType.value; // 선택된 충전기 타입 값
	    filterMarkers(usingCheckbox.checked, parkingFreeCheckbox.checked, selectedChargeType, selectChargeSpeed.value);
	});

	// 충전 속도 선택 변경 이벤트 처리
	selectChargeSpeed.addEventListener('change', function() {
	    var selectedChargeSpeed = selectChargeSpeed.value; // 선택된 충전 속도 값
	    filterMarkers(usingCheckbox.checked, parkingFreeCheckbox.checked, selectChargeType.value, selectedChargeSpeed);
	});
    
    
    function chargkind(kind){	// 충전소 구분
    	var kindval ="";
    	switch (kind){
	    	case "A0":
	    		kindval = "공공시설";
		      break;	
    		case "B0":
    			kindval = "주차시설";
    	      break;
    	    case "C0":
    	    	kindval ="휴게시설";
    	      break;
    	    case "D0":
    	    	kindval ="관광시설";
    	      break;
    	    case "E0":
    	    	kindval ="상업시설";
    	      break;
    	    case "F0":
    	    	kindval ="차량정비시설";
    	      break;
    	    case "G0":
	    		kindval = "기타시설";
		      break;	
    		case "H0":
    			kindval = "공동주택시설";
    	      break;
    	    case "I0":
    	    	kindval ="근린생활시설";
    	      break;
    	    case "J0":
    	    	kindval ="교육문화시설";
    	      break;
    	   
    	    default: kindval ="정보가 없습니다.";
    	  }
    	  return kindval;
    	}
    
    function chargeprice(output){	// 충전소 요금
    	var priceval ="";
    	switch (output){
	    	case "3":
	    		priceval = "1kW당 217원";
		      break;	
    		case "7":
    			priceval = "1kW당 217원";
    	      break;
    	    case "11":
    	    	priceval ="1kW당 217원";
    	      break;
    	    case "50":
    	    	priceval ="1kW당 324.4원";
    	      break;
    	    case "100":
    	    	priceval ="1kW당 347.2원";
    	      break;
    	    case "200":
    	    	priceval ="1kW당 347.2원";
    	      break;
    	    case "300":
    	    	priceval = "1kW당 347.2원";
		      break;	   	   
    	    default: priceval ="요금 정보 없음";
    	  }
    	  return priceval;
    	}
    
    function chargkinddetail(kindDetail){	// 충전소 구분(상세)
    	var kinddetailval ="";
    	switch (kindDetail){
	    	case "A001":
	    		kinddetailval = "(관공서)";
		      break;	
    		case "A002":
    			kinddetailval = "(주민센터)";
    	      break;
    	    case "A003":
    	    	kinddetailval ="(공공기관)";
    	      break;
    	    case "A004":
    	    	kinddetailval ="(지자체시설)";
    	      break;
    	    case "B001":
    	    	kinddetailval ="(공영주차장)";
    	      break;
    	    case "B002":
    	    	kinddetailval ="(공원주차장)";
    	      break;
    	    case "B003":
    	    	kinddetailval = "(환승주차장)";
		      break;	
    		case "B004":
    			kinddetailval = "(일반주차장)";
    	      break;
    	    case "C001":
    	    	kinddetailval ="(고속도로 휴게소)";
    	      break;
    	    case "C002":
    	    	kinddetailval ="(지방도로 휴게소)";
    	      break;
    	   
    	    default: kinddetailval ="";
    	  }
    	  return kinddetailval;
    	}
    
    
    function status(stat){	// 충전기 상태
    	var statval ="";
    	switch (stat){
	    	case "0":
				statval = "<div style='color:#9e9393;'><Strong>알수없음</Strong></div>";
		      break;	
    		case "1":
    			statval = "<div style='color:#de1d64;'><Strong>통신이상</Strong></div>";
    	      break;
    	    case "2":
    	    	statval ="<div style='color:#0489db;'><Strong>사용가능</Strong></div>";
    	      break;
    	    case "3":
    	    	statval ="<div style='color:#07e30a;'><Strong>충전중</Strong></div>";
    	      break;
    	    case "4":
    	    	statval ="<div style='color:#e3a807;'><Strong>운영중지</Strong></div>";
    	      break;
    	    case "5":
    	    	statval ="<div style='color:#de1d64;'><Strong>점검중</Strong></div>";
    	      break;
    	    default: statval ="정보가 없습니다.";
    	  }
    	  return statval;
    	}
    
    function chgertype(chgerType){	// 충전기 타입
    	var typeval ="";
    	switch (chgerType){
    		case "01":
    			typeval = "DC차데모";
    	      break;
    	    case "02":
    	    	typeval ="AC완속";
    	      break;
    	    case "03":
    	    	typeval ="DC차데모+AC3상";
    	      break;
    	    case "04":
    			typeval ="DC콤보";
    	      break;
    	    case "05":
    	    	typeval ="DC차데모+DC콤보";
    	      break;
    	    case "06":
    	    	typeval ="DC차데모+AC3상+DC콤보";
    	      break;
    	    case "07":
    			typeval ="AC3상";
    	      break;
    	    case "89":
    	    	typeval ="H2";
    	      break;
    	    default: statval ="정보가 없습니다.";  
    	  }
    	  return typeval;
    	}
    
    function pkfree(parkingFree){	// 무료 주차 여부
    	var pkfreeval ="";
    	switch (parkingFree){
    		case "Y":
    			pkfreeval = "무료";
    	      break;
    	    case "N":
    	    	pkfreeval ="유료";
    	      break;
    	    default: statval ="정보가 없습니다.";  
    	  }
    	  return pkfreeval;
    	}
    
    for (var i = 0; i < statnm.length; i++) {
        var markerPosition = new kakao.maps.LatLng(parseFloat(loclat[i].textContent), parseFloat(loclng[i].textContent));
        
        //마커 이미지(사용,사용불가,충전중) 
        if(stat[i].textContent === "2"){
            var markerImage = new kakao.maps.MarkerImage(
                'image/map/mark.png',
                new kakao.maps.Size(30, 30),
                {
                    offset: new kakao.maps.Point(15, 15)
                });
        }else if(stat[i].textContent === "3"){
        	var markerImage = new kakao.maps.MarkerImage(
                    'image/map/mark_charging.png',
                    new kakao.maps.Size(30, 30),
                    {
                        offset: new kakao.maps.Point(15, 15)
                    });
           }else{
        	var markerImage = new kakao.maps.MarkerImage(
        		'image/map/mark_notuse.png',
        		new kakao.maps.Size(30, 30),
        		{
        		  offset: new kakao.maps.Point(15, 15)
        		});   
           }
        
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            image: markerImage,
            
        });
        
        // 인포윈도우 내용 생성
        var infowindowContent = '<div class="infowindow text-truncate">' + 
                                '<img width="20px" height="20px" style="margin-left:30px;" src="image/icon/location.png"/><strong style="font-size:14px;margin-left:40px;margin-right:70px;"> '+ addr[i].textContent +'</strong>'+
                                '<table class="table table-hover chargeinfotable">' +
                                '<tr><th width="110px"><img width="20px" height="20px" src="image/icon/home.png"/></th><td width="150px">' + chargkind(kind[i].textContent) + chargkinddetail(kindDetail[i].textContent)+'</td>' +
                                '<td><button type="button" class="btn-close" aria-label="Close" onclick="closeInfoWindow()"></button></td>' +
                                '<tr><th align="right"><img width="20px" height="20px" src="image/icon/charging.png"/></th><td><div style="display:none">'+statId[i].textContent+'</div>' + statnm[i].textContent + '</td><td></td></tr>' +                                
                                '<tr><th><img width="20px" height="20px" src="image/icon/charge.png"/></th><td>' + status(stat[i].textContent) + '</td><td><div class="btn-group dropend">'+
                                '<button type="button" class="btn btn-outline-info dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" align="right" style="width:80px;height:30px; font-size:10px;">충전기 정보</button>'+
                                '<ul class="dropdown-menu" id="chargeInfobox">'+
                                '<li><div class="chargeInfo"><div>운영 기관</div><div style="margin-left:63px;">' + busiNm[i].textContent + '</div></div><hr/></li>' +
                                '<li><div class="chargeInfo"><div>충전 요금</div><div style="margin-left:63px;">' + chargeprice(output[i].textContent) + '</div></div><hr/></li>' +
                                '<li><div class="chargeInfo"><div>충전기 타입</div><div style="margin-left:60px;">' + chgertype(chgerType[i].textContent) + '</div></div><hr/></li>'+
                                '<li><div class="chargeInfo"><div>충전 속도(kW)</div><div style="margin-left:60px;">' + output[i].textContent + 'kW</div></div><hr/></li>' +
                                '<li><div class="chargeInfo"><div>충전 방식</div><div style="margin-left:80px;">' + method[i].textContent + '</div></div><hr/></li></ul></td>' +
                                '<tr><th><img width="20px" height="20px" src="image/icon/parkingfree.png"/></th><td>' + pkfree(parkingFree[i].textContent) + '</td><td><div class="btn-group dropend"></td>'+
                                '<tr><th><img width="20px" height="20px" src="image/icon/opentime.png"/></th><td>' + useTime[i].textContent + '</td><td></td></tr>' +
                                '<tr><th><img width="20px" height="20px" src="image/icon/coment.png"/></th><td>' + note[i].textContent + '</td><td></td></tr>' +
                                '</table></div>';
                                
			
            
                                
            // 커스텀 오버레이를 생성하고 위치 이름을 표시
			var content = 
					'<div class="price"><Strong>' + chargeprice(output[i].textContent) + '</Strong></div>'+
					'<div class="customOverlay"><Strong>' + statnm[i].textContent + '</Strong></div>';
			var customOverlay = new kakao.maps.CustomOverlay({
				position : markerPosition,
				content : content,
				yAnchor : 1.5
			// 위치 이름을 마커 이미지 위에 조금 올림
			});

			customOverlay.setMap(map); // 커스텀 오버레이를 지도에 추가
			customOverlays.push(customOverlay); // 생성한 커스텀 오버레이를 배열에 추가

			// 인포윈도우 생성 및 마커에 연결
			var infowindow = new kakao.maps.InfoWindow({
				content : infowindowContent
			});
			bindInfoWindow(marker, map, infowindow);

			marker.setMap(map);
			markers.push(marker);
			
			//리스트 함수 호출
			updateList(i, statnm[i].textContent, addr[i].textContent,status(stat[i].textContent),markerPosition, infowindowContent, infowindow);
		}

		// 모든 마커를 저장하는 배열에 추가
		allMarkers = markers.slice();
	}

	//인포윈도우를 닫기 위한 변수
	var openInfowindow = null;

	//인포윈도우를 마커에 연결하는 함수
	function bindInfoWindow(marker, map, infowindow) {
		kakao.maps.event.addListener(marker, 'click', function() {
			openInfowindow = infowindow;
			
			// 이미 열려있는 인포윈도우가 있다면 닫기
			if (openInfowindow) {
				openInfowindow.close();
			}
			infowindow.open(map, marker);

		});
	}

	// 지도 클릭 이벤트 등록
	kakao.maps.event.addListener(map, 'click', function() {
		// 열려있는 인포윈도우가 있다면 닫기
		if (openInfowindow && openInfowindow.close) {
			openInfowindow.close();
		}
	});
	
	// 선택된 리스트 저장
	var selectedListItem = null;

	//리스트 업데이트 함수
	function updateList(index, name, address,status, markerPosition,infowindowContent, infowindow) {
		var list = document.getElementById('chargerList');
		var listItem = document.createElement('li');
		listItem.innerHTML = '<img width="15px" height="15px" src="image/icon/locationBlue.png"/><strong>' + name + '</strong><br/><div style="display:flex;margin-bottom:8px;margin-left:12px;">' + address +'(' + status + ')</div><hr/>';
		
		// 인포윈도우 객체 저장
	    var infowindow = new kakao.maps.InfoWindow({
	        content: infowindowContent
	    });
		
		// 리스트 아이템 클릭 이벤트 추가
		listItem.addEventListener('click', function() {
			
			// 선택된 아이템이 있다면 선택 해제
			if (selectedListItem) {
				selectedListItem.classList.remove('selected');
			}
			
			// 해당 마커 위치로 지도 이동
			map.panTo(markerPosition);

			// 해당 마커의 인포윈도우 열기
			infowindow.setContent(infowindowContent);
			infowindow.open(map, markers[index]);
		});

		list.appendChild(listItem);
	}
	
	// 닫기버튼으로 인포윈도우 닫기
	function closeInfoWindow() {
		
		if(openInfowindow)
		openInfowindow.close();
    }
	
	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 장소 검색 객체를 생성합니다
	
	var ps = new kakao.maps.services.Places();

	
	// 검색 버튼 클릭 시 호출되는 함수
	function searchLocation() {
		var keyword = document.getElementById('keyword').value;
		var selectReg = document.getElementById('selectRegval');
		
		var changeEvent = new Event('change'); //강제로 이벤트 발동
		
		performSearch(keyword);

		switch (true) {
		case keyword.includes('종로'):
			selectReg.value = '11110';
			selectReg.dispatchEvent(changeEvent);
			keyword ="";
			break;
		case keyword.includes('중구'):
			selectReg.value = '11140';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('용산'):
			selectReg.value = '11170';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('성동'):
			selectReg.value = '11200';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('광진'):
			selectReg.value = '11215';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('동대문'):
			selectReg.value = '11230';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('중랑'):
			selectReg.value = '11260';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('성북'):
			selectReg.value = '11290';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('강북'):
			selectReg.value = '11305';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('도봉'):
			selectReg.value = '11320';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('노원'):
			selectReg.value = '11350';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('은평'):
			selectReg.value = '11380';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('서대문'):
			selectReg.value = '11410';
			selectReg.dispatchEvent(changeEvent);
			break;		
		case keyword.includes('마포'):
			selectReg.value = '11440';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('양천'):
			selectReg.value = '11470';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('강서'):
			selectReg.value = '11500';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('구로'):
			selectReg.value = '11530';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('금천'):
			selectReg.value = '11545';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('영등포'):
			selectReg.value = '11560';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('동작'):
			selectReg.value = '11590';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('관악'):
			selectReg.value = '11620';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('서초'):
			selectReg.value = '11650';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('강남'):
			selectReg.value = '11680';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('송파'):
			selectReg.value = '11710';
			selectReg.dispatchEvent(changeEvent);
			break;
		case keyword.includes('강동'):
			selectReg.value = '11740';
			selectReg.dispatchEvent(changeEvent);
			break;
		default:
			break;
		}
	}

	// 엔터 키로 검색되도록 처리하는 함수
	function handleEnterKey(event) {
		if (event.key === "Enter") {
			var keyword = document.getElementById('keyword').value;
			var selectReg = document.getElementById('selectRegval');
			
			var changeEvent = new Event('change'); //강제로 이벤트 발동
			
			performSearch(keyword);

			switch (true) {
			case keyword.includes('종로'):
				selectReg.value = '11110';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('중구'):
				selectReg.value = '11140';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('용산'):
				selectReg.value = '11170';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('성동'):
				selectReg.value = '11200';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('광진'):
				selectReg.value = '11215';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('동대문'):
				selectReg.value = '11230';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('중랑'):
				selectReg.value = '11260';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('성북'):
				selectReg.value = '11290';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('강북'):
				selectReg.value = '11305';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('도봉'):
				selectReg.value = '11320';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('노원'):
				selectReg.value = '11350';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('은평'):
				selectReg.value = '11380';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('서대문'):
				selectReg.value = '11410';
				selectReg.dispatchEvent(changeEvent);
				break;		
			case keyword.includes('마포'):
				selectReg.value = '11440';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('양천'):
				selectReg.value = '11470';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('강서'):
				selectReg.value = '11500';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('구로'):
				selectReg.value = '11530';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('금천'):
				selectReg.value = '11545';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('영등포'):
				selectReg.value = '11560';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('동작'):
				selectReg.value = '11590';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('관악'):
				selectReg.value = '11620';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('서초'):
				selectReg.value = '11650';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('강남'):
				selectReg.value = '11680';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('송파'):
				selectReg.value = '11710';
				selectReg.dispatchEvent(changeEvent);
				break;
			case keyword.includes('강동'):
				selectReg.value = '11740';
				selectReg.dispatchEvent(changeEvent);
				break;
			default:
				break;
			}
		}
	}

	// 검색 수행 함수
	function performSearch(keyword) {
		// 키워드로 장소를 검색합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 키워드 검색 완료 시 호출되는 콜백함수
	function placesSearchCB(data, status) {

		if (status === kakao.maps.services.Status.OK) {
			var bounds = new kakao.maps.LatLngBounds();

			for (var i = 0; i < data.length; i++) {
				bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			}

			// 검색 결과가 지도에 보이도록 지도 화면을 조정합니다
			map.setBounds(bounds);
		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			alert('검색 결과가 없습니다.');
		} else if (status === kakao.maps.services.Status.ERROR) {
			alert('검색 중 오류가 발생했습니다.');
		}
	}

	// 검색 버튼과 엔터 키 이벤트에 함수 연결
	document.getElementById('searchBtn').addEventListener('click',searchLocation);
	document.getElementById('keyword').addEventListener('keydown',handleEnterKey);
</script>

</body>
</html>