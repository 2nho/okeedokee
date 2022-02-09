<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<%
	int total = (Integer) request.getAttribute("total");
	int minBlock = (Integer) request.getAttribute("minBlock");
	int maxBlock = (Integer) request.getAttribute("maxBlock");
	
	String query = "";
	
	pageContext.setAttribute("query", query);
%>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" href="css/mypage.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/okeedokee/css/reservation.css?dfgdfgd" />
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />
</head>
<body>

	<div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />

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
							<a href="reservation" id="focus"><h4>방문 예약 내역</h4></a>
						</div>
					</div>
					<br />
					<div>
						<div class="mypageTitle">
							<h3>나의 실종 • 목격</h3>
						</div>
						<div class="mypageSubTitle">
							<a href="missingList"><h4>실종 신고 내역</h4></a> <a
								href="witnessingList"><h4>목격 신고 내역</h4></a>
						</div>
					</div>
					<br />
					<div>
						<div class="mypageTitle">
							<h3>나의 기부 • 봉사</h3>
						</div>
						<div class="mypageSubTitle">
							<a href="donationList"><h4>기부 현황</h4></a> <a
								href="volunteerList"><h4>자원봉사 현황</h4></a>
						</div>
					</div>
					<br />
					<div>
						<div class="mypageTitle">
							<h3>나의 신고 내역</h3>
						</div>
						<div class="mypageSubTitle">
							<a href="reportList"><h4>신고 내역</h4></a>
						</div>
					</div>
				</div>
			</nav>
			<section class="reserBBS">
				<!-- 방문 예약 내역 -->
				<article id="arti1">
					<div class="content">
						<h1>방문 예약 내역</h1>
						<div id="reserBBSBoard">
							<table>
								<thead>
									<tr>
										<th>순번</th>
										<th>제목</th>
										<th>방문 예정일</th>
										<th>방문 예정자</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<c:forEach var="item" items="${list}">
											<tr>
												<td>${item.rnum}</td>
												<td><a
													href="/okeedokee/reservationDetail?rnum=${item.rnum}">${item.reserName}님의 상담 예약</a></td>
												<td>${item.reserDate}</td>
												<td>${item.reserName}</td>
											</tr>
										</c:forEach>
									</tr>
								</tbody>
							</table>

							<div id="reserBBSPage">
								<c:choose>
									<c:when test="${(minBlock-1) < 1 }">
										<!-- <span>◀</span> -->
									</c:when>
									<c:otherwise>
										<a href="/okeedokee/reservation?rnum=${minBlock-1}${query}">◀◀</a>
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;
								<c:choose>
									<c:when test="${num==1}">
										<!-- <span>◀◀</span> -->
									</c:when>
									<c:otherwise>
										<a href="/okeedokee/reservation?num=${num-1}${query}">◀</a>
									</c:otherwise>
								</c:choose>

								<!-- 삼항 연산자를 사용하여 페이징 생성 -->
								<c:forEach begin="${minBlock}"
									end="${(total<maxBlock)?total:maxBlock }" step="1" var="i">
									<c:choose>
										<c:when test="${num==i}">
											<!-- jstl을 이용해서 i와 num이 같으면 span처리 -->
											<span>${i}</span>
										</c:when>
										<c:otherwise>
											<!-- 계산된 값으로 페이지 재 호출 -->
											<a
												href="/okeedokee/reservation?num=${i}${query}">${i }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${num==total }">
										<!-- <span>▶</span> -->
									</c:when>
									<c:otherwise>
										<a href="/okeedokee/reservation?num=${num+1}${query}">▶</a>
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;
								<c:choose>
									<c:when test="${maxBlock > total }">
										<!-- 	<span>▶▶</span> -->
									</c:when>
									<c:otherwise>
										<a href="/okeedokee/reservation?num=${maxBlock+1}${query}">▶▶</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	<script type="text/javascript" src="/okeedokee/js/reservation.js"></script>
</body>
</html>