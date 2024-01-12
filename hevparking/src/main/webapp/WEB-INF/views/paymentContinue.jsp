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
	<script type="text/javascript" src="js/paymentContinue.js"></script>

	<!-- 날짜 형식 변환 moment -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

	<!-- datetimepicker -->
  	<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
  	
  	<!-- Bootstrap 5.2.3 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	
  	<!-- 이미지 슬라이드 -->
  	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  		
</head>
<body>
	<input type="text" id="prsCode" name="prsCode" value="${prsCode}"/>
	<input type="text" id="memCode" name="memCode" value="${memCode}"/>
	<img src="../image/parkingresPayment/paymentbg.jpg" id="backgroundbg"/>
	
	<div id="resNexttable">
		<div id="tablebg">
		<br/>
		<div align="center">
      		<a href="#" class="logo"><strong>H/<span style="color:#47ccc5;">EV</span>Parking</strong></a>
   		</div>
		
		<!-- 주차 정보 -->
		<table class="infotable">
		<tr>
			<th colspan="2"><div id="parkingresInfo">주차 예약 정보</div><hr/></th>
		</tr>
		
		<tr>
			<td><div>주차 구역</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="prsArea" value="${prsArea}"></td>
		</tr>
		
		<tr>
			<td><div>주차 위치</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="prsLocation" value="${prsLocation}"></td>
		</tr>
			
		<tr>
			<td><div>주차 타입</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="prsType" value="${prsType}"></td>
		</tr>	
		
		<tr>
			<td><div>주차 시작일</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="startDate" value="${startDate} ${startTime}">분</td>
		</tr>
		
		<tr>
			<td><div>주차 종료일</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="endDate" value="${endDate} ${endTime}">분</td>
		</tr>
		
		<tr>
			<td><div>주차 이용 시간</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="restime" value=""></td>
		</tr>
		
		<tr>
			<td><div>주차 이용 요금</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="price" value="${price}"></td>
		</tr>
		</table>
		
		
		<table class="infotable" id="chargeinfoTable">
		
		<tr>
			<th colspan="2"><div id="chargeInfo">충전기 사용 정보</div><hr/></th>	
		</tr>
		
		<tr>
			<td width="500"><div>충전기 이름/속도</div></td>
			<td width="800" align="right"><input type="text" class="paymentInfo" id="chargeName" value="${chargeName}">
			<input type="hidden" class="paymentInfo" id="chargeCode" name="chargeCode" value="${chargeCode}" style="display:none;">
			</td>
		</tr>	
		
		<tr>
			<td><div>충전기 타입</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="chargeType" value="${chargeType}"></td>
		</tr>
		
		<tr>
			<td><div>충전기 이용 시간</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="chargeTime" name="chargeTime" value="${chargeTime}시간"></td>
		</tr>
		
		<tr>
			<td><div>충전기 이용 요금</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="chargePrice" name="chargePrice" value="${timePrice}"></td>
		</tr>		
		
		</table>
		
		<input type="hidden" id="paymentType" name="paymentType" value="">
		
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
							<div class="swiper-slide" id="newCardButton" data-bs-toggle="modal" data-bs-target="#cardRegistration">카드 추가
							<input type="hidden" class="cardcodeval" readonly>
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
			<td width="700" align="right"><input type="text" class="paymentInfo" id="finalprsprice" value="${price}"></td>
		</tr>
		
		<tr>
			<td width="500;"><div>충전 요금</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="finalchargeprice" value=""><span id="won">원</span></td>
		</tr>
		
		<tr>
			<td width="500;"><div>총 결제 금액</div></td>
			<td align="right"><input type="text" class="paymentInfo" id="totalprice" value="">원</td>
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
		<div class="modal fade" id="cardRegistration" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
			        <h6 class="modal-title fs-5" id="staticBackdropLabel">결제 카드 등록</h6>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body" align="center">
					<div id="cardpaymentGroup">
			
					<div id="insertcardnumGroup">
					<span>카드 번호:</span>
						<input type="text" id="cardNum1" class="form-control numcheck">
						<input type="text" id="cardNum2" class="form-control numcheck">
						<input type="text" id="cardNum3" class="form-control numcheck">
						<input type="text" id="cardNum4" class="form-control numcheck">
					</div>
					
					<br/>
					<div class="carddateGroup">
						<span>유효 기간:</span>
						<input type="text" id="cardDate" name="cardDate" class="form-control" style="width:100px;" value="">
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
						<input type="password" id="cardPass" name="cardPass" class="form-control numcheck" style="width:100px;" value="">
						<span style="margin-left:40px;">cvc:</span>
						<input type="password" id="cvc" name="cvc" class="form-control numcheck" style="width:100px;" value="">	
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
<jsp:include page="mymodal.jsp"></jsp:include>
</body>
</html>