<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
					<a href="selfFlyer" id="focus"><h4>셀프 전단지</h4></a>
				</div>
			</div>
		</nav>
		<section>
			<!-- 게시판 -->
			<article id="arti2">
					<div id="boardBox">
						<h1>셀프 전단지</h1>
						<div id="board">
							<div id="writeBox">
								<a href="makeFlyer" id="writeBtn">제작하기</a>
							</div>
							<div id="flyerBox">
								
								<c:forEach var="f" items="${flyers}">
								<a href="${pageContext.request.contextPath}/read?bdiv=3&num=${list.num}">
									<div class="flyer">
										
									</div>
								</a>
								</c:forEach>
							</div>
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