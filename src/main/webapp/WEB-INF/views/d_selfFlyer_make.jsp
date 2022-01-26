<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mnw.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<a href="witnessing"><h4>유기견 목격 신고</h4></a> 
						<a href="selfFlyer" id="focus"><h4>셀프 전단지</h4></a>
					</div>
				</div>
			</nav>
			<section>
				<!-- 게시판 -->
				<article id="arti2">
					<div id="explanation">
						
					</div>
					<div id="boardBox">
						<div id="board">
							<!-- 숨겨진 파일 업로드 버튼 -->
							<input type="file" name="image" id="image" style="display: none;"/>

							<form:form modelAttribute="selfVO" method="post" action="createFlyerResult" id="boardContent">
								<label for="id">작성자&nbsp; |</label>

								<!-- !!!!!!!!!!!세션 아이디/회원번호로 수정 필!!!!!!!!!!!!!! -->
								<!-- sessionScope.account.id -->
								<form:input path="id" type="text" name="id" id="id" readonly="true" value="sessionId" />
								<!--  sessionScope.account.mnum  -->
								<form:hidden path="mnum" name="mnum" id="mnum" value="100" />

								<div id="informBox">
									<div id="inform">
										<div id="flyerMaker">
											<div class="question" id="q1">
												<p>견주님의 강아지 이름을 입력해주세요.</p>		
												<form:input path="petName" name="petName" id="petName" required="required"/>
											</div>
											<div class="question" id="q2">
												<p>견종은 무엇인가요?</p>
												<form:input path="species" name="species" id="species" required="required"/>
											</div>
											<div class="question" id="q3">
												<p>강아지 성별은 무엇인가요?</p>
												<form:select path="sex" name="sex" id="sex" required="required">
													<option value="" disabled="disabled" selected="selected">성별</option>
													<option value="F">여</option>
													<option value="M">남</option>
												</form:select>
											</div>
											<div class="question" id="q4">
												<p>강아지 나이는 몇살인가요?</p>
												<form:select path="age" name="age" id="age" required="required">
													<option value="" disabled="disabled" selected="selected">나이</option>
													<option value="1">1살</option>
													<option value="2">2살</option>
													<option value="3">3살</option>
													<option value="4">4살</option>
													<option value="5">5살</option>
													<option value="6">6살</option>
													<option value="7">7살</option>
													<option value="8">8살</option>
													<option value="9">9살</option>
													<option value="10">10살</option>
													<option value="11">11살</option>
													<option value="12">12살</option>
													<option value="13">13살</option>
													<option value="14">14살</option>
													<option value="15">15살</option>
													<option value="16">16살</option>
													<option value="17">17살</option>
													<option value="18">18살</option>
													<option value="19">19살</option>
													<option value="20">20살</option>
													<option value="21">21살</option>
													<option value="22">22살</option>
													<option value="23">23살</option>
													<option value="24">24살</option>
													<option value="25">25살</option>
												</form:select>
											</div>
											<div class="question" id="q5">
												<p>알아볼 수 있는 특징이 있나요?</p>
												<form:input path="characters" type="text" name="characters" id="characters" required="required"/>
											</div>
											<div class="question" id="q6">
												<p>견주님의 강아지 실종 장소는 어디인가요?</p>
												<form:input path="location" type="text" name="location" id="location" required="required"/>
											</div>
											<div class="question" id="q7">
												<p>가능한 사례 금액을 선택해주세요.</p>
												<form:select path="gratuity">
													<option value="5">5만원</option>
													<option value="10">10만원</option>
													<option value="15">15만원</option>
													<option value="20">20만원</option>
													<option value="25">25만원</option>
													<option value="30">30만원</option>
													<option value="0">없음</option>
												</form:select>
											</div>
											<div class="question" id="q8">
												<p>견주님에게 연락드릴 번호를 적어주세요.</p>
												<form:input path="phone" type="text" name="phone" id="phone" required="required" maxlength=""/>
											</div>
											<div class="question" id="q9">
												<p>알아볼 수 있도록 강아지 사진을 첨부해주세요.</p>										
												<button type="button" id="callUpload">사진선택</button>
												<form:hidden path="fileList" id="fileList"/>
											</div>
											<div class="question" id="q10">
												<p>전단지 제목 배경 색을 선택해주세요. <br /><span>(*미선택시 분홍색입니다.)</span></p>			
												<input type="color" name="colorPicker" id="colorPicker" value=""/>
												<form:hidden path="color" name="color" id="color" value=""/>
											</div>
											
										</div>

									</div>
								</div>
								<form:hidden path="bdiv" value="7" />
							</form:form>
							<div class="submitBtnBox">
								<button type="button" id="preview">미리보기</button>
								<button type="button" id="submit">등록</button>
							</div>
						</div>
					</div>
				</article>

			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	
	<script type="text/javascript" src="js/selfFlyerMake.js"></script>


</body>
</html>