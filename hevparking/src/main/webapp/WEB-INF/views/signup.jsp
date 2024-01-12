<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입</title>
    
    <!-- CSS폴더 경로 -->
  	<link rel="stylesheet" href="css/signup.css">
  	
  	<!-- JQuery 로딩  -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	
  	<!-- js폴더 경로 -->
  	<script type="text/javascript" src="js/signup.js"></script>
 
  </head>
<body>

	<div id="signupTable">
	<a href="index" id="logo"><strong>H/<span style="color: #47ccc5;">EV</span>Parking</strong></a>
		<br/>
		<br/>
		<form action="/signup" id="check" method="post">
		<table class="table">

			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
				  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
				</svg>아이디<input type="text" class="writecss" id="memId" name="memId" placeholder="아이디 입력" style="width: 200px; margin-left: 84px;" required>
				<div id="checkid" style="display:none; font-size:10px; margin-left:20px;"></div></div></td>
			
			</tr>

			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-shield-lock-fill" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M8 0c-.69 0-1.843.265-2.928.56-1.11.3-2.229.655-2.887.87a1.54 1.54 0 0 0-1.044 1.262c-.596 4.477.787 7.795 2.465 9.99a11.777 11.777 0 0 0 2.517 2.453c.386.273.744.482 1.048.625.28.132.581.24.829.24s.548-.108.829-.24a7.159 7.159 0 0 0 1.048-.625 11.775 11.775 0 0 0 2.517-2.453c1.678-2.195 3.061-5.513 2.465-9.99a1.541 1.541 0 0 0-1.044-1.263 62.467 62.467 0 0 0-2.887-.87C9.843.266 8.69 0 8 0zm0 5a1.5 1.5 0 0 1 .5 2.915l.385 1.99a.5.5 0 0 1-.491.595h-.788a.5.5 0 0 1-.49-.595l.384-1.99A1.5 1.5 0 0 1 8 5z"/>
				</svg>비밀번호<input type="password" class="writecss" id="memPw" name="memPw" placeholder="비밀번호 입력" style="width: 200px; margin-left: 72px;" required>
				<i id="eyes" class="fa fa-eye-slash fa-sm"></i><div id="pwcheck" style="display:none; font-size:10px; margin-left:20px;"></div></div></td>
			</tr>
			
			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-envelope-at-fill" viewBox="0 0 16 16">
				  <path d="M2 2A2 2 0 0 0 .05 3.555L8 8.414l7.95-4.859A2 2 0 0 0 14 2H2Zm-2 9.8V4.698l5.803 3.546L0 11.801Zm6.761-2.97-6.57 4.026A2 2 0 0 0 2 14h6.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.606-3.446l-.367-.225L8 9.586l-1.239-.757ZM16 9.671V4.697l-5.803 3.546.338.208A4.482 4.482 0 0 1 12.5 8c1.414 0 2.675.652 3.5 1.671Z"/>
				  <path d="M15.834 12.244c0 1.168-.577 2.025-1.587 2.025-.503 0-1.002-.228-1.12-.648h-.043c-.118.416-.543.643-1.015.643-.77 0-1.259-.542-1.259-1.434v-.529c0-.844.481-1.4 1.26-1.4.585 0 .87.333.953.63h.03v-.568h.905v2.19c0 .272.18.42.411.42.315 0 .639-.415.639-1.39v-.118c0-1.277-.95-2.326-2.484-2.326h-.04c-1.582 0-2.64 1.067-2.64 2.724v.157c0 1.867 1.237 2.654 2.57 2.654h.045c.507 0 .935-.07 1.18-.18v.731c-.219.1-.643.175-1.237.175h-.044C10.438 16 9 14.82 9 12.646v-.214C9 10.36 10.421 9 12.485 9h.035c2.12 0 3.314 1.43 3.314 3.034v.21Zm-4.04.21v.227c0 .586.227.8.581.8.31 0 .564-.17.564-.743v-.367c0-.516-.275-.708-.572-.708-.346 0-.573.245-.573.791Z"/>
				</svg>이메일<input type="email" autocomplete="email" class="writecss" id="email" name="email" placeholder="비밀번호 분실시 확인용 이메일" style="width: 200px; margin-left: 84px;" required>
				<div id="emailcheck" style="display:none; font-size:10px; margin-left:20px;"></div></div></td>
			</tr>
			</table>
			
			<table class="table table-bordered">
			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-check" viewBox="0 0 16 16">
				  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.708l.547.548 1.17-1.951a.5.5 0 1 1 .858.514ZM11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Z"/>
				  <path d="M8.256 14a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Z"/>
				</svg>이 름<input type="text" class="writecss" id="memName" name="memName" placeholder="이름 입력" style="width: 200px; margin-left: 92px;" required>
				<div id="namecheck" style="display:none; font-size:10px; margin-left:20px;">이름이 올바르지 않습니다.</div></div></td>
			</tr>
			
			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-phone" viewBox="0 0 16 16">
				  <path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h6zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
				  <path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
				</svg>연락처<input type="text" class="writecss" id="phone" name="phone" placeholder="예)01012345678" style="width:200px; margin-left:84px;" required>
				<div id="phonecheck" style="display:none; font-size:10px; margin-left:20px;"></div></div></td>
			</tr>
			
			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-house-check" viewBox="0 0 16 16">
				  <path d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207l-5 5V13.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 2 13.5V8.207l-.646.647a.5.5 0 1 1-.708-.708L7.293 1.5Z"/>
				  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7Zm1.679-4.493-1.335 2.226a.75.75 0 0 1-1.174.144l-.774-.773a.5.5 0 0 1 .708-.707l.547.547 1.17-1.951a.5.5 0 1 1 .858.514Z"/>
				</svg>주 소
				<!-- <input type="text" class="form-control" id="addr3" name="addr3" placeholder="우편번호" style="width: 90px; margin-left: 105px; margin-right:10px;" readonly required> -->
				<input type="text" class="writecss" id="addr1" name="addr1" placeholder="도로명주소" style="width: 230px; margin-left: 15%; margin-right:10px; margin-bottom:10px; margin-top:10px;" readonly required>
				<button type="button" class="btn btn-outline-secondary" onclick="searchAddr()" style="width:80px; font-size:12px;">주소 검색</button></div>
				<input type="text" class="writecss" id="addr2" name="addr2" placeholder="상세주소" style="width: 230px; font-size:12px; margin-left: 60px; margin-right:10px; margin-bottom:10px;" required>
				
				</td>
			</tr>
			
			</table>
			
			
			<script>
			function searchAddr() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수

		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                //document.getElementById('addr3').value = data.zonecode;
		                document.getElementById("addr1").value = roadAddr;	        
		            }
		        }).open();
		    }
			</script>

			<table class="table table-bordered">
			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-123" viewBox="0 0 16 16">
				  <path d="M2.873 11.297V4.142H1.699L0 5.379v1.137l1.64-1.18h.06v5.961h1.174Zm3.213-5.09v-.063c0-.618.44-1.169 1.196-1.169.676 0 1.174.44 1.174 1.106 0 .624-.42 1.101-.807 1.526L4.99 10.553v.744h4.78v-.99H6.643v-.069L8.41 8.252c.65-.724 1.237-1.332 1.237-2.27C9.646 4.849 8.723 4 7.308 4c-1.573 0-2.36 1.064-2.36 2.15v.057h1.138Zm6.559 1.883h.786c.823 0 1.374.481 1.379 1.179.01.707-.55 1.216-1.421 1.21-.77-.005-1.326-.419-1.379-.953h-1.095c.042 1.053.938 1.918 2.464 1.918 1.478 0 2.642-.839 2.62-2.144-.02-1.143-.922-1.651-1.551-1.714v-.063c.535-.09 1.347-.66 1.326-1.678-.026-1.053-.933-1.855-2.359-1.845-1.5.005-2.317.88-2.348 1.898h1.116c.032-.498.498-.944 1.206-.944.703 0 1.206.435 1.206 1.07.005.64-.504 1.106-1.2 1.106h-.75v.96Z"/>
				</svg>차량 번호<input type="text" class="writecss" id="carNum" name="carNum" placeholder="예)111가1234" style="width: 230px; margin-left: 68px;" required>
				<div id="carNumcheck" style="display:none; font-size:10px; margin-left:20px;"></div></div></td>
			</tr>
			
			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-car-front-fill" viewBox="0 0 16 16">
				  <path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2Zm10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2ZM6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2H6ZM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17 1.247 0 3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z"/>
				</svg>차량명(차종)<input type="text" class="writecss" id="carName" name="carName" placeholder="예)Ev9" style="width: 230px; margin-left: 53px;" required>
				<p id="carNameCheck"></p></div></td>
			</tr>
			
			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-ev-front-fill" viewBox="0 0 16 16">
				  <path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848Zm6.75.51a.186.186 0 0 0-.23.034L6.05 7.246a.188.188 0 0 0 .137.316h1.241l-.673 2.195a.188.188 0 0 0 .085.218c.075.043.17.03.23-.034l2.88-3.187a.188.188 0 0 0-.137-.316H8.572l.782-2.195a.188.188 0 0 0-.085-.218Z"/>
				</svg>차량분류<input type="radio" class="btn-check contact" name="carCategory" id="nmselect" value="일반차" autocomplete="off" checked>
				<label class="btn btn-outline-secondary" for="nmselect" style="margin-left: 100px; margin-right: 40px; font-size:12px;">일반차</label>
				
				<input type="radio" class="btn-check contact" name="carCategory" id="evselect" value="전기차" autocomplete="off">
				<label class="btn btn-outline-info" for="evselect" style="font-size:12px;">전기차</label></div></td>
			</tr>
			
			<tr>
				<td>
				<div class="writealign">
				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-diagram-2" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M6 3.5A1.5 1.5 0 0 1 7.5 2h1A1.5 1.5 0 0 1 10 3.5v1A1.5 1.5 0 0 1 8.5 6v1H11a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-1 0V8h-5v.5a.5.5 0 0 1-1 0v-1A.5.5 0 0 1 5 7h2.5V6A1.5 1.5 0 0 1 6 4.5v-1zM8.5 5a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1zM3 11.5A1.5 1.5 0 0 1 4.5 10h1A1.5 1.5 0 0 1 7 11.5v1A1.5 1.5 0 0 1 5.5 14h-1A1.5 1.5 0 0 1 3 12.5v-1zm1.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1zm4.5.5a1.5 1.5 0 0 1 1.5-1.5h1a1.5 1.5 0 0 1 1.5 1.5v1a1.5 1.5 0 0 1-1.5 1.5h-1A1.5 1.5 0 0 1 9 12.5v-1zm1.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1z"/>
				</svg>차량유형(할인)
				<select class="writecss" id="carSale" name="carSale" style="width: 280px; font-size:12px; margin-left: 40px;">
					<option value="일반차량일반차량(할인없음)" selected>일반차량(할인없음)</option>
					<option value="저공해3종(20%할인)">저공해3종(20%할인)</option>
					<option value="경차,저공해(1,2종),장애인자동차(50%할인)">경차,저공해(1,2종),장애인자동차(50%할인)</option>
					<option value="전기차(50%할인)">전기차 (50%할인)</option>
				</select>
				</div></td>
			</tr>
			
			<tr>
				<td colspan="4" align="center"><br/>
					<input type="checkbox" class="form-check-input finalchk" id="finalchk">개인정보 수집 및 이용에 동의합니다.
					<br/><br/><br/>
					<div class="custom-control custom-checkbox" id="finalcheck">
						
						<input type="submit" class="btn btn-outline-secondary" id="signUpchk" value="회원 가입" disabled> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn btn-outline-secondary" value="다시 작성" data-target="#disup">
					</div>
				</td>
			</tr>	
		</table>
	</form>
	</div>
<jsp:include page="mymodal.jsp"></jsp:include>	

  </body>
</html>