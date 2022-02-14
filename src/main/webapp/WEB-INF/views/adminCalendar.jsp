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
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales/ko.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
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

.fc .fc-button-primary {
	background-color: #cb7f2b;
}

.fc .fc-button-primary:not(:disabled).fc-button-active {
	background-color: #cb7f2b;
}

.fc .fc-button-primary:hover {
	background-color: #f2b75b;
}

.fc .fc-button-primary:not(:disabled):active {
	background-color: #f2b75b;
}
</style>
</head>
<body>
	<div id='calendar'></div>
 <script>
      document.addEventListener("DOMContentLoaded", function () {
        var calendarEl = document.getElementById("calendar");
        var calendar = new FullCalendar.Calendar(calendarEl, {
          locale: "ko",
          headerToolbar: {
            left: "prev next",
            center: "title",
            right: "dayGridMonth", // ,timeGridWeek,timeGridDay 는 사용안함
          },
          //initialDate:  초기 보여줄 날짜 값
          navLinks: true,
          selectable: true,
          selectMirror: true,
          select: function (arg) {
            var title = prompt("일정을 입력해주세요");
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay, // Boolean (true or false), arg안에 allDay 기본값 true 내장(다른 내장값 써도 boolean이라 true)
              });
              console.log({ title, start: arg.startStr, end: arg.endStr });
              $.ajax({
                type: "PATCH",
                url: "${pageContext.request.contextPath}/admin/insert",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                  title,
                  start: arg.startStr,
                  end: arg.endStr,
                }),
                success: function (result) {
                  console.log("DB insert 성공");
                },
              });
            }
            calendar.unselect();
          },
          eventClick: function (arg) {
            //	console.log(arg.event.extendedProps); {num : 값}
            //	console.log(arg.event.extendedProps.num); 값
            var data = arg.event.extendedProps;
            if (confirm("삭제하시겠습니까?")) {
              $.ajax({
                type: "DELETE",
                url: "${pageContext.request.contextPath}/admin/delete",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                // num 값 넘겨줘야함
                data: JSON.stringify(data),
                success: function (result) {
                  console.log("삭제완료");
                  arg.event.remove();
                },
              });
            }
          },
          editable: true,
          dayMaxEvents: true, // 이벤트 화면 가득할 시 처리
          events: function (info, successCallback) {
            const arr = [];
            $.ajax({
              url: "${pageContext.request.contextPath}/admin/select",
              type: "GET",
              dataType: "json",
              success: function (result) {
                successCallback(result); // 성공시 콜백함수에 result값 넘겨주면 화면에 나타남
              }
            });
          },
          eventColor: '#f2b75b' // 이벤트 색상
        });
        calendar.render();
      });
    </script>
</body>
</html>