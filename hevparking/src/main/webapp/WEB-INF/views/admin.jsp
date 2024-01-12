<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.vo.AdminVO" %>
<%@ page import="com.example.demo.vo.MemberVO" %>          
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>H/EV Parking(메인)</title>
	
	<!-- CSS폴더 경로 -->
  	<link rel="stylesheet" href="css/admin.css">
  	
  	<!-- JQuery 로딩  -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	
  	<!-- js폴더 경로 -->
  	<script type="text/javascript" src="js/admin.js"></script>
  	
  	<!-- Bootstrap 5.2.3 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  
</head>

<!-- 로그인이 필요한 기능  -->
<script type="text/javascript">
	$(function(){

	$('#parkingresbtn').click(function(){
		var sessionVo = '<%=session.getAttribute("MemberVO")%>';

			if (sessionVo === 'null') {
				if (confirm("로그인이 필요합니다." + "\n" + "확인을 누르면 로그인 창으로 이동합니다.")) {
					window.location.href = "/login";
					return false;
				} else {
					return false;
				}
			}
		});
	});
</script>

<body>
<!--  <div id="topnav">adfadfafaf</div> -->
<div class="overlay-navigation">
  <nav role="navigation">
  
    <ul>
      <li><img id="noticeboardbg" width="900" height="100%" src="../image/index/subnoticeBoard.jpg"><a href="noticeBoard" id="noticeBoard" data-content="주차 관련 공지사항">공지사항 관리</a></li>
      <li><img id="parkingresbg" width="800" height="100%" src="../image/index/parking.jpg"><a href="#" id="parkingRes" data-content="주차 관리">주차 관리</a></li>
      <li><img id="parkingresbg" width="1000" height="100%" src="../image/index/parkingres.jpg"><a href="#" id="chargeMuchine" data-content="충전기 관리">충전기 관리</a></li>
      <li><img id="searchMapbg" width="900" height="100%" src="../image/index/searchmap.jpg"><a href="#" id="management" data-content="회원 관리">회원 관리</a></li>
      <li><img id="inquirybg" width="900" height="100%" src="../image/index/inquiry.jpg"><a href="#" data-content="주차 관련 문의">문의사항 관리</a></li>
      <%if(session.getAttribute("AdminVO") != null && session.getAttribute("MemberVO") == null){%> 
      <li><img id="loginbg" width="900" height="100%" src="../image/index/index_res.jpg"><a href="#"><%=((AdminVO) session.getAttribute("AdminVO")).getAdminName()%> 님</a><a href="index" class="textcss" id="adminlogout">로그아웃</a>
			
			<%}else if(session.getAttribute("MemberVO") != null && session.getAttribute("AdminVO") == null){%>
			
			<li><img id="loginbg" width="900" height="100%" src="../image/index/sublogin.jpg"><a href="myInfo"><%=((MemberVO) session.getAttribute("MemberVO")).getMemName()%> 님</a><br/><a href="index" class="textcss" id="logout">로그아웃</a>
			
			<%}else if(session.getAttribute("AdminVO") == null || session.getAttribute("MemberVO") == null){%>
			<li><img id="loginbg" width="900" height="100%" src="../image/index/sublogin.jpg"><a href="login" data-content="로그인/회원가입" id="login">로그인</a>	
			<%}%>
      </li>
    </ul>
  </nav>
</div>


</body>
</html>