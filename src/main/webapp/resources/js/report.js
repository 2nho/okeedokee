/**
 * 
 */

//텍스트 에디터 설정 및 게시글 작성, 수정, 전송
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
				bUseToolbar: false,
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

	submitPost = function() {
		//작성된 에디터 내용 textarea로 즉시 적용 불가능
		//서버 측 URL통해 value적용 (미구현시 공백 추출)

		//UPDATE_CONTENTS_FIELD 메세지 호출
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

		//널값 체크 후 전송
		checkNull();
	}

} textEdit();



//input 공란 체크 후 전송
function checkNull() {
	//변수 설정
	let title = document.getElementById("title");
	let content = document.getElementById("content").value;

	//미입력시 
	if (title.value == "") {
		alert("제목을 입력해주세요.");
		title.focus();
	}
	//'<p><br></p>' 추출되므로 해당 내용을 공백으로 간주
	else if (content == "<p><br></p>") {
		alert("내용을 입력해주세요.");
		oEditors.getById["content"].exec("FOCUS");
		return;
	}

	else {
		//input에 작성한 내용 전송하기
		$("#boardContent").submit();
	}

};