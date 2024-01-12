<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.vo.MemberVO" %>
        
<!doctype html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주차 관리</title>
  	
  	<!-- CSS폴더 경로 -->
	<link rel="stylesheet" href="css/parkingResPayment.css">

	<!-- JQuery 로딩  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- js폴더 경로 -->
	<script type="text/javascript" src="js/parkingResPayment.js"></script>
	
  	<!-- 이미지 슬라이드 -->
  	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  	
  	
</head>
<body>
	<input type="hidden" id="memCode" name="memCode" value="${memCode}"/>
	<input type="hidden" id="prsCode" name="prsCode" value="${prsCode}"/>
	<img src="../image/parkingresPayment/paymentbg.jpg" id="backgroundbg"/>
	
	<div id="resNexttable">
		<div id="tablebg">
		<br/>
		<div align="center">
      		<a href="#" class="logo"><strong>H/<span style="color:#47ccc5;">EV</span>Parking</strong></a>
   		</div>
   		
   		<!-- 회원 정보 -->
   		<table class="infotable">
		<tr>
			<th colspan="2"><div id="parkingresInfo">회원 정보</div><hr/></th>
		</tr>
		
		<tr>
			<td><div>이 름</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="memName"></td>
		</tr>
		
		<tr>
			<td><div>연락처</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="memPhone"></td>
		</tr>	
		
		</table>
		<br/>
		
		
		<!-- 주차 정보 -->
		<table class="infotable">
		<tr>
			<th colspan="2"><div id="parkingresInfo">주차 예약 정보</div><hr/></th>
		</tr>
		
		<tr>
			<td><div>주차 구역</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="prsArea"></td>
		</tr>
		
		<tr>
			<td><div>주차 위치</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="prsLocation"></td>
		</tr>
			
		<tr>
			<td><div>주차 타입</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="prsType"></td>
		</tr>	
		
		<tr>
			<td><div>주차 시작일</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="startDate"></td>
		</tr>
		
		<tr>
			<td><div>주차 종료일</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="endDate"></td>
		</tr>
		
		<tr>
			<td><div>주차 이용 시간</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="restime"></td>
		</tr>
		
		<tr>
			<td><div>주차 이용 요금</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="price"></td>
		</tr>
		</table>
		
		
		<table class="infotable" id="chargeinfoTable">
		
		<tr>
			<th colspan="2"><div id="chargeInfo">충전기 사용 정보</div><hr/></th>	
		</tr>
		
		<tr>
			<td width="500"><div>충전기 이름/속도</div></td>
			<td width="800" align="right"><input type="text" class="paymentInfo" id="chargeName" >
			<input type="hidden" class="paymentInfo" id="chargeCode" name="chargeCode" style="display:none;">
			</td>
		</tr>	
		
		<tr>
			<td><div>충전기 타입</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="chargeType" ></td>
		</tr>
		
		<tr>
			<td><div>충전기 이용 시간</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="chargeTime" name="chargeTime"></td>
		</tr>
		
		<tr>
			<td><div>충전기 이용 요금</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="chargePrice" name="chargePrice"></td>
		</tr>		
		
		</table>
		
		<input type="hidden" id="paymentType" name="paymentType">
		
		<!-- 결제 선택 -->
		<table class="infotable">
		<tr>
			<th colspan="2" width="800px;">
			<div id="paymentChoice">결제 선택</div><hr/>
			</th>	
		</tr>
		
		<tr>
			<td>
				<div class="accordion accordion-flush" id="accordionFlushExample" style="width:440px;">
				  <div class="accordion-item">
				    <div class="accordion-header">
				      <button class="accordion-button collapsed choicePayment" id="card" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
				        카드 결제
				      </button>
				    </div>
				    <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample" data-index="카드결제">
				      <div class="accordion-body">
				      	<!-- 카드 결제 -->
				      	<div class="swiper-container">
						
						<!-- 카드 정보, 카드 추가 -->
						<div class="swiper-wrapper">
							<div class="swiper-slide" id="newCardButton">
							<input type="hidden" class="cardcodeval">
							
							<svg xmlns="http://www.w3.org/2000/svg" width="70" height="70" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16" style="margin-top:10px;">
							  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
							  <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
							</svg>
							</div>
						</div>
						
						<div class="swiper-pagination"></div>
						<div class="swiper-button-prev"></div>	
						<div class="swiper-button-next"></div>
						</div>
						<br/>
						<br/>	
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <div class="accordion-header">
				      <button class="accordion-button collapsed choicePayment" id="acc" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
				        계좌 이체
				      </button>
				    </div>
				    <div id="flush-collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample" data-index="계좌이체">
				      <div class="accordion-body" align="center">
				      <br/>
						<table id="accGroup">
						<tr>
							<td align="right"><span>은행 이름:</span></td>
							<td align="center">
							<select id="accBank" name="accBank" class="form-select">
								<option value="" selected>은행 선택</option>
								<option value="kb">국민 은행</option>
								<option value="we">우리 은행</option>
								<option value="sinhan">신한 은행</option>
								<option value="hana">하나 은행</option>
								<option value="nc">농협 은행</option>
								<option value="ibk">기업 은행</option>
								<option value="ct">씨티 은행</option>
								<option value="sc">SC제일 은행</option>
								<option value="postoffice">우체국</option>
								<option value="busan">부산 은행</option>
								<option value="gyeongnam">경남 은행</option>
								<option value="daegoo">대구 은행</option>
								<option value="gwangju">광주 은행</option>
								<option value="jeju">제주 은행</option>
								<option value="kakao">카카오 뱅크</option>	
							</select>
							</td>
						</tr>
						<tr>
							<td align="right">예금주:</td>
							<td><input type="text" id="accName" name="accName" class="form-control" value=""></td>
						</tr>
						<tr>
							<td align="right">계좌 번호:</td>
							<td><input type="text" id="accNum" name="accNum" class="form-control" value=""></td>
						</tr>
						</table> 
				      </div>
				    </div>
				 </div>
			 </div>
		</table>
		
		<!-- 요금 합계  -->
		<table class="infotable">
		<tr>
			<th colspan="2"><div id="paymentTotal">합 계</div><hr/></th>
		</tr>
		
		<tr>
			<td width="500;"><div>주차 요금</div></td>
			<td width="700" align="right"><input type="text" class="paymentInfo" id="finalprsprice"></td>
		</tr>
		
		<tr id="chargePriceShow">
			<td width="500;"><div>충전 요금</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="finalchargeprice"></td>
		</tr>
		
		<tr>
			<td width="500;"><div>총 결제 금액</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="totalprice"></td>
		</tr>
		
		</table>
		<br/>
		<br/>
		<br/>
		
		<div class="finalbtnGroup">
			<button type="button" class="btn btn-outline-secondary" id="resfinalbtn">결 제</button> 
			<button type="button" class="btn btn-outline-secondary" id="resfinalcancel" style="margin-left:70px;">취 소</button>
		</div>
		<br/>
		<br/>
		</div>
		</div>	
		<br/>
		
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
								<option value="" selected>카드 선택</option>
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
	
	<div class="modal fade" id="FinalPassCheck" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
</body>
</html>