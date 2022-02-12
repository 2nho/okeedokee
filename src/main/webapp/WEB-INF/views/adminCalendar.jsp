<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminCalendar</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
.fc .fc-button-primary{
	background-color: #cb7f2b;
	}
.fc .fc-button-primary:not(:disabled).fc-button-active{
background-color: #cb7f2b;
}
.fc .fc-button-primary:hover {
background-color:#f2b75b;
}
.fc .fc-button-primary:not(:disabled):active{
background-color:#f2b75b;
}

/* .fc-next-button:hover {
	color: #cb7f2b;
}
.fc-prev-button:hover{
	color: #cb7f2b;
}
.fc-dayGridMonth-button{
	color: #cb7f2b;
} */

</style>
</head>
<body>
	<div id='calendar'></div>
	<script>
    var calendarEl = document.getElementById('calendar');
    document.addEventListener('DOMContentLoaded', function() {
        // 콜백함수 event에 직접적으로 ajax넣게되면 데이터가 넘어오기전에 
        // 실행이 되므로 값이 안나타날수있다
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/select',
            type:"Get",
            dataType: "json",  
            success: function(result) {
                 $.each(result,function(index, value){	
                	 const data = [];
                        // value 값만 이용
                       console.log(value);
                       data.push(value);
                       openCalander(data);
                 });
            }
        });	
    });
    
    function openCalander(datalist){
        var calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar : {
                left : 'prev next',
                center : 'title',
                right : 'dayGridMonth'
            },
            locale : 'ko', 
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
                    console.log({title,start:arg.startStr,end:arg.endStr});
                    $.ajax({
                        type:"PATCH",
                        url:'${pageContext.request.contextPath}/admin/insert',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                        data : JSON.stringify({title,start:arg.startStr,end:arg.endStr}),
                        success : function(result) {
                            console.log("DB insert 성공");
                        }
                    })
                }
                calendar.unselect();
            },
            eventClick : function(arg) {
                var data = arg.event.extendedProps;
                if (confirm('삭제하시겠습니까?')) {
                    $.ajax({
                        type:"DELETE",
                        url:'${pageContext.request.contextPath}/admin/delete',
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                        data : JSON.stringify(data),
                        success : function(result) {
                            console.log("삭제완료");
                            arg.event.remove();
                        }
                    })
                }
            },
            editable : true, 
            dayMaxEvents : true, 
            events : datalist,
            eventColor: '#f2b75b'
        });
        calendar.render();
    }
</script>
</body>
</html>