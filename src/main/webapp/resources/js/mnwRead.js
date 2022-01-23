/**
 * 
 */

//글읽기 사진 슬라이더
function showSlider() {
	//초기화 리스트 (이미지, 인덱스 초기넘버)
	let imgs = document.querySelectorAll(".mySlides");
	console.log(imgs.length);
	console.log(imgs);
	let dotbox = document.querySelector(".dotbox");
	let num = 0;

	if (imgs.length > 0) {
		//이미지 갯수만큼 dot 생성하기
		createDots();

		//슬라이드 초기 설정
		showSlides(num);

		//dot클릭시 슬라이드 이동
		clickDots();

	}
	function createDots() {
		for (let i = 0; i < imgs.length; i++) {
			let tagForDot = document.createElement("span");
			tagForDot.classList.add("dot");
			tagForDot.setAttribute("data-num", i);
			dotbox.append(tagForDot);
		}
	}

	function showSlides(n) {
		let dots = document.querySelectorAll(".dot");
		for (let i = 0; i < imgs.length; i++) {
			imgs[i].style.display = "none";
			dots[i].classList.remove("active");
		}
		imgs[n].style.display = "block";
		dots[n].classList.add("active");
	
	}

	function clickDots() {
		let dots = document.querySelectorAll(".dot");
		for (let i = 0; i < dots.length; i++) {
			dots[i].addEventListener("click", function() {
				showSlides(dots[i].dataset.num);
			});

		}
	}

} showSlider();
