var init_Announcement = function () {

	var jsonDogResult = dogData;

	var _today = new Date()
	  , _todayResult = '';
	  
	//일자일 경우 예외처리..
	_today.setMonth(_today.getMonth() + 1); //1 --> 2
	var _dateResult = getDateZeroPadding(_today.getMonth(), _today.getDate());
	_todayResult = _today.getFullYear() + '-' + _dateResult.monthResult + '-' + _dateResult.dateResult;

	$('#start_date').val(_todayResult);
	$('#end_date').val(_todayResult);

	//초기진입 > 기간에만 해당.
	bindDogData('init', jsonDogResult);

	//초기 focus..
	$('#search').focus();

	//search검색
	$("#btn-search").on("click", function () {
		bindDogData('', jsonDogResult);
	});

	$("#search").on('keyup', function (e) {
		if (e.key === 'Enter' || e.keyCode === 13) {
			bindDogData('', jsonDogResult);
		} else {;}
	});
}

/**
 * 20220201.원동혁.설명
 * 아래코드는 날짜 0으로 패딩하는 함수입니다.
 * @param {*} i_month 달
 * @param {*} i_date 일
 * @returns json..! [중요]
 */
var getDateZeroPadding = function (i_month, i_date) {
	var jsonResult = {}
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

var page_move = function (url, i_data) {
	var form = document.createElement("form");
	var input = new Array();


	form.action = url;
	form.method = "post";
	
	for (var i = 0; i < i_data.length; i++) {
		var jsonKey = Object.keys(i_data[i]);
		var jsonKeyResult = jsonKey[0];
		var strJsonValue = '';
		if ('dog_img' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_img;
		} else if ('dog_kindCd' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_kindCd;
		} else if ('dog_orgNm' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_orgNm;
		} else if ('dog_age' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_age;
		} else if ('dog_sexCd' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_sexCd;
		} else if ('dog_noticeSdt' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_noticeSdt;
		} else if ('dog_careNm' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_careNm;
		} else if ('dog_happenPlace' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_happenPlace;
		} else if ('dog_processState' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_processState;
		} else if ('dog_specialMark' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_specialMark;
		} else if ('dog_careTel' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_careTel;
		} else if ('dog_chargeNm' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_chargeNm;
		} else if ('dog_careAddr' == jsonKeyResult) {
			strJsonValue = i_data[i].dog_careAddr;
		} else {;}

		input[i] = document.createElement("input");
		input[i].setAttribute("type", "hidden");
		input[i].setAttribute('name', jsonKeyResult);
		input[i].setAttribute("value", strJsonValue);
		form.appendChild(input[i]);
	}

	document.body.appendChild(form);
	form.submit();
}

var bindDogData = function (i_init, i_data) {
	var doaData = i_data;
	
	//초기화
	$('#div_dogContentMain').empty();

	if ('init' == i_init) {
		//최초 페이지
		//console.log(dogDataResult[i].kindCd);
		
		var strStartDate = $('#start_date').val()
		  , strEndDate = $('#end_date').val()
		  , strSplitStartDate = strStartDate.split('-')
		  , strSplitEndDate = strEndDate.split('-')
          , strSplitStartDateResult = strSplitStartDate[0] + strSplitStartDate[1] + strSplitStartDate[2]
          , strSplitEndDateResult = strSplitEndDate[0] + strSplitEndDate[1] + strSplitEndDate[2];

		var count = 0;
		for (var i = 0; i < doaData.length; i++) {
			if (Number(strSplitStartDateResult) <= Number(doaData[i].noticeSdt) && Number(strSplitEndDateResult) >= Number(doaData[i].noticeSdt)) {
				count++;
			} else {;}
		}

		if (0 == count) {
			alert('데이터가 존재하지 않습니다.');
		} else {
			for (var i = 0; i < doaData.length; i++) {
				if (Number(strSplitStartDateResult) <= Number(doaData[i].noticeSdt) && Number(strSplitEndDateResult) >= Number(doaData[i].noticeSdt)) {
					var dogDataHTML = "";
					dogDataHTML += '<div class="profile-div" id="profile_' + doaData[i].desertionNo + '">';
					dogDataHTML += '<div class="profile-contents">';
					dogDataHTML +=	'<div class="profile-photo">';
					dogDataHTML +=	'<img id="dog_img_' + doaData[i].desertionNo + '" alt="">';
					dogDataHTML +=	'</div>';
					dogDataHTML +=	'</div>';
					dogDataHTML += '<div class="profile-info">';
					dogDataHTML += '<ul>';
					dogDataHTML += '<li id="dog_kindCd_' + doaData[i].desertionNo + '">품종 : ' + doaData[i].kindCd + '</li>';
					dogDataHTML += '<li id="dog_orgNm_' + doaData[i].desertionNo + '" style="display: none;">지역 : ' + doaData[i].orgNm + '</li>';
					dogDataHTML += '<li id="dog_age_' + doaData[i].desertionNo + '">나이 : ' + doaData[i].age + '</li>';
					dogDataHTML += '<li id="dog_sexCd_' + doaData[i].desertionNo + '">성별 : ' + doaData[i].sexCd + '</li>';
					dogDataHTML += '<li id="dog_noticeSdt_' + doaData[i].desertionNo + '">등록일 : ' + doaData[i].noticeSdt + '</li>';
					dogDataHTML += '<li id="dog_careNm_' + doaData[i].desertionNo + '">보호소 : ' + doaData[i].careNm + '</li>';
					dogDataHTML += '<li id="dog_happenPlace_' + doaData[i].desertionNo + '">구조지역 : ' + doaData[i].happenPlace + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_processState_' + doaData[i].desertionNo + '">상태 : ' + doaData[i].processState + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_specialMark_' + doaData[i].desertionNo + '">특징 : ' + doaData[i].specialMark + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_careTel_' + doaData[i].desertionNo + '">보호소 번호 : ' + doaData[i].careTel + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_chargeNm_' + doaData[i].desertionNo + '">담당자 : ' + doaData[i].chargeNm + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_careAddr_' + doaData[i].desertionNo + '">보호소 주소 : ' + doaData[i].careAddr + '</li>';
					dogDataHTML += '</ul>';
					dogDataHTML += '</div>';
					dogDataHTML += '</div>';
					dogDataHTML += '</div>';

                	$('#div_dogContentMain').append(dogDataHTML);

					$('#dog_img_' + doaData[i].desertionNo).attr("src", doaData[i].popfile);

				} else {;}
			}
		}
	} else {
		//검색 눌렀을때
		var strStartDate = $('#start_date').val()
		  , strEndDate = $('#end_date').val()
		  , strSplitStartDate = strStartDate.split('-')
		  , strSplitEndDate = strEndDate.split('-')
          , strSplitStartDateResult = strSplitStartDate[0] + strSplitStartDate[1] + strSplitStartDate[2]
          , strSplitEndDateResult = strSplitEndDate[0] + strSplitEndDate[1] + strSplitEndDate[2]
		  , strSearchCategory = $('#search_category').val()
		  , strSearchField = $('#search').val();

		/*console.log('시작일 : '      + strStartDate);
		console.log('종료일 : '      + strEndDate);
		console.log('카테고리 : '    + strSearchCategory);
		console.log('카테고리 값 : ' + strSearchField);*/

		var count = 0;
		var arrDogDataResult = [];

		for (var i = 0; i < doaData.length; i++) {
			debugger;

			if (Number(strSplitStartDateResult) <= Number(doaData[i].noticeSdt) && Number(strSplitEndDateResult) >= Number(doaData[i].noticeSdt)) {
				if ('' == strSearchField) {
					var dogDataHTML = "";
					dogDataHTML += '<div class="profile-div" id="profile_' + doaData[i].desertionNo + '">';
					dogDataHTML += '<div class="profile-contents">';
					dogDataHTML +=	'<div class="profile-photo">';
					dogDataHTML +=	'<img id="dog_img_' + doaData[i].desertionNo + '" alt="">';
					dogDataHTML +=	'</div>';
					dogDataHTML += '<div class="profile-info">';
					dogDataHTML += '<ul>';
					dogDataHTML += '<li id="dog_kindCd_' + doaData[i].desertionNo + '">품종 : ' + doaData[i].kindCd + '</li>';
					dogDataHTML += '<li id="dog_orgNm_' + doaData[i].desertionNo + '" style="display: none;">지역 : ' + doaData[i].orgNm + '</li>';
					dogDataHTML += '<li id="dog_age_' + doaData[i].desertionNo + '">나이 : ' + doaData[i].age + '</li>';
					dogDataHTML += '<li id="dog_sexCd_' + doaData[i].desertionNo + '">성별 : ' + doaData[i].sexCd + '</li>';
					dogDataHTML += '<li id="dog_noticeSdt_' + doaData[i].desertionNo + '">등록일 : ' + doaData[i].noticeSdt + '</li>';
					dogDataHTML += '<li id="dog_careNm_' + doaData[i].desertionNo + '">보호소 : ' + doaData[i].careNm + '</li>';
					dogDataHTML += '<li id="dog_happenPlace_' + doaData[i].desertionNo + '">구조지역 : ' + doaData[i].happenPlace + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_processState_' + doaData[i].desertionNo + '">상태 : ' + doaData[i].processState + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_specialMark_' + doaData[i].desertionNo + '">특징 : ' + doaData[i].specialMark + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_careTel_' + doaData[i].desertionNo + '">보호소 번호 : ' + doaData[i].careTel + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_chargeNm_' + doaData[i].desertionNo + '">담당자 : ' + doaData[i].chargeNm + '</li>';
					dogDataHTML += '<li class="dog_hidden" id="dog_careAddr_' + doaData[i].desertionNo + '">보호소 주소 : ' + doaData[i].careAddr + '</li>';
					dogDataHTML += '</ul>';
					dogDataHTML += '</div>';
					dogDataHTML += '</div>';
					dogDataHTML += '</div>';

					$('#div_dogContentMain').append(dogDataHTML);
					$('#dog_img_' + doaData[i].desertionNo).attr("src", doaData[i].popfile);
				} else {
					if ('kind' == strSearchCategory) {
						//품종 kindCd
						if (doaData[i].kindCd.includes(strSearchField)) {
							arrDogDataResult.push(doaData[i]);
						} else {;}
					} else if ('happenPlace' == strSearchCategory) {
						//구조지역
						if (doaData[i].happenPlace.includes(strSearchField)) {
							arrDogDataResult.push(doaData[i]);
						} else {;}
					} else if ('careNm' == strSearchCategory) {
						//보호소
						if (doaData[i].careNm.includes(strSearchField)) {
							arrDogDataResult.push(doaData[i]);
						} else {;}
					} else {;}
				}
			} else {;}
		}

		if (0 == arrDogDataResult.length && '' != strSearchField) {
			alert('검색한 데이터가 존재하지 않습니다.');
		} else {
			for (var i = 0; i < arrDogDataResult.length; i++) {
				dogDataHTML = "";
				dogDataHTML += '<div class="profile-div" id="profile_' + arrDogDataResult[i].desertionNo + '">';
				dogDataHTML += '<div class="profile-contents">';
				dogDataHTML +=	'<div class="profile-photo">';
				dogDataHTML +=	'<img id="dog_img_' + arrDogDataResult[i].desertionNo + '" alt="">';
				dogDataHTML +=	'</div>';
				dogDataHTML += '<div class="profile-info">';
				dogDataHTML += '<ul>';
				dogDataHTML += '<li id="dog_kindCd_' + arrDogDataResult[i].desertionNo + '">품종 : ' + arrDogDataResult[i].kindCd + '</li>';
				dogDataHTML += '<li id="dog_orgNm_' + arrDogDataResult[i].desertionNo + '" style="display: none;">지역 : ' + arrDogDataResult[i].orgNm + '</li>';
				dogDataHTML += '<li id="dog_age_' + arrDogDataResult[i].desertionNo + '">나이 : ' + arrDogDataResult[i].age + '</li>';
				dogDataHTML += '<li id="dog_sexCd_' + arrDogDataResult[i].desertionNo + '">성별 : ' + arrDogDataResult[i].sexCd + '</li>';
				dogDataHTML += '<li id="dog_noticeSdt_' + arrDogDataResult[i].desertionNo + '">등록일 : ' + arrDogDataResult[i].noticeSdt + '</li>';
				dogDataHTML += '<li id="dog_careNm_' + arrDogDataResult[i].desertionNo + '">보호소 : ' + arrDogDataResult[i].careNm + '</li>';
				dogDataHTML += '<li class="dog_hidden" id="dog_happenPlace_' + arrDogDataResult[i].desertionNo + '">구조지역 : ' + arrDogDataResult[i].happenPlace + '</li>';
				dogDataHTML += '<li class="dog_hidden" id="dog_processState_' + arrDogDataResult[i].desertionNo + '">상태 : ' + arrDogDataResult[i].processState + '</li>';
				dogDataHTML += '<li class="dog_hidden" id="dog_specialMark_' + arrDogDataResult[i].desertionNo + '">특징 : ' + arrDogDataResult[i].specialMark + '</li>';
				dogDataHTML += '<li class="dog_hidden" id="dog_careTel_' + arrDogDataResult[i].desertionNo + '">보호소 번호 : ' + arrDogDataResult[i].careTel + '</li>';
				dogDataHTML += '<li class="dog_hidden" id="dog_chargeNm_' + arrDogDataResult[i].desertionNo + '">담당자 : ' + arrDogDataResult[i].chargeNm + '</li>';
				dogDataHTML += '<li class="dog_hidden" id="dog_careAddr_' + arrDogDataResult[i].desertionNo + '">보호소 주소 : ' + arrDogDataResult[i].careAddr + '</li>';
				dogDataHTML += '</ul>';
				dogDataHTML += '</div>';
				dogDataHTML += '</div>';
				dogDataHTML += '</div>';

				$('#div_dogContentMain').append(dogDataHTML);

				$('#dog_img_' + arrDogDataResult[i].desertionNo).attr("src", arrDogDataResult[i].popfile);

			}
		}
	}

	$(".profile-div").on("click", function () {
		var dogId = $(this).attr('id');
		var splitDogId = dogId.split('_');
		var arrDogParams = new Array();

		var _dog_img = {}
		  , _dog_kindCd = {}
		  , _dog_orgNm = {}
		  , _dog_age = {}
		  , _dog_sexCd = {}
		  , _dog_noticeSdt = {}
		  , _dog_careNm = {}
		  , _dog_happenPlace = {}
		  , _dog_processState = {}
		  , _dog_specialMark = {}
		  , _dog_careTel = {}
		  , _dog_chargeNm = {}
		  , _dog_careAddr = {};
		
		_dog_img.dog_img = $('#dog_img_' + splitDogId[1]).attr('src');
		_dog_kindCd.dog_kindCd = $('#dog_kindCd_' + splitDogId[1]).text();
		_dog_orgNm.dog_orgNm = $('#dog_orgNm_' + splitDogId[1]).text();
		_dog_age.dog_age = $('#dog_age_' + splitDogId[1]).text();
		_dog_sexCd.dog_sexCd = $('#dog_sexCd_' + splitDogId[1]).text();
		_dog_noticeSdt.dog_noticeSdt = $('#dog_noticeSdt_' + splitDogId[1]).text();
		_dog_careNm.dog_careNm = $('#dog_careNm_' + splitDogId[1]).text();
		_dog_happenPlace.dog_happenPlace = $('#dog_happenPlace_' + splitDogId[1]).text();
		_dog_processState.dog_processState = $('#dog_processState_' + splitDogId[1]).text();
		_dog_specialMark.dog_specialMark = $('#dog_specialMark_' + splitDogId[1]).text();
		_dog_careTel.dog_careTel = $('#dog_careTel_' + splitDogId[1]).text();
		_dog_chargeNm.dog_chargeNm = $('#dog_chargeNm_' + splitDogId[1]).text();
		_dog_careAddr.dog_careAddr = $('#dog_careAddr_' + splitDogId[1]).text();

		arrDogParams.push(_dog_img);
		arrDogParams.push(_dog_kindCd);
		arrDogParams.push(_dog_orgNm);
		arrDogParams.push(_dog_age);
		arrDogParams.push(_dog_sexCd);
		arrDogParams.push(_dog_noticeSdt);
		arrDogParams.push(_dog_careNm);
		arrDogParams.push(_dog_happenPlace);
		arrDogParams.push(_dog_processState);
		arrDogParams.push(_dog_specialMark);
		arrDogParams.push(_dog_careTel);
		arrDogParams.push(_dog_chargeNm);
		arrDogParams.push(_dog_careAddr);

		page_move('/okeedokee/Announcement/Announcement_detail', arrDogParams);
	});
	
}



//Render
$(document).ready(function() {
	
    //초기 init render
    init_Announcement();

	
});