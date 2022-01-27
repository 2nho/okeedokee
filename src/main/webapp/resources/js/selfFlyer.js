/**
 * 
 */
 
 
//게시글 상태(귀가/종료/신고)에 따른 처리
function addEffect() {
	
	const status = document.querySelectorAll(".status");

	for(let i = 0; i < status.length; i ++) {
		
		const flyer = status[i].parentNode;
		const a = flyer.parentNode;
		
		//귀가 처리시
		if(status[i].value == "B") {
			flyer.classList.add("back");
			a.addEventListener("click", function(e){ e.preventDefault(); });
			
		}
		//종료 처리시
		else if(status[i].value == "E") {
			flyer.classList.add("end");
			a.addEventListener("click", function(e){ e.preventDefault(); });
		}
		//신고 처리시
		else if(status[i].value == "R") {
			flyer.classList.add("report");
			a.addEventListener("click", function(e){ e.preventDefault(); });
		}
	}
}addEffect();