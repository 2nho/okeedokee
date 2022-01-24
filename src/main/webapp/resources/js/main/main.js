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

	
	/*for (var j = 0; j < 20; j++) {
				
		$(".nearby-dog-div + j + ").each(function(i, e){
			console.log(i);
			$(this).hover(function(){
				$('.profilePhoto + i + ').css("border-radius", "0");
		        $('.hover-div + i + ').css("display", "flex");
			}, function(){
				$('.profilePhoto + i + ').css("border-radius", "30px");
		        $('.hover-div + i + ').css("display", "none");
			});
		});
	}*/

}
	


//Render
$(document).ready(function() {
    //초기 init render
    init_main();
});