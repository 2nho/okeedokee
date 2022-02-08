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
					<div id="explanation"></div>
					<div id="boardBox">
						<div id="board">

							<div id="boardContent">
								<label for="id">작성자&nbsp; |</label>
								
								<!-- !!!!!!!!!!!세션 아이디/회원번호로 수정 필!!!!!!!!!!!!!! -->
								<input type="text" name="id" id="id" readonly="readonly" value="${reportVO.id}" />
								<input type="hidden" name="mnum" id="mnum" value="${sessionScope.account.mnum}" />
								<input type="hidden" name="sessionId" id="sessionId" value="${sessionScope.account.id}" />
								<input type="hidden" name="level" id="level" value="${sessionScope.account.level}" />
								<div class="btnBox">
									<a href="${pageContext.request.contextPath}/reviseReport?num=${reportVO.num}">수정</a>
									<a href="${pageContext.request.contextPath}/isdeleteReport?num=${reportVO.num}">삭제</a>
								</div>
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
													<input name="title" id="title" value="${reportVO.title}" readonly="readonly"/>
												</td>
											</tr>
											
											<tr>
												<td>
													<div id="content">${reportVO.content}</div><br/>
												</td>
											</tr>
											
										</table>
										
										
										<div class="comment">
											<h3>댓글</h3>
											<div class="commentCreate">
												<textarea id="commentCreator" rows="2" cols="100"></textarea>
												<input type="hidden" name="bnum" id="bnum" value="${reportVO.num }" />
												<div class="cmtSubmitBox">
													<button type="button" id="cmtSubmit">등록</button>
												</div>
											</div>
											<br />
											<hr />
											<br />
											<div class="commentList" id="commentList">
											
											</div>
											
										</div>
										
										
									</div>
								</div>
								<input type="hidden" name="bdiv" id="bdiv" value="${reportVO.bdiv}"/>
							</div>
						</div>
					</div>
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	
	<script type="text/javascript" src="js/reportRead.js"></script>

</body>
</html>