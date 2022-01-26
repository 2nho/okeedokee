<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/* 메인 */
main {
	display: flex;
	flex-direction: row;
}

main nav {
	flex: 3;
}

main section {
	flex: 9;
	width: 100%;
	height: 100%;
}

/* 네비게이션 */
main nav #LoginNav {
	width: 90%;
	height: 350px;
	background-color: #f9f1c0;
}
main nav #LoginNav #LoginTitle::after {
	content: "";
	display: block;
	width: 90%;
	border-bottom: 2px solid black;
}

.button {
  width: 180px;
  height: 60px;
  position: absolute;
}
button {
  width: 85px;
  height: 30px;
  cursor: pointer;
  background: transparent;
  border: 1px solid #FBD157;
  outline: none;
  transition: 1s ease-in-out;
}
svg {
  position: absolute;
  left: 0;
  top: 0;
  fill: none;
  stroke: #fff;
  stroke-dasharray: 150 480;
  stroke-dashoffset: 150;
  transition: 1s ease-in-out;
}
button:hover {
  transition: 1s ease-in-out;
  background: #FBD157;
}
button:hover svg {
  stroke-dashoffset: -480;
}
button span {
  color: black;
  font-size: 15px;
  font-weight: 100;
}
</style>
</head>
<body>

<div class="totalContainer">
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	
	<main>
		<nav>
			<!-- missing and witnessing 줄여서 mnw -->
			<div id="LoginNav">
				<div id="LoginTitle">
					<h4>로그인/회원가입</h4>
				</div>
				<div id="LoginSubTitle">
					<h5></h5>
					<h5>로그인</h5>
					<h5>회원가입</h5>
					<h5>ID/비밀번호 찾기</h5>
				</div>
				
			</div>
		</nav>
		<section>
			<article id="arti1">
				<div id="SignupBoard">
					<h1>회원가입</h1>
						<form:form modelAttribute="memberVO" action="${pageContext.request.contextPath }/member/signupResult" method="POST">
							아이디 : <form:input path="id"/><br />
							비밀번호 : <form:password path="pw"/><br />
							성명 : <form:input path="name"/><br />
							
							<!-- 주소 api 추가 예정 -->
							주소 : <form:input path="address"/><br />
							
							<!-- 이메일 인증 추가 예정 -->
							이메일 : <form:input path="email"/><br />
							
							<!-- 뒤 8자리만 입력하도록 변경 예정 -->
							전화번호 : <form:input path="phNum"/><br />
							반려동물 보유여부 : <form:radiobutton path="petOwn" value="Y"/>보유
											<form:radiobutton path="petOwn" value="N"/>미보유<br />
							
							선호크기 : <form:checkbox path="size" value="대형"/>대형
									<form:checkbox path="size" value="증형"/>중형
									<form:checkbox path="size" value="소형"/>소형<br />
							
							<form:button id="signupBtn">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>가입하기</span>
					    </form:button>
						</form:form>
					
					<div id="board"></div>
				</div>
			</article>
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>
</body>
</html>