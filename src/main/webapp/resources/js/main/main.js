var init_main = function () {
	var slideIndex = 0;
	showSlides();

	function showSlides() {
	    var i;
	    var slides = document.getElementsByClassName("slidershow");
	    var dots = document.getElementsByClassName("dot");
	    for (i = 0; i < slides.length; i++) {
	       slides[i].style.display = "none";  
    }
	    slideIndex++;
	    if (slideIndex > slides.length) {slideIndex = 1}    
	    for (i = 0; i < dots.length; i++) {
	        dots[i].className = dots[i].className.replace(" active", "");
    }
	    slides[slideIndex-1].style.display = "block";  
	    dots[slideIndex-1].className += " active";
	    setTimeout(showSlides, 4000); // Change image every 2 seconds

	}

	document.cookie = "safeCookie1=foo; SameSite=None; Secure"; 
	document.cookie = "safeCookie2=foo"; 
	document.cookie = "crossCookie=bar; SameSite=None; Secure";
	
	$('.nearby-dog-div').hover(function() {
		var targetId = $(this).attr('id')
		  , splitTargetId =  targetId.split('_')
		  , strTargetDesertionNo = splitTargetId[1];
		
		$('#' + 'img_' + strTargetDesertionNo).css("border-radius", "0");
        $('#' + strTargetDesertionNo).css("display", "flex");
	}, function() {
		var targetId = $(this).attr('id')
		  , splitTargetId =  targetId.split('_')
		  , strTargetDesertionNo = splitTargetId[1];

		$('#' + 'img_' + strTargetDesertionNo).css("border-radius", "30px");
		$('#' + strTargetDesertionNo).css("display", "none");
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
	
	$(".nearby-dog-div").on("click", function () {
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

		arrDoagPrams.push(_dog_img);
		arrDoagPrams.push(_dog_kindCd);
		arrDoagPrams.push(_dog_orgNm);
		arrDoagPrams.push(_dog_age);
		arrDoagPrams.push(_dog_sexCd);
		arrDoagPrams.push(_dog_noticeSdt);
		arrDoagPrams.push(_dog_careNm);
		arrDoagPrams.push(_dog_happenPlace);
		arrDoagPrams.push(_dog_processState);
		arrDoagPrams.push(_dog_specialMark);
		arrDoagPrams.push(_dog_careTel);
		arrDoagPrams.push(_dog_chargeNm);
		arrDoagPrams.push(_dog_careAddr);

		page_move('/okeedokee/Announcement/Announcement_detail', arrDoagPrams);
		
		
	});


}
	


//Render
$(document).ready(function() {
    //초기 init render
    init_main();
});