$(function() {
	$(document).ready(function() {
		// 관리자 로그아웃
		$('#adminlogout').on('click', function(event) {
			event.preventDefault();
			confirmmodal("로그아웃 하시겠습니까?", function(ok) {
				if (ok) {
					window.location.href = "/adminlogout";
					window.onload();
					return true;
				} else {
					return false;
				}
			});
		});

		// 회원 로그아웃
		$('#logout').on('click', function(event) {
			event.preventDefault();
			
			confirmmodal("로그아웃 하시겠습니까?", function(ok) {
				if (ok) {
					alertmodal("로그아웃되었습니다.");
					window.location.href = "/logout";
					
				} else {
					return false;
				}
			});
		});
	});

});


