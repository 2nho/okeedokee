<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/snv.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>

	<div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />


		<main>
			<nav>
				<!-- support and voluntee 줄여서 save -->
				<div id="saveNav">
					<div id="saveTitle">
						<h3>후원 / 자원봉사</h3>
					</div>
					<div id="saveSubTitle">
						<a href="Save" id="focus"><h4>자원봉사</h4></a> 
						<a href="donation"><h4>후원하기</h4></a>
					</div>
				</div>
			</nav>

			<section>
				<article id="arti2">
					<div id="boardBox">
						<h1>자원봉사 신청하기</h1>

						<div id="btnBox">
							<c:if test="${sessionScope.account.level eq 'A'}">
								<a
									href="${pageContext.request.contextPath}/reviseVolta?num=${voltaVO.num}">수정</a>
								<a
									href="${pageContext.request.contextPath}/deleteVolta?num=${voltaVO.num}">삭제</a>
							</c:if>
						</div>

						<div id="adminlist">
							<table>
								<colgroup>
									<col style="width: 40%;" />
									<col style="width: auto;" />
								</colgroup>
								<tbody>
									<tr>
										<td>제목</td>
										<td><input type="text" name="title" size="50"
											maxlength="50" value="${voltaVO.title}"></td>
									</tr>
									<tr>
										<td>보호소 이름</td>
										<td><input type="text" name="careName" id="careName"
											size="50" maxlength="50" value="${voltaVO.careName}" readonly="readonly"></td>
									</tr>
									<tr>
										<td>보호소 연락처</td>
										<td><input type="text" name="phNum" id="phNum" size="50"
											maxlength="12" value="${voltaVO.phNum}" readonly="readonly"></td>
									</tr>
									<tr>
										<td>보호소 주소</td>
										<td><input type="text" name="addr" id="addr" size="50" maxlength="50" value="${voltaVO.addr}" readonly="readonly"></td>
									</tr>
									<tr>
										<td>상세설명</td>
										<td><textarea name="detailText" id="detailText" rows="10" cols="50" readonly="readonly">${voltaVO.detailText}</textarea></td>
									</tr>
									<tr>
										<td>활동기간</td>
										<td><input type="date" id="dateFrom" name="dateFrom" value="${voltaVO.dateFrom}" readonly="readonly"> 
											<span> ~ </span> 
											<input type="date" id="dateTo" name="dateTo" value="${voltaVO.dateTo}" readonly="readonly">
										</td>
									</tr>
								</tbody>
							</table>

							<div class="comment">
								<div class="commentCreate">
									<p>* 활동 가능 기간 입력</p>
									<div id="formBox">
										<input type="date" name="dateFrom1" id="dateFrom1" min="${voltaVO.dateFrom}" max="${voltaVO.dateTo}" title="${volta.dateFrom}"/>
										~
										<input type="date" name="dateTo1" id="dateTo1"  min="${voltaVO.dateFrom}" max="${voltaVO.dateTo}" title="${volta.dateTo}"/>
										<input type="hidden" name="phNum1" id="phNum1" value="${sessionScope.account.phNum}" />
										<input type="hidden" name="sessionId" id="sessionId" value="${sessionScope.account.id}" />
										<input type="hidden" name="sessionLv" id="sessionLv" value="${sessionScope.account.level}" />
										<input type="hidden" name="mnum" id="mnum" value="${sessionScope.account.mnum}" />
										<input type="hidden" name="bnum" id="bnum" value="${voltaVO.num}" />
									</div>
									<div class="cmtSubmitBox">
										<button type="button" id="cmtSubmit">신청</button>
									</div>
								</div>
								<br />
								<h3>신청내역</h3>
								<hr />
								<br />
								<div class="commentList" id="commentList"></div>
							</div>
						</div>
					</div>
				</article>
			</section>

		</main>



		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>

<script type="text/javascript" src="js/voluntary.js"></script>

</body>
</html>