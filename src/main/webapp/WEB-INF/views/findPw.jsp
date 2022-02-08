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
						<a href="findId" ><h4>아이디 찾기</h4></a>
						<a href="findPw" id="focus"><h4>비밀번호 찾기</h4></a>
					</div>
					<br /><br /><br /><br />
				</div>
				<br />
				
			</div>
		</nav>
		<section>
			<article id="arti1">
				<div id="findPwBoard">
					<h1>비밀번호 찾기</h1><br />
					<form action="/okeedokee/mail/findPwAuth" method="post" id="submit">
							
							성명 <input type="text" name="name" id="name" style="margin-left: 14px;"/><br />
							아이디 <input type="text" name="id" id="id" /> <br />
                            이메일 <input type="email" name="e_mail" placeholder="이메일주소를 입력하세요."><br />
                           	     <input type="hidden" name="hidden" id="hidden"/>
 						<button type="button" id="submitFindPw">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>인증 메일 보내기</span>
					    </button><br />
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