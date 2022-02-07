<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/snv.css" />
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
						<a href="Save" id="focus"><h4>자원봉사</h4></a> <a href="donation"><h4>후원하기</h4></a>
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
									href="${pageContext.request.contextPath}/reviseVol?num=${volta.num}">수정</a>
								<a
									href="${pageContext.request.contextPath}/deleteVol?num=${volta.num}">삭제</a>
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
											maxlength="50" value="${volta.title}"></td>
									</tr>
									<tr>
										<td>보호소 이름</td>
										<td><input type="text" name="careName" id="careName"
											size="50" maxlength="50" value="${volta.careName}" readonly="readonly"></td>
									</tr>
									<tr>
										<td>보호소 연락처</td>
										<td><input type="text" name="phNum" id="phNum" size="50"
											maxlength="12" value="${volta.phNum}" readonly="readonly"></td>
									</tr>
									<tr>
										<td>보호소 주소</td>
										<td><input type="text" name="addr" id="addr" size="50"
											maxlength="50" value="${volta.addr}" readonly="readonly"></td>
									</tr>
									<tr>
										<td>상세설명</td>
										<td><textarea name="detailText" id="detailText" rows="10"
												cols="50" readonly="readonly">${volta.detailText}</textarea></td>
									</tr>
									<tr>
										<td>활동기간</td>
										<td><input type="date" id="dateFrom" name="dateFrom"
											value="${volta.dateFrom}" readonly="readonly"> <span> ~ </span> 
											<input type="date" id="dateTo" name="dateTo" value="${volta.dateTo}" readonly="readonly">
										</td>
									</tr>
								</tbody>
							</table>

							<div class="comment">
								<div class="commentCreate">
									<input type="date" name="dateFrom" id="dateFrom" min="${volta.dateFrom }" max="${volta.dateTo}" />
									<input type="date" name="dateTo" id="dateTo"  min="${volta.dateFrom }" max="${volta.dateTo}" />
									<input type="hidden" name="sessionId" id="sessionId" value="${sessionScope.account.id}" />
									<input type="hidden" name="mnum" id="mnum" value="${sessionScope.account.mnum}" />
									<input type="hidden" name="bnum" id="bnum" value="${volta.num}" />
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


</body>
</html>