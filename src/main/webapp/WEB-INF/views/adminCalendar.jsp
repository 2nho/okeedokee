<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminCalendar</title>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales/ko.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<style type="text/css">
body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<div id='calendar'></div>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				locale : 'ko',
				headerToolbar : {
					left : 'prev next',
					center : 'title',
					right : 'dayGridMonth' // ,timeGridWeek,timeGridDay 는 사용안함
				},
				//initialDate:  초기 보여줄 날짜 값 
				navLinks : true,
				selectable : true,
				selectMirror : true,
				select : function(arg) {
					var title = prompt('일정을 입력해주세요');
					if (title) {
						calendar.addEvent({
							title : title,
							start : arg.start,
							end : arg.end,
							allDay : arg.allDay
						})
					}
					calendar.unselect();
				},
				eventClick : function(arg) {
					if (confirm('삭제하시겠습니까?')) {
						arg.event.remove()
					}
				},
				editable : true,
				dayMaxEvents : true, // allow "more" link when too many events
				events : [ {
					title : '이벤트',
					start : '2022-02-07'
				} ]
			});
			calendar.render();
		});
	</script>
</body>
</html>