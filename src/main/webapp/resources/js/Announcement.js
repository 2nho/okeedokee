var init_Announcement = function () {

	//console.log(dogData); //원본
	var dogDataResult = dogData; // 파싱할 데이터
	
	/**
	 * 공통사항 소스
	 */
	// <div class="main-content-profile" id="div_dogContentMain">
	// 	<c:set var="dog_data" value="${result.item}" />
	// 	<c:forEach var="dog" items="${result.item}">
	// 		<div class="profile-div">
	// 			<div class="profile-contents" id="profile_${dog.desertionNo}">
	// 				<div class="profile-photo">
	// 					<img id="dog_img_${dog.desertionNo}" src="${dog.popfile}" alt="">
	// 				</div>
	// 				<div class="profile-info">
	// 					<ul>
	// 						<li id="dog_kindCd_${dog.desertionNo}">품종 : ${dog.kindCd}</li>
	// 						<li id="dog_orgNm_${dog.desertionNo}" style="display: none;">지역 : ${dog.orgNm}</li>
	// 						<li id="dog_age_${dog.desertionNo}">나이 : ${dog.age}</li>
	// 						<li id="dog_sexCd_${dog.desertionNo}">성별 : ${dog.sexCd}</li>
	// 						<li id="dog_noticeSdt_${dog.desertionNo}">등록일 : ${dog.noticeSdt}</li>
	// 						<li id="dog_careNm_${dog.desertionNo}">보호소 : ${dog.careNm}</li>
	// 						<li id="dog_happenPlace_${dog.desertionNo}">구조지역 :${dog.happenPlace}</li>
	// 						<li>
	// 							<div class="key" id="key_${dog.desertionNo}">
	// 								key : ${dog.desertionNo}
	// 							</div>
	// 						</li>
	// 					</ul>
	// 				</div>
	// 			</div>
	// 		</div>
	// 	 </c:forEach>
	// </div>
 	
	//date-btn 날짜
	$("#date-btn").on("click", function () {
		//start_date
		//end_date
		for (var i = 0; i < 3; i++) {
			debugger;
			console.log(dogDataResult[i].kindCd);
		}




	});

	//btn-search 타 기능 검색
	$("#btn-search").on("click", function () {
		//search_category
		//search





	});

	$(".profile-contents").on("click", function () {
		/*
		 * ! 1. 덮어씌우는 방식으로 하면 충족이 안돼
	     * !  - 이걸 해결하기위해 href에다가 data넘기는 방식을 찾고 상세페이지를 띄우는 방법을 찾아야함.
		 */
		var dogId = $(this).attr('id');
		var splitDogId = dogId.split('_');
		var arrDoagPrams = new Array();

		var _dog_img = {}
		  , _dog_kindCd = {}
		  , _dog_orgNm = {}
		  , _dog_age = {}
		  , _dog_sexCd = {}
		  , _dog_noticeSdt = {}
		  , _dog_careNm = {}
		  , _dog_happenPlace = {};
		
		_dog_img.dog_img = $('#dog_img_' + splitDogId[1]).attr('src');
		_dog_kindCd.dog_kindCd = $('#dog_kindCd_' + splitDogId[1]).text();
		_dog_orgNm.dog_orgNm = $('#dog_orgNm_' + splitDogId[1]).text();
		_dog_age.dog_age = $('#dog_age_' + splitDogId[1]).text();
		_dog_sexCd.dog_sexCd = $('#dog_sexCd_' + splitDogId[1]).text();
		_dog_noticeSdt.dog_noticeSdt = $('#dog_noticeSdt_' + splitDogId[1]).text();
		_dog_careNm.dog_careNm = $('#dog_careNm_' + splitDogId[1]).text();
		_dog_happenPlace.dog_happenPlace = $('#dog_happenPlace_' + splitDogId[1]).text();

		arrDoagPrams.push(_dog_img);
		arrDoagPrams.push(_dog_kindCd);
		arrDoagPrams.push(_dog_orgNm);
		arrDoagPrams.push(_dog_age);
		arrDoagPrams.push(_dog_sexCd);
		arrDoagPrams.push(_dog_noticeSdt);
		arrDoagPrams.push(_dog_careNm);
		arrDoagPrams.push(_dog_happenPlace);

		page_move('/okeedokee/Announcement/Announcement_detail', arrDoagPrams);
	});

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
}



//Render
$(document).ready(function() {
	
    //초기 init render
    init_Announcement();

	
});