<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.vo.MemberVO"%>
<%@ page import="com.example.demo.vo.CarInfoVO"%>

<!doctype html>
<html lang="ko" class="no-js">
<head>
<meta charset="utf-8">
<title>주차 예약 화면</title>

	<!-- CSS폴더 경로 -->
	<link rel="stylesheet" href="css/parkingRes.css">
	
	<!-- JQuery 로딩  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- js폴더 경로 -->
	<script type="text/javascript" src="js/parkingRes.js"></script>

</head>

<body>

	<div id="opendoor">
		<div id="leftdoor" class="leftdoor"></div>
		<div id="rightdoor" class="rightdoor"></div>
	</div>
	
	<img src="../image/parkingres/parkingResbg.jpg" id="parkingResbg" />
	<img src="../image/parkingres/resbgImg.png" id="resbgImg" />
	<div id="parkingtable">
		<img src="../image/parkingres/resmap.png"/>

		<!-- ----------------------------------------------A버튼--------------------------------- -->
		<div id="btngroupA" class="EvCarLoc">
			<%for (int a = 1; a <= 33; a++) {%>
			<%if (a <= 9) {%>
			<button type="button" class="btn btn-outline-info locbtn" id="A0<%=a%>"  value="A0<%=a%>">A0<%=a%></button>
			<%} else {%>
			<button type="button" class="btn btn-outline-info locbtn" id="A<%=a%>"  value="A<%=a%>">A<%=a%></button>
			<%}}%>
		</div>

		<div id="chargebtngroupA">
			<%for (int a = 1; a <= 33; a++) {%>
			<%if (a <= 9) {%>
			<input type="image" class="chargebtn" src="../image/parkingres/chargingMuchine_gray.png" value="A0<%=a%>">
			<%} else {%>
			
			<%if (a == 10) {%><p style="width: 2px;"></p>
			<%}%><input type="image" class="chargebtn" src="../image/parkingres/chargingMuchine_gray.png" value="A<%=a%>">
			<%}}%>
		</div>

		<!-- ----------------------------------------------B1버튼--------------------------------- -->
		<div id="btngroupB1" class="EvCarLoc">
			<%for (int b = 1; b <= 38; b++) {%>
			<%if (b <= 9) {%><button type="button" class="btn btn-outline-info locbtn" id="B0<%=b%>" value="B0<%=b%>" >B0<%=b%></button>
			<%if (b % 5 == 0) {%>&nbsp;<%} else if (b == 9) {%>&nbsp;<%}%>
			<%} else {%>
			
			<button type="button" class="btn btn-outline-info locbtn" id="B<%=b%>" value="B<%=b%>" >B<%=b%></button>
			<%if ((b % 4) + 1 == 0) {%>&nbsp;<%} else if (b == 13 || b == 17 || b == 21 || b == 25) {%><p style="width: 8.0px;"></p>
			<%}else if(b == 29 || b == 34){%><p style="width: 12px;"></p><%}%>
			<%}}%>
		</div>

		<div id="chargebtngroupB1">
			<%for (int b = 1; b <= 38; b++) {%>
			<%if (b <= 9) {%><input type="image" class="chargebtn" src="../image/parkingres/chargingMuchine_gray.png" value="B0<%=b%>"><%
			if (b % 5 == 0) {%>&nbsp;<%} else if (b == 9) {%>&nbsp;<%}%>
			<%} else {%>
			
			<input type="image" class="chargebtn" src="../image/parkingres/chargingMuchine_gray.png" value="B<%=b%>">
			<%if ((b % 4) + 1 == 0) {%>&nbsp;<%} else if (b == 13 || b == 17 || b == 21) {
			%><p style="width: 8px;"></p><%
			} else if (b == 25 || b == 29 || b == 34) {
			%><p style="width: 9px;"></p><%}%><%}}%>
		</div>

		<!-- ----------------------------------------------B2버튼--------------------------------- -->
		<div id="btngroupB2" class="NmCarLoc">
			<%for (int b = 39; b <= 76; b++) {%>
			<button type="button" class="btn btn-outline-warning locbtn "id="B<%=b%>" value="B<%=b%>">B<%=b%></button>
			<%if (b == 43 || b == 47 || b == 51 || b == 55 || b == 59 || b == 63 || b == 67 || b == 72) {%><p style="width: 9.1px;"></p>
			<%}}%>
		</div>

		<!-- ----------------------------------------------C1,2버튼--------------------------------- -->
		<div id="btngroupC1" class="NmCarLoc">
			<%for (int c = 1; c <= 16; c++) {%>
			<%if (c <= 9) {%><button type="button" class="btn btn-outline-warning locbtn " id="C0<%=c%>" value="C0<%=c%>" >C0<%=c%></button>
			<%if (c == 2) {%><p style="width: 9px;"></p><%} else if (c == 6) {%><p style="width: 703px;"></p><%}%>
			<%} else {%>
			
			<button type="button" class="btn btn-outline-warning locbtn "
				id="C<%=c%>" value="C<%=c%>" >
				C<%=c%></button><%}}%>
		</div>

		<div id="btngroupC2" class="NmCarLoc">
			<%for (int c = 17; c <= 35; c++) {%><button type="button" class="btn btn-outline-warning locbtn " id="C<%=c%>" value="C<%=c%>" >C<%=c%></button>
			<%if (c == 18) {%><p style="width: 9px;"></p>
			<%} else if (c == 22) {%><p style="width: 35px;"></p>
			<%} else if (c == 25) {%><p style="width: 592px;"></p>
			<%}}%>
		</div>

		<!-- ----------------------------------------------D1버튼--------------------------------- -->
		<div id="btngroupD1" class="NmCarLoc">
			<%for (int d = 1; d <= 39; d++) {%><%
			if (d <= 9) {%>
			<button class="btn btn-outline-warning locbtn" id="D0<%=d%>" value="D0<%=d%>"  type="button">D0<%=d%></button>
			<%if (d == 1 || d == 6) {%><p style="width: 8.5px;"></p>
			<%}%><%} else {%>
			
			<button class="btn btn-outline-warning locbtn" id="D<%=d%>" value="D<%=d%>"  type="button">D<%=d%></button>
			<%if (d == 10 || d == 14 || d == 18 || d == 22 || d == 26 || d == 30 || d == 35) {%><p style="width: 11px;"></p>
			<%}}}%>
		</div>

		<!-- ----------------------------------------------D2버튼--------------------------------- -->
		<div id="btngroupD2" class="EvCarLoc">
			<%for (int d = 40; d <= 77; d++) {%><button class="btn btn-outline-info locbtn" id="D<%=d%>" value="D<%=d%>"  type="button">D<%=d%></button>
			<%if (d == 44 || d == 48 || d == 52 || d == 56 || d == 60) {%><p style="width: 9.9px;"></p>
			<%} else if (d == 64 || d == 68 || d == 73) {%><p style="width: 9.6px;"></p>
			<%}}%>
		</div>

		<div id="chargebtngroupD2">
			<%for (int d = 40; d <= 77; d++) {%><input type="image" class="chargebtn" src="../image/parkingres/chargingMuchine_gray.png" value="D<%=d%>">
			<%if (d == 44 || d == 48 || d == 52 || d == 56 || d == 60) {%><p style="width: 9.0px;"></p>
			<%} else if (d == 64 || d == 68) {%><p style="width: 9.8px;"></p>
			<%} else if (d == 73) {%><p style="width: 11px;"></p>
			<%}}%>
		</div>

		<!-- ----------------------------------------------E버튼--------------------------------- -->
		<div id="btngroupE" class="EvCarLoc">
			<%for (int e = 1; e <= 30; e++) {%>
			<%if (e <= 9) {%><button type="button" class="btn btn-outline-info locbtn" id="E0<%=e%>"  value="E0<%=e%>">E0<%=e%></button>
			<%if (e == 9) {%><p style="width: 374px;"></p><%}%>
			
			<%} else {%><button type="button" class="btn btn-outline-info locbtn" id="E<%=e%>" value="E<%=e%>">E<%=e%></button>
			<%if (e == 14 || e == 23) {%><p style="width: 10px;"></p>
			<%}else if(e == 18 || e == 27){%><p style="width: 13px;"></p><%}}}%>
		</div>

		<div id="chargebtngroupE">
			<%for (int e = 1; e <= 30; e++) {%>
			<%if (e <= 9) {%><input type="image" class="chargebtn" src="../image/parkingres/chargingMuchine_gray.png" value="E0<%=e%>">
			<%if (e == 9) {%><p style="width: 374px;"></p><%}%><%} else {%>
			<%if (e == 10) {%><p style="width: 2px;"></p><%}%><input type="image" class="chargebtn" src="../image/parkingres/chargingMuchine_gray.png" value="E<%=e%>">
			<%if (e == 14 || e == 18 || e == 23 || e == 27) {%><p style="width: 12px;"></p><%}%><%}}%>
		</div>

		<!-- ----------------------------------------------F버튼--------------------------------- -->
		<div id="btngroupF" class="NmCarLoc">
			<%for (int f = 1; f <= 19; f++) {%><%
			if (f <= 9) {%><button class="btn btn-outline-warning locbtn rotate" id="F0<%=f%>" value="F0<%=f%>"  type="button">F0<%=f%></button>
			<%if (f == 4 || f == 8) {%><p style="height: 4px;"></p><%}%>
			<%} else {%><button class="btn btn-outline-warning locbtn rotate" id="F<%=f%>" value="F<%=f%>"  type="button">F<%=f%></button>
			<%if (f == 11) {%><p style="height: 4px;"></p><%} else if (f == 15) {%><p style="height: 2px;"></p><%
			}}}%>
		</div>

		<!-- view 버튼 , 실시간 좌석 확인 -->
		<div id="viewselectGroup">
			<input type="radio" class="btn-check viewbtn" id="viewEv" name="viewselect" value="전기차"> 
			<label class="btn btn-outline-dark viewselect" id="selectEv" for="viewEv">전기차</label> 
			
			<input type="radio" class="btn-check viewbtn" id="viewAll" name="viewselect" value="전 체" checked> 
			<label class="btn btn-outline-dark viewselect" id="selectAll" for="viewAll">전 체</label> 
			
			<input type="radio" class="btn-check viewbtn" id="viewNm" name="viewselect" value="일반차">
			<label class="btn btn-outline-dark viewselect" id="selectNm" for="viewNm">일반차</label>
		</div>

		<!-- 실시간 주차 자리 갯수  -->
		<div id="realtimeseat">
		 	<input type="text" class="form-control" id="evcarCount" style="color: #00e6da; margin-right:232px;">
			<input type="text" class="form-control" id="nmcarCount" style="color: white;" readonly>
		</div>
	</div>

	<!--  주차 예약 모달 -->
		<div class="modal fade modalTable" id="nmcar" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="font-size: 12px; padding: 2%">
					<div class="modal-body">
						<div>
							<input type="hidden" class="form-control" id="memCode" name="memCode" value="<%=((MemberVO) session.getAttribute("MemberVO")).getMemCode()%>" /><!-- 멤버코드 숨겨져있음 -->
						</div>

						<div style="text-align: center; font-size: 22px;">
							<a href="index" class="logo"> <strong>H/<span style="color: #47ccc5;">EV&nbsp;</span>Parking
							</strong></a>
						</div>
						<hr />

						<div class="modalcss">
							<strong>주차 위치 </strong> <input type="text" class="form-control" id="prsLocation" name="prsLocation"/>(<input type="text" class="form-control" id="prsArea" name="prsArea">)
						</div>

						<div class="modalcss">
							<strong id="parktype">주차 유형</strong> <input type="radio" class="btn-check resCategory" id="pktypenm" name="prsType" value="일반 주차" checked>
							<label class="btn btn-outline-secondary" for="pktypenm" id="pktypenmlabel" style="font-size: 10px;">일반 주차</label> 
							<input type="radio" class="btn-check resCategory" id="pktypeev" name="prsType" value="정기 주차"> 
							<label class="btn btn-outline-secondary" for="pktypeev" style="margin-right: 5%; font-size: 10px;">정기 주차</label>

						</div>

						<div class="modalcss">
							<strong>주차 시작일/시간</strong> 
							<input type="text" class="resinput" id="startDate" name="startDate" placeholder="시작일"/> <input type="text" class="resinput timeGrop" id="startTime" name="startTime" placeholder="시작시간"/>
							<button type="button" class="btn btn-outline-secondary" id="resreset">초기화</button>
						</div>

						<div class="modalcss">
							<strong>주차 종료일/시간</strong> 
							<input type="text" class="resinput" id="endDate" name="endDate" placeholder="종료일"/>
							<input type="text" class="resinput timeGrop" id="endTime" name="endTime" placeholder="종료시간"/>
							<button type="button" class="btn btn-outline-secondary" id="Evchargeselect">충전기</button>
						</div>

						<input type="hidden" id="paymentType" name="paymentType" value="결제진행중"/>

						<div class="modalcss">
							<strong>주차장 이용 시간</strong><input type="text" id="totaltime" name="totaltime" value="0"/>
						</div>

						<div class="modalcss">
							<strong>주차장 이용 요금</strong><input type="text" class="pricemodal" id="price" name="price" value="0"/>
						</div>

						<div class="modalcss" id="timePricegroup">
							<strong>충전기 사용 요금</strong><input type="text" class="pricemodal" id="chargePrice" name="chargePrice" value="0"/>
						</div>

						<input type="hidden" id="carType" value="<%=((MemberVO) session.getAttribute("MemberVO")).getCarInfo().getCarCategory()%>"><br/>
						<div id="parkingrespriceInfo">
							<div style="margin-left: 25%; margin-right: 20%;"><span class="star">*</span> 주차요금은 10분당 500원으로 계산됩니다.
							</div>
							<div style="margin-left: 18%; margin-right: 10%;">
								<span class="star">*</span> 전기차는 주차 요금이 <span class="sale">50%</span>할인됩니다. <span class="star">(정기주차제외)</span>
							</div>
						</div>
						<br/>

						<div>
							<textarea placeholder="예약시 특이사항 입력(예:차량특이사항,기타문의)" id="comment"
								name="comment" class="resinput"
								style="color: black; resize: none;"></textarea>
						</div>
						<hr/>

						<br/>
						<div align="center">
							<input type="submit" class="btn btn-outline-secondary" id="gopayment" value="주차 예약" data-index="1" disabled>
							<input type="button" class="btn btn-outline-secondary" id="rescancel" value="취 소" style="margin-left: 80px;">
						</div>
						<br />
					</div>
				</div>
			</div>
		</div>

		<!-- 충전기 사용 modal(예약진행 화면) -->
		<div class="modal fade" id="chargemodal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content" style="width: 80%;">
					<div class="modal-body chargelogo">
						<strong>H/<span style="color: #13afd6;">EV</span>&nbsp;Parking
						</strong>
					</div>

					<div class="UsechargeGroup">
						<input type="hidden" id="chargeCode" name="chargeCode" style="display: none;"> <input type="hidden" class="chargeinfo" id="chargeusePrice" readonly /> <input type="hidden" id="chargeUse" name="chargeUse" value="no" readonly>
						<br/>
						<table class="table table-borderless" id="chargeModalTable">
							<tr>
								<td width="60"></td>
								<th>충전기 위치:</th>
								<td><input type="text" id="chargeLoc" name="chargeLoc" readonly /></td>
							</tr>

							<tr>
								<td></td>
								<th>충전기 이름:</th>
								<td><input type="text" id="chargeName" name="chargeName" readonly /></td>
							</tr>

							<tr>
								<td></td>
								<th>충전기 타입:</th>
								<td><input type="text" id="chargeType" name="chargeType" readonly /></td>
							</tr>

							<tr>
								<td></td>
								<th>사용 시간:</th>
								<td><select id="chargeTime" name="chargeTime">
										<option value="0" selected>충전시간 선택</option>
										<%for (int i = 1; i <= 12; i++) {%>
										<option value="<%=i%>"><%=i%>시간</option>
										<%}%>
								</select></td>
							</tr>

							<tr>
								<td></td>
								<th>충전 방식:</th>
								<td><input type="text" id="chargeState" name="chargeState"
									readonly /></td>
							</tr>
						</table>

						<div style="display: flex; margin-left: 60px; margin-top: 50px;">
							<button type="button" class="btn btn-outline-info chargemuchinebtn" id="chargeinput" style="margin-right: 65px;" data-index="">주차 예약</button>
							<button type="button" class="btn btn-outline-info chargemuchinebtn" id="chargecancel" data-bs-dismiss="modal">취 소</button>
						</div>
						<p id="UsechargeInfoText">충전기를 사용하려면 주차 예약을 진행해 주세요.</p>
					</div>
					<br/>
				</div>
			</div>
		</div>

	<!-- '결제 진행중' 모달 -->
	<div class="modal fade modalTable" id="paymentnot" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" style="width: 900px;">
			<div class="modal-content" style="font-size: 12px; padding: 2%">
				<div class="modal-body">
					<div class="paymentnotlogo" style="font-size:20px;">
						<strong>H/<span style="color: #13afd6;">EV</span>Parking</strong>
						<!-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" style="margin-left:250px;font-size: 12px;">X</button> -->
					</div>
					<br/>
					<br/>
					
					<table class="table container table-striped" id="parkingListTable">
						<tr>
							<th scope="col"><div>위 치</div></th>
							<th scope="col"><div>주차 시작일</div></th>
							<th scope="col"><div>주차 종료일</div></th>
							<th scope="col"><div>남은 시간</div></th>
							<th scope="col"><div>충전기 사용</div></th>
							<th scope="col"><div>결제 진행</div></th>
							<th scope="col"><div>예약 취소</div></th>
						</tr>
					</table>
					
					<br/>
					<p align="center"><span style="color:red;">*</span> '<span style="color:green;">결제 진행중</span>' 예약은 결제를 진행하지 않으면 <span style="color:red;">30분</span> 후 데이터는 사라집니다.</p>
					<p align="center"><span style="color:red;">*</span> 결제를 원하지 않으시면 <span style="color:red;">예약 취소</span> 를 눌러 취소를 진행해 주세요.<span style="color:red;">(취소시 예약정보 삭제)</span></p>
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- 예약일이 있는 주차 자리 버튼 모달 -->
	<div class="modal fade modalTable" id="parkingSuccessModal" data-bs-keyboard="false" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" style="width: 900px;">
			<div class="modal-content" style="font-size: 12px; padding: 2%">
				<div class="modal-body">
					<div class="paymentnotlogo" style="font-size:20px;">
						<strong>H/<span style="color: #13afd6;">EV</span>Parking</strong>
						<!-- <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" style="font-size: 12px;">X</button> -->
					</div>
					<br/>
					<br/>
					<div align="right" style="display:flex;margin-bottom:15px;">	
					<div style="margin-left:20px;margin-right:40px;">주차 위치:&nbsp;&nbsp;<input type="text" id="parkingModalprsLocation" style="width:45px;font-weight:600;background-color:white;border:0;" disabled></div>
					<div>현재 시간: <jsp:include page="digitalclock.jsp"></jsp:include></div>
					<span style="color:rgb(151, 203, 255);margin-left:420px;">■</span>회원의 주차
					</div>
					
					<table class="table container table-bordered" id="parkingListTableAddparking" style="text-align:center;">
					<thead style="background-color:table-striped;">	
						<tr>
							<th scope="col">주차 타입</th>
							<th scope="col">주차 시작일</th>	
							<th scope="col">주차 종료일</th>
							<th scope="col">종료일까지</th>
							<th scope="col">충전기 사용</th>
							<th scope="col">주차상태</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>	
					</table>
					
					<br/>
					<br/>
					<hr/>
					<div align="center">
						<button type="button" class="btn btn-outline-secondary" id="nextparkingResbtn" style="font-size:12px;width:80px;">예 약</button>
						<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" style="margin-left:60px;font-size:12px;width:80px;">취 소</button>
					</div>
					<br/>
					<br/>
					<br/>
					
					<p align="center"><span style="color:red;">*</span>'<span style="color:green;">예 약</span>'은 <span style="color:red;">'주차 종료시간'</span>이후에 예약이 가능합니다.</p>
					
				</div>
			</div>
		</div>
	</div>
<jsp:include page="mymodal.jsp"></jsp:include>
<jsp:include page="adminheader.jsp"></jsp:include>

<!-- 페이지가 로드된 후 html에있는 class 삭제 -->
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
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
