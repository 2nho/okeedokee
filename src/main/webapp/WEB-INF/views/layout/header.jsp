<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="stylesheet" type="text/css" href="/okeedokee/css/layout.css" />
</head>
<body>
	<header>
		<div class="header-container">
			<div class="nav1">
				<div class="nav1-pagelink">
					<ul>
						<li><a href="/okeedokee/Introduction">소개</a></li>
						<li><a href="/okeedokee/Announcement">유기견
						공고</a></li>
						<li><a href="/okeedokee/missing">실종
						•
						목격</a></li>
					</ul>
				</div>
			</div>
			<div class="header-logo">
				<a href="/okeedokee/main"><img src="/okeedokee/media/logo/mainLogo.png" alt="로고" /></a>
			</div>
			<div class="nav2">
				<div class="nav2-pagelink">
					<ul> 
						<li><a href="/okeedokee/Save">후원
						•
						봉사</a></li>
						<li><a href="/okeedokee/Notice/main">공지
						사항</a></li>
						<c:choose>
							<c:when test="${sessionScope.account.mnum != null}">
							<li>
								<a href="/okeedokee/mypage">마이
								페이지</a>
							</li>
							<li>
								<a href="/okeedokee/member/logout">로그
								아웃</a>
							</li>
							</c:when>
							<c:otherwise>
							<li>
								<a href="/okeedokee/member/loginPage">로그인
								•
								회원가입</a>	
							</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>