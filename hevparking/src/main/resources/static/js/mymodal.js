// 확인창 모달을 열기 위한 함수
function confirmmodal(text, callback) {
var confirmed = false; // 초기값 변경    

    $("#confirmModal .modal-body").html(text);
    $("#confirmModal").modal('show');

    $('#confirmModalcheck').on('click keypress', function(e) {
        if (e.type === 'click' || e.keyCode === 13) {
            $("#confirmModal").modal('hide');
            callback(true);
            
        }
    });

    $('#confirmModalcancel').on('click', function() {
        $("#confirmModal").modal('hide');
        callback(confirmed);
        return false;
    });
}


// 경고창 모달을 열기위한 함수
function alertmodal(text) {
	$("#alertModal .modal-body").html(text);
	$("#alertModal").modal('show');
}

// 경고창 확인 true값 반환
function alertmodalTrue(text, callback) {
	$("#alertModal .modal-body").html(text);
	$("#alertModal").modal('show');

	$('#alertModalcheck').on('click keypress', function(e) {
		if (e.type === 'click' || e.keyCode === 13) {
			callback(true);
		}
	});
}