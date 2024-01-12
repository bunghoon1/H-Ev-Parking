$(function() {

	$(document).ready(function() {
		
		var CodeArray = [];				// 공지코드 배열에 저장
		var CodePwArray = [];			// 공지비밀번호 배열에 저장
		
		

		// 공지 리스트
		$.ajax({
			url: "/noticelist",
			type: 'GET',
			contentType: "application/json",
			success: function(data) {
				var noticelisttable = $('#noticelisttable');

				var logincheck = $('#adminId').val();
				

				data.forEach(function(datalist) {
					var noticeCode = datalist.noticeCode;
					var adminId = datalist.adminId;
					var noticeTitle = datalist.noticeTitle;
					var noticeType = datalist.noticeType;
					var noticeContent = datalist.noticeContent;
					var createDate = datalist.createDate;
					var noticePw = datalist.noticePw;

					var newRow = $('<tr>');

					// 아코디언 추가(관리자)
					if (logincheck === "admin") {
						newRow.append('<td colspan="5"><div class="accordion-item">'
							+ '<button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapse' + noticeCode + '" aria-expanded="false" aria-controls="flush-collapse' + noticeCode + '">'
							+ '<div class="noticeAcc" style="margin-right:8%;">' + noticeCode + '</div>'
							+ '<div style="margin-right:15%;font-size:13px;">' + noticeType + '</div>'
							+ '<div style="position:fixed;margin-left:24%;font-size:12px;font-weight:400;width:21%;text-align:center;">' + noticeTitle + '</div>'
							+ '<div style="position:fixed;margin-left:56%;font-size:12px;">' + adminId + '</div>'
							+ '<div style="position:fixed;margin-left:75%;z-index:3; font-size:12px;">' + createDate + '</div></button>'
							+ '<div id="flush-collapse' + noticeCode + '" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">'
							+ '<div class="accordion-body" id=' + noticeCode + '>'
							+ '<select class="textbox noticeTypeChange" aria-label="Default select example" style="position:fixed;width:15%;margin-left:45px;font-size:12px;text-align:center;display:none;">'
							+ '<option value="일반 공지" selected>일반 공지</option><option value="중요 공지">중요 공지</option><option value="주차 공지">주차 공지</option></select>'
							+ '<input type="text" class="form-control noticeTitleChange" value=' + noticeTitle + ' placeholder="공지 제목 변경" style="position:fixed;margin-left:23%;font-size:12px;width:250px;text-align:center;display:none;">'
							+ '<input type="button" class="btn btn-outline-primary noticemdf" data-index=' + noticeCode + ' value="공지 변경" style="position:fixed;margin-left:75%;font-size:12px;display:block;">'
							+ '<input type="button" name="' + noticeCode + '" class="btn btn-outline-danger noticedel" value="공지 삭제" data-bs-toggle="modal" data-bs-target="#checkpw" style="position:fixed;margin-left:85%;font-size:12px;display:block;">'
							+ '<input type="button" name="' + noticeCode + '" class="btn btn-outline-success noticesave" value="공지 저장" style="position:fixed;margin-left:75%;font-size:12px;display:none;">'
							+ '<input type="button" class="btn btn-outline-secondary noticecancel" value="변경 취소" style="position:fixed;margin-left:85%;font-size:12px;display:none;">'
							+ '<textarea class="newContent" style="font-size:12px;margin-top:4%;border:1;" disabled>' + noticeContent + '</textarea></div></div></div></td>');
						//'<td style="margin-left:100px;">' + noticeCnt + '<input type="hidden" class="ncontent" value="'+ noticeContent +'"></td>' // 조회수
						noticelisttable.append(newRow);
					} else {
						newRow.append('<td colspan="5"><div class="accordion-item">'
							+ '<button type="button" class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#flush-collapse' + noticeCode + '" aria-expanded="false" aria-controls="flush-collapse' + noticeCode + '">'
							+ '<div class="noticeAcc" style="margin-right:8%;">' + noticeCode + '</div>'
							+ '<div style="margin-right:15%;font-size:13px;">' + noticeType + '</div>'
							+ '<div style="position:fixed;margin-left:24%;font-size:12px;font-weight:400;width:21%;text-align:center;">' + noticeTitle + '</div>'
							+ '<div style="position:fixed;margin-left:56%;font-size:12px;">' + adminId + '</div>'
							+ '<div style="position:fixed;margin-left:75%;z-index:3; font-size:12px;">' + createDate + '</div></button>'
							+ '<div id="flush-collapse' + noticeCode + '" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">'
							+ '<div class="accordion-body" id=' + noticeCode + '>'
							+ '<textarea class="newContent" style="font-size:12px;border:1;" disabled>' + noticeContent + '</textarea></div></div></div></td>');
						//'<td style="margin-left:100px;">' + noticeCnt + '<input type="hidden" class="ncontent" value="'+ noticeContent +'"></td>' // 조회수
						noticelisttable.append(newRow);
					}
					//배열에 코드,비밀번호 저장
					CodeArray.push(noticeCode);

					var codeandpw = { code: noticeCode, pw: noticePw };
					CodePwArray.push(codeandpw);

					$('.collapse').collapse('hide');

					$('.accordion-button').on('click', function() {

						// 클릭된 버튼에 해당하는 collapse 보이기
						$($(this).data('bs-target')).collapse('show');
					});

				});

			},
			error: function(status, error) { alertmodal(status + ' ' + error); }
		});

		$('#insertBtn').click(function() {
			$('#insertNoticeModal').modal('show');
		});

		// 공지 등록
		$("#insertNotice").on('click', function() {
			var adminId = $('#adminId').val();
			var noticeTitle = $('#noticeTitle').val();
			var noticeType = $('#noticeType').val();
			var noticeContent = $('#noticeContent').val();
			var noticePw = $('#noticePw').val();
			if (noticeTitle !== "" && noticeContent !== "" && noticePw !== "") {
				confirmmodal("공지를 등록하시겠습니까?", function(yes) {
					if (yes) {
						$.ajax({
							url: '/noticeinsert',
							type: 'POST',
							contentType: "application/json",
							data: JSON.stringify({
								"adminId": adminId,
								"noticeTitle": noticeTitle,
								"noticeType": noticeType,
								"noticeContent": noticeContent,
								"noticePw": noticePw

							}),
							success: function(data) {
								alertmodalTrue("공지가 등록되었습니다.", function(yes) {
									if (yes) {
										window.location = "/noticeBoard";
									}
								});
							},
							error: function(status, error) { alertmodal(status + ' ' + error); }
						});
					} else {
						return false;
					}
				});
			} else {
				alertmodal("빈칸을 확인해 주세요");
				return false;
			}
		});

		//공지 삭제
		$(document).on('click', '.noticedel', function() {
			var noticeCode = $(this).attr('name');

			$('#pwcheckButton').off('click').on('click', function() {
				var noticePwcheck = $('#noticePwcheck').val();

				var findval = CodePwArray.find(function(item) {
					return item.code === parseInt(noticeCode) && item.pw === String(noticePwcheck);
				});

				if (findval) {
					confirmmodal("공지를 삭제하시겠습니까?", function(yes) {
						if (yes) {
							$.ajax({
								url: "/noticedelete",
								type: 'DELETE',
								data: { "noticeCode": noticeCode, "noticePw": noticePwcheck },
								success: function(data) {
									alertmodalTrue("공지가 삭제되었습니다.", function(yes) {
										if (yes) {
											location.reload();
										}
									});
								},
								error: function(status, error) { alertmodal(status + ' ' + error); }
							});
						} else {
							$('#checkpw').modal('hide');
							return false;
						}
					});
				} else {
					alertmodal("비밀번호를 다시 확인해 주세요");
					$('#noticePwcheck').val("");
				}
			});

		});// 삭제끝

		// 공지 변경 버튼 클릭
		$(document).on('click', '.noticemdf', function() {

			// name = this.noticeCode 
			var noticeCode = $(this).data('index');

			var findval = CodePwArray.find(function(item) {
				return item.code === parseInt(noticeCode);
			});

			if (findval) {
				//해당 버튼의 텍스트박스 변경
				$(this).closest('.accordion-body').find('.noticeTypeChange').css("display", "block");
				$(this).closest('.accordion-body').find('.noticeTitleChange').css("display", "block");

				$(this).closest('.accordion-body').find('.newContent').prop("disabled", false);

				$(this).closest('.accordion-body').find('.noticemdf').css("display", "none");
				$(this).closest('.accordion-body').find('.noticedel').css("display", "none");
				$(this).closest('.accordion-body').find('.noticesave').css("display", "block");
				$(this).closest('.accordion-body').find('.noticecancel').css("display", "block");
			}
		});


		//공지 저장
		$(document).on('click', '.noticesave', function() {

			// name = this.noticeCode 
			var noticeCode = parseInt($(this).attr('name'));
			var noticeType = $(this).closest('td').find('.noticeTypeChange').val();
			var noticeTitle = $(this).closest('td').find('.noticeTitleChange').val();
			var noticeContent = $(this).closest('td').find('.newContent').val();

			var ArrCode = CodeArray.find(function(item) {
				return item === noticeCode;
			});

			if (noticeCode === ArrCode) {

				$.ajax({
					url: "/noticeupdate",
					type: 'post',
					data: {
						"noticeCode": noticeCode,
						"noticeType": noticeType,
						"noticeTitle": noticeTitle,
						"noticeContent": noticeContent
					},
					success: function(data) {
						alertmodal("수정이 완료되었습니다.");
						location.reload();
					},
					error: function(status, error) { alertmodal(status + ' ' + error); }
				});
			}
		});

		//공지 업데이트 취소
		$(document).on('click', '.noticecancel', function() {
			location.reload();
		});
	});
});