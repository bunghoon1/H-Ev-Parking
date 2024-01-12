$(document).ready(function() {
	$('#nextsignup').hide();
	
	$('.chbt').on('change', function() {
		let allChecked = true;
		 
		
		$('.chbt').each(function() {
			if (!$(this).prop('checked')) {
				allChecked = false;
				return false;
			}
		});

		if (allChecked) {
			$('#selectall').prop('checked', true);
			$('#nextsignup').show(); // 모두 체크되었을 때 버튼 보이기
		} else {
			$('#selectall').prop('checked', false);
			$('#nextsignup').hide(); // 하나라도 체크 해제되었을 때 버튼 숨기기
		}
	});

	$('#selectall').on('change', function() {
		if ($(this).is(':checked')) {
			$('.accordion-collapse').addClass('show');	// 모든 아코디언 열림
			$('.chbt').prop('checked', true);
			$('#nextsignup').show(); // "모두체크하기"를 체크했을 때 버튼 보이기
			$('#signupTermsTable').css('height','1300px');
			
		} else {
			$('.accordion-collapse').removeClass('show'); // 모든 아코디언 닫힘
			$('.chbt').prop('checked', false);
			$('#nextsignup').hide(); // "모두체크하기"를 해제했을 때 버튼 숨기기
			$('#signupTermsTable').css('height','850px');
		}
	});
	
	$('#nextsignup').click(function(){
		confirmmodal("회원가입을 진행하시겠습니까?",function(yes){
			if(yes){
				window.location ="signup";
			}
		});
		
	})

});		