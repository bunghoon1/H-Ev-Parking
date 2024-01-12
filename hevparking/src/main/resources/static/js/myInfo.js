$(function() {
	var myinfoanimation = sessionStorage.getItem('myinfoanimation');
	if (myinfoanimation === "success") {
		$('#buttongroup').addClass('fadeIn num1');
		$('#infobtn').addClass('fadeIn num2');
		$('#paymentbtn').addClass('fadeIn num3');
		$('#pkinfobtn').addClass('fadeIn num4');
		$('#cuponbtn').addClass('fadeIn num5');

		$('#myinfotitle').addClass('fadeIn num1');
		$('#meminfo1').addClass('fadeIn num2');
		$('#meminfo2').addClass('fadeIn num3');
		$('#meminfo3').addClass('fadeIn num4');
		$('#meminfo4').addClass('fadeIn num5');
		$('#meminfo5').addClass('fadeIn num6');
		$('#meminfo6').addClass('fadeIn num7');
		$('#profileImage').addClass('fadeIn num5');
		$('#memName').addClass('fadeIn num6');
		$('#modifybtn').addClass('fadeIn num7');

		setTimeout(function() {
			sessionStorage.removeItem('myinfoanimation'); // 세션 삭제
			$('#buttongroup').removeClass('fadeIn num1');
			$('#infobtn').removeClass('fadeIn num2');
			$('#paymentbtn').removeClass('fadeIn num3');
			$('#pkinfobtn').removeClass('fadeIn num4');
			$('#cuponbtn').removeClass('fadeIn num5');

			$('#myinfotitle').removeClass('fadeIn num1');
			$('#meminfo1').removeClass('fadeIn num2');
			$('#meminfo2').removeClass('fadeIn num3');
			$('#meminfo3').removeClass('fadeIn num4');
			$('#meminfo4').removeClass('fadeIn num5');
			$('#meminfo5').removeClass('fadeIn num6');
			$('#meminfo6').removeClass('fadeIn num7');
			$('#profileImage').removeClass('fadeIn num5');
			$('#memName').removeClass('fadeIn num6');
			$('#modifybtn').removeClass('fadeIn num7');
		}, 3200);

	}


	$(document).ready(function() {



		$.ajax({
			url: "/MemberDataGet",
			type: 'GET',
			contentType: "application/json",
			success: function(data) {

				var memCode = $('#memCode').val();

				data.forEach(function(list) {
					var memcode = list.memCode;
					

					if (parseInt(memCode) === memcode) {
						$('#memName').text(list.memName+"님");
						$('#carCategory').val(list.carInfo.carCategory);
						$('#carName').val(list.carInfo.carName);
						$('#carNum').val(list.carInfo.carNum);
						$('#addr1').val(list.addr1);
						$('#addr2').val(list.addr2);
						$('#Mememail').val(list.email);
						$('#Memphone').val(list.phone);
					}
				});
			}
		});

		// nav 버튼 클릭 이벤트
		$('#infobtn, #pkinfobtn, #paymentbtn, #cuponbtn').on('click', function() {
			var buttonValue = $(this).val();

			$('.collapse').collapse('hide');
			$($(this).data('bs-target')).collapse('show');

			// 이전에 클릭한 버튼들의 그림자 제거
			$('#infobtn, #pkinfobtn, #paymentbtn, #cuponbtn').css('box-shadow', 'none');
			// 모든 버튼의 이벤트 활성화
			$('#infobtn, #pkinfobtn, #paymentbtn, #cuponbtn').css('pointer-events', 'auto');

			// 현재 클릭한 버튼에 그림자 추가 및 이벤트 비활성화
			$(this).css('box-shadow', 'inset 1px 1px 1px 1px rgb(77, 71, 71)');
			$(this).css('pointer-events', 'none');

			switch (buttonValue) {
				case '내정보':
					$('#pkinfobtn, #paymentbtn, #cuponbtn').css('pointer-events', 'auto');
					$('#myinfotable').css('width', '750px');
					break;

				case '결제정보':
					$('#infobtn, #pkinfobtn, #cuponbtn').css('pointer-events', 'auto');
					$('#myinfotable').css('width', '500px');
					break;

				case '예약정보':
					$('#infobtn, #paymentbtn, #cuponbtn').css('pointer-events', 'auto');
					$('#myinfotable').css('width', '1200px');
					break;

				case '쿠폰정보':
					$('#infobtn, #paymentbtn, #pkinfobtn').css('pointer-events', 'auto');
					$('#myinfotable').css('width', '600px');
					break;

				default:
					$('#myinfotable').css('width', '50%');
					break;
			}
		});

		// 개인정보 변경
		$('#modifybtn, #modifyCancel').on('click', function() {

			var btnName = $(this).text();
			var memCode = $('#memCode').val();
			var carCategory = $('#carCategory').val();
			var carName = $('#carName').val();
			var carNum = $('#carNum').val();
			var addr1 = $('#addr1').val();
			var addr2 = $('#addr2').val();
			var Mememail = $('#Mememail').val();
			var Memphone = $('#Memphone').val();

			// 버튼이 변경버튼이면
			if (btnName === "변 경") {
				$(this).text("저 장");
				$('#myinfotitle').css('margin-right', '176px');
				$('.meminput').css('box-shadow', 'inset 1px 1px 1px 1px rgb(77, 71, 71)');
				$('#memPwChange').css('pointer-events', 'none');
				$('#modifyCancel').show();
				$('#carCategory').prop('disabled', false);
				$('#carName').prop('disabled', false);
				$('#carNum').prop('disabled', false);
				$('#addr1').prop('disabled', false);
				$('#addr2').prop('disabled', false);
				$('#Mememail').prop('disabled', false);
				$('#Memphone').prop('disabled', false);

				// 버튼이 저장버튼이면
			} else if (btnName === "저 장") {

				if (carCategory.length > 0 && carName.length > 0 && carNum.length > 0 && addr1.length > 0 && addr2.length > 0 && Mememail.length > 0 && Memphone.length > 0) {
					confirmmodal("변경된 정보를 저장히시겠습니까?", function(yes) {
						if (yes) {

							$.ajax({
								url: "/memInfoUpdate",
								type: 'post',
								contentType: 'application/json',
								data: JSON.stringify({
									"memCode": memCode,
									"addr1": addr1,
									"addr2": addr2,
									"email": Mememail,
									"phone": Memphone,
									"carCategory": carCategory,
									"carName": carName,
									"carNum": carNum
								}),
								success: function(data) {
									$('#modifybtn').text("변 경");
									$('#carCategory').prop('disabled', true);
									$('#carName').prop('disabled', true);
									$('#carNum').prop('disabled', true);
									$('#addr1').prop('disabled', true);
									$('#addr2').prop('disabled', true);
									$('#Mememail').prop('disabled', true);
									$('#Memphone').prop('disabled', true);
									$('#memPwChange').css('pointer-events', 'auto');
									$('#myinfotitle').css('margin-right', '230px');
									$('.meminput').css('background-color', 'white');
									$('.meminput').css('box-shadow', 'none');
									$('#modifyCancel').hide();
									$(this).text("변 경");

									alertmodalTrue("개인정보 수정이 [ 완료 ] 되었습니다.", function(yes) {
										if (yes) {
											//window.location.reload();
										}
									});
								},
								error: function(status, error) { alertmodal("회원 기본정보 업데이트 실패!" + status + ' ' + error); }
							});

						} else {
							return false;
						}
					});

				} else {
					return false;
				}

				// 버튼이 취소버튼이면	
			} else if (btnName === "취 소") {
				var memCode = $('#memCode').val();

				$.ajax({
					url: "/MemberDataGet",
					type: 'GET',
					contentType: "application/json",
					success: function(data) {

						data.forEach(function(list) {

							if (memCode === list.memCode) {
								$('#carCategory').val(list.carCategory);
								$('#carName').val(list.carName);
								$('#car').val(list.carCategory);
								$('#carCategory').val(list.carCategory);
								$('#carCategory').val(list.carCategory);

							}

						})

					},
				});

				$('#modifybtn').text("변 경");
				$('#carCategory').prop('disabled', true);
				$('#carName').prop('disabled', true);
				$('#carNum').prop('disabled', true);
				$('#addr1').prop('disabled', true);
				$('#addr2').prop('disabled', true);
				$('#Mememail').prop('disabled', true);
				$('#Memphone').prop('disabled', true);
				$('#memPwChange').css('pointer-events', 'auto');
				$('#myinfotitle').css('margin-right', '230px');
				$('.meminput').css('background-color', 'white');
				$('.meminput').css('box-shadow', 'none');
				$('#modifyCancel').hide();
			}
		});

		// 개인정보 변경중 주소
		$('#addr1').click(function() {
			searchAddr();
		});

		// 비밀변호 변경버튼 클릭
		$('#memPwChange').click(function() {
			$('#passWordcheckModal').modal('show');
		});

		// 기존 비밀번호 확인
		$('#passWordCheck').click(function() {
			var writememPw = $('#passCheckinputPass').val();
			var memcode = $('#memCode').val();

			// 회원정보 가져오기
			$.ajax({
				url: "/MemberDataGet",
				type: 'GET',
				contentType: "application/json",
				success: function(data) {

					data.forEach(function(list) {
						var memCode = list.memCode;
						var memPw = list.memPw;

						//비밀번호 체크
						if (parseInt(memcode) === memCode && writememPw === memPw) {
							$('#passWordcheckModal').hide();
							setTimeout(function() {
								$('#passWordcheckModal').modal('hide');
								$('#passWordWriteModal').modal('show');
								$('#passCheckFalse').css('display', 'none');
								$('#passCheckinputPass').val("");
							}, 200);

							return true;
						} else {
							$('#passCheckFalse').css('display', 'block');
							return false;
						}
					});
				}
			});

			// 비밀번호 변경창에서 취소버튼 
			$('#passWordCheckCancel, #passWordChangeCancel').on('click', function() {
				$('#passCheckFalse').css('display', 'none');
				$('#passCheckinputPass').val("");
			});
		});

		// 비밀번호 변경 마지막
		$('#passWordChange').click(function() {
			var memCode = $('#memCode').val();
			var changePass = $('#inputChangePass').val();
			var changepassre = $('#inputChangePassre').val();

			if (changePass.length > 0 && changePass === changepassre || changepassre.length > 0 && changePass === changepassre) {

				$.ajax({
					url: "/PasswrodChange",
					type: 'post',
					data: { "memCode": parseInt(memCode), "memPw": changePass },
					success: function(data) {
						if (data) {
							$('#inputChangePass').val("");
							$('#inputChangePassre').val("");
							$('#passWordWriteModal').modal('hide');
							$('#passCheckFalse').css('display', 'none');
							alertmodal("비밀번호가 변경 되었습니다.");
						}

					},
					error: function(status, error) { alertmodal("비밀번호 업데이트 실패!" + status + ' ' + error); }
				});

			} else {
				alertmodal("비밀번호가 다릅니다.");
				return false;
			}
		});

		// 카드 정보 불러오기
		var getcardCodeArray = []; // 카드 코드 배열
		var memCodeCount = 0;
		$.ajax({
			url: "/CardAndCardPayment",
			type: 'GET',
			contentType: "application/json",
			success: function(data) {
				var paymenttable = $('#paymentListTable');
				var memCodeval = $('#memCode').val();

				data.forEach(function(list) {
					var memCode = list.memCode;
					var cardCode = list.cardCode;
					var cardName = list.cardName;
					var cardNum = list.cardNum;

					if (parseInt(memCodeval) === memCode) {

						var cardrow = $('<tr data-index=' + cardCode + '>');
						cardrow.append('<td align="center" colspan="2">'
							+ '<div id=' + cardCode + ' data-index=' + cardName + '>'
							+ '<input type="text" style="margin-top:75px;margin-left:8px;font-weight: 600;color:#1c1a1a; border:0; text-align:center;background-color: transparent;" value="' + cardNum + '"></div>'
							+ '<input type="button" class="btn btn-outline-danger cardDelete" style="width:200px;font-size:10px;" data-index=' + cardCode + ' value="카드 삭제"><hr/></td>');

						paymenttable.append(cardrow);

						// 회원카드 갯수 제한
						memCodeCount++;

					}
					if (memCodeCount >= 3) {
						$('#paymentListTable th').hide();
					} else {
						$('#paymentListTable th').show();
					}

					// 카드 이미지 적용
					var elementById = $('#' + cardCode); // id요소 찾기 
					var divid = elementById.attr('id');
					var cardname = elementById.data('index');

					// 카드 이미지의 index와 카드이름 비교
					if (cardCode === parseInt(divid) && cardName === cardname) {

						switch (cardName) {
							case 'bc':
								elementById.addClass('paymentcardImage_bc');
								break;
							case 'hana':
								elementById.addClass('paymentcardImage_hana');
								break;
							case 'hyundai':
								elementById.addClass('paymentcardImage_hyundai');
								break;
							case 'kb':
								elementById.addClass('paymentcardImage_kb');
								break;
							case 'lotte':
								elementById.addClass('paymentcardImage_lotte');
								break;
							case 'nc':
								elementById.addClass('paymentcardImage_nc');
								break;
							case 'samsung':
								elementById.addClass('paymentcardImage_samsung');
								break;
							case 'sinhan':
								elementById.addClass('paymentcardImage_sinhan');
								break;
							case 'woori':
								elementById.addClass('paymentcardImage_woori');
								break;
							default:
								false;
								break;
						}
					}

				});
			}, error: function(status, error) { alertmodal("카드 정보 불러오기 실패:" + status + ' ' + error); }
		});

		// 카드 등록 클릭시 
		$('#CardInsert').click(function() {
			$('#cardInsertModal').modal('show');
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

		//카드 등록 클릭시
		$('#cardInsert').click(function() {
			var memCode = $('#memCode').val();
			var cardNum = $('#cardNum1').val() + '-' + $('#cardNum2').val() + '-' + $('#cardNum3').val() + '-' + $('#cardNum4').val();
			var cardDate = $('#cardDate').val();
			var cardName = $('#cardName').val();
			var cardPass = $('#cardPass').val();
			var cvc = $('#cardPass').val();
			
			if ($('#cardNum1').val() === "" || $('#cardNum2').val() === "" || $('#cardNum3').val() === "" || $('#cardNum4').val() === "" || $('#cardDate').val() === "" || $('#cardName').val() === "선택" || $('#cardPass').val() === "" || $('#cvc').val() === "") {
				alertmodal("빈칸이 존재합니다 다시 확인해 주세요");
				return false;
			} else {
				
				confirmmodal("카드를 등록하시겠습니까??", function(yes) {
					if (yes) {
						// 카드 insert
						$.ajax({
							url: '/cardregistration',
							type: 'POST',
							contentType: "application/json",
							data: JSON.stringify({
								"memCode": memCode,
								"cardName": cardName,
								"cardNum": cardNum,
								"cvc": cvc,
								"cardDate": cardDate,
								"cardPass": cardPass
							}),
							success: function(data) {
								$('#cardInsertModal').modal('hide');
								alertmodalTrue('카드가 등록 되었습니다.', function(yes) {
									if (yes) {
										window.location.reload();
									}
								});

							},
							error: function(status, error) { alertmodal(status + ' ' + error); }
						});
					} else {
						return false;
					}
				});
			}

		});

		// 결제된 카드 정보 조회
		$.ajax({
			url: "/getcardpaymentInfo",
			type: 'GET',
			contentType: "application/json",
			success: function(data) {

				data.forEach(function(datalist) {
					var paymentCardCode = datalist.cardCode;

					var getcardCodeArrayInfo = { code: paymentCardCode };
					getcardCodeArray.push(getcardCodeArrayInfo);

				});

			}, error: function(status, error) { alertmodal("결제된 카드 정보 불러오기 실패:" + status + ' ' + error); }
		});

		// 카드 삭제 버튼 클릭시
		$(document).on('click', '.cardDelete', function() { // 동적으로 생성된 버튼
			var cardCode = $(this).data('index');
			var memCode = $('#memCode').val();

			// 주차 예약 결제에 사용된 카드가 있을때
			var filterCode = getcardCodeArray.filter(function(item) {

				return item.code === cardCode;
			});

			if (filterCode.length > 0) {
				alertmodalTrue("[예약 정보]가 남아있는 카드 입니다.<br/> 주차 정보를 확인해 주세요", function(ok) {
					if (ok) {
					}
				});

			} else if (filterCode.length === 0) {
				confirmmodal("[등록된 카드] 를 삭제하시겠습니까?", function(ok) {
					if (ok) {
						$('#parkingListTable tbody > tr[data-index="' + cardCode + '"]').remove();
						$.ajax({
							url: "/cardDelete",
							type: 'DELETE',
							data: { "cardCode": cardCode, "memCode": memCode },
							success: function(data) {

								alertmodalTrue("카드 삭제가 완료되었습니다.", function(yes) {
									if (yes) {
										window.location.reload();
									}
								});
							}, error: function(status, error) { alertmodal("등록된 카드삭제 실패:" + status + ' ' + error); }
						});
					} else {
						return false;
					}
				});
			}
		});

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
					var chargeUse = datalist.chargeUse;
					var price = datalist.price;
					var chargePrice = datalist.chargeResVO.chargePrice;

					// 주차 목록 정보 
					if ($('#memCode').val() == memCode) {
						var resrow = $('<tr>');
						resrow.append('<td><input type="text" class="prsCode" name="prsCode" value="' + prsCode + '"></td>');
						resrow.append('<td><input type="text" class="prsLocation" name="prsLocation" value="' + prsLocation + '"></td>');
						resrow.append('<td><input type="text" class="prsType" name="prsType" value="' + prsType + '"></td>');
						resrow.append('<td><input type="text" class="startDate" name="startDate" value="' + startDate + ' ' + startTime.substr(0, 5) + '"></td>');
						resrow.append('<td><input type="text" class="endDate" name="endDate" value="' + endDate + ' ' + endTime.substr(0, 5) + '"></td>');
						resrow.append('<td><input type="text" class="prsDate" name="prsDate" value="' + prsDate.substr(0, 16) + '"></td>');

						// 결제 진행중 버튼 클릭시 결제 창으로 이동
						if (paymentType === "결제진행중") {
							resrow.append('<td><button type="button" class="btn btn-outline-success" id="paymentPagebtn" style="font-size:10px;" data-index=' + prsCode + '>' + paymentType + '</button></td>');
						} else {
							resrow.append('<td><button type="button" class="btn btn-outline-secondary paymentType" style="font-size:10px; name="paymentType" data-index=' + prsCode + '>' + paymentType + '</button></td>');
						}

						// 충전기 사용 여부
						if (chargeUse === "yes" && chargePrice !== null) {
							var reprice = price.replace('원', '');
							var rechargeprice = chargePrice.replace('원', '');
							var priceAndchargePrice = parseInt(reprice) + parseInt(rechargeprice);

							resrow.append('<td><input type="text" class="price" name="price" value="' + priceAndchargePrice + "원" + '"></td>');
							resrow.append('<td><input type="text" class="chargeUse" name="chargeUse" value="사용"></td>');
						} else {
							resrow.append('<td><input type="text" class="price" name="price" value=' + price + '></td>');
							resrow.append('<td><input type="text" class="chargeUse" name="chargeUse" value="미사용"></td>');
						}

						resrow.append('<td><button type="button" class="btn btn-outline-danger parkingdelbtn" style="font-size:10px;" data-index=' + prsCode + '>예약취소</button></td>');


						parkingrestable.append(resrow);
					}

					// 카드 정보
					if (paymentType == "카드결제" && $('#memCode').val() == memCode) {

					}
				});
			}, error: function(status, error) { alertmodal("데이터 불러오기 실패:" + status + ' ' + error); }
		});
	});

	//뒤로가기
	$('#back').on('click', function() {
		window.location.href = "index";
	});

	//프로필 이미지 변경
	$('#profileImage').on('click', function() {

	});



});
