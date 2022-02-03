<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="css/mnw.css" />
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
						<a href="missing"><h4>유기견 실종 신고</h4></a> 
						<a href="witnessing" id="focus"><h4>유기견 목격 신고</h4></a> 
						<a href="selfFlyer"><h4>셀프 전단지</h4></a>
					</div>
				</div>
			</nav>
			<section>
				<article id="arti1">
					<div id="menuText"><span>유기견 목격 신고 게시판</span></div>
				</article>
				<div class="buttonBox">
				<!-- article 사이 패딩용 -->
				</div>
				<!-- 글쓰기 -->
				<article id="arti2">
					<div id="boardBox">
						<div id="board">
							<!-- 숨겨진 파일 업로드 버튼 -->
							<input type="file" name="image" id="image" style="display: none;" multiple="multiple"/>
							<form:form modelAttribute="mnwVO" method="post" action="createResult" id="boardContent">
								<form:input path="title" type="text" id="title" name="title" placeholder="제목을 입력해주세요" />
								<label for="id">작성자&nbsp; |</label>
								
								<!-- !!!!!!!!!!!세션 아이디/회원번호로 수정 필!!!!!!!!!!!!!! -->
								<form:input path="id" type="text" name="id" id="id" readonly="true" value="${sessionScope.account.id}" />
								<form:hidden path="mnum" name="mnum" id="mnum" value="${sessionScope.account.mnum}" />

							
								<div id="informBox">
									<div id="informTitle"><span>* 기본정보</span></div>
									<div id="inform">
										<table id="informTable">
											<tr>
												<td>사진</td>										
												<td><button type="button" id="callUpload">사진선택</button></td>
												<form:hidden path="fileList" id="fileList"/>
																							
											</tr>
											
											<tr>
												<td>성별</td>
												 <td>
													<form:select path="sex" name="sex" id="sex" required="required">
														<option value="" disabled="disabled" selected="selected">선택</option>
														<option value="F">여</option>
														<option value="M">남</option>
														<option value="X">미상</option>
													</form:select>
												</td>
											</tr>
											
											<tr>
												<td>견종</td>
												<td>
													<form:select path="species" name="species" id="species" required="required">
														<option value="" disabled="disabled" selected="selected">선택</option>
														<option value="푸들">푸들</option>
														<option value="말티즈">말티즈</option>
														<option value="시츄">시츄</option>
														<option value="치와와">치와와</option>
														<option value="불독">불독</option>
														<option value="요크셔테리어">요크셔테리어</option>
														<option value="비숑프리제">비숑프리제</option>
														<option value="아프간하운드">아프간하운드</option>
														<option value="진도">진도</option>
														<option value="믹스">믹스</option>
														<option value="기타">기타</option>
													</form:select>
												</td>
											</tr>
											
											<tr>
												<td>특징</td>
												<td>
													<form:input path="characters" type="text" name="characters" id="characters" placeholder="특징 (30자 내외)" required="required"/>
												</td>
											</tr>
											
											<tr>
												<td>목격 장소</td>
												<td>
													<form:input path="location" type="text" name="location" id="location" placeholder="목격한 장소 (30자 내외)" required="required"/>
												</td>
											</tr>
											
											<tr> 
												<td>목격 일자</td>
												<td>
													<form:input path="date" type="date" name="date" id="date" required="required"/>
												</td>
											</tr>
										</table>
										
										<form:textarea path="content" name="content" id="content" rows="15" cols="100" style="width: 100%; min-width: 150px;"></form:textarea><br/>
									</div>
								</div>
								<form:hidden path="bdiv" value="4"/>
							</form:form>
							<div class="submitBtnBox">
								<button type="button" onclick="submitPost()" id="submit">등록</button>
							</div>
						</div>
					</div>
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>

	<script type="text/javascript" src="js/mnwWrite.js"></script>
</body>
</html>