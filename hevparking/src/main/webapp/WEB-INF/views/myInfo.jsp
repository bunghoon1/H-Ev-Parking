<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.vo.MemberVO" %>
        
<!doctype html>
<html lang="ko" class="no-js">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 정보</title>
  	
  	<!-- CSS폴더 경로 -->
  	<link rel="stylesheet" href="css/myInfo.css">
  	
  	<!-- JQuery 로딩  -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	
  	<!-- js폴더 경로 -->
  	<script type="text/javascript" src="js/myInfo.js"></script>
  	
  	<!-- 카카오 주소 api -->
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	
</head>
<body style="background-color:black;">
	<img id="bgimg" src="image/myinfo/myinfobg.jpg">

	<input type="hidden" id="memCode" name="memCode" value="<%=((MemberVO) session.getAttribute("MemberVO")).getMemCode()%>">

	<div id="myinfotable" class="fadeIn slideFirst">
	<br/>
		<div>
			<table id="infotableNav" class="container">
				<tr>
					<td> <!-- 내정보, 주차예약정보, 결제정보 이동  -->
						<div id="buttongroup" align="center">
							<svg xmlns="http://www.w3.org/2000/svg" id="back" width="30" height="30" fill="azure" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
							  <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
							</svg>
						
							<button type="button" class="btn btn-outline-secondary"
								id="infobtn" value="내정보" data-bs-toggle="tooltip"
								data-bs-target="#infocollapse" aria-expanded="false"
								aria-controls="collapseExample" data-bs-placement="top" data-bs-title="Tooltip on top">
								<img src="image/myinfo/myinfo.png" width="25px" height="25px" />
							</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-secondary"
								id="paymentbtn" value="결제정보" data-bs-toggle="collapse"
								data-bs-target="#paymentcollapse" aria-expanded="false"
								aria-controls="collapseExample">
								<img src="image/myinfo/payment.png" width="25px" height="25px" />
							</button>
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-secondary"
								id="pkinfobtn" value="예약정보" data-bs-toggle="collapse"
								data-bs-target="#parkingrescollapse" aria-expanded="false"
								aria-controls="collapseExample">
								<img src="image/myinfo/parking.png" width="25px" height="25px" />
							</button>
	
							&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-secondary"
								id="cuponbtn" value="쿠폰정보" data-bs-toggle="collapse"
								data-bs-target="#couponcollapse" aria-expanded="false"
								aria-controls="collapseExample">
								<img src="image/myinfo/coupon.png" width="25px" height="25px" />
							</button>
							
						</div><br/>
					</td>
				</tr>
			</table>

		<!-- 회원 정보  -->
		<div class="collapse show " id="infocollapse">
		  <div class="card card-body">
		    <table class="table container" id="bigMyinfotable" style="vertical-align: middle;">
				<tr>
					<td>
						
					</td>
					<td align="right">
						<Strong id="myinfotitle"></Strong>
						<button type="button" class="btn btn-outline-secondary" id="modifybtn" data-index="<%=((MemberVO) session.getAttribute("MemberVO")).getMemCode()%>" style="font-size:10px;">변 경</button>
						<button type="button" class="btn btn-outline-secondary" id="modifyCancel" data-index="<%=((MemberVO) session.getAttribute("MemberVO")).getMemCode()%>" style="font-size:10px;display:none;">취 소</button>
					</td>
				</tr>
				
				<tr>
					<td rowspan="4" width="190"><img src="../image/myinfo/profileIcon.jpg" id="profileImage" width="100%" height="100%"/></td>
					<td><div id="meminfo1" class="meminfo">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="cadetblue" class="bi bi-car-front-fill" viewBox="0 0 16 16">
					  <path d="M2.52 3.515A2.5 2.5 0 0 1 4.82 2h6.362c1 0 1.904.596 2.298 1.515l.792 1.848c.075.175.21.319.38.404.5.25.855.715.965 1.262l.335 1.679c.033.161.049.325.049.49v.413c0 .814-.39 1.543-1 1.997V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.338c-1.292.048-2.745.088-4 .088s-2.708-.04-4-.088V13.5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5v-1.892c-.61-.454-1-1.183-1-1.997v-.413a2.5 2.5 0 0 1 .049-.49l.335-1.68c.11-.546.465-1.012.964-1.261a.807.807 0 0 0 .381-.404l.792-1.848ZM3 10a1 1 0 1 0 0-2 1 1 0 0 0 0 2Zm10 0a1 1 0 1 0 0-2 1 1 0 0 0 0 2ZM6 8a1 1 0 0 0 0 2h4a1 1 0 1 0 0-2H6ZM2.906 5.189a.51.51 0 0 0 .497.731c.91-.073 3.35-.17 4.597-.17 1.247 0 3.688.097 4.597.17a.51.51 0 0 0 .497-.731l-.956-1.913A.5.5 0 0 0 11.691 3H4.309a.5.5 0 0 0-.447.276L2.906 5.19Z"/>
					</svg>
					<!--  <input type="text" id="carCategory" name="carCategory" class="meminput" disabled> -->
					<select id="carCategory" name="carCategory" class="form-select meminput" disabled>
								<option value="전기차">전기차</option>
								<option value="일반차">일반차</option>
							</select>
					<input type="text" id="carName" name="carName" class="meminput" disabled>
					<input type="text" id="carNum" name="carNum" class="meminput" disabled>
					</div></td>
				</tr>
				
				<tr>
					<td><div id="meminfo2" class="meminfo">
					<svg xmlns="http://www.w3.org/2000/svg" id="addrImage" width="25" height="25" fill="gray" class="bi bi-house-fill meminfoicon" viewBox="0 0 16 16">
					  <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z"/>
					  <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z"/>
					</svg>
					<input type="text" id="addr1" name="addr1" class="meminput" disabled>
					<input type="text" id="addr2" name="addr2" class="meminput" disabled>
					</div></td>
				</tr>	
				
				<tr>
					<td><div id="meminfo3" class="meminfo">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="darkgoldenrod" class="bi bi-envelope meminfoicon" viewBox="0 0 16 16">
					  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
					</svg>
					<input type="text" id="Mememail" name="email" class="meminput" disabled>
					</div></td>
				</tr>
				
				<tr>
					<td><div id="meminfo4" class="meminfo">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-phone" viewBox="0 0 16 16">
					  <path d="M11 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h6zM5 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H5z"/>
					  <path d="M8 14a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					</svg>
					<input type="text" id="Memphone" name="phone" class="meminput" disabled>
					</div></td>
				</tr>		
				
				<tr>
					<th>
						<Strong id="memName"></Strong>
					</th>
					
					<td><div id="meminfo5" class="meminfo">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="cornflowerblue" class="bi bi-key-fill meminfoicon" viewBox="0 0 16 16">
					  <path d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
					</svg>	
					<input type="password" id="memPwChange" name="memPw" placeholder="비밀번호 변경(클릭)" readonly/>	
					</div></td>
				</tr>
			</table>
			<p id="meminfo6" style="font-size:12px;"><span style="color:red">*</span>보안을 위해 비밀변호 변경시 이전에 사용하던 비밀번호를 입력해 주세요.</p>
		  </div>
		</div>
		
		<!-- 회원정보 수정 주소 -->
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
		
		
		<!-- 주차 예약 정보 -->
		<div class="collapse" id="parkingrescollapse">
		  <div class="card card-body">
		  	
		    <table class="table container table-sm" id="parkingListTable">
					<tr>
						<th colspan="10" style="text-align: center;">주차 예약 목록</th>
					</tr>
					<tr style="dispaly: flex;">
						<th scope="col" class="table-active"><div>번 호</div></th>
						<th scope="col" class="table-active"><div>위 치</div></th>
						<th scope="col" class="table-active"><div>주차 예약</div></th>
						<th scope="col" class="table-active"><div>주차 시작일</div></th>
						<th scope="col" class="table-active"><div>주차 종료일</div></th>
						<th scope="col" class="table-active"><div>결제일</div></th>
						<th scope="col" class="table-active"><div>결제 수단</div></th>
						<th scope="col" class="table-active"><div>결제 금액</div></th>
						<th scope="col" class="table-active"><div>충전기 사용 유무</div></th>
						<th scope="col" class="table-active"><div>예약 취소</div></th>
					</tr>
				</table>
		  </div>
		</div>
		
		<!-- 결제 내역 -->
		<div class="collapse" id="paymentcollapse">
		  <div class="card card-body">
		    <table class="container table table-bordered" id="paymentListTable">
		    	<tr>
		    		<th colspan="3"><button type="button" class="btn btn-outline-secondary" id="CardInsert" style="font-size:12px;">카드 등록</button></th>
		    	</tr>
			</table>
			<span style="font-size:12px;text-align:center;">결제 카드는 최대 3개 까지 등록 가능합니다.</span>
		  </div>
		</div>
		
		<!-- 쿠폰 정보 -->
		<div class="collapse" id="couponcollapse">
		  <div class="card card-body">
		    
			<span style="font-size:12px;text-align:center;">쿠폰</span>
		  </div>
		</div>
		</div>
	</div>
	
	<!-- 카드 등록 모달 -->
	<div class="modal fade" id="cardInsertModal" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
			        <h6 class="modal-title fs-7" id="staticBackdropLabel">결제 카드 등록</h6>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" align="center">
					<div id="cardpaymentGroup">
			
					<div id="insertcardnumGroup">
					<span>카드 번호:</span>
						<input type="text" id="cardNum1" class="form-control numcheck" placeholder="****">
						<input type="text" id="cardNum2" class="form-control numcheck" placeholder="****">
						<input type="text" id="cardNum3" class="form-control numcheck" placeholder="****">
						<input type="text" id="cardNum4" class="form-control numcheck" placeholder="****">
					</div>
					
					<br/>
					<div class="carddateGroup">
						<span>유효 기간:</span>
						<input type="text" id="cardDate" name="cardDate" class="form-control" style="width:100px;" placeholder="24/12" value="">
						
						<span style="margin-left:20px;">카드사:</span>
						<select id="cardName" name="cardName" class="form-select" style="width:120px;">
								<option value="선택" selected>카드 선택</option>
								<option value="bc">비씨 카드</option>
								<option value="hana">하나 카드</option>
								<option value="hyundai">현대 카드</option>
								<option value="kb">KB국민 카드</option>
								<option value="lotte">롯데 카드</option>
								<option value="nc">농협 카드</option>
								<option value="samsung">삼성 카드</option>	
								<option value="sinhan">신한 카드</option>							
								<option value="woori">우리 카드</option>	
							</select>
					</div>
					
					<br/>
					<div class="cardpasscvc">
						<span>비밀 번호:</span>
						<input type="password" id="cardPass" name="cardPass" class="form-control numcheck" style="width:100px;" placeholder="****" value="">
						<span style="margin-left:40px;">cvc:</span>
						<input type="password" id="cvc" name="cvc" class="form-control numcheck" style="width:100px;" placeholder="***" value="">	
					</div>
					
					</div>
			      </div>
			    <hr/>  
				<div align="center">
					<button type="button" class="btn btn-outline-secondary" id="cardInsert" style="margin-right:60px; width:80px;font-size:12px;">등 록</button>
					<button type="button" class="btn btn-outline-secondary " id="cardInsertCancle" style="width:80px;font-size:12px;" data-bs-dismiss="modal">취 소</button>
				</div>
				<br/>
			</div>
		</div>
	</div>
	
	<!-- 기존 비밀번호 확인 모달 -->
	<div class="modal fade" id="passWordcheckModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content" style="width:80%;left:10%;">
	      <div align="center" style="margin-bottom:10px;margin-top:20px;">
		      <strong>H/<span style="color: #47ccc5;">EV</span>Parking</strong>
		    </div>
		    <hr/>
	      <div class="modal-body" align="center" style="font-size:14px;">
	      	<p>비밀번호 변경</p>
	      	<input type="password" class="myModalWriteinputbox" id="passCheckinputPass" value="" style="text-align:center;border-radius: 5px;" placeholder="기존 비밀번호 입력">
	      	<p id="passCheckFalse" style="margin-top:10px;color:red;display:none;">비밀번호가 틀렸습니다. 다시 확인해 주세요</p>
	      </div>
	      <hr/>	
	      <div align="center" style="margin-bottom:10px;">
	      	<button type="button" id="passWordCheck" class="btn" style="font-size:12px;width:80px;">확 인</button>
	        <button type="button" id="passWordCheckCancel" class="btn" data-bs-dismiss="modal" style="font-size:12px;width:80px;margin-left:20px;">취 소</button>  
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	<!-- 비밀번호 변경 입력 모달 -->
	<div class="modal fade" id="passWordWriteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content" style="width:80%;left:10%;">
	      <div align="center" style="margin-bottom:10px;margin-top:10px;">
		      <strong>H/<span style="color: #47ccc5;">EV</span>Parking</strong>
		    </div>
		    <hr/>
	      <div class="modal-body" align="center" style="font-size:12px;">
	      	<p>새로운 비밀번호 입력</p>
	      	<input type="password" class="myModalWriteinputbox" id="inputChangePass" value="" style="text-align:center;border-radius: 5px;" placeholder="새로운 비밀번호 입력">
	      	<input type="password" class="myModalWriteinputbox" id="inputChangePassre" value="" style="text-align:center;border-radius: 5px; margin-top:20px;" placeholder="비밀번호 확인">
	      </div>
	      <p id="passCheckFalse" style="margin-top:10px;color:red;display:none;">비밀번호가 틀렸습니다. 다시 확인해 주세요</p>
	      <hr/>
	      <div align="center" style="margin-bottom:10px;margin-top:10px;">
	      	<button type="button" id="passWordChange" class="btn" style="font-size:12px;width:80px;">확 인</button>
	        <button type="button" id="passWordChangeCancel" class="btn" data-bs-dismiss="modal" style="font-size:12px;width:80px;margin-left:20px;">취 소</button>  
	      </div>
	      
	    </div>
	  </div>
	</div>
<jsp:include page="mymodal.jsp"></jsp:include>

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var htmlElement = document.querySelector('html');
    if (htmlElement.classList.contains('no-js')) {
        htmlElement.classList.remove('no-js');
    }
});
</script>	
</body>
</html>