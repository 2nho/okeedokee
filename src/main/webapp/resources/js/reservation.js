/* reservation_create*/
let init_Reservation = function () {
	let today = new Date() , todayResult = '';
		
	today.setMonth(today.getMonth() + 1); 
	let dateResult = getDateZeroPadding(today.getMonth(), today.getDate());
	todayResult = today.getFullYear() + '-' + dateResult.monthResult + '-' + dateResult.dateResult;
	$('#reserDate').val(todayResult);
	
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
    $("#openInfo").click(function(){
		$('.main-content-info').fadeIn( 1000 );
		$(".main-content-info").css("display","flex");
	});
	
	$("#closeInfo").click(function(){
		$('.main-content-info').fadeOut(1000);
	});
	
});