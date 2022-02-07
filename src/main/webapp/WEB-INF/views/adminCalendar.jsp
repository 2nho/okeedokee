<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminCalendar</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
				//initialDate:  초기 보여줄 날짜 값 지정 X
				navLinks : true,
				selectable : true, // 드래그로 날짜설정가능
				selectMirror : true,
				select : function(arg) {
					var title = prompt('일정을 입력해주세요');
					if (title) {
						calendar.addEvent({
							title : title,
							start : arg.start,
							end : arg.end,
							allDay : arg.allDay // Boolean (true or false), arg안에 allDay 기본값 true 내장(다른 내장값 써도 boolean이라 true) 
						})
						console.log({title,start:arg.startStr,end:arg.endStr});
						$.ajax({
							type:"PATCH",
							url:'${pageContext.request.contextPath}/admin/insert',
							 contentType: "application/json; charset=utf-8",
							 dataType: "json",
							data : JSON.stringify({title,start:arg.startStr,end:arg.endStr}),
							success : function(result) {
								alert((result));
							}
						})
					}
					calendar.unselect();
				},
				eventClick : function(arg) {
					if (confirm('삭제하시겠습니까?')) {
						arg.event.remove()
					}
				},
				editable : true, // 날짜조정 스크롤바로 가능
				dayMaxEvents : true, // true시 이벤트가 많을 경우 more
				events :[
					$.ajax({
						url: '${pageContext.request.contextPath}/admin/select',
						type:"Get",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						success: function(result) {
					        console.log(result);
						 },
						 error: function(err){
					        	console.log(err);	
					        }
					})
				]	
			});
			calendar.render();
		});
	</script>
</body>
</html>