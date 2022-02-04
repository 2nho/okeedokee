<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="css/mypage.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<a href="mypage"><h4>개인정보 변경</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 예약 일정</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="reservation"><h4>방문 예약 내역</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 실종 • 목격</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="missingList" id="focus"><h4>실종 신고 내역</h4></a>
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
			<!-- 실종 신고 내역 -->
			<article id="arti1">
				<div class="content">
					<h1>실종 신고 내역</h1>
					<!-- 여기서부터 작업 시작하세요 -->
					<div class="myList">
						<table>
							<colgroup>
								<col width="5%">
								<col width="auto">
								<col width="15%" id="colDate">
								<col width="10%" id="colStatus">
							</colgroup>
							<thead>
								<tr>
									<th>순번</th>
									<th>제목</th>
									<th>작성일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="miss" items="${list}">
								<c:set var="i" value="${i+1}"/>
								<tr>
									<td>${i}</td>
									<td><a href="read?bdiv=3&num=${miss.num}">${miss.title}</a></td>
									<td>${miss.createdate}</td>
									<td>${(miss.status == 'O')?	'공고':(miss.status == 'B')? '귀가':(miss.status == 'E')? '종료':'신고'}</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
			</article>
			
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>

</body>
</html>