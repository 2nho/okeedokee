/**
 * 
 */
 //전단지 프린트
function printFlyer() {
	const printBtn = document.querySelector("#printBtn");

	printBtn.addEventListener("click", function() {
	
		//프린트
		window.print();
		//페이지 새로고침
		location.reload();

	});

} printFlyer();


