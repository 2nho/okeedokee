/**
 * 
 */


//게시글 상태(귀가/종료/신고)에 따른 처리
function addEffect() {

	const status = document.querySelectorAll(".status");

	for (let i = 0; i < status.length; i++) {

		const flyer = status[i].parentNode;
		const a = flyer.parentNode;

		//귀가 처리시
		if (status[i].value == "B") {
			flyer.classList.add("back");
			a.addEventListener("click", function(e) { e.preventDefault(); });

		}
		//종료 처리시
		else if (status[i].value == "E") {
			flyer.classList.add("end");
			a.addEventListener("click", function(e) { e.preventDefault(); });
		}
		//신고 처리시
		else if (status[i].value == "R") {
			flyer.classList.add("report");
			a.addEventListener("click", function(e) { e.preventDefault(); });
		}
	}
} addEffect();


//검색기능 자스로 구현해보기
function searchJs() {
	const searchBtn = document.querySelector("#searchBtn");
	const flyer = document.querySelectorAll(".flyer");
	const flyerText = document.querySelectorAll(".flyerText");
	let keyword = document.querySelector("#search");


	searchBtn.addEventListener("click", function() {

		if (keyword.value) {
			for (let i = 0; i < flyer.length; i++) {

				let id = flyerText[i].firstElementChild;
				let pet = flyerText[i].lastElementChild;
				
				//매 검색시 초기화 시키기 위해 모든 a를 보여준다
				id.parentNode.parentNode.parentNode.style.display = "block";


				if (id.innerHTML.includes(keyword.value) == 1 || pet.innerHTML.includes(keyword.value) == 1) {
					//즉, 해당하는 검색어가 담긴 a자체를 보여준다
					id.parentNode.parentNode.parentNode.style.display = "block";
				}
				else if (id.innerHTML.includes(keyword.value) != 1 || pet.innerHTML.includes(keyword.value) != 1) {
					//즉, 해당하는 검색어가 담긴 a자체를 감춘다
					id.parentNode.parentNode.parentNode.style.display = "none";
				}

			}
		}
		else {
			alert("검색어를 입력해주세요");
		}
	});

} searchJs();