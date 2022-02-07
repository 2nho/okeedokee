/**
 * 
 */
 //전화번호 자동 하이픈 추가
function autoHypen() {
	const phone = document.querySelector("#phNum");

	phone.addEventListener("keyup", function() {
		phone.value = phone.value
			.replace(/[^0-9]/, '')
			.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	});
} autoHypen();