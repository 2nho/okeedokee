<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<a href="missing" id="focus"><h4>유기견 실종 신고</h4></a> 
						<a href="witnessing"><h4>유기견 목격 신고</h4></a> 
						<a href="selfFlyer"><h4>셀프 전단지</h4></a>
					</div>
				</div> 
			</nav>
			<section>
				<article id="arti1">
					<div id="menuText"><span>유기견 실종 신고 게시판</span></div>
				</article>
				<!-- 글쓰기 -->
				<article id="arti2">
					<div id="boardBox">
						<div id="board">
							<form:form modelAttribute="mnwVO" id="boardContent">
								<form:input path="title" type="text" id="title" name="title" readonly="true"/>
								<label for="id">작성자&nbsp; |</label>
								<form:input path="id" type="text" name="id" id="id" readonly="true"/>
								<%-- <div class="btnBox">
									<c:if test="${sessionScope.account.id == mnwVO.id}">
										<a href="${pageContext.request.contextPath}/missing/revise?num=${mnwVO.num}">수정</a>
										<a href="${pageContext.request.contextPath}/missing/back?num=${mnwVO.num}">귀가</a>
										<a href="${pageContext.request.contextPath}/missing/end?num=${mnwVO.num}">종료</a>
									</c:if>
									<c:if test="${sessionScope.account.id != mnwVO.id}">
										<a href="${pageContext.request.contextPath}/missing/revise?num=${mnwVO.num}">신고</a>
									</c:if>
								</div> --%>
								<div id="informBox">
									<div id="informTitle"><span>* 기본정보</span></div>
									<div id="inform">
										<div class="imgBox">
											
										</div>
										<table id="informTable">
											<tr>
												<td>성별</td>
												 <td>
													<form:input path="sex" type="text" name="sex" id="sex" readonly="true"/>
												</td>
											</tr>
											
											<tr>
												<td>견종</td>
												<td>
													<form:input path="species" type="text" name="species" id="species" readonly="true"/>
												</td>
											</tr>
											
											<tr>
												<td>특징</td>
												<td>
													<form:input path="characters" type="text" name="characters" id="characters" readonly="true"/>
												</td>
											</tr>
											
											<tr>
												<td>실종 장소</td>
												<td>
													<form:input path="location" type="text" name="location" id="location" readonly="true"/>
												</td>
											</tr>
											
											<tr>
												<td>실종일</td>
												<td>
													<form:input path="date" type="date" name="date" id="date" readonly="true"/>
												</td>
											</tr>
										</table>
										
										<form:textarea path="content" name="content" id="content" rows="15" cols="100" readonly="true" ></form:textarea><br/>
									</div>
								</div>
								<form:input path="bdiv" type="hidden"/>
							</form:form>
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