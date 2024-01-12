<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Custom Confirm</title>

	<!-- CSS폴더 경로 -->
	<link rel="stylesheet" href="css/mymodal.css">

	<!-- JQuery 로딩  -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	
  	<!-- mymodal -->
  	<script type="text/javascript" src="js/mymodal.js"></script>
  	
  	<!-- Bootstrap 5.2.3 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	
  	<!-- datetimepicker -->
  	<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js"></script>
	
	<!-- 날짜 형식 변환 moment -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  	
  	<!-- 카카오 주소 api -->
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  	
  	<!-- 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@400;700&display=swap" rel="stylesheet">
    
</head>

<body>
	
	<!-- 경고창 모달 -->
	<div class="modal fade" id="alertModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content" style="width:80%;left:10%;">
	    	<div align="center" style="margin-bottom:10px;margin-top:20px;">
		      <strong>H/<span style="color: #47ccc5;">EV</span>Parking</strong>
		    </div>
		   
	      <div class="modal-body" align="center" style="font-size:14px;"></div>
	      <div align="center" style="margin-bottom:20px;">
	        
	        <button type="button" id="alertModalcheck" class="btn" data-bs-dismiss="modal" style="font-size:12px;width:80px;">확 인</button>  
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 확인창 모달 -->
	<div class="modal fade" id="confirmModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content" style="width:80%;left:10%;">
	      <div align="center" style="margin-bottom:10px;margin-top:20px;">
		      <strong>H/<span style="color: #47ccc5;">EV</span>Parking</strong>
		    </div>
		    
	      <div class="modal-body" align="center" style="font-size:14px;"></div>
	      <div align="center" style="margin-bottom:10px;margin-top:10px;">
	      
	      	<button type="button" id="confirmModalcheck" class="btn" style="font-size:12px;width:80px;">확 인</button>
	        <button type="button" id="confirmModalcancel" class="btn" data-bs-dismiss="modal" style="font-size:12px;width:80px;margin-left:20px;">취 소</button>  
	      </div>
	      
	    </div>
	  </div>
	</div>

</body>
</html>