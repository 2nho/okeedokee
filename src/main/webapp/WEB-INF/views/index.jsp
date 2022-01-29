
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<a href="api">유기견API TEST</a>
	<br/>
	<a href="textEditor">텍스트 에디터 TEST</a>
	<br/>
	<br/>
	<a href="Map_api">카카오맵API TEST</a>
	<br/>
	<a href="main">main</a>
	<br/>
	<a href="missing">유기견 목격 / 실종 게시판</a>
	<br />
	<a href="adminHome">관리자페이지</a>
	<a href="adminMember">관리자 회원관리</a> <a href="adminReport">관리자 신고관리</a>
	<a href="Announcement">유기견공고</a>
	<a href="Announcement_detail">유기견공고</a>
	<br/>
	<a href="${pageContext.request.contextPath }/Notice/main">공지사항</a>
	
	<a href="${pageContext.request.contextPath }/member/loginPage">로그인</a>
	<c:if test="${sessionScope.account.mnum != null}">
		<p>로그인되었습니다.</p>
		<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
	</c:if>
	
	<c:if test="${sessionScope.account.mnum == null}">
		<p>로그인해주세요.</p>
	</c:if>
</body>
</html>