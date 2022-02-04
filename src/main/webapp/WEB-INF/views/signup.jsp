<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/validation.js?dd"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/joinCheck.js"></script>

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
    height: 650px;
    background-color: #f9f1c0;
    margin: 20px;
    border-radius: 17px;
    padding: 15px;
}
main nav #LoginNav #LoginTitle::after {
	content: "";
	display: block;
	width: 90%;
	border-bottom: 2px solid black;
}

main nav #LoginNav div a{
	display: block;
	transition:0.5s;
	padding:6px;
	margin-top:10px;
}

main nav #LoginNav div a::after {
	content: "";
    display: block;
    width: 0px;
    border-bottom: 2px solid black;
    margin-top: 1px;
    transition: .5s ease;
}

main nav #LoginNav div a:hover::after {
	width:15px;
}

.thisPosition{
	background-color: rgba(233,199,199,0.8);
    border-radius: 15px;
}

/* main */
#arti1{
	height: 680px;
	margin: 20px 0 0 0;
}

#arti1 #SignupBoard{
	width: 50%;
	margin: 0 auto;
    border: 25px solid #f9f1c0;
    border-radius: 25px;
    padding: 25px 25px 0 25px;;
    min-width: 460px;
}

#arti1 #SignupBoard h1:nth-child(1)::after{
	content: "";
	display: block;
	width: 100%;
	border-bottom: 2px solid black;
	margin-top: 10px;
}

#arti1 #SignupBoard form {
	margin: 20px 0 0 0;
}

#arti1 #SignupBoard form input{
	border : 1px solid #FBD157;
	outline: none;
}

#arti1 #SignupBoard form #signupBtn{
	position: relative;
    left: 42%;
    bottom: -65px;
}

#arti1 #SignupBoard form .valid,.invalid{
	position:relative;
	font-size: 0.8rem;
	font-weight: bold;
	margin-bottom: 9px;
	left:10px;
}

.valid { color: green; } 
.invalid { color: red; } }


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
  font-weight: 500;
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
				<c:choose>
					<c:when test="${sessionScope.account.mnum != null}">
					
					</c:when>
					
					<c:otherwise>
						<div id="LoginTitle">
							<h4>로그인/회원가입</h4>
						</div>
						<div id="LoginSubTitle">
							<a href="loginPage">로그인</a>
							<a href="signupAuth">회원가입</a>
							<a href="findId">ID 찾기</a>
							<a href="findPw">비밀번호 찾기</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</nav>
		<section>
			<article id="arti1">
				<div id="SignupBoard">
					<h1>회원가입</h1>
						<form:form modelAttribute="memberVO" action="${pageContext.request.contextPath }/member/signupResult" method="POST">
							<div>
								성명  <form:input path="name" class="chk"/><br />
								<div class="invalid">성명을 입력하세요.</div>
							</div>
							
							<div>
								아이디  <form:input path="id" class="chk"/>
								<button type="button" id="chkid" style="height: 22px; ">중복확인</button>
								<br />
								<div class="invalid">아이디를 입력하세요.(영문 소문자, 숫자만 입력 가능)</div>
							</div>
							
							<div>
								비밀번호  <form:password path="pw" class="chk"/><br />
								<div class="invalid">비밀번호를 입력하세요.(영문 대/소문자, 숫자를 모두 포함)</div>
							</div>
							
							<div>
								비밀번호 확인  <form:password path="chkpw" class="chk"/><br />
								<div class="invalid">비밀번호를 동일하게 입력하세요.</div>
							</div>
							
							
							<!-- 주소 api 추가 예정 -->
							주소  <form:input path="address" /><br />
							<div class="valid">주소를 입력하세요.</div>
							
							<!-- 이메일 인증 추가 예정 -->
							이메일  <form:input path="email" />
									<button type="button" id="auth" style="width:40px; height: 22px; line-height: 1;">
								         <svg width="60px" height="20px" viewBox="0 0 180 60" class="border">
								           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
								           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
								         </svg>
								         <span>인증</span>
									</button><br />
									<div class="valid">이메일을 입력하세요.</div>
							
							<div>
								전화번호  <form:input path="phNum" class="chk" placeholder="'-' 포함하여 입력해주십시오."/><br />
								<div class="valid">전화번호를 입력하세요.</div>
							</div>
							
							<div>
								반려동물 보유여부  <form:radiobutton path="petOwn" value="Y" class="chkra"/>보유
												<form:radiobutton path="petOwn" value="N" class="chkra"/>미보유<br />
								<div class="invalid">보유여부를 선택하세요.</div>
							</div>
							
							<div>
								선호크기  <form:radiobutton path="size" value="b" class="chkra"/>대형
										<form:radiobutton path="size" value="m" class="chkra"/>중형
										<form:radiobutton path="size" value="s" class="chkra"/>소형
										<form:radiobutton path="size" value="e" class="chkra"/>모두<br />
								<div class="invalid">선호크기를를 선택하세요.</div>
							</div>
							
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

<script type="text/javascript">
	$(function(){
		
		$(document).ready(function(){
			let path = window.location.pathname;
			let sepa = path.split('/');
			let di = $("#LoginSubTitle").children('a');

			for (var value of di) { 
				if( window.location.pathname === value.pathname){
					value.classList.add("thisPosition");
				}
			}
		});
		
		


		$("#sign").click(function(){
			location.href = "${pageContext.request.contextPath }/member/signUp";
		});
		
		$("#auth").click(function(){
			if(confirm("메일을 보내시겠습니까?")){
				const email = $("#email");
				$.ajax({
					url : '${pageContext.request.contextPath}/auth',
					data : email,
					type : "post",
					datatype: "text",
					success : function(result){
						console.log(result);

					}
				});
			}
		});
	});
</script>
</body>
</html>