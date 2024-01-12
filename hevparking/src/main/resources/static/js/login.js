$(function() {
	$(document).ready(function() {

		setTimeout(function() {
			var successSignup = sessionStorage.getItem('signupSuccess');
			if (successSignup === "success") {
				alertmodal('회원가입이 완료되었습니다.');
				sessionStorage.removeItem('signupSuccess');//세션 삭제
			}
		}, 2000);

		$('#memId, #memPw').on('keydown', function(e) {
			if (e.key === 'Enter') {
				$('#login').trigger('click');
			}
		});

		// 로그인
		$('#login').on('click', function() {
			var memId = $("#memId").val();
			var memPw = $("#memPw").val();

			if (memId === "admin" && memPw === "1212") { 	//관리자 로그인

				$.ajax({
					url: "/adminlogin",
					type: 'POST',
					contentType: "application/json",
					data: JSON.stringify({ "adminId": memId, "adminPw": memPw }),
					success: function(data) {
						if (data === "success") { // 로그인 성공
							sessionStorage.setItem('loginSuccess', 'success');
							window.location.href = "/admin";
						}
						else if (data === "fail") { // 로그인 실패
							alertmodal('아이디와 비밀번호를 다시 확인해 주세요');
							$("#memId").val("");
							$("#memPw").val("");
							$("#memId").focus();
						}
					},
					error: function(request, status, error) {
						alertmodal("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});

			} else {	//회원 로그인

				var loginData = { "memId": memId, "memPw": memPw };

				$.ajax({
					url: "/login", // 컨트롤러로 가는 mapping 입력
					type: 'POST',
					contentType: "application/json",
					data: JSON.stringify(loginData), // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
					success: function(data) {
						if (data === "success") { // 로그인 성공
							window.location.href = "/index";
						}
						else if (data === "fail") { // 로그인 실패

							alertmodal('아이디와 비밀번호를 다시 확인해 주세요');
							$("#memId").val("");
							$("#memPw").val("");
							$("#memId").focus();

						}
					},
					error: function(request, status, error) {
						alertmodal("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
			}
		});
	});
});

