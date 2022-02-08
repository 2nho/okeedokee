<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
						<a href="Save" id="focus"><h4>자원봉사</h4></a> 
						<a href="donation"><h4>후원하기</h4></a>
					</div>
				</div>
			</nav>

			<!-- 게시판 -->
			<section>
				<article id="arti2">
					<div id="boardBox">
						<h1>자원봉사 수정하기</h1>

						<form:form modelAttribute="voltaVO" action="reviseVoltaResult?num=${voltaVO.num}" method="post" id="adminlist">
							<table>
								<colgroup>
									<col style="width: 40%;" />
									<col style="width: auto;" />
								</colgroup>
								<tbody>
									<tr>
										<!-- 관리자 -->
										<td>관리자</td>
										<td><form:input path="id" type="text" name="id" size="50" maxlength="50" readonly="readonly"/></td>
									</tr>
									<tr>
										<td>제목</td>
										<td><form:input path="title" type="text" name="title" size="50" maxlength="50"/></td>
									</tr>
									<tr>
										<td>보호소 이름</td>
										<td><form:input path="careName" type="text" name="careName" id="careName" size="50" maxlength="50"/></td>
									</tr>
									<tr>
										<td>보호소 연락처</td>
										<td><form:input path="phNum" type="text" name="phNum" id="phNum" size="50" maxlength="12"/></td>
									</tr>
									<tr>
										<td>보호소 주소</td>
										<td><form:input path="addr" type="text" name="addr" id="addr" size="50" maxlength="50"/></td>
									</tr>
									<tr>
										<td>상세설명</td>
										<td><form:textarea path="detailText" name="detailText" id="detailText" rows="10" cols="50"/></td>
									</tr>
									<tr>
										<td>활동기간</td>
										<td><form:input path="dateFrom" type="date" id="dateFrom" name="dateFrom"/>
											<span> ~ </span> <form:input path="dateTo" type="date" id="dateTo" name="dateTo"/>
										</td>
									</tr>
								</tbody>
							</table>
							<div id="admin3" align="center">
								<button type="submit" id="addVsmt">수정하기</button>
							</div>
						</form:form>
					</div>
				</article>
			</section>

		</main>


		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>

	<script type="text/javascript" src="js/voluntaryAdd.js"></script>
</body>
</html>