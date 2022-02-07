/**
 * 
 */


//게시글 검색
function searchMnw() {
	const searchBtn = document.querySelector("#searchBtn");

	searchBtn.addEventListener("click", function() {

		let type = document.querySelector("#searchType").value;
		let text = document.querySelector("#search").value;

		if (type == "careName") {
			location.href = "Save?careName=" + text
		}
		else if (type == "addr") {
			location.href = "Save?addr=" + text;
		}
		else if (type == "both") {
			location.href = "Save?addr=" + text + "&careName=" + text;
		}
	});

} searchMnw();
