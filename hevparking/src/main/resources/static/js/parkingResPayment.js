$(function() {


	// 카드 이미지 슬라이드
	var swiper = new Swiper('.swiper-container', {
		centeredSlides: true,
		slidesPerView: 1,
		spaceBetween: 90,
		sliderOffsetBefore: 90,
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		},
		effect: 'coverflow',
		coverflowEffect: {
			depth: 200,
			modifier: 1,
			slideShadows: true
		},
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
		initialSlide: 1, // 첫 번째 슬라이드부터 시작
	});

	$(document).ready(function() {
		var cardlengthArray = []; // 카드개수 배열

		// 예약 정보 불러오기
		$.ajax({
			url: "/parkingList",
			type: 'GET',
			contentType: "application/json",
			success: function(data) {

				var requestprscode = $('#prsCode').val();
				var memCodeval= $('#memCode').val();

				data.forEach(function(datalist) {

					var memName = datalist.memberVO.memName;
					var memPhone = datalist.memberVO.phone;

					var memCode = datalist.memCode;
					var prsCode = datalist.prsCode;
					var prsArea = datalist.prsArea;
					var prsLocation = datalist.prsLocation;
					var prsType = datalist.prsType;
					var startDate = datalist.startDate;
					var endDate = datalist.endDate;
					var startTime = datalist.startTime;
					var endTime = datalist.endTime;
					var price = datalist.price;

					var chargeuse = datalist.chargeUse;
					var chargeTime = datalist.chargeResVO.chargeTime;
					var chargePrice = datalist.chargeResVO.chargePrice;

					// 회원의 예약정보 가져오기
					if (prsCode === parseInt(requestprscode) && memCode === parseInt(memCodeval)) {
						$('#memName').val(memName);
						$('#memPhone').val(memPhone);
						$('#prsArea').val(prsArea);
						$('#prsLocation').val(prsLocation);
						$('#prsType').val(prsType);
						$('#startDate').val(startDate + ' ' + (startTime).replace(':00', '') + '분');
						$('#endDate').val(endDate + ' ' + (endTime).replace(':00', '') + '분');
						$('#price,#finalprsprice').val(price);


						/*------------------ 주차 예약 정보 -----------------------*/
						var startDatestr = $('#startDate').val();
						var endDatestr = $('#endDate').val();

						var startDate = new Date(startDatestr.replace('분', ''));
						var endDate = new Date(endDatestr.replace('분', ''));

						var timeDifference = endDate - startDate;

						var secondsDifference = Math.floor(timeDifference / 1000);
						var minutesDifference = Math.floor(secondsDifference / 60);
						var hoursDifference = Math.floor(minutesDifference / 60);
						var daysDifference = Math.floor(hoursDifference / 24);

						// 일(day) 단위의 차이
						var days = daysDifference;

						// 남은 시간을 일(day)로 나눈 나머지에서 시간(hour) 계산
						var remainingHours = hoursDifference - (daysDifference * 24);

						// 남은 시간을 일(day)과 시간(hour)으로 나눈 나머지에서 분(minute) 계산
						var remainingMinutes = minutesDifference - (daysDifference * 24 * 60) - (remainingHours * 60);

						// 주차 시작일과 종료일 시간 계산
						if (days == 0 && remainingHours == 0 && remainingMinutes > 0) {
							$('#restime').val(remainingMinutes + '분');
						} else if (days == 0 && remainingHours >= 0 && remainingMinutes == 0) {
							$('#restime').val(hoursDifference + '시간');
						} else if (days >= 0 && remainingHours == 0 && remainingMinutes == 0) {
							$('#restime').val(days + '일');
						} else if (days == 0 && remainingHours > 0 && remainingMinutes > 0) {
							$('#restime').val(remainingHours + '시간' + remainingMinutes + '분');
						} else {
							$('#restime').val(days + '일' + remainingHours + '시간' + remainingMinutes + '분');
						}


						/*------------------ 충전기 사용 정보,요금 합계 정보 -----------------------*/
						//충전기 사용시
						if (chargeuse === "yes" && chargePrice !== null) {
							var rechargePrice = chargePrice.replace('원', '');
							var reprice = price.replace('원', '');
							$('#chargePriceShow').show();
							$('#chargeinfoTable').css('display', 'block');

							$('#chargeName').val(datalist.chargeVO.chargeName + '(' + datalist.chargeVO.chargeSpeed + ')');
							$('#chargeType').val(datalist.chargeVO.chargeType);
							$('#chargeTime').val(chargeTime + '시간');
							$('#chargePrice').val(chargePrice);
							$('#finalchargeprice').val(rechargePrice + '원');
							$('#totalprice').val(parseInt(reprice) + parseInt(rechargePrice) + '원');
							// 충전기 사용안할시
						} else {
							$('#chargeinfoTable').css('display', 'none');
							$('#chargePriceShow').hide();

							$('#totalprice').val(price);
						}

					}
				});
			}
		});

		$.ajax({
			url: '/getcardInfo',
			type: 'GET',
			async: false,
			success: function(data) {
				
				var wrapper = $('.swiper-wrapper');
				var memCodeval= $('#memCode').val();

				data.forEach(function(list) {
					var cardname = list.cardName;
					var cardcode = list.cardCode;
					var cardnum = list.cardNum;
					var cardmemcode = list.memCode;

					var cardButton = $('<button>', {
						type: 'button',
						class: 'swiper-slide selectMemCard',
						id: cardcode,
					});

					// 회원번호와 일치하면 카드 불러오기
					if (cardmemcode === parseInt(memCodeval)) {

						//회원번호와 일치하는 카드번호 배열에 추가
						cardlengthArray.push(cardcode);

						wrapper.append(cardButton);
						// 카드 3개 이상시 카드 추가버튼 hide
						if (cardlengthArray.length >= 3) {
							$('#newCardButton').remove();

						} else {
							$('#newCardButton').show();
						}
					}

					var visiblePart = cardnum.substring(6).replace(/\d/g, '*');
					var cardNumsubString = cardnum.substring(0, 7) + visiblePart;

					// 카드 이름에 따라 클래스 추가
					switch (cardname) {
						case 'bc':
							cardButton.addClass('paymentcardImage_bc');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						case 'hana':
							cardButton.addClass('paymentcardImage_hana');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						case 'hyundai':
							cardButton.addClass('paymentcardImage_hyundai');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						case 'kb':
							cardButton.addClass('paymentcardImage_kb');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						case 'lotte':
							cardButton.addClass('paymentcardImage_lotte');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						case 'nc':
							cardButton.addClass('paymentcardImage_nc');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						case 'samsung':
							cardButton.addClass('paymentcardImage_samsung');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						case 'sinhan':
							cardButton.addClass('paymentcardImage_sinhan');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						case 'woori':
							cardButton.addClass('paymentcardImage_woori');
							cardButton.html('<div class="selectcardNum">' + cardNumsubString + '</div><input type="hidden" class="cardcodeval" value="' + cardcode + '">');
							break;
						default:
							false;
							break;
					}
				});
			},
			error: function(status, error) {
				alertmodal(status + ' ' + error);
			}
		});
		$('#newCardButton').click(function() {
			$('#cardInsertModal').modal('show');
		});


		// F5, ctrl + F5, ctrl + r 새로고침 막기
		/*$(document).keydown(function(e) {
			var allowPageList = new Array('/a.php', '/b.php');
			var bBlockF5Key = true;
			for (number in allowPageList) {
				var regExp = new RegExp('^' + allowPageList[number] + '.*', 'i');
				if (regExp.test(document.location.pathname)) {
					bBlockF5Key = false;
					break;
				}
			}
	
			if (bBlockF5Key) {
				if (e.which === 116) {
					if (typeof event == "object") {
						event.keyCode = 0;
					}
					return false;
				} else if (e.which === 82 && e.ctrlKey) {
					return false;
				}
			}
		});
		*/
	});

	/*------------------ 카드 이미지 슬라이드 -----------------------*/

	// 카드번호 입력 체크
	$('.numcheck').on('input', function() {	//카드 번호 길이 제한
		if ($('#cardNum1').val().length >= 4) {
			$('#cardNum1').val($('#cardNum1').val().slice(0, 4));
		}
		if ($('#cardNum2').val().length >= 4) {
			$('#cardNum2').val($('#cardNum2').val().slice(0, 4));
		}
		if ($('#cardNum3').val().length >= 4) {
			$('#cardNum3').val($('#cardNum3').val().slice(0, 4));
		}
		if ($('#cardNum4').val().length >= 4) {
			$('#cardNum4').val($('#cardNum4').val().slice(0, 4));
		}
		if ($('#cardPass').val().length >= 4) {
			$('#cardPass').val($('#cardPass').val().slice(0, 4));
		}
		if ($('#cvc').val().length >= 3) {
			$('#cvc').val($('#cvc').val().slice(0, 3));
		}
	});

	// 카드 등록 유효성 체크
	$('#cardNum1, #cardNum2, #cardNum3, #cardNum4, #cardPass').on('input', function() {
		var maxLength = 4;
		var value = $(this).val();

		if (!/^\d+$/.test(value)) {
			$(this).val('');
			return;
		} else if (value.length > 4) {
			$(this).val(value.slice(0, maxLength));
		}
	});

	$('#cvc').on('input', function() {
		var maxLength = 3;
		var value = $(this).val();

		if (!/^\d+$/.test(value)) {
			$(this).val('');
			return;
		} else if (value.length > maxLength) {
			$(this).val(value.slice(0, maxLength));
		}
	});

	// 카드 등록 이벤트
	$('#cardInsert').on('click', function() {
		var memCodeval= $('#memCode').val();
		var cardNum = $('#cardNum1').val() + '-' + $('#cardNum2').val() + '-' + $('#cardNum3').val() + '-' + $('#cardNum4').val();
		var cardDate = $('#cardDate').val();
		var cardName = $('#cardName').val();
		var cardPass = $('#cardPass').val();
		var cvc = $('#cardPass').val();

		confirmmodal("카드를 등록하시겠습니까??", function(yes) {
			if (yes) {
				if ($('#cardNum1').val() == "" && $('#cardNum2').val() == "" && $('#cardNum3').val() == "" && $('#cardNum4').val() == "" && $('#cardDate').val() == "" && $('#cardName').val() == "" && $('#cardPass').val() == "" && $('#cvc').val() == "") {
					alertmodal("빈칸이 존재합니다 다시 확인해 주세요");
					return false;
				} else {

					// 카드 insert
					$.ajax({
						url: '/cardregistration',
						type: 'POST',
						contentType: "application/json",
						data: JSON.stringify({
							"memCode": memCodeval,
							"cardName": cardName,
							"cardNum": cardNum,
							"cvc": cvc,
							"cardDate": cardDate,
							"cardPass": cardPass
						}),
						success: function() {

							alertmodal('카드가 등록 되었습니다.');
							window.location.reload();
						},
						error: function(status, error) { alertmodal(status + ' ' + error); }
					});
				}
			} else {
				return false;
			}
		});
	});

	// 결제 선택
	$('.choicePayment').on('click', function() {

		if (!$('#card').hasClass('collapsed')) {
			$(this).text("카드 결제 (선택)");
			$('#acc').text("계좌 이체");
			$('#paymentType').val("카드결제");
		} else if (!$('#acc').hasClass('collapsed')) {
			$(this).text("계좌 이체 (선택)");
			$('#card').text("카드 결제");
			$('#paymentType').val("계좌이체");
		} else {
			$('#card').text("카드 결제");
			$('#acc').text("계좌 이체");
			$('#paymentType').val("");
		}
	});

	// '결 제' 버튼 클릭시 이벤트
	$('#resfinalbtn').on('click', function() {

		// 카드결제 card 열려 있을때(선택)
		var cardshow = $('#flush-collapseOne').hasClass('show');

		// 계좌이체 열려 있을때(선택)
		var accshow = $('#flush-collapseTwo').hasClass('show');

		// 카드 슬라이드 index
		var activeSlide = swiper.slides[swiper.activeIndex];

		// 카드 슬라이드의 카드 번호 찾기
		var cardCode = $(activeSlide).find('.cardcodeval').val();

		if (cardshow && cardCode === "") {
			alertmodal("결제할 카드를 선택해 주세요!");
			return false;
		} else if (cardshow && cardCode !== "") { // 카드결제가 열려있는경우

			confirmmodal("카드로 결제를 진행하시겠습니까?", function(yes) {
				if (yes) { // 확인 버튼을 누른 경우
					cardpaymentInsert();
				} else {
					return false; // 취소 버튼 누르면 취소 
				}
			});
		} else if (accshow) {	//계좌 이체 결제

			confirmmodal("계좌이체 결제를 진행하시겠습니까?", function(yes) {
				if (yes) {
					accpaymentInsert();
				} else {
					return false;
				}
			});
		} else { // 라디오 박스가 선택되지 않은 경우
			alertmodal("결제 방식을 선택해 주세요");
			return false;
		}

		// 카드 결제 insert
		function cardpaymentInsert() {
			var prsCode = $('#prsCode').val();

			// 카드 슬라이드의 카드 번호 가져오기
			activeSlide = swiper.slides[swiper.activeIndex];
			cardCode = $(activeSlide).find('.cardcodeval').val();

			console.log(cardCode);

			$.ajax({
				url: 'cardpayment',
				type: 'POST',
				contentType: "application/json",
				data: JSON.stringify({
					"prsCode": prsCode,
					"cardCode": cardCode
				}),
				success: function() {
					FinalupdateDate();
				},
				error: function(status, error) {
					alertmodal('카드 결제 실패: ' + status + ' ' + error);
					return false;
				}
			});
		}

		// 계좌이체 결제 insert
		function accpaymentInsert() {
			var prsCode = $('#prsCode').val();;
			var accBank = $('#accBank').val();
			var accName = $('#accName').val();
			var accNum = $('#accNum').val();

			$.ajax({
				url: 'accinsert',
				type: 'POST',
				contentType: "application/json",
				data: JSON.stringify({
					"prsCode": prsCode,
					"accBank": accBank,
					"accName": accName,
					"accNum": accNum
				}),
				success: function() {
					FinalupdateDate();
				},
				error: function(status, error) { alertmodal("계좌이체 결제 실패!:" + status + ' ' + error); }
			});
		}

		// 주차정보 업데이트
		function FinalupdateDate() {
			var currentDate = new Date();
			var year = currentDate.getFullYear();
			var month = String(currentDate.getMonth() + 1).padStart(2, '0');
			var day = String(currentDate.getDate()).padStart(2, '0');
			var hours = String(currentDate.getHours()).padStart(2, '0');
			var minutes = String(currentDate.getMinutes()).padStart(2, '0');
			var seconds = String(currentDate.getSeconds()).padStart(2, '0');
			var prsCode = $('#prsCode').val();
			var prsDate = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
			var paymentType = $('#paymentType').val();
			var parkingStatus = "결제완료";

			$.ajax({
				url: 'updateResDate',
				type: 'POST',
				data: { "prsCode": prsCode, "prsDate": prsDate, "paymentType": paymentType, "parkingStatus": parkingStatus },
				success: function(data) {
					sessionStorage.setItem('parkingresSuccess', 'success');
					window.location.href = "/index";
				},
				error: function(status, error) { alertmodal("주차정보 업데이트 실패:" + status + ' ' + error); }
			});
		}
	});

	// 로고 클릭시 이벤트
	$('.logo').click(function() {

		confirmmodal("결제가 진행중입니다. <br/> 진행을 멈추고 메인화면으로 이동하시겠습니까?", function(yes) {
			if (yes) {
				window.location.href = "index";
			} else {
				return false;
			}
		});
	});

	// 취소 버튼 클릭시 이벤트
	$('#resfinalcancel').click(function() {
		var prsCode = $('#prsCode').val();
		var chargetime = $('#chargeTime').val();
		var chargerice = $('#chargePrice').val();

		confirmmodal("진행중인 예약을 취소하시겠습니까?<br/>(예약정보가 삭제 됩니다.)", function(yes) {
			if (yes) {
				if (chargetime !== "" && chargerice !== "") {// 충전기 사용
					$.ajax({
						url: "/parkinglistandchargeRes",
						type: 'DELETE',
						data: { "prsCode": prsCode },
						success: function(data) {
							sessionStorage.setItem('parkingresCancel', 'success');
							window.location.href = "/index";

						},
						error: function(status, error) { alertmodal("취소 실패:" + status + ' ' + error); }
					});
				} else {// 충전기 사용 X 
					$.ajax({
						url: "/parkinglistdelete",
						type: 'DELETE',
						data: { "prsCode": prsCode },
						success: function(data) {
							sessionStorage.setItem('parkingresCancel', 'success');
							window.location.href = "/index";

						},
						error: function(status, error) { alertmodal("취소 실패:" + status + ' ' + error); }
					});
				}
			}
		});
	});

});