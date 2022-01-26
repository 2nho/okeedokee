/**
 * 
 */
 
 //숨겨진 파일 업로드 input 클릭하기
function callUpload() {

	const callUpload = document.querySelector("#callUpload");
	const file = document.querySelector("#image");
	if(callUpload) {
		callUpload.addEventListener("click", function() {
			file.click();
		});
	}
	
} callUpload();

 //컬러 피커 값 전달하기
 function colorPick() {
	//기본 컬러 설정
	const colorPicker = document.getElementById("colorPicker");
	colorPicker.setAttribute("value", "#ff8080");
	
	//선택 컬러 저장할 hidden input
	let color = document.querySelector("#color");
	
	//지정된 기본컬러 변경시 hidden input에 반영
	colorPicker.addEventListener("change", function(){
		color.setAttribute("value", colorPicker.value);
	});
}colorPick();

function submitPost() {
	const submitBtn = document.querySelector("#submit");
	
	submitBtn.addEventListener("click", function(){
		
		//에디터 작성 후 등록 버튼 클릭시 실행될 로직
		//일단 콘솔창으로 전달
		//console.log("내용 : " + content);

		/* 파일 업로드 */
		//formData객체 불러오기
		const formData = new FormData();

		//input에 넣어둔 파일 위치
		const $images = $("#image");

		//파일 받아오기
		let files = $images[0].files;

		//파일 추가시
		//파일 갯수만큼 순회 & 추가
		if(files.length >= 0) {
			for (var i = 0; i < files.length; i++) {
	
				formData.append("uploadFile", files[i])
				console.log(formData);
			}
	
			$.ajax({
				url: 'uploadImage',
				processData: false,
				contentType: false,
				data: formData,
				type: "post",
				dataType: "json",
				success: function(result) {
					//직렬화된 데이터 잘 오는지 찍어보기
					//console.log(JSON.stringify(result));
	
					$("#fileList").val(JSON.stringify(result));
	
					console.log($("#fileList").val(JSON.stringify(result)));
	
					//input에 작성한 내용 전송하기
					$("#boardContent").submit();
				}
			});
		}
		else {
			//input에 작성한 내용 전송하기
			$("#boardContent").submit();
		}
	});
}submitPost();

//게시글 수정시 이미지 삭제
function deleteImg(num) {
	const deleteBtn = document.querySelectorAll(".deleteFile");

	if(deleteBtn){
		for(let i = 0; i < deleteBtn.length; i++) {
			deleteBtn[i].addEventListener("click", function(){
				//dataset에 설정한 num을 상단 선언된 배열변수 num에 삽입
				num.push({num : this.dataset.num});
				
				//어떤 사진 선택됐는지 뽑아보기
				for(let j = 0; j < num.length; j++){
					console.log(num[j]);
				};
				
				//버튼의 부모, 즉 사진 li지우기
				this.parentNode.remove();
			});
		}	
	}
}deleteImg();

//이미지 수정시 삭제 
function deleteInfo(num) {
	$.ajax({
		url: 'deleteFile',
		data: JSON.stringify(num),
		type: "post",
		contentType: "application/json; charset=uft-8;",
		dataType: "json",
		success: function(result) {
			//직렬화된 데이터 잘 오는지 찍어보기
			console.log("잘온거니?"+JSON.stringify(result));
		}
	});
}

//전화번호 자동 하이픈 추가
function autoHypen() {
	const phone = document.querySelector("#phone");
	
	phone.addEventListener("keyup", function(){
		 phone.value = phone.value
		   .replace(/[^0-9]/, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	});
}autoHypen();


//미리보기 창
function previewWin() {
	const previewBtn = document.querySelector("#preview");
	
	previewBtn.addEventListener("click", function(){
		window.open();
		
	});
}




