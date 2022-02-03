<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="css/mnw.css" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>

	<div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />

		<main>

			<section>
				<article id="arti1">
					<div id="menuText">
						<span>신고하기</span>
					</div>
				</article>
				<div class="buttonBox">
					<!-- article 사이 패딩용 -->
				</div>
				<!-- 신고 게시판 -->
				<article id="arti2">
					<div id="boardBox">
						<div id="board">

							<form:form modelAttribute="reportVO" action="reviseReportResult" method="get" id="boardContent">
								<label for="id">작성자&nbsp; |</label>
								
								<!-- !!!!!!!!!!!세션 아이디/회원번호로 수정 필!!!!!!!!!!!!!! -->
								<form:input path="id" type="text" name="id" id="id" readonly="true"/>
								<form:hidden path="mnum" name="mnum" id="mnum"/>
								<form:hidden path="num" name="num" id="num"/>
								
								<div id="informBox">
									<div id="inform">

										<table id="reportTable">
											<tr>
												<td id="reportUrl">
													* 신고 게시글 : <a href="${reportVO.url}">${title}</a>
												</td>		
											</tr>
											
											<tr>
												 <td>
													<form:input path="title" name="title" id="title"/>
												</td>
											</tr>
											
											<tr>
												<td>
													<form:textarea path="content" name="content" id="content" rows="20" cols="120"></form:textarea><br/>
												</td>
											</tr>
											
										</table>
										
									</div>
								</div>
								<form:hidden path="bdiv" name="bdiv" id="bdiv" value="1"/>
							</form:form>
							
							<div class="submitBtnBox">
								<button type="button" id="submit" onclick="submitPost()">제출</button>
							</div>
							
						</div>
					</div>
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>

	<script type="text/javascript" src="js/report.js"></script>
</body>
</html>