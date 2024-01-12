$(function() {
	$(document).ready(function() {
		var week = ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'];
		updateTime();
		var timerID = setInterval(updateTime, 1000);

		function updateTime() {
			var cd = new Date();
			var timeStr = zeroPadding(cd.getHours(), 2) + '시 ' + zeroPadding(cd.getMinutes(), 2) + '분 ' + zeroPadding(cd.getSeconds(), 2)+'   '+week[cd.getDay()];
			var dateStr = zeroPadding(cd.getFullYear(), 4) + '년 ' + zeroPadding(cd.getMonth() + 1, 2) + '월 ' + zeroPadding(cd.getDate(), 2) + '일 ';

			$('#clocktime').text(timeStr);
			$('#clockdate').text(dateStr);
		}

		function zeroPadding(num, digit) {
			var zero = '';
			for (var i = 0; i < digit; i++) {
				zero += '0';
			}
			return (zero + num).slice(-digit);
		}
	});
	
	

});


