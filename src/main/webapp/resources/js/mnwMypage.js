/**
 * 
 */
//게시글 검색
function searchMnw() {
	const searchBtn = document.querySelector("#searchBtn");
	let bdiv = document.querySelector("#bdiv").value;
	
	searchBtn.addEventListener("click", function(){
		let type = document.querySelector("#searchType").value;
		let text = document.querySelector("#search").value;
		
		console.log(type);
		console.log(text);
		console.log(bdiv);
		
		if(type == "title") {
			if(bdiv == 3) {
				location.href = "missingList?title="+text;
			}
			else if(bdiv == 4) {
				location.href = "witnessingList?title="+text;
			}
		}
		else if(type == "content") {
			if(bdiv == 3) {
				location.href = "missingList?content="+text;
			}
			else if(bdiv == 4) {
				location.href = "witnessingList?content="+text;
			}
		}
		else if(type == "both") {
			if(bdiv == 3) {
				location.href = "missingList?title="+text+"&content="+text;
			}
			else if(bdiv == 4) {
				location.href = "witnessingList?title="+text+"&content="+text;
			}
		}
	});
}searchMnw();
