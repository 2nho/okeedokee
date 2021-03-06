<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="media/logo/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="css/mypage.css" />
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />
</head>
<body>

<div class="container">
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	
	<main>
		<nav>
			<div class="mypageNav">
				<div>
					<div class="mypageTitle">
						<h3>개인정보</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="mypage" id="focus"><h4>개인정보 변경</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 예약 일정</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="reservation" ><h4>방문 예약 내역</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 실종 • 목격</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="missingList" ><h4>실종 신고 내역</h4></a>
						<a href="witnessingList" ><h4>목격 신고 내역</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 기부 • 봉사</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="donationList" ><h4>기부 현황</h4></a>
						<a href="volunteerList" ><h4>자원봉사 현황</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 신고 내역</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="reportList" ><h4>신고 내역</h4></a>
					</div>
				</div>
			</div>
		</nav>
		<section>
			<!-- 개인정보 변경 -->
			<article id="arti1">
				<div class="content">
					<h1>개인정보 변경</h1>
					<div id="cpi">
						<form action="/okeedokee/cpi" method="post" id="submit">
							<ul style=" text-align: center;">
								<li><label for="id">아이디</label><input type="text" name="id" id="id" style="margin-left: 18px;"/></li>
								<li><label for="pw">비밀번호 </label><input type="password" name="pw" id="pw"/></li>
								<input type="hidden" name="cpi" value="cpi"/>
								<li>
									<button type="button" id="submitBtn">
								         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
								           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
								           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
								         </svg>
								         <span>변경하기</span>
								    </button>
								</li>
							</ul>
						</form>
					</div>
					
				</div>
			</article>
			
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>
<script type="text/javascript" src="/okeedokee/js/cpi.js"></script>
</body>
</html>