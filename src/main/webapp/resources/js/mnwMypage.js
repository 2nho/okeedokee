/**
 * 
 */
//게시글 검색
function searchMnw() {
	const searchBtn = document.querySelector("#searchBtn");
	let bdiv = document.querySelector("#bdiv").value;
	console.log(bdiv);
	
	searchBtn.addEventListener("click", function(){
		let type = document.querySelector("#searchType").value;
		let text = document.querySelector("#search").value;
		
		if(type == "title") {
			if(bdiv == 3) {
				location.href = "missing?title="+text;
			}
			else if(bdiv == 4) {
				location.href = "witnessing?title="+text;
			}
		}
		else if(type == "content") {
			if(bdiv == 3) {
				location.href = "missing?content="+text;
			}
			else if(bdiv == 4) {
				location.href = "witnessing?content="+text;
			}
		}
		else if(type == "both") {
			if(bdiv == 3) {
				location.href = "missing?title="+text+"&content="+text;
			}
			else if(bdiv == 4) {
				location.href = "witnessing?title="+text+"&content="+text;
			}
		}
	});
}searchMnw();
