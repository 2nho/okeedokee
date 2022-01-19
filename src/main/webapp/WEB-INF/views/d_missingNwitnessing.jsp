<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/layout.css" />

<style type="text/css">
/* 메인 */
main {
	/* 전체 비율 */
	flex: 10;
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
}

main nav {
	flex: 3;
}

main nav #missingNav {
	width: 90%;
	height: 350px;
	background-color: #f9f1c0;
}

main section {
	flex: 9;
	width: 100%;
}
</style>
</head>
<body>

<div class="totalContainer">

	<header>
		<div class="header-container">
			<div class="nav1">
				<div class="nav1-pagelink">
					<ul>
						<li><a href="">소개</a></li>
						<li><a href="">유기견공고</a></li>
						<li><a href="">실종/목격 게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="header-logo">
				<img src="media/logo/mainLogo.png" alt="로고" />
			</div>
			<div class="nav2">
				<div class="nav2-pagelink">
					<ul>
						<li><a href="">후원/봉사</a></li>
						<li><a href="">공지사항</a></li>
						<li><a href="">로그인/회원가입</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<main>
		<nav>
			<!-- missing and sighting 줄여서 mns -->
			<div id="mnsNav">
				<div id="mnsTitle">
					<h4>유기견 실종 / 목격 신고</h4>
				</div>
				<div id="mnsSubTitle">
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
	<footer>
		<div id="bar"></div>
		<div id="footerContent">
			<div class="logo">
				<img src="media/logo/mainLogo.png" alt="로고" />
			</div>
			<div class="text">
				<p>
					서울특별시 종로구 000동 TEL : 010-0000-0000서울특별시 종로구 000동 TEL : 010-0000-0000 <br />
					서울 12345호 법인사업자등록번호 : 123-3456-12314 <br />
					Copyright®2022OKEE DOKEE All Rights Reserved.
				</p>
			</div>
			<div class="sns">
				<a href="https://www.instagram.com"><img src="media/sns/instagram.png" alt="" /></a> 
				<a href="https://www.facebook.com"><img src="media/sns/facebook.png" alt="" /></a> 
				<a href="https://www.youtube.com"><img src="media/sns/youtube.png" alt="" /></a>
			</div>
		</div>
	</footer>
</div>
</body>
</html>