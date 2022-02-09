<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="/okeedokee/media/logo/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
						<a href="/okeedokee/mypage" id="focus"><h4>개인정보 변경</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 예약 일정</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="/okeedokee/reservation" ><h4>방문 예약 내역</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 실종 • 목격</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="/okeedokee/missingList" ><h4>실종 신고 내역</h4></a>
						<a href="/okeedokee/witnessingList" ><h4>목격 신고 내역</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 기부 • 봉사</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="/okeedokee/donationList" ><h4>기부 현황</h4></a>
						<a href="/okeedokee/volunteerList" ><h4>자원봉사 현황</h4></a>
					</div>
				</div>
				<br />
				<div>
					<div class="mypageTitle">
						<h3>나의 신고 내역</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="/okeedokee/reportList" ><h4>신고 내역</h4></a>
					</div>
				</div>
			</div>
		</nav>
		<section>
			<!-- 개인정보 변경 -->
			<article id="arti1">
				<div class="content" id="cpiContent">
					<h1>${sessionScope.account.name} 님의 정보</h1>
					<div id="cpiModify">
						<input type="hidden" name="size" id="size" value="${sessionScope.account.size}" />
						<form:form modelAttribute="memberVO" action="/okeedokee/member/cpiUpdate" method="POST" id="submitUpdate">
								성명  <form:input path="name" class="chk" value="${sessionScope.account.name}"/><br />

								아이디  <form:input path="id" id="id" class="chk" value="${sessionScope.account.id}" />
								<br />

								비밀번호  <form:password path="pw" class="chk"/><br />

								비밀번호 확인  <form:password path="chkpw" class="chk"/><br />
							
								<input type="hidden" id="addressBefore" value="${sessionScope.account.address}"/>
								<form:input path="address" style="display:none;"/>
								주소 <input type="text" id="postcode" readonly placeholder="우편번호"/>
								<button type="button" id="findPostcode" onclick="execDaumPostcode()">
							         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>우편번호 찾기</span>
							    </button><br />
								<input type="text" id="roadAddress" readonly placeholder="도로명주소"/>
								<input type="text" id="jibunAddress" readonly placeholder="지번주소"/>
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="detailAddress" placeholder="상세주소"/>
								<input type="text" id="extraAddress" readonly placeholder="참고항목"/><br />
		
								이메일  <form:input path="email" value="${sessionScope.account.email}" /><br />

								전화번호  <form:input path="phNum" class="chk" placeholder="'-' 포함하여 입력해주십시오." value="${sessionScope.account.phNum}"/><br />

								반려동물 보유여부  <form:radiobutton path="petOwn" id="pet1" value="Y" class="chkra"/>보유
											  <form:radiobutton path="petOwn" id="pet2" value="N" class="chkra"/>미보유<br />

								선호크기  <form:radiobutton path="size" id="size1" value="b" class="chkra"/>대형
										<form:radiobutton path="size" id="size2" value="m" class="chkra"/>중형
										<form:radiobutton path="size" id="size3" value="s" class="chkra"/>소형
										<form:radiobutton path="size" id="size4" value="e" class="chkra"/>모두<br />
						</form:form>
						
					</div>
					<div id="cpiModifyBtns">
						<button type="button" id="modifyBtn">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>변경하기</span>
					    </button>
					    <button type="button" id="deleteBtn">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>탈퇴하기</span>
					    </button>
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