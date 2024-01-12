$(function() {

	if ($('#memCode').val() == "null") {
		$('#memCode').val("0");
	}


	$('#adminlogout').on('click', function() {

		confirmmodal("로그아웃 하시겠습니까?", function(yes) {
			if (yes) {
				window.location.href = "adminlogout";
				window.onload();
				return true;
			} else {
				return false;
			}
		});
	});

	// 회원 로그아웃
	$('#logout').on('click', function() {

		confirmmodal("로그아웃 하시겠습니까?", function(yes) {
			if (yes) {
				window.location.href = "logout";
				alertmodal("로그아웃되었습니다.");
			} else {
				return false;
			}
		});
	});


	$(document).ready(function() {

		// 주차예약 성공
		setTimeout(function() {
			var parkingresSuccess = sessionStorage.getItem('parkingresSuccess');
			if (parkingresSuccess === "success") {
				alertmodal("주차 예약이 완료 되었습니다.");
				sessionStorage.removeItem('parkingresSuccess'); // 세션 삭제
			}
		}, 50);

		// 주차예약 취소
		setTimeout(function() {
			var resCancelSuccess = sessionStorage.getItem('parkingresCancel');
			if (resCancelSuccess === "success") {
				alertmodal("예약된 주차가 취소 되었습니다.");
				sessionStorage.removeItem('parkingresCancel'); // 세션 삭제
			}
		}, 50);


		var parkinginfoArray = []; // 주차 예약 코드,타입 담고있는 배열

		// 로그인이 필요한 기능
		$('#goparkingres, #goparkinglist').on('click', function() {
			var membersessionVo = $('#memCode').val();

			if (membersessionVo === "0") {
				confirmmodal("서비스를 이용하려면 로그인이 필요합니다.<p>로그인 페이지로 이동합니다.</p>", function(yes) {
					if (yes) {
						window.location.href = "/login";
					} else {
						return false;
					}
				});
			} else if ($(this).attr('id') === "goparkingres" && membersessionVo !== "0") {
				sessionStorage.setItem('opendoor', 'success');
				window.location.href = "/parkingRes";

			} else if ($(this).attr('id') === "goparkinglist" && membersessionVo !== "0" && parkinginfoArray.length !== 0) {
				$('#parkinglist').modal('show');
			} else if ($(this).attr('id') === "goparkinglist" && membersessionVo !== "0" && parkinginfoArray.length === 0) {
				$('#parkinglist').modal('hide');
				alertmodal("예약된 주차가 없습니다.");
			}
		});


		// 주차 정보 리스트
		$.ajax({
			url: "/parkingList",
			type: 'GET',
			contentType: "application/json",
			success: function(data) {
				var parkingrestable = $('#parkingListTable');

				data.forEach(function(datalist) {

					var prsCode = datalist.prsCode;
					var memCode = datalist.memCode;
					var prsLocation = datalist.prsLocation;
					var prsType = datalist.prsType;
					var prsDate = datalist.prsDate;
					var startDate = datalist.startDate;
					var endDate = datalist.endDate;
					var startTime = datalist.startTime;
					var endTime = datalist.endTime;
					var paymentType = datalist.paymentType;
					var parkingStatus = datalist.parkingStatus;
					var chargeUse = datalist.chargeUse;
					var price = datalist.price;
					var chargePrice = datalist.chargeResVO.chargePrice;

					/* ---- 예약 종료일 ---- */
					var EndparkingDay = new Date(endDate + ' ' + endTime);
					var today = new Date();

					var endDateTime = endDate + ' ' + endTime;

					/* ---- 종료일로부터 남은시간 계산 ---- */
					var lastendDate = new Date(endDateTime);

					// 현재 시간
					var now = new Date();

					// 종료일과 현재 시간의 차이 계산
					var difference = lastendDate - now;

					// 차이를 시간, 분으로 계산
					var days = Math.floor(difference / (1000 * 60 * 60 * 24));
					var hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
					var minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));

					/* ---- 결제 진행중 남은시간 계산 ---- */
					var paymentLasttime = new Date(prsDate);

					// 결제시간에 30분 추가
					var addedThirtyMinutes = new Date(paymentLasttime.getTime() + 30 * 60000);

					var differenceMinute = addedThirtyMinutes - now;

					var lastminutes = Math.floor((differenceMinute % (1000 * 60 * 60)) / (1000 * 60));

					// 예약 종료일
					if (today > EndparkingDay) {
						var parkingStatusupdate = "예약일만료";

						$('.locbtn').each(function() {
							if ($(this).val() === prslocation) {
								console.log(prsCode);
								$.ajax({
									url: 'endDateUpdate',
									type: 'POST',
									data: { "prsCode": prsCode, "parkingStatus": parkingStatusupdate },
									success: function(data) {
									},
									error: function(status, error) { alertmodal("주차 만료 업데이트 실패:" + status + ' ' + error); }
								});
							}
						});
					}

					// 회원이 주차한 내역만 불러오기
					if (parseInt($('#myInfo').data('index')) === memCode) {
						var resrow = $('<tr>');
						resrow.append('<td><div>' + prsLocation + '</div></td>');
						resrow.append('<td><div>' + prsType + '</div></td>');
						resrow.append('<td><div>' + startDate + ' ' + startTime.substr(0, 5) + '</div></td>');
						resrow.append('<td><div>' + endDate + ' ' + endTime.substr(0, 5) + '</div></td>');

						// 결제 진행중 상태
						if (paymentType === "결제진행중") {
							resrow.append('<td><div style="color:red">' + lastminutes + "분후 삭제 됩니다." + '</div></td>');
							resrow.append('<td><button type="button" class="btn btn-outline-success paymentPagebtn" style="font-size:9px;" data-index=' + prsCode + '>' + paymentType + '</button></td>');
							resrow.append('<td><div style="color:orange">' + parkingStatus + '</div></td>');

							// 결제 완료 상태
						} else if (paymentType === "카드결제" && parkingStatus === "결제완료" || paymentType === "계좌이체" && parkingStatus === "결제완료") {
							resrow.append('<td><div>' + days + "일 " + hours + "시간 " + minutes + "분 남음" + '</div></td>');
							resrow.append('<td><button type="button" class="btn btn-outline-secondary paymentType" style="font-size:10px; name="paymentType" data-index=' + prsCode + '>' + paymentType + '</button></td>');
							resrow.append('<td><div style="color:green">' + parkingStatus + '</div></td>');

							// 예약시간 종료 상태
						} else {
							resrow.append('<td><div>' + "예약시간종료" + '</div></td>');
							resrow.append('<td>' + paymentType + '</td>');
							resrow.append('<td><div>' + parkingStatus + '</div></td>');
							resrow.addClass('EndParkingRes');
						}

						// 충전기 사용 여부
						if (chargeUse === "yes" && chargePrice !== null) {
							var reprice = price.replace('원', '');
							var rechargeprice = chargePrice.replace('원', '');
							var priceAndchargePrice = parseInt(reprice) + parseInt(rechargeprice);

							resrow.append('<td><div>' + priceAndchargePrice + "원" + '</div></td>');
							resrow.append('<td><div style="color:blue">' + "사용" + '</div></td>');
						} else {
							resrow.append('<td><div>' + price + '</div></td>');
							resrow.append('<td><div style="color:silver">' + "사용안함" + '</div></td>');
						}

						resrow.append('<td><button type="button" class="btn btn-outline-danger parkingdelbtn" style="font-size:10px;" data-index=' + prsCode + '>예약취소</button></td>');

						parkingrestable.append(resrow);

						var codeandtype = { code: prsCode, type: paymentType, charge: chargeUse };
						parkinginfoArray.push(codeandtype);
						
						// 30분이 지나면 결제진행중 삭제
						if (lastminutes < 0 && paymentType === "결제진행중" && chargeUse ==="no") {
							console.log(prsCode);
							$.ajax({
								url: "/parkinglistdelete",
								type: 'DELETE',
								data: { "prsCode": prsCode },
								success: function() {
									location.reload();
								},
								error: function(status, error) { alertmodal("결제진행중 삭제 실패(216):" + status + ' ' + error); }
							});
						}else if(lastminutes < 0 && paymentType === "결제진행중" && chargeUse ==="yes"){
							$.ajax({
								url: "/parkinglistandchargeRes",
								type: 'DELETE',
								data: { "prsCode": prsCode },
								success: function() {
									location.reload();
								},
								error: function(status, error) { alertmodal("결제진행중 삭제 실패(226):" + status + ' ' + error); }
							});
						}
					}
				});
			}
		});

		// 결제 진행중, 예약취소 버튼 이벤트
		$(document).on('click', '.paymentPagebtn, .parkingdelbtn', function(btn) {
			var prsCode = $(this).data('index');

			var findcharge = parkinginfoArray.find(function(item) {
				return item.code === parseInt(prsCode) && item.charge && item.type;
			});

			$('#parkinglist').modal('hide');

			// 결제 진행
			if ($(btn.target).hasClass('paymentPagebtn')) {
				confirmmodal("결제를 진행 하시겠습니까?", function(yes) {
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
						$('#parkinglist').modal('show');
						return false;
					}
				});

				// 결제 취소
			} else if ($(btn.target).hasClass('parkingdelbtn')) {

				// 예약된 결제 수단 (카드 결제)
				if (findcharge.type === "카드결제") {
					confirmmodal("예약을 취소 하시겠습니까?", function(yes) {
						if (yes) {
							$.ajax({
								url: "/cardpaymentdel",
								type: 'DELETE',
								data: { "prsCode": prsCode },
								success: function(data) {
									if (findcharge.charge === "yes") {
										parkinglistandchargeRes();
									} else if (findcharge.charge === "no") {
										parkinglistdelete();
									}
								},
								error: function(status, error) { alertmodal("카드 결제 삭제 실패:" + status + ' ' + error); }
							});

						} else {
							$('#parkinglist').modal('show');
							return false;
						}
					});

				// 예약된 결제 수단 (계좌이체 결제)
				} else if (findcharge.type === "계좌이체") {
					confirmmodal("예약을 취소 하시겠습니까?", function(yes) {
						if (yes) {
							$.ajax({
								url: "/pkaccdel",
								type: 'DELETE',
								data: { "prsCode": prsCode },
								success: function(data) {
									if (findcharge.charge === "yes") {		//충전기 예약 했을때 
										parkinglistandchargeRes();
									} else if (findcharge.charge === "no") {  //충전기 예약 안했을때
										parkinglistdelete();
									}
								},
								error: function(status, error) { alertmodal("계좌이체 삭제 실패:" + status + ' ' + error); }
							});

						} else {
							$('#parkinglist').modal('show');
							return false;
						}
					});
				} else {
					if (findcharge.charge === "yes") {		//충전기 예약 했을때 
						parkinglistandchargeRes();
					} else if (findcharge.charge === "no") {  //충전기 예약 안했을때
						parkinglistdelete();
					}
				}

			}

			//주차 예약 취소(메소드)
			function parkinglistdelete() {
				var prsCode = findcharge.code;

				$.ajax({
					url: "/parkinglistdelete",
					type: 'DELETE',
					data: { "prsCode": prsCode },
					success: function() {
						sessionStorage.setItem('parkingresCancel', 'success');
						location.reload();
					},
					error: function(status, error) { alertmodal("충전기 사용 예약 삭제 실패:" + status + ' ' + error); }
				});
			}

			// 충전기 예약 + 주차 예약 취소
			function parkinglistandchargeRes() {
				var prsCode = findcharge.code;

				$.ajax({
					url: "/parkinglistandchargeRes",
					type: 'DELETE',
					data: { "prsCode": prsCode },
					success: function() {
						sessionStorage.setItem('parkingresCancel', 'success');
						window.location.reload();
					},
					error: function(status, error) { alertmodal("충전기 사용 예약 삭제 실패:" + status + ' ' + error); }
				});
			}
		});

		// 회원정보 클릭시
		$('#myInfo').click(function() {
			sessionStorage.setItem('myinfoanimation', 'success');
			window.location.href = "/myInfo";
		});

		// 텍스트에 마우스 올리면 이벤트
		$('#goparkingres').hover(
			function() {
				$('#parkingresText').fadeIn();
			},
			function() {
				$('#parkingresText').hide();
			}
		);

		$('#gonoticeBoard').hover(
			function() {
				$('#noticeBoardText').fadeIn();
			},
			function() {
				$('#noticeBoardText').hide();
			}
		);

		$('#gosearchMap').hover(
			function() {
				$('#searchMapText').fadeIn();
				$('#infotext').hide();
			},
			function() {
				$('#searchMapText').hide();
				$('#infotext').fadeIn();
			}
		);

		$('#goparkinglist').hover(
			function() {
				$('#parkingInfoText').fadeIn();
			},
			function() {
				$('#parkingInfoText').hide();
			}
		);


	});
});