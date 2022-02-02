<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css" />
</head>
<body>
	<header>
		<div class="header-container">
			<div class="nav1">
				<div class="nav1-pagelink">
					<ul>
						<li><a href="/okeedokee/Introduction">소개</a></li>
						<li><a href="/okeedokee/Announcement_detail">유기견공고</a></li>
						<li><a href="/okeedokee/missing">실종/목격 게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="header-logo">
				<img src="/okeedokee/media/logo/mainLogo.png" alt="로고" />
			</div>
			<div class="nav2">
				<div class="nav2-pagelink">
					<ul> 
						<li><a href="">후원/봉사</a></li>
						<li><a href="/okeedokee/Notice/main">공지사항</a></li>
						<li>
							<%-- <c:choose>
								<c:when test="${sessionScope.account.mnum != null}">
								<a href="/okeedokee/mypage">마이페이지</a>
								</c:when>
								<c:otherwise> --%>
								<a href="/okeedokee/member/loginPage">로그인/회원가입</a>	
								<%-- </c:otherwise>
							</c:choose> --%>
							
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>