<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="/okeedokee/media/logo/favicon.ico">
<link rel="stylesheet" href="/okeedokee/css/loginpage.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/okeedokee/css/offLogin.css" />
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />
</head>
<body>
<div class="totalContainer">
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	<main>
		<nav>
			<div class="mypageNav">
				<div>
					<div class="mypageTitle">
						<h3>로그인/회원가입</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="loginPage" ><h4>로그인</h4></a>
						<a href="signupAuthMove" ><h4>회원가입</h4></a>
						<a href="findId" id="focus"><h4>아이디 찾기</h4></a>
						<a href="findPw" ><h4>비밀번호 찾기</h4></a>
					</div>
					<br /><br /><br /><br />
				</div>
				<br />
				
			</div>
		</nav>
		<section>
			<article id="arti1">
				<div id="findIdBoard">
					<h1>아이디찾기</h1><br />
					<form action="/okeedokee/member/findIdResult" method="post" id="submit">
						<ul>
							<li><label for="name">성명</label><input type="text" name="name" id="name" style="margin-left: 18px;"/></li>
							<li><label for="email">이메일 </label><input type="email" name="email" id="email"/></li>
							<li>
								<button type="button" id="submitFindId">
							         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>아이디 찾기</span>
							    </button>
							</li>
						</ul>
					</form>
				</div>
			</article>
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>
<script type="text/javascript" src="/okeedokee/js/offLogin.js"></script>
</body>
</html>