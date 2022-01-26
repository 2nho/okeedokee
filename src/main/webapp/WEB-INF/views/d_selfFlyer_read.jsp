<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"  href="css/mnw.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>


</head>
<body>

	<div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

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
				<!-- 글쓰기 -->
				<article id="arti2">
					<div id="boardBox">
						<div id="board">
							<div id="boardContent">
								<input type="text" id="title" name="title" readonly="readonly" 
								value="${selfVO.id}님의 강아지를 찾습니다."/>
								<label for="id">작성자&nbsp; |</label>
								<input type="text" name="id" id="id" readonly="readonly" value="${selfVO.id}"/>
								
								<!-- 실제 세션 정보 수정 필!!!! -->
								<input type="hidden" name="sessionId" id="sessionId" readonly="readonly" value="${sessionScope.account}"/>
								<div class="btnBox">
									<!-- 실제 세션 정보 수정 필!!!! -->
									<c:if test="${sessionScope.account == selfVO.id}">
										<a href="${pageContext.request.contextPath}/revise?bdiv=3&num=${selfVO.num}">수정</a>
										<a href="${pageContext.request.contextPath}/back?bdiv=3&num=${selfVO.num}" id="back">귀가</a>
										<a href="${pageContext.request.contextPath}/end?bdiv=3&num=${selfVO.num}" id="end">종료</a>
										<a href="${pageContext.request.contextPath}/isdelete?bdiv=3&num=${selfVO.num}">삭제</a>
									</c:if>
									<!-- 실제 세션 정보 수정 필!!!! -->
									<c:if test="${sessionScope.account != selfVO.id}">
										<a href="${pageContext.request.contextPath}/report?bdiv=3&num=${selfVO.num}">신고</a>
									</c:if>
								</div>
								<div id="printNshare">
									<button id="printBtn"><img src="media/logo/printer.png" alt="" /></button>
								</div>
								<div id="informBox">
									<div id="inform">
										<div id="flyerContent">
											<div id="flyerTitle" style="background-color: ${selfVO.color};">
												<h1>강아지를 찾습니다.</h1>
											</div>
											<div class="imgBox">
												<c:if test="${selfVO.hasimg == 'Y'}">
													<c:forEach var="img" items="${filelist }">
														<img alt="" src="media/img/${img.localName}">
													</c:forEach>
												</c:if>
												<c:if test="${selfVO.hasimg == 'N'}">
													<img src="media/logo/mainLogo.png" alt=>
												</c:if>
											</div>
											<table id="informTable">
												<tr>
													<td>이름</td>
													<td><input type="text" name="petName" id="petName"
														readonly="readonly" value="${selfVO.petName } (${selfVO.age}세 / ${(selfVO.sex == 'F')? '여':'남'})" /></td>
												</tr>

												<tr>
													<td>견종</td>
													<td><input type="text" name="species" id="species"
														readonly="readonly" value="${selfVO.species }" /></td>
												</tr>

												<tr>
													<td>특징</td>
													<td><input type="text" name="characters"
														id="characters" readonly="readonly"
														value="${selfVO.characters }" /></td>
												</tr>

												<tr>
													<td>실종 장소</td>
													<td><input type="text" name="location" id="location"
														readonly="readonly" value="${selfVO.location }" /></td>
												</tr>
											</table>
											<ul id="flyerReward">
												<c:if test="${selfVO.gratuity >= 0}">
													<li>
														사례금 ${selfVO.gratuity}만원
													</li>
													<li>
														<span>"꼭 사례하겠습니다."</span>
													</li>
												</c:if>
												<li>
													Tel. ${selfVO.phone}
												</li> 
											</ul>

										</div>
										
										<div class="comment">
											<h3>댓글</h3>
											<div class="commentCreate">
												<textarea id="commentCreator" rows="2" cols="100"></textarea>
												<input type="hidden" name="bnum" id="bnum" value="${selfVO.num }" />
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
								<input type="hidden" name="bdiv" id="bdiv" value="7"/>
							</div>
						</div>
					</div>
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	
	<script type="text/javascript" src="js/selfFlyerRead.js"></script>
</body>
</html>