/**
 * 
 */
 
 function submitReport() {
	const submitBtn = document.querySelector("#submit");
	const form = document.querySelector("#boardContent");
	
	submitBtn.addEventListener("click", function(){
		form.submit();
	});
}submitReport();