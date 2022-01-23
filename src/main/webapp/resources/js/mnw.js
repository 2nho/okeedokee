/**
 * 
 */
//무한 슬라이드 & 오토 슬라이드
function slideShow() {
	let slideBox = document.querySelector("#slideBox");
	let slide = document.querySelectorAll(".slides");
	let num = 0;
	let slideCount = slide.length;
	let slideWidth = 250; /*width: 230, padding: 10, margin: 10*/
	let slideMargin = 50;
	let prev = document.querySelector("#prev");
	let next = document.querySelector("#next");


	/*무한슬라이드 위한 복사본 만들기*/
	if (slideBox) {
		makeClone();

		function makeClone() {

			for (let i = 0; i < slideCount; i++) {
				//x.cloneNode() : x복사
				//x.cloneNode(true) : x와 x자식까지 복사
				let cloneSlide = slide[i].cloneNode(true);
				//나중에 clone으로 선택하기 위해 클래스 추가
				cloneSlide.classList.add("clone");
				//slideBox뒤에 클론 추가
				slideBox.append(cloneSlide);
			}

			for (let i = slideCount - 1; i >= 0; i--) {
				//x.cloneNode() : x복사
				//x.cloneNode(true) : x와 x자식까지 복사
				let cloneSlide = slide[i].cloneNode(true);
				//나중에 clone으로 선택하기 위해 클래스 추가
				cloneSlide.classList.add("clone");
				//slideBox앞에 클론 추가
				slideBox.prepend(cloneSlide);
			}

			//클론 후 전체 너비 업데이트
			updateWidth();
			//초기위치 설정
			setInitialPos();
			//slide 이동 애니메이션
			//화면 로드시 초기위치 설정이 보이지 않도록 1초 후 클래스 추가
			setTimeout(function() {
				slideBox.classList.add("animated");
			}, 100);


		}

		function updateWidth() {
			//클론 후 갯수 체크
			let currentSlides = document.querySelectorAll(".slides");
			let newSlideCount = currentSlides.length;

			//토탈 너비 체크 후 slideBox 너비 수정하기
			let newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + "px";
			slideBox.style.width = newWidth;
		}

		function setInitialPos() {
			//slideCount는 초기 설정한 5개
			//하지만 이동방향 왼쪽으로 -방향
			let initialTranslateValue = -(slideWidth + slideMargin) * slideCount;
			//console.log(initialTranslateValue);

			//slideBox {transform:translateX(-px)}
			slideBox.style.transform = `translateX(${initialTranslateValue}px)`;
		}

		//버튼으로 슬라이드 이동
		next.addEventListener("click", function() {
			moveSlide(num + 1);
		});
		prev.addEventListener("click", function() {
			moveSlide(num - 1);
		});

		function moveSlide(n) {
			slideBox.style.left = -n * (slideWidth + slideMargin) + "px";
			//최초 숫자 변경
			num = n;
			//console.log(num, slideCount);

			//최초숫자가 클론 제외한 slideCount랑 같으면
			if (num == slideCount || num == -slideCount) {
				//미리 설정한 animated효과 빼 
				//첫 번째 슬라이드가 보인 후에 설정하기 위해 애니메이션 시간인 .5초 이후
				//같은 번호 연속이기 때문에 slide후에는 변경되어도 바뀐 줄 모름! 
				setTimeout(function() {
					//초기설정 감추는 애니메이션 지우기
					slideBox.classList.remove("animated");
					//left 원위치로 돌리기
					slideBox.style.left = "0px";
					//최초숫자 원상복귀
					num = 0;
				}, 500);

				//다시 슬라이드 필요하므로 뺐던 애니메이션 다시 추가
				//but 500보다 0.1초 느리게 둬서 뻑나지 않도록!
				setTimeout(function() {
					slideBox.classList.add("animated");
				}, 550);

			}
		}

		//오토 슬라이드
		let timer = undefined;

		function autoSlide() {
			if (timer == undefined) {
				timer = setInterval(function() {
					moveSlide(num + 1);
				}, 3000);
			}
		} autoSlide();


		function stopSlide() {
			clearInterval(timer);
			//undefined일때만 autoSlide() 작동하므로 추가!
			//미설정시 timer가 int값으로 변해 슬라이드가 빨라지는 이상움직임 있음
			timer = undefined;
		}

		//슬라이드 호버시 stopSlide()
		slideBox.addEventListener("mouseenter", function() {
			stopSlide()
		});
		//슬라이드 리브시 autoSlide();
		slideBox.addEventListener("mouseleave", function() {
			autoSlide();
		});
	}

} slideShow();


//게시글 상태에 따른 처리
function addEffect() {
	
	const status = document.querySelectorAll(".status");

	for(let i = 0; i < status.length; i ++) {
		
		const tr = status[i].parentNode;
		//귀가 처리시
		if(status[i].value == "B") {
			tr.classList.add("back");
		}
		//종료 처리시
		else if(status[i].value == "E") {
			tr.classList.add("end");
		}
		//신고 처리시
		else if(status[i].value == "R") {
			tr.classList.add("report");
		}
	}
}addEffect();
