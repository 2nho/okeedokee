/**
 * 
 */
function printFlyer() {
	const printBtn = document.querySelector("#printBtn");
	
	printBtn.addEventListener("click", function(){
		window.onbeforeprint = function() {
			document.body.innerHTML = document.querySelector("#flyerContent");
		}
		
		window.print();
	});

} printFlyer();