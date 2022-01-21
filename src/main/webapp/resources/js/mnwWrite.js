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

//실종일에 오늘날짜 디폴트
function setDefaultDate() {

	document.getElementById('date').value = new Date().toISOString().substring(0, 10);
	//굳이...
}

function textEdit() {
	var oEditors = [];
	
	smartEditor = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "smartEditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2",
			htParams: {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar: true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer: false,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger: false,
			}
		});
	}

	//a태그로 이동 구현했으나 없을시엔 해당 로직 작동하도록!
	$(document).ready(function() {
		smartEditor()
	});

	submitPost = function()  {
		//작성된 에디터 내용 textarea로 즉시 적용 불가능
		//서버 측 URL통해 value적용 (미구현시 공백 추출)
	
		//UPDATE_CONTENTS_FIELD 메세지 호출
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
		checkNull();
	}
	
}textEdit();


function checkNull() {
	//변수 설정
	let title = document.getElementById("title");
	let sex = document.getElementById("sex");
	let species = document.getElementById("species");
	let characters = document.getElementById("characters");
	let location = document.getElementById("location");
	let date = document.getElementById("date");
	let content = document.getElementById("content").value;

	//미입력시 
	if (title.value == "") {
		alert("제목을 입력해주세요.");
		title.focus();
	}
	else if (sex.value == "") {
		alert("성별을 입력해주세요");
		sex.focus();
	}
	else if (species.value == "") {
		alert("견종을 입력해주세요");
		species.focus();
	}
	else if (characters.value == "") {
		alert("특징을 입력해주세요");
		characters.focus();
	}
	else if (location.value == "") {
		alert("목격 장소를 입력해주세요");
		location.focus();
	}
	else if (date.value == "") {
		alert("목격일을 입력해주세요");
		date.focus();
	}
	//'<p><br></p>' 추출되므로 해당 내용을 공백으로 간주
	else if (content == "<p><br></p>") {
		alert("내용을 입력해주세요.");
		oEditors.getById["content"].exec("FOCUS");
		return;
	}

	else {
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

		//파일 갯수만큼 순회
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
};
