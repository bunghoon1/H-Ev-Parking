<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.demo.vo.AdminVO" %>
<%@ page import="com.example.demo.vo.MemberVO" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
	
	<!-- CSS폴더 경로 -->
  	<link rel="stylesheet" href="css/noticeBoard.css">
  	
  	<!-- JQuery 로딩  -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	
  	<!-- js폴더 경로 -->
  	<script type="text/javascript" src="js/noticeBoard.js"></script>
  	
  	<!-- Bootstrap 5.2.3 -->
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  	
</head>

<body>
<img id="bg" src="../image/noticeboard.jpg">
	
	<!-- 관리자로 로그인시 공지사항 -->
	<%if((AdminVO) session.getAttribute("AdminVO") != null){%>
	<div id="background">
	<input type="text" class="logincheck" id="managerId" name="managerId" value="admin"/>
		<section class="notice">
			<div class="page-title">
					<h3>공 지 사 항</h3>
				</div>
				<br/>
				
			<!-- 검색 -->
			<div id="board-search">
			<div class="container">
				<div class="search-window">
					<div class="search-wrap">
						<label for="search" class="blind">공지사항 내용 검색</label> 
						<input id="search" class="form-control" type="search" name="" placeholder="검색어를 입력해주세요."value="">
						<button type="submit" class="btn btn-dark" id="search">검 색</button>
						</div>	
					</div>
				</div>
				<br/>
				<button type="button" class="btn btn-outline-dark" id="insertBtn">공지 등록</button>
				<br/>
			</div>
			<br/>

			<!-- board list area -->
			<div id="board-list">
			<div class="accordion accordion-flush" id="accordionFlushExample">
			  	<table class="table" id="noticelisttable">
					<thead>
					<tr>
						<th width="112" style="padding-left:3%;">#</th>
						<th width="260">공지 타입</th>
						<th width="275">공지 제목</th>
						<th width="230">작성자</th>
						<th>등록 날짜</th>
					</tr>
					</thead>
					<tbody class="table-group-divider">
					
					</tbody>
				</table>	
			</div>
			</div>
			<br/>
			<br/>
		</section>
	</div>
	
	<!-- 회원,비회원으로 입장시 공지사항 -->
	<%}else{%>
	<div id="background">
	<input type="hidden" class="logincheck" value=" "/>
		<section class="notice">
			<div class="page-title">
				<h3>공 지 사 항</h3>
			</div>
			<br/>
			<!-- 검색 -->
			<div id="board-search">
				<div class="container">
					<div class="search-window">
						<div class="search-wrap">
						<label for="search" class="blind">공지사항 내용 검색</label> 
						<input id="search" class="form-control" type="search" name="" placeholder="검색어를 입력해주세요."value="">
						<button type="submit" class="btn btn-dark" id="search">검 색</button>
						</div>	
					</div>
				</div>
			</div>
			<br/>
			
			<!-- 등록된 공지 목록 -->
			<div id="board-list">
			<div class="accordion accordion-flush" id="accordionFlushExample">
			  	<table class="table" id="noticelisttable">
					<thead>
					<tr>
						<th width="112" style="padding-left:3%;">#</th>
						<th width="260">공지 타입</th>
						<th width="275">공지 제목</th>
						<th width="230">작성자</th>
						<th>등록 날짜</th>
					</tr>
					</thead>
					<tbody class="table-group-divider">
					
					</tbody>
				</table>	
			</div>
			</div>
			<br/>
			<br/>
		</section>
	</div>
	<%} %>
	
	<!-- 공지 등록 modal -->
	<div class="modal fade" id="insertNoticeModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered ">
	    <div class="modal-content" style="font-size:14px;">
	      
	      <div class="modal-body">
	      <br/>
	      
	      	<div style="text-align:center;font-size:20px;">
			<strong>H/<span style="color:#47ccc5;">EV</span>Parking</strong>
			</div>
			<br/>
	      	
	      
			<div class="insertnotice"><strong>이 름</strong>
		    <input type="text" class="textbox" id="adminName" name="adminId" value="주차 관리자" readonly/>
		    </div>
		    <hr/>
		     
		    <div class="insertnotice"><strong>제 목</strong>  	
		    <input type="text" class="textbox" id="noticeTitle" name="noticeTitle" style="width:52%;">
		    <select class="textbox" id="noticeType" name="noticeType" aria-label="Default select example" style="width:25%;margin-left:10px;">
				<option value="일반 공지" selected>일반 공지</option>
				<option value="중요 공지">중요 공지</option>
				<option value="주차 공지">주차 공지</option>
				
			</select>
		    </div>
		    <hr/>
		     
		    <div class="insertnotice"><strong>내 용</strong>  	
		    <textarea class="textbox" id="noticeContent" name="noticeContent" style="height: 200px; resize:none;"></textarea>
		    </div>
		    <hr/>
		     
		    <div class="insertnotice"><strong style="margin-left: 3%;margin-right: 2%;">비밀번호</strong>    	
		    <input type="password" class="textbox" id=noticePw name="noticePw" value="">
		    </div> 
		    <hr/>

		    <div class="insertnotice" align="center">  
		    
	        <button type="button" class="btn btn-secondary" style="width:90px;font-size:12px; margin-left:15%;" data-bs-dismiss="modal">취 소</button>
	        </div>
	        <br/>	
		   
	      </div>
	    </div>
	  </div>
	</div>
	<button type="button" class="btn btn-secondary" id="insertNotice" style="width:90px;font-size:12px; margin-left:27%;">등 록</button>
	<!-- 공지 삭제 비밀번호 체크 -->
	<div class="modal fade" id="checkpw" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">비밀번호</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input type="password" class="form-control" id="noticePwcheck" placeholder="비밀번호 입력">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="pwcheckButton">확 인</button>
	        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취 소</button> -->
	      </div>
	    </div>
	  </div>
	</div>
<jsp:include page="adminheader.jsp"></jsp:include>
</body>
</html>