$(function() {

	$(document).ready(function() {

		var idt = [1];
		var pwt = [1];
		var emailt = [1];
		var namet = [1];
		var phonet = [1];
		var addrt = [1];
		var carnumt = [1];
		var carnamet = [1];


		// 아이디 중복체크 & 유효성 검사
		$("#memId").on("change", function() {
			var memId = $("#memId").val();
			var regex = /^[a-zA-Z][a-zA-Z0-9]{5,15}$/;

			$.ajax({
				url: "/checkid",
				type: 'post',
				contentType: "application/json",
				data: JSON.stringify({ "memId": memId }), // 원하는 값을 중복확인하기위해서  JSON 형태로 DATA 전송
				success: function(data) {

					if (memId == "") { // 빈칸
						$('#memId').css("border-color", "silver");
						$('#memId').css("color", "black");
						$('#checkid').css("display", "none");
						$('#checkid').text("");
						idt.push(1);

					} else if (memId.length < 4 || !regex.test(memId)) { // 아이디 유형
						$('#memId').css("border-color", "red");
						$('#memId').css("color", "red");
						$('#checkid').css("display", "block");
						$('#checkid').text("아이디 유형을 확인해 주세요");
						$('#checkid').css("color", "red");
						$('#memId').focus();
						idt.push(1);

					} else if (data == 0) { // 사용 가능할때
						$('#memId').css("border-color", "green");
						$('#memId').css("color", "green");
						$('#checkid').css("display", "block");
						$('#checkid').text("사용 가능한 아이디 입니다.");
						$('#checkid').css("color", "green");
						idt.length = 0;

					} else if (data == 1) { // 중복된 아이디 일때
						$('#memId').css("border-color", "orange");
						$('#memId').css("color", "orange");
						$('#checkid').css("display", "block");
						$('#checkid').text("이미 사용중인 아이디 입니다.");
						$('#checkid').css("color", "orange");
						$('#memId').focus();
						idt.push(1);
					}
				},
				error: function(status, error) { alertmodal(status, error); }
			});
		});

		// 비밀번호 보이기/숨기기
		$('#eyes').on('click', function() {
			$('#memPw').toggleClass('active');
			if ($('#memPw').hasClass('active')) {
				$(this).attr('class', "fa fa-eye fa-sm").prev('#memPw').attr('type', "text");
				$('#eyes').css("opacity", "1");
			} else {
				$(this).attr('class', "fa fa-eye-slash fa-sm").prev('#memPw').attr('type', 'password');
				$('#eyes').css("opacity", "0.7");
			}
		});

		// 비밀번호 유효성 체크
		$('#memPw').on("change", function() {
			var Pwval = $("#memPw").val();
			var regExpPw = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%\^&\*_-]).{8,}$/;

			if (regExpPw.test(Pwval) && Pwval.length > 8) {
				$('#memPw').css("border-color", "green");
				$('#memPw').css("color", "green");
				$('#pwcheck').css("display", "block");
				$('#pwcheck').css('color', 'green');
				$('#pwcheck').text('사용 가능한 비밀번호 입니다.');
				pwt.length = 0;

			} else if (Pwval.length == 0) {
				$('#pwcheck').css("display", "none");
				$('#pwcheck').css('color', 'silver');
				$('#memPw').css("border-color", "silver");
				$('#memPw').css("color", "silver");
				pwt.push(1);

			} else {
				$('#memPw').css("border-color", "red");
				$('#memPw').css("color", "red");
				$('#pwcheck').css("display", "block");
				$('#pwcheck').css('color', 'red');
				$('#pwcheck').text('비밀번호를 확인해 주세요');
				$("#memPw").focus();
				pwt.push(1);
			}
		});

		// 이메일 유효성 체크
		$('#email').on("change", function() {
			var emailval = $("#email").val();
			var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{3}$/i;

			if (regExpEmail.test(emailval)) {
				$('#emailcheck').css("display", "none");
				$('#email').css("border-color", "green");
				$('#emailcheck').text("사용 가능한 이메일 입니다.");
				$('#email').css("color", "green");
				emailt.length = 0;

			} else if (emailval.length == 0) {
				$('#emailcheck').css("display", "none");
				$('#email').css("border-color", "silver");
				emailt.push(1);

			} else {
				$('#emailcheck').css("display", "block");
				$('#email').css("border-color", "red");
				$('#email').css("color", "red");
				$('#emailcheck').css("color", "red");
				$('#emailcheck').text("이메일이 올바르지 않습니다.");
				$("#email").focus();
				emailt.push(1);
			}
		});

		// 이름 유효성 체크
		$('#memName').on('change', function() {
			var memName = $('#memName').val();
			var nameRegex = /^[가-힣]+$/;

			if (nameRegex.test(memName)) {
				$('#namecheck').css("display", "none");
				$('#memName').css("border-color", "green");
				$('#memName').css("color", "green");
				namet.length = 0;

			} else if (memName.length == 0) {
				$('#namecheck').css("display", "none");
				$('#memName').css("border-color", "silver");
				namet.push(1);

			} else {
				$('#namecheck').css("display", "block");
				$('#memName').css("border-color", "red");
				$('#namecheck').css("color", "red");
				$("#memName").focus();
				namet.push(1);
			}
		});

		$('#phone').on('input', function(e) {
			var input = $(this).val();
			var sanitizedInput = input.replace(/\D/g, ''); // 숫자가 아닌 문자를 모두 제거
			var maxLength = 11;

			if (sanitizedInput.length > maxLength) {
				$('#phone').css("border-color", "silver");
				$('#phone').css("color", "silver");
				$('#phonecheck').css("display", "none");
				sanitizedInput = sanitizedInput.slice(0, maxLength); // 12자리를 넘어가면 초과된 부분을 자름
				phonet.push(1);
			} else if (sanitizedInput.length < maxLength) {
				$('#phone').css("border-color", "red");
				$('#phone').css('color', 'red');
				$('#phonecheck').css("display", "block");
				$('#phonecheck').css('color', 'red');
				$('#phonecheck').css("border-color", "red");
				$('#phonecheck').text('연락처 형식이 올바르지 않습니다.');
				phonet.push(1);
			}

			var formattedNumber = '';
			if (sanitizedInput.length > 10) {
				$('#phone').css("border-color", "green");
				$('#phone').css("color", "green");
				$('#phonecheck').css("display", "block");
				$('#phonecheck').text('사용 가능한 연락처 입니다.');
				$('#phonecheck').css('color', 'green');
				formattedNumber = sanitizedInput.replace(/(\d{3})(\d{4})(\d{4})/, '010-$2-$3');
				phonet.length = 0;
			} else {
				$('#phone').css("border-color", "red");
				$('#phone').css('color', 'red');
				$('#phonecheck').css("display", "block");
				$('#phonecheck').css('color', 'red');
				$('#phonecheck').css("border-color", "red");
				$('#phonecheck').text('연락처 형식이 올바르지 않습니다.');
				formattedNumber = sanitizedInput;
				phonet.push(1);
			}

			// 입력한 값이 원하는 형식에 맞게 변환되고, 숫자만 입력될 수 있도록 설정
			$(this).val(formattedNumber);

		});


		// 주소 유효성 체크
		$('#addr2').on("change", function() {
			var addr1 = $("#addr1").val();
			var addr2 = $("#addr2").val();
			//var addr3 = $("#addr3").val();

			if (addr2.length != 0 && addr1.length != 0) {
				// $('#addr3').css("border-color", "green");
				// $('#addr3').css("color", "green");
				$('#addr2').css("border-color", "green");
				$('#addr2').css("color", "green");
				$('#addr1').css("border-color", "green");
				$('#addr1').css("color", "green");
				addrt.length = 0;

			} else {
				//$('#addr3').css("border-color", "silver");
				//$('#addr3').css("color", "silver");
				$('#addr2').css("border-color", "silver");
				$('#addr2').css("color", "silver");
				$('#addr1').css("border-color", "silver");
				$('#addr1').css("color", "silver");
				phonet.push(1);
				$('#addr').val("");
			}


		});

		// 차량 번호 유효성 체크
		$('#carNum').on("change", function() {
			var carNum = $("#carNum").val();
			var krCarNumberRegex = /^\d{3}[가-힣]{1}\d{4}$/; // 대한민국 차량번호 형식 정규 표현식

			// 차량번호 중복체크
			$.ajax({
				url: "/checkcarnum",
				type: 'post',
				contentType: "application/json",
				data: JSON.stringify({ "carNum": carNum }),
				success: function(data) {

					if (carNum == "") { // 빈칸
						$('#carNum').css("border-color", "silver");
						$('#carNum').css("color", "black");
						$('#carNumcheck').css("display", "none");
						carnumt.push(1);

					} else if (carNum.length < 8 || !krCarNumberRegex.test(carNum)) {
						$('#carNumcheck').css("display", "block");
						$('#carNum').css("border-color", "red");
						$('#carNum').css("color", "red");
						$('#carNumcheck').css("color", "red");
						$('#carNumcheck').text("차량번호 유형을 확인해 주세요");
						$('#carNum').focus();
						carnumt.push(1);

					} else if (data == 0) {
						$('#carNum').css("border-color", "green");
						$('#carNum').css("color", "green");
						$('#carNumcheck').css("display", "block");
						$('#carNumcheck').css("color", "green");
						$('#carNumcheck').text("사용 가능한 차량번호 입니다.");
						carnumt.length = 0;

					} else if (data == 1) {
						$('#carNum').css("border-color", "orange");
						$('#carNum').css("color", "orange");
						$('#carNumcheck').css("display", "block");
						$('#carNumcheck').css("color", "orange");
						$('#carNumcheck').text("이미 등록된 차량번호 입니다.");
						$('#carNum').focus();
						carnumt.push(1);
					}
				},
				error: function(status, error) { alertmodal(status, error); }
			});
		});

		// 차량이름 유효성 체크
		$('#carName').on("change", function() {
			var carName = $("#carName").val();
			var krCarNameRegex = /^[가-힣]{2}$/;

			if (krCarNameRegex.test(carName) || carName.length >= 3) {
				$('#carName').css("border-color", "green");
				$('#carName').css("color", "green");
				carnamet.length = 0;

			} else {
				$('#carName').css("border-color", "silver");
				$('#carName').css("color", "silver");
				carnamet.push(1);
			}
		});

		// 차량분류 선택
		$('input[name="carCategory"]').on('click', function() {
			var changeval = $(this).val();
			var selectcarsale = $('#carSale');

			if (changeval === "전기차") {
				selectcarsale.val('전기차(50%할인)').prop("selected", true);
				$('#carSale').css("border-color", "green");
				$('#carSale').css("color", "green");

			} else if (changeval === "일반차") {
				selectcarsale.val('일반차량일반차량(할인없음)').prop("selected", true);
				$('#carSale').css("border-color", "gray");
				$('#carSale').css("color", "black");
			}

		});

		// 차량 유형 선택
		$('#carSale').on("change", function() {
			$('#carSale').css("border-color", "green");
			$('#carSale').css("color", "green");
		});

		// 개인정보 수집 동의 클릭시 유효성 체크 안되있을때
		$('#finalchk').on("click", function() {

			if (idt != 0) {
				$('#finalchk').prop("checked", false);
				$('#signUpchk').prop("disabled", true);
				alertmodal("아이디를 확인해 주세요", function(yes) {
					if (yes) {
						$('#memId').focus();
					}
				});

			} else if (pwt != 0) {
				$('#finalchk').prop("checked", false);
				$('#signUpchk').prop("disabled", true);
				alertmodal("비밀번호를 확인해 주세요", function(yes) {
					if (yes) {
						$('#memPw').focus();
					}
				});

			} else if (emailt != 0) {
				$('#finalchk').prop("checked", false);
				$('#signUpchk').prop("disabled", true);
				alertmodal("이메일을 확인해 주세요", function(yes) {
					if (yes) {
						$('#email').focus();
					}
				});


			} else if (namet != 0) {
				$('#finalchk').prop("checked", false);
				$('#signUpchk').prop("disabled", true);
				alertmodal("이름을 확인해 주세요", function(yes) {
					if (yes) {
						$('#memName').focus();
					}
				});


			} else if (phonet != 0) {
				$('#finalchk').prop("checked", false);
				$('#signUpchk').prop("disabled", true);
				alertmodal("연락처를 확인해 주세요", function(yes) {
					if (yes) {
						$('#phone').focus();
					}
				});


			} else if (addrt != 0) {
				$('#finalchk').prop("checked", false);
				$('#signUpchk').prop("disabled", true);
				alertmodal("주소를 확인해 주세요", function(yes) {
					if (yes) {
						$('#addr2').focus();
					}
				});
			} else if (carnumt != 0) {
				$('#finalchk').prop("checked", false);
				$('#signUpchk').prop("disabled", true);
				alertmodal("차량번호를 확인해 주세요", function(yes) {
					if (yes) {
						$('#carNum').focus();
					}
				});

			} else if (carnamet != 0) {
				$('#finalchk').prop("checked", false);
				$('#signUpchk').prop("disabled", true);
				alertmodal("차량이름을 확인해 주세요", function(yes) {
					if (yes) {
						$('#carName').focus();
					}
				});

			} else {
				$('#signUpchk').prop("disabled", false);
			}
		});
	});

	$('#signUpchk').click(function(event) {
		event.preventDefault(); // 기본 동작 막기

		confirmmodal("회원가입을 진행 하시겠습니까?", function(yes) {
			if (yes) {
				sessionStorage.setItem('signupSuccess', 'success');
				$('#check').submit();
			} else {
				return false;
			}
		});
	});
});

