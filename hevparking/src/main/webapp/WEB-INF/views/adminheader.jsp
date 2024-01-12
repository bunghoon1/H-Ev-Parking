<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.vo.AdminVO"%>
<%@ page import="com.example.demo.vo.MemberVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- CSS폴더 경로 -->
	<link rel="stylesheet" href="css/adminheader.css">

	<!-- JQuery 로딩  -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- js폴더 경로 -->
	<script type="text/javascript" src="js/adminheader.js"></script>
	
</head>
	
<body>
	<div id="navGroup">
		<nav>
			<div class="container borderYtoX">

				<!-- 회원 로그인  -->
				<%if (session.getAttribute("MemberVO") != null && session.getAttribute("AdminVO") == null) {%>
				<a href="index" class="logo"><strong style="font-size: 22px; color: white;">H/<span style="color: #47ccc5;">Ev</span> Parking</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="noticeBoard" class="textcss">공지 사항</a>
				<a href="parkingRes" class="textcss" id="resparkingbtn">주차 예약</a> 
				<a href="searchMap" class="textcss">충전소 조회</a>
				<a href="#" class="textcss" style="margin-right: 50px;">문의사항</a> 
				<a href="myInfo" class="textcss" style="color: #8df0ec; margin-left: 6%; font-size: 12px;"><%=((MemberVO) session.getAttribute("MemberVO")).getMemName()%>님</a> 
				<a href="login" class="textcss" id="logout" style="color: #7acaff; font-size: 12px;">로그아웃</a>
				
				<!-- 관리자 로그인  -->
				<%} else if(session.getAttribute("MemberVO") == null && session.getAttribute("AdminVO") != null){%>
				<a href="admin" class="textcss" id="gomain" style="color: white; font-size: 12px;">메인 화면으로 이동</a>
				<a href="admin" class="logo"><strong style="font-size: 22px; color: white; margin-left:200px;margin-right:100px;">H/<span style="color: #47ccc5;">Ev</span> Parking</strong></a>
				
				<a href="myInfo" class="textcss" style="color: #8df0ec; margin-left: 6%; font-size: 12px;"><%=((AdminVO) session.getAttribute("AdminVO")).getAdminName()%>님</a> 
				
				<a href="login" class="textcss" id="adminlogout" style="color: #7acaff; font-size: 12px;">로그아웃</a>
				
				<!-- 로그인필요! -->
				<%} else if((session.getAttribute("MemberVO") == null && session.getAttribute("AdminVO") == null)){%>
					<script type="text/javascript">
						$(function(){
							$(document).ready(function(){
								alertmodalTrue("로그인이 필요한 페이지 입니다.<br/> 로그인 페이지로 이동합니다.",function(yes){
									if(yes){
										window.location.href = "login";
									}
								});
							});
						});
					
					</script>
				<%}%>
			</div>
		</nav>
	</div>
<jsp:include page="mymodal.jsp"></jsp:include>
</body>
</html>

