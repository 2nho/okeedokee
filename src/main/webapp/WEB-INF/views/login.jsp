<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  width: 60px;
  height: 25px;
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
				<div id="LoginBoard">
					<h1>로그인</h1>
						<form action="${pageContext.request.contextPath }/member/login" method="post">
							<ul>
								<li><label for="id">아이디 : </label><input type="text" name="id" id="id"/></li>
								<li><label for="password">비밀번호 : </label><input type="password" name="pw" id="pw"/></li>
								<li><button type="submit">
							         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>글쓰기</span>
							    </button></li>
							</ul>
						</form>
						<a href="${pageContext.request.contextPath }/member/signUp">회원가입</a>
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