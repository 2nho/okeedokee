<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/d_missingNwitnessing.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>

	<div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />

		<main>
			<nav>
				<!-- missing and witnessing 줄여서 mnw -->
				<div id="mnwNav">
					<div id="mnwTitle">
						<h3>유기견 실종 / 목격 신고</h3>
					</div>
					<div id="mnwSubTitle">
						<a href="missing" id="focus"><h4>유기견 실종 신고</h4></a> 
						<a href="witnessing"><h4>유기견 목격 신고</h4></a> 
						<a href="selfFlyer"><h4>셀프 전단지</h4></a>
					</div>
				</div> 
			</nav>
			<section>
				<article id="arti1">
					<div id="menuText">유기견 실종 신고 게시판</div>
				</article>
				<!-- 글쓰기 -->
				<article id="arti2">
					<div id="boardBox">
						<input type="text" id="title" name="title" placeholder="제목을 입력해주세요" />
						<div id="board">
							<form:form modelAttribute="" action="" method="">
								<label for="id">작성자</label>
								<input type="text" name="id" id="id" readonly="readonly" value="sessionId"/>
							
								<div id="informBox">
									<div id="informTitle"><span>기본정보</span></div>
									<div id="inform">
										<table id="informTable">
											<tr>
												<td>견종</td>
												<td>
													<select name="species" id="species">
														<option value="">푸들</option>
														<option value="">말티즈</option>
														<option value="">시츄</option>
														<option value="">치와와</option>
														<option value="">불독</option>
														<option value="">비숑프리제</option>
														<option value="">아프간하운드</option>
														<option value="">진도</option>
														<option value="">기타</option>
													</select>
												</td>
											</tr>
											
											<tr>
												<td>성별</td>
												 <td>
													<select name="sex" id="sex">
														<option value="F">여</option>
														<option value="M">남</option>
														<option value="X">미상</option>
													</select>
												</td>
											</tr>
											
											<tr>
												<td>특징</td>
												<td>
													<input type="text" name="character" id="character" placeholder="특징을 적어주세요 (* 30자 내외)"/>
												</td>
											</tr>
											
											<tr>
												<td>실종일</td>
												<td>
													<input type="date" name="date" id="date" />
												</td>
											</tr>
											
											<tr>
												<td>실종 장소</td>
												<td>
													<input type="text" name="location" id="location" placeholder="마지막으로 함께 있던 장소, 추측되는 장소"/>
												</td>
											</tr>
										</table>
										<form:textarea path="content" name="content" id="content" rows="20" cols="100"></form:textarea><br/>
										<button onclick="submitPost()">등록</button>
									
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>


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
				//에디터 작성 후 등록 버튼 클릭시 실행될 로직
				//일단 콘솔창으로 전달
				console.log("내용 : " + content);
				
			}
		};
	</script>
	<script type="text/javascript" src="js/d_missingNwitnessing.js"></script>
</body>
</html>