<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="css/mnw.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
					<a href="witnessing" id="focus"><h4>유기견 목격 신고</h4></a>
					<a href="selfFlyer"><h4>셀프 전단지</h4></a>
				</div>
			</div>
		</nav>
		<section>
			<article id="arti1">
			<!-- 게시글 내용 슬라이드 -->
				<div id="slideBox">
				<c:forEach var="list" items="${list}">
					<div class="slides" id="slide1">
						
						<a href="${pageContext.request.contextPath}/read?bdiv=4&num=${list.num}">
							<div class="slideContent">
								 <!-- 저장된 파일 가져오기 -->
								<c:set var="loop_flag" value="false" />
								<c:forEach var="file" items="${filelist}">
								<c:if test="${not loop_flag }">
								<c:if test="${(list.hasimg eq 'Y') and (file.bnum == list.num)}">
									<img src="media/img/${file.localName}" alt=""/>
									  <c:set var="loop_flag" value="true" />
								</c:if>
								<c:if test="${list.hasimg ne 'Y'}">
									<img src="media/logo/mainLogo.png" alt=""/>
									 <c:set var="loop_flag" value="true" />
								</c:if>
								 </c:if>
							</c:forEach>
								<div class="text">
									<h3>${list.title}</h3>
								</div>
							</div>
						</a>
					</div>
				</c:forEach>
				</div>
			</article>
			<div class="buttonBox">
				<button id="prev">◀◀</button>
				<button id="next">▶▶</button>
			</div>
			<!-- 게시판 -->
			<article id="arti2">
					<div id="boardBox">
						<h1>유기견 목격 신고 게시판</h1>
						<div id="board">
							<div id="writeBox">
								<a href="writeWitnessing" id="writeBtn">글쓰기</a>
							</div>
							<table id="boardTable">
								<colgroup>
									<col width="5%">
									<col width="20%">
									<col width="auto">
									<col width="8%">
									<col width="10%">
									<col width="5%">
								</colgroup>
								<thead>
									<tr>
										<th>No.</th>
										<th>사진</th>
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="list" items="${list}">
									<tr>
										<td>${list.num}</td>
										<td>
											<a href="${pageContext.request.contextPath}/read?bdiv=4&num=${list.num}">
											<!-- 저장된 파일 가져오기 -->
											<c:set var="loop_flag" value="false" />
											<c:forEach var="file" items="${filelist}">
												<c:if test="${not loop_flag }">
												<c:if test="${(list.hasimg eq 'Y') and (file.bnum == list.num)}">
													<img src="media/img/${file.localName}" alt="" style="width: 180px; height: 120px;"/>
													  <c:set var="loop_flag" value="true" />
												</c:if>
												<c:if test="${list.hasimg ne 'Y'}">
													<img src="media/logo/mainLogo.png" alt="" style="width: 180px; height: 120px;"/>
													  <c:set var="loop_flag" value="true" />
												</c:if>
												 </c:if>
											</c:forEach>
											</a>
										</td>
										<td>
											<a href="${pageContext.request.contextPath}/read?bdiv=3&num=${list.num}">
												<h4>${list.title }</h4>
												<p><strong>성별</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;${(list.sex == 'F')? "여":(list.sex == 'M')? "남":"미상"}</p>
												<p><strong>견종</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;${list.species }</p>
												<p><strong>특징</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;${list.characters}</p>
												<p><strong>실종일</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;${list.date}</p>
												<p><strong>실종장소</strong>&nbsp;&nbsp;&nbsp;:&nbsp;${list.location}</p>
											</a>
										</td>
										<td>${list.id }</td>
										<td>${list.createdate }</td>
										<td>3</td>
										<!-- 게시글 상태 처리용 -->
										<input type="hidden" name="status" class="status" value="${list.status}" />
									</tr>
								</c:forEach>
								</tbody>
							</table>
							<div id="pagingBox">
								<!-- 왼쪽 페이지 블럭 이동 -->
		                        <c:choose>
		                        	<c:when test="${(minBlock - 1 ) < 1}"></c:when>
		                        	<c:otherwise><a href="${pageContext.request.contextPath}/witnessing?num=${minBlock-1}" class="paging">◀◀</a></c:otherwise>
		                        </c:choose>
								&nbsp;&nbsp;&nbsp;
								<!-- 왼쪽 페이지 이동 -->
								<c:choose>
									<c:when test="${num == 1}"></c:when>
									<c:otherwise><a href="${pageContext.request.contextPath }/witnessingnum=${num-1}" class="paging">◀</a></c:otherwise>
								</c:choose>
								&nbsp;&nbsp;
								<!-- 페이지별 선택 이동 -->
								<c:forEach begin="${minBlock}" end="${(total < maxBlock)? total:maxBlock }" step="1" var="i">
									<c:choose>
										<c:when test="${num == i}"><span  class="paging"><strong>&nbsp;${i}&nbsp;</strong></span></c:when>
										<c:otherwise><a href="${pageContext.request.contextPath}/witnessing?num=${i}">&nbsp;${i}&nbsp;</a></c:otherwise>
									</c:choose>
								</c:forEach>
								&nbsp;&nbsp;
								<!-- 오른쪽 페이지 이동 -->
								<c:choose>
									<c:when test="${num == total}"></c:when>
									<c:otherwise><a href="${pageContext.request.contextPath }/witnessing?num=${num+1}" class="paging">▶</a></c:otherwise>
								</c:choose>
								&nbsp;&nbsp;&nbsp;
								<!-- 오른쪽 페이지 블럭 이동 -->
								<c:choose>
									<c:when test="${maxBlock >= total }"></c:when>
									<c:otherwise><a href="${pageContext.request.contextPath}/witnessing?num=${maxBlock+1}" class="paging">▶▶</a></c:otherwise>
								</c:choose>
							</div>
							<!-- 검색 -->
							<div class="searchBox">
								<!-- 게시판 구분용 -->
								<input type="hidden" name="bdiv" id="bdiv" value="4" />
								<select name="searchType" id="searchType">
									<option value="id">작성자</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="both">제목+내용</option>
								</select>
								<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요"/>
								<button type="button" id="searchBtn">검색</button>
							</div>
						</div>
					</div>
				</article>
			
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>

<script type="text/javascript" src="js/mnw.js"></script>
</body>
</html>