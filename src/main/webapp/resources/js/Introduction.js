var init_Introduction = function () {

	$("#btn").on("click", function () {
		ajaxPageFunction ('GET', 'main');
	});
}

$(document).ready(function() {
	
    //초기 init render
    init_Introduction();

	
});