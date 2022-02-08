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
	console.log(deleteMnum);
	
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
		$(".main-content-info").css("display","flex");
	});
	
	$("#closeInfo").click(function(){
		$('.main-content-info').fadeOut(1000);
	});
});

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