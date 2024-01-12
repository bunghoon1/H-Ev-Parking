<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.vo.MemberVO" %>          
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>H/EV Parking(전기차/일반차 주차 시스템)</title>
    
  	<!-- JQuery 로딩  -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  	<!-- Bootstrap 5.2.3 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	
  	<!-- CSS폴더 경로 -->
  	<link rel="stylesheet" href="css/index.css">
  	
  	<!-- js폴더 경로 -->
  	<script type="text/javascript" src="js/index.js"></script>
  	
</head>

<body>
<input type="hidden" id="memCode" value="<%=(MemberVO) session.getAttribute("MemberVO")%>">

<img id="bg" src="../image/index/mainbg.jpg">

<div id="startGroup">
<a href="index" id="startlogo"><strong style="color:white;">H/<span style="color: #6decf7;">Ev</span> Parking</strong></a>

<!-- 공지사항  -->
<a href="noticeBoard" id="gonoticeBoard"><input type="image" id="mainbg_noticeboard" width="280" src="../image/index/mainbg_noticeboard.png"></a>

<!-- 전기차 주차장 조회 -->
<a href="searchMap" id="gosearchMap"><input type="image" id="mainbg_searchmap" width="1950px" src="../image/index/mainbg_searchmap.png"></a>

<%if(session.getAttribute("MemberVO") == null){%> 
	
	<!-- information text group -->
	<p id="parkingInfoText"><Strong>주차정보</Strong></p>	
	<p id="parkingresText"><Strong>주차 예약</Strong></p>
	<p id="noticeBoardText"><Strong>공지 사항</Strong></p>
	<p id="searchMapText"><Strong>충전소 검색</Strong></p>
	<p id="infotext"><Strong>이미지를 클릭하면 필요한 서비스를 이용할 수 있습니다.</Strong></p>
		
	<div class="logingroup">
	<a href="login" id="memberInfoText"><Strong>로그인</Strong></a>
	<a href="signupTerms" id="gosignup"><Strong>회원가입</Strong></a>
	</div>
		
	<!-- 주차 목록 -->
	<a href="#" id="goparkinglist"><input type="image" id="mainbg_car" src="../image/index/mainbg_car.png"></a>
		
	<!-- 주차 예약, 충전기 예약 -->
	<a href="#" id="goparkingres"><input type="image" id="mainbg_charge" src="../image/index/mainbg_charge.png"></a>	
	
</div>

<%}else{%>
	<div class="logingroup">
	<a href="#" id="myInfo" data-index="<%=((MemberVO) session.getAttribute("MemberVO")).getMemCode()%>"><strong><%=((MemberVO) session.getAttribute("MemberVO")).getMemName()%> 님</strong></a> <a href="#" class="textcss" id="logout"><strong>로그아웃</strong></a>	
	</div>
	
	<!-- information text group -->
	<p id="parkingInfoText"><Strong>주차정보</Strong></p>	
	<p id="parkingresText"><Strong>주차 예약</Strong></p>
	<p id="noticeBoardText"><Strong>공지 사항</Strong></p>
	<p id="searchMapText"><Strong>충전소 검색</Strong></p>
	<p id="infotext"><Strong>이미지를 클릭하면 필요한 서비스를 이용할 수 있습니다.</Strong></p>
	
	<!-- 주차 목록 -->
	<a href="#" id="goparkinglist"><input type="image" id="mainbg_car" src="../image/index/mainbg_car.png"></a>
	
	<!-- 주차 예약, 충전기 예약 -->
	<a href="parkingRes" id="goparkingres"><input type="image" id="mainbg_charge" src="../image/index/mainbg_charge.png"></a>
	
	
	<div class="modal fade" id="parkinglist" aria-hidden="true" aria-labelledby="exampleModalToggleLabel3" tabindex="-1">
	<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered modal-xl">
		<div class="modal-content">
			<div class="modal-body">
				<div class="logo" align="center">
					<strong>H/<span style="color: #13afd6;">EV</span>Parking</strong>
				</div>
				<br/>
				<table class="table container table-sm" id="parkingListTable">
					
					<tr style="dispaly: flex;">
						<th scope="col" class="table-active"><div>주차 위치</div></th>
						<th scope="col" class="table-active"><div>주차 예약</div></th>
						<th scope="col" class="table-active"><div>주차 시작일</div></th>
						<th scope="col" class="table-active"><div>주차 종료일</div></th>
						<th scope="col" class="table-active"><div>남은 시간</div></th>
						<th scope="col" class="table-active"><div>결제 수단</div></th>
						<th scope="col" class="table-active"><div>주차예약상태</div></th>
						<th scope="col" class="table-active"><div>결제 금액</div></th>
						<th scope="col" class="table-active"><div>충전기 사용 유무</div></th>
						<th scope="col" class="table-active"><div>예약 취소</div></th>
					</tr>
				</table>
				<br/>
				<p align="center" style="font-size:12px;"><span style="color:red;">*</span> '<span style="color:green;">결제 진행중</span>' 예약은 결제를 진행하지 않으면 <span style="color:red;">30분</span> 후 데이터는 사라집니다.</p>
				<p align="center" style="font-size:12px;"><span style="color:red;">*</span> 결제를 원하지 않으시면 <span style="color:red;">예약 취소</span> 를 눌러 취소를 진행해 주세요.<span style="color:red;">(취소시 예약정보 삭제)</span></p>
			
			</div>
		</div>
	</div>
</div>
<%}%>


<jsp:include page="mymodal.jsp"></jsp:include>
</body>

</html>