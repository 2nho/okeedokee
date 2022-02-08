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
						<a href="loginPage" id="focus"><h4>로그인</h4></a>
						<a href="signupAuthMove" ><h4>회원가입</h4></a>
						<a href="findId" ><h4>아이디 찾기</h4></a>
						<a href="findPw" ><h4>비밀번호 찾기</h4></a>
					</div>
					<br /><br /><br /><br />
				</div>
				<br />
				
			</div>
		</nav>
		
		<section id="loginSection">
			<article id="arti1">
				<div id="LoginBoard">
					<h1>로그인</h1><br />
					<form action="/okeedokee/member/login" method="post" id="submit">
						<ul>
							<li><label for="id">아이디</label><input type="text" name="id" id="id" style="margin-left: 18px;"/></li>
							<li><label for="password">비밀번호 </label><input type="password" name="pw" id="pw"/></li><br />
							<li>
								<button type="button" id="submitBtn">
							         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>로그인</span>
							    </button>
							    <button type="button" id="sign">
							         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>회원가입</span>
								</button><br /><br />
							</li>
							<li>
								<a href="findId">아이디 찾기</a>
								<a href="findPw">비밀번호 찾기</a>
							</li>	
						    
						</ul>
					</form>
				</div>
			</article>
		</section>
	</main>
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	<script type="text/javascript" src="/okeedokee/js/offLogin.js"></script>
</div>
</body>
</html>