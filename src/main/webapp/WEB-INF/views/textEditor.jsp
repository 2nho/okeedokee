<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<style type="text/css">
	.container {
		width: 80%;
		height: 100vh;
	}
	#title{
		width:100%; 
		height:30px;
		border: none;
		outline: none;
		padding: 30px 0;
		font-size: 30px;
	}
	#title:placeholder {
		font-size: 30px;
	}
	#title::after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 2px solid #eee;
		margin: 20px 0;
	}
	#content {
		width: 80%;
		height: 50%;
	}
</style>
</head>
<body>
	<div class="container">
		<input type="text" id="title" name="title" placeholder="제목을 입력해주세요" />
		<textarea name="content" id="content" rows="50" cols="80"></textarea>
		<button onclick="submitPost()">전송</button>
		<h1>전송할 DB없어서 우선 F12 콘솔창으로 전송 설정함</h1>
	</div>

	<!-- textarea 밑에 script 작성하기 -->
	
	<script type="text/javascript">
		var oEditors = [];
		smartEditor = function() {
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "content",
				sSkinURI : "smartEditor/SmartEditor2Skin.html",
				fCreator : "createSEditor2",
				htParams : {
					// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseToolbar : true,
					// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : false,
					// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : false,
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
			//title & content 변수 설정
			let title = document.getElementById("title").value;
			let content = document.getElementById("content").value;
			
			//content 미입력시 
			//'<p><br></p>' 추출되므로 해당 내용을 공백으로 간주
			if (content == "<p><br></p>") {
				
				//공백은 alert 호출 후 에디터로 재포커스
				alert("내용을 입력해주세요.");
				oEditors.getById["content"].exec("FOCUS");
				return;
			} 
			//title 미입력시
			else if (title == "") {
				alert("제목을 입력해주세요.");
				title.focus();
			}
			
			else {
				//에디터 작성 후 저장 버튼 클릭시 실행될 로직
				//일단 콘솔창으로 전달
				console.log("제목 : "+title);
				console.log("내용 : "+content);
			}
		};
	</script>

</body>
</html>
