<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 메인 */
main {
	display: flex;
	flex-direction: row;
}

main nav {
	flex: 3;
}

main section {
	flex: 9;
	width: 100%;
	height: 100%;
}

/* 네비게이션 */
main nav #mnwNav {
	width: 90%;
	height: 350px;
	background-color: #f9f1c0;
}
main nav #mnwNav #mnwTitle::after {
	content: "";
	display: block;
	width: 90%;
	border-bottom: 2px solid black;
}
</style>
</head>
<body>

<div class="totalContainer">
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	
	<main>
		<nav>
			<!-- missing and witnessing 줄여서 mnw -->
			<div id="mnwNav">
				<div id="mnwTitle">
					<h4>유기견 실종 / 목격 신고</h4>
				</div>
				<div id="mnwSubTitle">
					<h5>유기견 실종 신고</h5>
					<h5>유기견 목격 신고</h5>
					<h5>셀프 전단지</h5>
				</div>
			</div>
		</nav>
		<section>
			<article id="arti1">
				<div id="slideBox">
					<div class="slides" id="slide1"></div>
					<div class="slides" id="slide2"></div>
					<div class="slides" id="slide3"></div>
					<div class="slides" id="slide4"></div>
					<div class="slides" id="slide5"></div>
				</div>
			</article>

			<article id="arti2">
				<div id="missingBoard">
					<h1>유기견 실종 신고 게시판</h1>
					<div id="board"></div>
				</div>
			</article>
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>
</body>
</html>