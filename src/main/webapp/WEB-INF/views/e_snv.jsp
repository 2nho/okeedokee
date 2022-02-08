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
							<h1>자원봉사 신청하기</h1>

						<div id="volList">
							<div id="valbtn">
								<c:if test="${sessionScope.account.level eq 'A'}">
									<a href="addVoluntary">
										<button class="ClickBtn">자원봉사 등록하기</button>
									</a>
								</c:if>
							</div>

							<table id="col1">
								<colgroup>
									<col style="width: 5%;" id="colNo"/>
									<col style="width: 24%;" id="colCare"/>
									<col style="width: auto;" />
									<col style="width: 22%;" id="colPer" />
								</colgroup>
								<thead>
									<tr bgcolor="#f9f1c0">
										<th>No.</th>
										<th>보호소</th>
										<th>주소</th>
										<th>기간</th>
									</tr>
								</thead>
								<c:forEach var="vt" items="${list}">
									<tbody>
										<tr>
											<th>${vt.num }</th>
											<td><a href="voluntary?num=${vt.num }">${vt.careName }</a></td>
											<td><a href="voluntary?num=${vt.num }">${vt.addr }</a></td>
											<td id="period">${vt.dateFrom}
											 ~ 
											 ${vt.dateTo}</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
							<div id="pagingBox">
								<!-- 왼쪽 페이지 블럭 이동 -->
								<c:choose>
									<c:when test="${(minBlock - 1 ) < 1}"></c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/Save?num=${minBlock-1}${query}"
											class="paging">◀◀</a>
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;&nbsp;
								<!-- 왼쪽 페이지 이동 -->
								<c:choose>
									<c:when test="${num == 1}"></c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath }/Save?num=${num-1}${query}"
											class="paging">◀</a>
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;
								<!-- 페이지별 선택 이동 -->
								<c:forEach begin="${minBlock}"
									end="${(total < maxBlock)? total:maxBlock }" step="1" var="i">
									<c:choose>
										<c:when test="${num == i}">
											<span class="paging"><strong>&nbsp;${i}&nbsp;</strong></span>
										</c:when>
										<c:otherwise>
											<a
												href="${pageContext.request.contextPath}/Save?num=${i}${query}">&nbsp;${i}&nbsp;</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								&nbsp;&nbsp;
								<!-- 오른쪽 페이지 이동 -->
								<c:choose>
									<c:when test="${num == total}"></c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath }/Save?num=${num+1}${query}"
											class="paging">▶</a>
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;&nbsp;
								<!-- 오른쪽 페이지 블럭 이동 -->
								<c:choose>
									<c:when test="${maxBlock >= total }"></c:when>
									<c:otherwise>
										<a
											href="${pageContext.request.contextPath}/Save?num=${maxBlock+1}${query}"
											class="paging">▶▶</a>
									</c:otherwise>
								</c:choose>
							</div>

							<!-- 검색 -->
							<div class="searchBox">
								<select name="searchType" id="searchType">
									<option value="careName">보호소</option>
									<option value="addr">주소</option>
									<option value="both">보호소+주소</option>
								</select> <input type="text" id="search" name="search"
									placeholder="검색어를 입력해주세요" />
								<button type="button" id="searchBtn">검색</button>
							</div>
						</div>
					</div>
				</article>
			</section>
		</main>



		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	<script>
	<!-- 챗봇 코드 -->
		window.dyc = {
			chatbotUid : "9431422cef3497f7"
		};
	</script>
	<script async src="https://cloudturing.chat/v1.0/chat.js"></script>
	<!-- End CLOUDTURING -->

	<script type="text/javascript" src="js/snv.js"></script>
</body>
</html>