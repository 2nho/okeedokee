<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mnw.css" />
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
					<a href="missing" ><h4>유기견 실종 신고</h4></a>
					<a href="witnessing"><h4>유기견 목격 신고</h4></a>
					<a href="selfFlyer/selfFlyer" id="focus"><h4>셀프 전단지</h4></a>
				</div>
			</div>
		</nav>
		<section>
			<!-- 게시판 -->
			<article id="arti2">
					<div id="boardBox">
						<h1>셀프 전단지</h1>
						<div id="board">
							<!-- 검색 -->
							<div class="searchBox">
								<!-- 게시판 구분용 -->
								<input type="hidden" name="bdiv" id="bdiv" value="7" />
								<select name="searchType" id="searchType">
									<option value="id">작성자</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="both">제목+내용</option>
								</select>
								<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요"/>
								<button type="button" id="searchBtn">검색</button>
							</div>
							<div id="writeBox">
								<a href="makeFlyer" id="writeBtn">제작하기</a>
							</div>
							<div id="flyerBox">
								<div id="flyers">
									<c:forEach var="f" items="${flyers}">
									<a href="${pageContext.request.contextPath}/readFlyer?bdiv=7&num=${f.num}">
										<div class="flyer">
										
											<div class="flyerImg">
												 <!-- 저장된 파일 가져오기 -->
												<c:set var="loop_flag" value="false" />
												<c:forEach var="file" items="${filelist}">
												<c:if test="${not loop_flag }">
												<c:if test="${(f.hasimg eq 'Y') and (file.bnum == f.num)}"> 
													<img src="media/img/${file.localName}" alt=""/>
													  <c:set var="loop_flag" value="true" />
												</c:if>
												<c:if test="${f.hasimg ne 'Y'}">
													<img src="media/logo/mainLogo.png" alt=""/>
													 <c:set var="loop_flag" value="true" />
												</c:if>
												</c:if>
												</c:forEach>
											</div>
											
											<div class="flyerText">
												<h3>${f.id }님의 전단지</h3>
												<p>${f.petName } 어디있니?</p>
											</div>
											
										</div>
									</a>
									</c:forEach>
								</div>
							</div>
							
						</div>
					</div>
				</article>
			
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>


</body>
</html>