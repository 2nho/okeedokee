/* reservation_create*/
let init_Reservation = function () {
	let today = new Date() , todayResult = '';
		
	today.setMonth(today.getMonth() + 1); 
	let dateResult = getDateZeroPadding(today.getMonth(), today.getDate());
	todayResult = today.getFullYear() + '-' + dateResult.monthResult + '-' + dateResult.dateResult;
	if($("#reserDate").val() == ""){
		$('#reserDate').val(todayResult);
	}
	
}

let getDateZeroPadding = function (i_month, i_date) {
		let jsonResult = {}
		  , dateResult = ''
		  , monthResult = '';
	
		//달
		if (1 < i_month.length) {
			monthResult = i_month;
		} else {
			monthResult = '0' + i_month;
		}
	
		//일
		if (1 < i_date.length) {
			//10~31일자
			dateResult = i_date;
		} else {
			//1~9
			dateResult = '0' + i_date;
		}
		
		jsonResult.monthResult = monthResult
		jsonResult.dateResult = dateResult;
		
		return jsonResult;
	}
	
$(document).ready(function() {
	
    init_Reservation();
	
});

$(function() {
	const modifyRnum = $("#modifyRnum").val();
	const deleteMnum = $("#deleteMnum").val();
	
	$("#reserDate").on("change",function(){
		const reserDate = $(this);
		let fullDate = new Date();
		let year = fullDate.getFullYear(); // 년도
		let month = fullDate.getMonth() + 1;  // 월
		let date = fullDate.getDate();  // 날짜
		
		if(month.toString.length == "1"){
			month = "0" + month;
			if(date.toString.length == "1"){
				date = "0" + date;
			}
		}
		
		let today = year+"-"+month+"-"+date;

		if(reserDate.val() < today){
			alert("날짜를 확인해주세요.");
			reserDate.val(today);
		}
		
	});
	
	$("#listMove").click(function(){
		location.href = "/okeedokee/reservation";
	});
	
	$("#createReser").click(function(){
		if(confirm("방문 예약하시겠습니까?")){
			$("#submitCreate").submit();
		}
	});

	$("#modifyReser").click(function(){
		if(confirm("수정하시겠습니까?")){
			location.href = "/okeedokee/reservationModify?rnum="+modifyRnum;
		}
	});
	
	$("#deleteReser").click(function(){
		if(confirm("삭제하시겠습니까?")){
			location.href = "/okeedokee/reservationDelete?rnum="+modifyRnum+"&mnum="+deleteMnum;
		}
	});
	
	$("#modifyReserResult").click(function(){
		if(confirm("수정 완료하시겠습니까?")){
			$("#submitModifyResult").submit();
		}
	});
	
    $("#openInfo").click(function(){
		$('.main-content-info').fadeIn( 1000 );
		$('#map').fadeOut( 500 );
		$(".main-content-info").css("display","flex");
		
	});
	
	$("#closeInfo").click(function(){
		$('.main-content-info').fadeOut(1000);
		$('#map').fadeIn( 500 );
	});
});

/* 텍스트에디터 */
function textEdit() {
	let oEditors = [];
	smartEditor = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "/okeedokee/smartEditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2",
			htParams: {
				bUseToolbar: true,
				bUseVerticalResizer: false,
				bUseModeChanger: false,
			}
		});
	}
	
	$(document).ready(function() {
		smartEditor();
	});
	
	submitPost = function()  {	
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	}
	
}textEdit();

/* map */
var init_Announcement_detail = function () {
	var mapContainer = document.getElementById('map'),
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667),
	        level: 9
	    };  

	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	var geocoder = new kakao.maps.services.Geocoder();
	
	var dogId = $("#shelterDetail").attr("value");
	var splitDogId = dogId.split(':');
	
	var shelterId = $("#shelterName").attr("value");
	var splitshelterId = shelterId.split(':');
	
	geocoder.addressSearch("'" + splitDogId[1] + "'", function(result, status) {

	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
			
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + splitshelterId[1] + '</div>'
	        });
	        infowindow.open(map, marker);
			
	        map.setCenter(coords);
	    } 
	}); 
}

$(document).ready(function() {
    init_Announcement_detail();
});