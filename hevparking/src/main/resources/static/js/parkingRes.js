
$(function() {
	// 가운데 버튼(주차 자리)


	$(document).ready(function() {
		var prslocationArray = [];	// 회원 코드와 버튼 위치값 저장된 배열
		var notResPaymentArray = [];	// 결제 진행중인 정보

		var startopendoor = sessionStorage.getItem('opendoor');

		if (startopendoor === "success") {
			$('#opendoor').addClass('opendoor');

			setTimeout(function() {
				$('#opendoor').removeClass('opendoor');
				sessionStorage.removeItem('opendoor'); // 세션 삭제
			}, 2000);

			setTimeout(function() {
				$('#viewselectGroup').fadeIn(3500).animate({ opacity: 1 }, 2000);
			}, 500);

		} else {
			$('#opendoor').hide();

			setTimeout(function() {
				$('#viewselectGroup').fadeIn(3500).animate({ opacity: 1 }, 2000);
			}, 500);
		}

		// 주차 정보 이미지
		$('#viewselectGroup').hover(
			function() {

				$('#realtimeseat').fadeIn('1000');
				$(this).children().fadeIn('1000');
				$('.viewselect').css('opacity', '1');
			},
			function() {

				$('#realtimeseat').fadeOut('1000');
				$(this).children().fadeOut('1000');
				$('.viewselect').css('opacity', '0');
			}
		);

		// 주차예약 취소
		setTimeout(function() {
			var resCancelSuccess = sessionStorage.getItem('parkingresCancel');
			if (resCancelSuccess === "success") {
				alertmodal("예약된 주차가 취소 되었습니다.");
				sessionStorage.removeItem('parkingresCancel'); // 세션 삭제
			}
		}, 500);

		// 예약버튼,충전기 select된것만 보기
		$('.viewbtn').on('click', function() {
			var checkViewbtnval = $(this).val();

			if (checkViewbtnval == "일반차") {
				$('.NmCarLoc').children().show();
				$('.EvCarLoc').children().hide();
				$('.chargebtn').hide();
			} else if (checkViewbtnval == "전기차") {
				$('.NmCarLoc').children().hide();
				$('.EvCarLoc').children().show();
				$('.chargebtn').show();
			} else if (checkViewbtnval == "전 체") {
				$('.EvCarLoc').children().show();
				$('.NmCarLoc').children().show();
				$('.chargebtn').show();
			}
		});

		// 주차 예약 정보 불러오기(주차위치,회원코드,주차타입)
		$.ajax({
			url: "/prsDateGet",
			type: 'GET',
			contentType: "application/json",
			success: function(data) {
				var evcarCount = 139; // 전기차 예약 좌석 개수
				var nmcarCount = 130; // 일반차 예약 좌석 개수 

				data.forEach(function(datalist) {

					var prsCode = datalist.prsCode;
					var memCode = datalist.memCode;
					var prsType = datalist.prsType;
					var paymentType = datalist.paymentType;
					var prslocation = datalist.prsLocation;
					var startdate = datalist.startDate + ' ' + datalist.startTime;
					var enddate = datalist.endDate + ' ' + datalist.endTime;
					var prsDate = datalist.prsDate;
					var chargeuse = datalist.chargeUse;
					var parkingStatus = datalist.parkingStatus;

					// prsLocation를 배열에 저장(회원이 예약한 위치정보 저장)
					var prslocArrayinfo = { prstype: prsType, loc: prslocation, mem: memCode, type: paymentType, status: parkingStatus };
					prslocationArray.push(prslocArrayinfo);

					var notusepaymentInfo = { prscode: prsCode, use: chargeuse };
					notResPaymentArray.push(notusepaymentInfo);

					// 예약좌석 실시간 변경
					if (datalist.prsArea == "전기차 주차 구역") {
						evcarCount--;
					} else if (datalist.prsArea == "일반차 주차 구역") {
						nmcarCount--;
					}

					if (chargeuse === "yes") {
						chargeuse = "사용";
					} else {
						chargeuse = "사용안함";
					}

					var EndparkingDay = new Date(enddate)
					var today = new Date();

					// 예약 종료일
					if (today > EndparkingDay) {
						var parkingstatus = "예약일만료";

						$('.locbtn').each(function() {
							if ($(this).val() === prslocation) {

								$.ajax({
									url: 'endDateUpdate',
									type: 'POST',
									data: { "prsCode": prsCode, "parkingStatus": parkingstatus },
									success: function(data) {
										$(this).prop('disabled', false);
										$(this).remove('carIconGreen');
										$(this).remove('carIconRed');
									},
									error: function(status, error) { alertmodal("주차 만료 업데이트 실패:" + status + ' ' + error); }
								});
							}
						});
					} else {
						$('.locbtn').each(function() {
							var dataindexval = $(this).val();
							var chargebtn = $('.chargebtn');

							// 배열안에 있는 값 찾기	// 일반 주차 (녹색 아이콘)
							var findNomalParking = prslocationArray.find(function(item) {
								return item.loc === dataindexval && item.prstype === "일반 주차" && item.type !== "결제진행중" && item.status !== "예약일만료";
							});

							// 배열안에 있는 값 찾기	// 정기 주차(빨간 아이콘)
							var findRegularParking = prslocationArray.find(function(item) {
								return item.loc === dataindexval && item.prstype === "정기 주차" && item.type !== "결제진행중" && item.status !== "예약일만료";
							});

							// 배열안에 있는 값 찾기	// 현재 로그인된 회원의 예약 + 결제진행중
							var findPaymentProgress = prslocationArray.find(function(item) {
								return item.loc === dataindexval && item.type === "결제진행중" && item.status !== "예약일만료";
							});

							// 일반주차 조건 만족시
							if (findNomalParking !== undefined) {
								$(this).addClass('carIconGreen');	// 내가 예약한 주차 상태
								$(this).css('color', 'chartreuse');
								$(this).css('border-color', 'chartreuse');

								// 충전기 버튼도 같이 disabled
								chargebtn.each(function() {
									var chargebtnloc = $(this).val();

									if (findNomalParking.loc == chargebtnloc) {
										$(this).attr('src', '../image/parkingres/chargingMuchine_green.png');
									}
								});

								// 정기주차 조건 만족시
							} else if (findRegularParking !== undefined) {
								$(this).remove('carIconGreen');
								$(this).addClass('carIconRed');
								$(this).prop('disabled', true);
								$(this).css('color', 'red');
								$(this).css('border-color', 'red');

								// 충전기 버튼도 같이 disabled
								chargebtn.each(function() {
									var chargebtnloc = $(this).val();

									if (findRegularParking.loc == chargebtnloc) {
										$(this).prop('disabled', true);
										$(this).css('pointer-events', 'none');
										$(this).attr('src', '../image/parkingres/chargingMuchine_green.png');
									}
								});

								// 주차 진행중일때
							} else if (findPaymentProgress !== undefined) {
								$(this).remove('carIconGreen');
								$(this).remove('carIconRed');
								$(this).css('color', 'orange');
								$(this).prop('disabled', true);
								$(this).addClass('carIconYellow');
								$(this).css('border-color', 'orange');

								// 충전기 버튼도 같이 disabled
								chargebtn.each(function() {
									var chargebtnloc = $(this).val();

									if (findPaymentProgress.loc == chargebtnloc) {
										$(this).prop('disabled', true);
										$(this).css('pointer-events', 'none');
										$(this).attr('src', '../image/parkingres/chargingMuchine_green.png');
									}
								});

							} else {
								$(this).remove('carIconGreen');
								$(this).remove('carIconRed');
								$(this).prop('disabled', false);
								$(this).css('pointer-events', 'auto');
								$(this).css('color', '');
								$(this).css('border-color', '');
							}

						});
					}

					var now = new Date();
					/* ---- 결제 진행중 남은시간 계산 ---- */
					var paymentLasttime = new Date(prsDate);

					// 결제시간에 30분 추가
					var addedThirtyMinutes = new Date(paymentLasttime.getTime() + 30 * 60000);

					var differenceMinute = addedThirtyMinutes - now;

					var lastminutes = Math.floor((differenceMinute % (1000 * 60 * 60)) / (1000 * 60));

					// 결제 진행중인 예약 확인
					if (paymentType == "결제진행중" && memCode == $('#memCode').val()) {

						// 회원의 예약 진행중인 데이터 모달에 입력
						if ($('#memCode').val() == memCode) {

							var parkingrestable = $('#parkingListTable');
							var resrow = $('<tr>');

							resrow.append('<td>' + prslocation + '</td>');
							resrow.append('<td>' + startdate.replace(':00', '') + '</td>');
							resrow.append('<td>' + enddate.replace(':00', '') + '</td>');
							resrow.append('<td><div style="color:red">' + lastminutes + "분" + '</div></td>');
							resrow.append('<td>' + chargeuse + '</td>');

							// 결제 진행중 버튼 클릭시 결제 창으로 이동
							if (paymentType === "결제진행중") {
								resrow.append('<td>'
									+ '<button type="button" class="btn btn-outline-success continuepayment" data-index=' + prsCode + ' value=' + memCode + ' style="font-size:9px;">결제 진행</button></td>');
							}
							resrow.append('<td><button type="button" class="btn btn-outline-danger delpaymentnot" data-index=' + prsCode + ' style="font-size:9px;">예약취소</button></td>');

							parkingrestable.append(resrow);

						}
						// 결제 진행중이면 '결제 진행중 modal '
						setTimeout(function() {

							alertmodalTrue('결제 진행중인 예약이 있습니다.<br/> 진행중인 예약을 먼저 진행해 주세요', function(yes) {
								if (yes) {
									$('#paymentnot').modal('show');

								} else {
									return false;
								}
							});
						}, 1200);

					}

					// 30분이 지나면 결제진행중 삭제
					if (lastminutes < 0 && paymentType === "결제진행중" && chargeUse === "no") {
						console.log(prsCode);
						$.ajax({
							url: "/parkinglistdelete",
							type: 'DELETE',
							data: { "prsCode": prsCode },
							success: function() {
								location.reload();
							},
							error: function(status, error) { alertmodal("결제진행중 삭제 실패(289):" + status + ' ' + error); }
						});
					} else if (lastminutes < 0 && paymentType === "결제진행중" && chargeUse === "yes") {
						$.ajax({
							url: "/parkinglistandchargeRes",
							type: 'DELETE',
							data: { "prsCode": prsCode },
							success: function() {
								location.reload();
							},
							error: function(status, error) { alertmodal("결제진행중 삭제 실패(298):" + status + ' ' + error); }
						});
					}
				});

				// '결제 진행중' 로고 클릭시 이벤트
				$('.paymentnotlogo').click(function() {
					$('#paymentnot').modal('hide');
					confirmmodal("메인 화면으로 이동하시겠습니까?", function(yes) {
						if (yes) {
							window.location.href = "/index";
						} else {
							$('#paymentnot').modal('show');
							return false;
						}
					});
				});

				// '결제 진행중' 결제 진행 버튼 클릭
				$(document).on('click', '.continuepayment, .delpaymentnot', function(btn) {
					var prsCode = $(this).data('index');

					// 결제 버튼
					if ($(btn.target).hasClass('continuepayment')) {
						$('#paymentnot').modal('hide');
						confirmmodal("결제를 진행하시겠습니까?<br/> 확인을 누르면 결제 화면으로 이동합니다.", function(yes) {

							if (yes) {
								$.ajax({
									url: "/parkingResPayment",
									type: "GET",
									success: function() {
										window.location.href = "/parkingResPayment";
									},
									error: function(status, error) { alertmodal("결제 진행 실패:" + status + ' ' + error); }
								});
							} else {
								$('#paymentnot').modal('show');
								return false;
							}
						});

						// 취소 버튼
					} else if ($(btn.target).hasClass('delpaymentnot')) {

						console.log(chargeuse);

						var chargeuse = notResPaymentArray.find(function(item) {
							return item.prscode === prsCode && item.use;
						});

						// 충전기 사용함
						if (chargeuse.use === "yes") {

							$.ajax({
								url: "/parkinglistandchargeRes",
								type: 'DELETE',
								data: { "prsCode": prsCode },
								success: function() {
									alertmodalTrue("진행중인 예약이 취소 되었습니다.", function(yes) {
										if (yes) {
											location.reload();
										}
									});

								},
								error: function(status, error) { alertmodal("진행중 예약 취소 실패:" + status + ' ' + error); }
							});

							// 충전기 사용안함	
						} else if (chargeuse.use === "no") {
							$.ajax({
								url: "/parkinglistdelete",
								type: 'DELETE',
								data: { "prsCode": prsCode },
								success: function() {
									alertmodalTrue("진행중인 예약이 취소 되었습니다.", function(yes) {
										if (yes) {
											location.reload();
										}
									});
								},
								error: function(status, error) { alertmodal("진행중 예약 취소 실패:" + status + ' ' + error); }
							});
						}
					}
				});


				// 주차 자리 카운트 값 넘김
				$('#evcarCount').val(evcarCount);
				$('#nmcarCount').val(nmcarCount);

			},
			error: function(status, error) { alertmodal(status + ' ' + error); }
		});

		// 충전기 아이콘 클릭시 이벤트
		$('.chargebtn').click(function() {
			var prsLocation = $(this).val();

			$('#prsLocation').val(prsLocation);

			$.ajax({
				url: "/chargeinfo",
				type: 'GET',
				data: { "chargeLoc": prsLocation },
				contentType: "application/json",
				success: function(data) {
					$('#chargeLoc').val(data.chargeLoc);
					$('#chargeCode').val(data.chargeCode);									//충전기 코드
					$("#chargeName").val(data.chargeName + "(" + data.chargeSpeed + ")");	// 충전기 이름+충전속도
					$("#chargeState").val(data.chargeState);	// 충전기 상태
					$("#chargeState").css("color", "white");
					$("#chargeType").val(data.chargeType);	//충전기 타입
					$('#chargeusePrice').val(data.timePrice);
					$("#chargeUsetime").val(data.chargeUsetime);  // 충전기 사용가능 시간

					if (data.chargeState == "사용가능") {
						$('#Evchargeselect').css('display', 'block');
						$('#chargePrice').css('color', 'black');
						$('#chargePrice').val("0");

					} else if (data.chargeState == "사용불가능") {					// 충전기 사용불가시 선택 안됨
						$('#Evchargeselect').css('display', 'none');
						$('#chargePrice').css('color', 'red');
						$('#chargePrice').val("충전기 정비중");
					}
					$('#chargemodal').modal('show');
				},
				error: function(status, error) { alertmodal("충전기 정보 불러오기 실패:" + status + ' ' + error); }
			});
		});

		// 주차 위치(자리) 버튼 클릭시 이벤트
		$('.locbtn').click(function() {
			var prsLocation = $(this).val();
			$('#prsLocation').val(prsLocation);		// 주차 위치
			$('#chargeLoc').val(prsLocation);
			$('#parkingModalprsLocation').val(prsLocation);

			var parentClassName = $(this).parent().attr('class');
			var thismemcode = $('#memCode').val();

			// 이미 예약중인 주차예약의 다른시간 선택가능(같은장소)

			$.ajax({
				url: "/prsDateGet",
				type: 'GET',
				contentType: "application/json",
				success: function(data) {
					$('#parkingListTableAddparking tr>td').remove();

					var parkingmodalprslocation = $('#parkingModalprsLocation').val();

					data.forEach(function(datalist) {
						var memCode = datalist.memCode;
						var prsCode = datalist.prsCode;
						var prsloc = datalist.prsLocation;
						var prsType = datalist.prsType;
						var startDate = datalist.startDate;
						var startTime = datalist.startTime;
						var endDate = datalist.endDate;
						var endTime = datalist.endTime;
						var chargeuse = datalist.chargeUse;
						var chargeStatus = datalist.chargeStatus;

						var endDateTime = endDate + ' ' + endTime;

						// 예약 종료일 (2024년 1월 17일 18시 30분)
						var lastendDate = new Date(endDateTime);

						// 현재 시간
						var now = new Date();

						// 종료일과 현재 시간의 차이 계산
						var difference = lastendDate - now;

						// 차이를 시간, 분으로 계산
						var days = Math.floor(difference / (1000 * 60 * 60 * 24));
						var hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
						var minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));


						if (parkingmodalprslocation === prsloc && chargeStatus !== "예약일만료") {

							var parkingrestable = $('#parkingListTableAddparking');
							var resrow = $('<tr>');
							resrow.append('<td>' + prsType + '</td>');
							resrow.append('<td>' + startDate + ' ' + startTime.replace(':00', '') + '</td>');
							resrow.append('<td><div class="checkEndDate">' + endDate + ' ' + endTime.replace(':00', '') + '</div></td>');
							resrow.append('<td>' + days + "일" + hours + "시간" + minutes + "분 " + "남음" + '</td>');

							if (chargeuse === "yes") {
								resrow.append('<td>' + "사용중" + '</td>');
							} else {
								resrow.append('<td>' + "사용안함" + '</td>');
							}

							if (memCode === parseInt(thismemcode)) {
								console.log(prsCode);

								resrow.append('<td><button type="button" class="btn btn-outline-danger delpaymentnot" data-index=' + prsCode + ' style="font-size:9px;">예약취소</button></td>');
								resrow.addClass('memberCheck');
							} else {
								resrow.append('<td>' + "다른사람이 예약" + '</td>');
							}


							parkingrestable.append(resrow);
						}

					});
				}
			});


			// 전기차 주차 위치
			if (parentClassName === "EvCarLoc") {

				$.ajax({
					url: "/chargeinfo",
					type: 'GET',
					data: { "chargeLoc": prsLocation },
					contentType: "application/json",
					success: function(data) {

						$('#chargeCode').val(data.chargeCode);									//충전기 코드
						$("#chargeName").val(data.chargeName + "(" + data.chargeSpeed + ")");	// 충전기 이름+충전속도
						$("#chargeState").val(data.chargeState);	// 충전기 상태
						$("#chargeState").css("color", "white");
						$("#chargeType").val(data.chargeType);	//충전기 타입
						$('#chargeusePrice').val(data.timePrice);
						$("#chargeUsetime").val(data.chargeUsetime);  // 충전기 사용가능 시간

						if (data.chargeState == "사용가능") {
							$('#Evchargeselect').css('display', 'block');
							$('#chargePrice').css('color', 'black');
							$('#chargePrice').val("0");


						} else if (data.chargeState == "사용불가능") {					// 충전기 사용불가시 선택 안됨
							$('#Evchargeselect').css('display', 'none');
							$('#chargePrice').css('color', 'red');
							$('#chargePrice').val("충전기 정비중");
						}
					},
					error: function(status, error) { alertmodal("충전기 정보 불러오기 실패:" + status + ' ' + error); }
				});

			} else if (parentClassName === "NmCarLoc") {
				$("#chargeCode").val("0");
				$("#chargeName").val("no");	// 충전기 이름+충전속도
				$("#chargeState").val("no");	// 충전기 상태
				$("#chargeType").val("0");	//충전기 타입
				$('#chargeusePrice').val("no");
				$("#chargeUsetime").val("no");  // 충전기 사용가능 시간
			}

			// 버튼(자동차이미지)의 변화에 따른 이벤트
			if ($(this).hasClass('carIconYellow')) {	// 주차 버튼 클릭시 '예약진행중' 상태일때
				$('#nmcar').modal('hide');
				$('#paymentnot').modal('show');

			} else if ($(this).hasClass('carIconGreen')) { // 주차 버튼 클릭시 다른 예약이 있을때 
				$('#parkingModalprsLocation').val(prsLocation);
				$('#nmcar').modal('hide');
				$('#parkingSuccessModal').modal('show');

			} else {
				$('#nmcar').modal('show');
			}
		});

		// 일반주차 , 정기 주차 선택시 이벤트	
		$('.resCategory').on('change', function() {

			if ($(this).is(':checked') && $(this).val() === '일반 주차') {
				$('#startDate').val("");
				$('#endDate').val("");
				$('#startTime').val("");
				$('#endTime').val("");
				$('#totaltime').val("0");
				$('#price').val("0");
				$('#chargePrice').val("0");
				$('#chargeTime').val('0');
				$('#endDate').css('pointer-events', 'auto');
				$('#endTime').css('pointer-events', 'auto');
				$('#gopayment').prop('disabled', true);

			} else if ($(this).is(':checked') && $(this).val() === '정기 주차') {
				$('#startDate').val("");
				$('#endDate').val("");
				$('#startTime').val("");
				$('#endTime').val("");
				$('#totaltime').val("0");
				$('#price').val("0");
				$('#chargePrice').val("0");
				$('#chargeTime').val('0');
				$('#endDate').css('pointer-events', 'none');
				$('#endTime').css('pointer-events', 'none');
				$('#gopayment').prop('disabled', true);
			}
		});

		// 충전기 시간 선택시 충전요금 보이게
		$('#chargeTime').on('change', function() {
			var time = $(this).val();
			var priceval = $('#chargePrice');
			var chargeuse = $('#chargeUse');

			if (time === "0") {
				chargeuse.val("no");						// 충전시간 선택x 	
				priceval.val(0);
			} else {
				chargeuse.val("yes");						// 충전시간 선택o
				priceval.val($('#chargeusePrice').val() * time + "원");
			}
		});

		// 실시간 충전기 상태(사용가능/사용불가능)
		setTimeout(function() {
			$('.chargebtn').each(function() {
				var chargeLoc = $(this).val();

				$.ajax({
					url: "/chargestate",
					type: 'post',
					contentType: "application/json",
					data: JSON.stringify({ "chargeLoc": chargeLoc }),
					success: function(data) {

						//예약화면 충전기 상태(이미지 변경)
						$('.chargebtn').each(function() {

							if ($(this).val() === data) {

								if ($(this).val() !== data) {
									$(this).attr('src', '../image/parkingres/chargingMuchine_gray.png');// 충전기 평상시
									$(this).css('pointer-events', 'auto');

								} else {
									$(this).attr('src', '../image/parkingres/chargingMuchine_red.png'); // 충전기 사용불가 
									$(this).css('pointer-events', 'none');
								}
							}
						});
					},
					error: function(status, error) { alertmodal(status + ' ' + error); }
				});
			});
		}, 1500);

		// 주차 구역 타입:일반차(버튼색)
		$('.NmCarLoc ,#chargemuchineResbtn, .chargebtn').click(function() {
			$('#prsArea').val("일반차 주차 구역");
			$('#prsArea').css('color', 'blue');
			$('#chargePricegroup').hide();
			$('#Evchargeselect').hide();
		});

		// 주차 구역 타입:전기차(버튼색)
		$('.EvCarLoc ,#chargemuchineResbtn, .chargebtn').click(function() {
			$('#prsArea').val("전기차 주차 구역");
			$('#prsArea').css('color', '#67e0da');
			$('#chargePricegroup').show();
			$('#Evchargeselect').show();
		});

		$('#nextparkingResbtn').click(function() {
			$('#parkingSuccessModal').modal('hide');
			$('#nmcar').modal('show');
		});

		//------------------------------------- 예약 설정 -------------------------------//

		// 날짜 형변환 Date -> String 2023-12-12형식
		function formatDate(dateString) {
			const date = new Date(dateString);
			const year = date.getFullYear();
			const month = `0${date.getMonth() + 1}`.slice(-2);
			const day = `0${date.getDate()}`.slice(-2);
			return `${year}-${month}-${day}`;
		}

		// 00:00 ~ 24:00 까지 10분단위로 배열에 시간 저장
		var times = [];
		for (var hour = 0; hour < 24; hour++) {
			for (var minute = 0; minute < 60; minute += 10) {
				var formattedHour = ('0' + hour).slice(-2);
				var formattedMinute = ('0' + minute).slice(-2);
				var time = formattedHour + ':' + formattedMinute;
				times.push(time);
			}
		}

		var timefilter = times.slice();
		var endDatefilter = [];

		// 예약 '시작' 날짜/시간 선택
		jQuery.datetimepicker.setLocale('kr');
		$('#startDate').on('click', function() {		// 예약 '시작' 날짜 시간 선택

			var prsLocationval = $('#prsLocation').val();
			$('#endDate').val(""); //예약 종료 input박스 초기화
			$('#endTime').val("");

			var today = new Date();
			var formattedTime = ("0" + today.getHours()).slice(-2) + ":" + ("0" + today.getMinutes()).slice(-2);

			//주차 시작 날짜 선택
			$('#startDate').datetimepicker({
				lang: 'ko',
				timepicker: false,
				disabledDates: endDatefilter,
				formatDate: 'Y-m-d',
				format: "Y-m-d",
				onShow: function() {
					var nowDate = new Date();
					var maxDate = nowDate.setDate(nowDate.getDate() + 30);

					this.setOptions({
						minDate: 0,
						maxDate: maxDate,
					});
				},
				// 날짜 선택될때마다 예약 시간 초기화 , 오늘 이전날짜 선택불가
				onSelectDate: function(selectday) {
					var selectedDay = new Date(selectday);

					// 시간을 비교하기위해 시간0으로 설정
					selectedDay.setHours(0, 0, 0, 0);

					$.ajax({
						url: "/prsDateGet",
						type: 'GET',
						contentType: "application/json",
						success: function(data) {

							data.forEach(function(datalist) {
								//var today = new Date();
								var prsLocation = datalist.prsLocation;
								var startdate = datalist.startDate;
								var starttime = datalist.startTime;
								//var enddate = datalist.endDate;
								//var endtime = datalist.endTime;

								//var retoday = formatDate(today);
								//var restdate = formatDate(startdate);
								//var reenddate = formatDate(startdate);
								var restarttime = starttime.replace(':00', '');
								//var reendtime = endtime.replace(':00', '');

								// 서버에 예약이 있으면
								if (startdate === formatDate(selectedDay) && prsLocation === prsLocationval && restarttime) {
									timefilter = timefilter.filter(function(filtertime) {
										return filtertime !== restarttime;
									});
								} else {
									return;
								}
							});

							// 선택된 날짜가 오늘날짜와 같을때
							if (selectedDay.toDateString() === today.toDateString()) {
								var startTime = timefilter.filter(time => time >= formattedTime);	// 예약정보를 제외한 배열에서 현재시간의 이전 시간을 한번더 제외

								var options = {
									allowTimes: startTime,	// 현재시간 + 예약된시간 제외한 나머지 시간들
									mintime: formattedTime,	// 현재시간
								};
								$('#startTime').datetimepicker('setOptions', options);
								timefilter = times.slice(); // 날짜 변경시 초기화
							} else {
								var options = {
									allowTimes: timefilter,
									mintime: timefilter[0], // 00:00시 시작
								};
								$('#startTime').datetimepicker('setOptions', options);
								timefilter = times.slice(); // 날짜 변경시 초기화
							}
						},
						error: function(status, error) { alertmodal(status + ' ' + error); }
					});
				},
			});
			$('#startTime').datetimepicker({
				lang: 'ko',
				format: "H:i",
				datepicker: false,
			});
			$('#startDate').datetimepicker('show');
		});

		$('#startTime').on('click', function() {
			$('#startTime').datetimepicker('show');
		});

		// 예약 '종료' 날짜/시간 선택
		$('#endDate').on('click', function() {

			$("#endDate").datetimepicker({
				lang: 'ko',
				format: "Y-m-d",
				timepicker: false,
				onShow: function() {
					var nowDate = new Date();
					var startDateval = $('#startDate').val();
					var maxday = nowDate.setDate(nowDate.getDate() + 30); // 현재날짜에서 +일 이후까지만 선택가능하게

					this.setOptions({
						minDate: startDateval,
						maxDate: maxday,

					});
					// 종료일은 startDate의 값으로 datetimepicker 초기화
					if (startDateval) {
						this.setOptions({
							value: startDateval
						});
					}

				},
				// 날짜 선택될때마다 예약 시간 초기화 , 오늘 이전날짜 선택불가
				onSelectDate: function(selectday) {
					var today = new Date();
					var selectedDate = new Date(selectday);

					// 선택된 시간과 현재시간이 같으면 최소 시간은 
					if (selectedDate.toDateString() === today.toDateString()) {
						$('#endTime').datetimepicker('setOptions', {
							minTime: $('#startTime').val(),
						});
						$('#endTime').val("");

						// 시작일과 종료일이 같을때 종료 시간은 시작시간보다 커야한다	
					} else if ($('#endDate').val() === $('#startDate').val()) {
						$('#endTime').datetimepicker('setOptions', {
							minTime: $('#endTime').val(),
						});
					} else {
						$('#endTime').datetimepicker('setOptions', {
							minTime: false,
						});
					}
				},
			});
			$('#endTime').datetimepicker({
				lang: 'ko',
				format: "H:i",
				step: 10,
				datepicker: false,
				value: "",
			});
			$('#endDate').datetimepicker('show');
		});

		$('#endTime').click(function() {

			$('#endTime').datetimepicker('show');
		});


		// 일반주차,정기 주차 선택에 따른 날짜 계산
		$('#startTime').on('change', function() {

			var checkedval = $('.resCategory:checked').val();

			if (checkedval === "일반 주차") {
				$('#endDate').css('pointer-events', 'auto');

			} else if (checkedval === "정기 주차") {
				$('#endDate').css('pointer-events', 'none');
				$("#totaltime").val(30 + "일");
				$("#price").val(100000 + "원");
				$('#gopayment').prop('disabled', false);
			}

			var stdateval = $('#startDate').val() + ' ' + $('#startTime').val();

			$('#endDate').val("");
			$('#endTime').val("");

			//시작일 + 30일 '정기 주차 날짜 계산'
			var plusday = new Date(stdateval);
			plusday.setDate(plusday.getDate() + 30) + plusday.setHours(plusday.getHours() + 9);

			// 정기 주차 선택시 +30일
			if (checkedval == "정기 주차" && stdateval != "") {
				var changeformat = plusday.toISOString().slice(0, 16).replace('T', ' ');
				$('#endDate').val(changeformat.slice(0, 10));
				$('#endTime').val(changeformat.slice(11, 16));
			}
		});

		// 주차 요금 계산
		$('#endTime').on('change', function() { // 주차 요금 계산

			var startDateValue = $('#startDate').val() + ' ' + $('#startTime').val();
			var endDateValue = $('#endDate').val() + ' ' + $('#endTime').val();

			var parkingrescheck = $('.resCategory:checked').val();

			// 현재 날짜를 예약 시작날짜와 종료날짜로 저장
			var startDate = new Date(startDateValue);
			var endDate = new Date(endDateValue);

			// 날짜 계산
			var timeDifferenceInMilliseconds = endDate - startDate;
			var timeDifferenceInMinutes = timeDifferenceInMilliseconds / (1000 * 60);

			// 시간 단위로 계산
			var days = Math.floor(timeDifferenceInMinutes / (24 * 60)); // 일 수
			var remainingMinutes = timeDifferenceInMinutes - (days * 24 * 60); // 남은 시간 (분)

			// 주차 요금 계산 (1일 최대 30000원)
			var maxDailyFee = 30000; // 1일 최대 요금
			var ratePer10Minutes = 500; // 분당 요금 수정
			var days = Math.floor(timeDifferenceInMinutes / (24 * 60)); // 총 일 수 계산
			var remainingMinutes = timeDifferenceInMinutes % (24 * 60); // 일 이상의 나머지 분 계산

			// 1일 최대 요금을 넘지 않도록 조정
			var dailyFee = days * maxDailyFee;
			var remainingFee = Math.ceil(remainingMinutes / 10) * ratePer10Minutes;	// minute 수정

			var price = dailyFee + Math.min(remainingFee, maxDailyFee);

			// 시간 단위 변환
			var hours = Math.floor(remainingMinutes / 60);
			var minutes = remainingMinutes % 60;

			if ($('#endTime').val().length == 0 || $('#endTime').val() === "") {
				alertmodal("주차 종료 시간을 다시 확인해 주세요");
				$('#endTime').val("");
				$('#endTime').focus();
				$('#gopayment').prop('disabled', true);
			} else {
				$('#gopayment').prop('disabled', false);
			}

			// 주차 타입 선택에 따라 요금 계산
			if (parkingrescheck === "일반 주차") { 	// 일반 주차

				if (days >= 1) {
					$("#totaltime").val(days + "일" + hours + "시간" + minutes + "분"); // 주차 시간 계산 (일 단위)
				} else if (hours >= 1) {
					$("#totaltime").val(hours + "시간 " + minutes + "분"); // 주차 시간 계산 (시간 단위)
				} else {
					$("#totaltime").val(minutes + "분"); // 주차 시간 계산 (분 단위)
				}

				// 1일 최대요금 3만원이 넘을때 
				if (days == 1 && hours < 1 || days == 0 && hours < 12 && price > 30000) {
					if ($('#carType').val() === "전기차") {
						$("#price").val(maxDailyFee / 2 + "원");

					} else {
						$("#price").val(maxDailyFee + "원");
					}

				} else {
					if ($('#carType').val() === "전기차") {
						$("#price").val(price / 2 + "원"); // 전기차 주차 요금 계산

					} else {
						$("#price").val(price + "원"); // 주차 요금 계산
					}
				}

			} else if (parkingrescheck === "정기 주차") {	// 정기 주차 계산
				$("#totaltime").val(days + "일");
				$("#price").val(100000 + "원");
			}
		});

		// 초기화 버튼 클릭시 이벤트
		$('#resreset').click(function() {
			$('#gopayment').prop('disabled', true);
			$('#startDate').val("");
			$('#endDate').val("");
			$('#startTime').val("");
			$('#endTime').val("");
			$('#chargeTime').val("0");
			$('#totaltime').val("0");
			$('#price').val("0");
			$('#chargePrice').val("0");
		});

		// 충전기 버튼 클릭시 충전기 화면
		$('#Evchargeselect').click(function() {
			$('#nmcar').modal('hide');
			$('#chargemodal').modal('show');
		});

		// 주차 예약 버튼 클릭시 이벤트
		$('#chargeinput').click(function() {
			$('#nmcar').modal('show');
			$('#chargemodal').modal('hide');
		});

		// 결제 버튼 클릭시 이벤트
		var prsCode = '';
		$('#gopayment').click(function() {
			if ($('#comment').val() === "") {
				$('#comment').val("없음");
			}
			var memCode = $('#memCode').val();
			var prsLocation = $('#prsLocation').val();
			var prsArea = $('#prsArea').val();
			var prsType = $('.resCategory:checked').val();
			var startDate = $('#startDate').val();
			var startTime = $('#startTime').val();
			var endDate = $('#endDate').val();
			var endTime = $('#endTime').val();
			var paymentType = $('#paymentType').val();
			var price = $('#price').val();
			var comment = $('#comment').val();
			var chargeUse = $('#chargeUse').val();

			var chargeCode = $('#chargeCode').val();
			var chargeTime = $('#chargeTime').val();
			var chargePrice = $('#chargePrice').val();

			var totaltime = $('#totaltime').val();

			$('#nmcar').modal('hide');
			if (startDate === "" || endDate === "" || startTime === "" || endTime === "") {
				alertmodal("예약날짜를 선택해 주세요");
				return false;

			} else if (endDate < startDate && endTime <= startTime || totaltime == "0분" || price == "0원") {
				$('#totaltime').val("0");
				$('#price').val("0");
				$('#endDate').val("0");
				$('#endTime').val("0");
				alertmodal("주차 예약시간을 다시 확인해 주세요");
				return false;
			} else {
				confirmmodal("주차 예약을 진행하시겠습니까?", function(yes) {

					if (yes) { // 결제 진행
						parkingResInsert();
					} else {
						$('#nmcar').modal('show');
					}
				});
			}

			// 주차 예약 insert
			function parkingResInsert() {
				$.ajax({
					url: '/parkResreturnPrsCode',
					type: 'POST',
					contentType: "application/json",
					data: JSON.stringify({
						"memCode": memCode,
						"prsLocation": prsLocation,
						"prsArea": prsArea,
						"prsType": prsType,
						"startDate": startDate,
						"startTime": startTime,
						"endDate": endDate,
						"endTime": endTime,
						"paymentType": paymentType,
						"price": price,
						"comment": comment,
						"chargeUse": chargeUse
					}),
					success: function(data) {

						window.location.href = "/parkingResPayment";
						prsCode = data;

						// 충전기 사용 안함
						if (chargeTime === "0" || chargePrice === "0") {
							window.location.href = "/parkingResPayment";

							// 충전기 사용 
						} else {
							$.ajax({
								url: 'chargeresinsert',
								type: 'POST',
								contentType: "application/json",
								data: JSON.stringify({
									"prsCode": prsCode,
									"chargeCode": chargeCode,
									"chargeTime": chargeTime,
									"chargePrice": chargePrice
								}),
								success: function() {
									window.location.href = "/parkingResPayment";
								},
								error: function(status, error) { alertmodal("충전 예약 실패:" + status + ' ' + error); }
							});

						}
					},
					error: function(status, error) { alertmodal("주차 예약 실패:" + status + ' ' + error); }
				});
			}
		});

		// 주차예약, 충전기정보 취소 버튼을 눌렀을때
		$('#rescancel, #chargecancel').on('click', function() {
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var startTime = $('#startTime').val();
			var endTime = $('#endTime').val();
			var chargePrice = $('#chargePrice').val();
			var comment = $('#comment').val();

			$('#nmcar').modal('hide');
			if (startDate !== "" || endDate !== "" || startTime !== "" || endTime !== "" || chargePrice !== "0" || comment !== "") {

				confirmmodal("진행중인 예약을 취소하시겠습니까?", function(yes) {
					if (yes) {
						$('#gopayment').prop('disabled', true);
						$('#startDate').val("");
						$('#endDate').val("");
						$('#startTime').val("");
						$('#endTime').val("");
						$('#comment').val("");
						$('#startDate').datetimepicker('hide');
						$('#endDate').datetimepicker('hide');
						$('#startTime').datetimepicker('hide');
						$('#endTime').datetimepicker('hide');
						$("#price").val("0");
						$("#chargePrice").val("0");
						$("#chargeTime").val("0");
						$("#totaltime").val("0");
						$('#pktypenm').prop('checked', true);
					} else {
						return false;

					}
				});
			} else {
				$('#gopayment').prop('disabled', true);
				$('#nmcar').modal('hide');
				$('#startDate').val("");
				$('#endDate').val("");
				$('#startTime').val("");
				$('#endTime').val("");
				$("#price").val("0");
				$("#chargePrice").val("0");
				$("#chargeTime").val("0");
				$("#totaltime").val("0");
				$('#pktypenm').prop('checked', true);
			}

		});

	});
});
