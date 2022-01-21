<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/d_missingNwitnessing.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />

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
					<div id="menuText">유기견 목격 신고 게시판</div>
				</article>
				<!-- 글쓰기 -->
				<article id="arti2">
					<div id="boardBox">
						<input type="text" id="title" name="title" placeholder="제목을 입력해주세요" />
						<div id="board">
							
						</div>
					</div>
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>

	<script type="text/javascript" src="js/d_missingNwitnessing.js"></script>
</body>
</html>