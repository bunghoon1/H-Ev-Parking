<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<!-- JQuery 로딩  -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  
  	<!-- Bootstrap 5.2.3 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	
  	<!-- CSS폴더 경로 -->
  	<link rel="stylesheet" href="css/login.css">
  	
  	<!-- js폴더 경로 -->
  	<script type="text/javascript" src="js/login.js"></script>
  	
  	<script type="text/javascript" src="js/mymodal.js"></script>
	
</head>
<body>
<img src="image/login.jpg" id="bgimage" class="first"/>	
<div class="wrapper fadeInDown">

  <div id="formContent">

    <br/>
    <div class="fadeIn second">
      <a href="index" style="font-size: 20px;text-decoration: none;color: rgb(162, 162, 162);"><strong>H/<span style="color: #47ccc5;">EV</span>Parking</strong></a>
    </div>
	<br/>
    <input type="text" id="memId" class="fadeIn third" name="login" placeholder="아이디">
    <input type="password" id="memPw" class="fadeIn fourth" name="login" placeholder="비밀번호">
    <button type="button" id="login" class="fadeIn five">로그인</button>

    

    <div id="formFooter">
      <button id="signup" class="fadeIn six" onclick="location='signupTerms'">회원 가입</button>
      <button id="findpw" class="fadeIn seven">비밀번호 찾기</button>
    <br/>
    <br/>
    <br/>
    </div>
  </div>
</div>
<jsp:include page="mymodal.jsp"></jsp:include>
  </body>
</html>
