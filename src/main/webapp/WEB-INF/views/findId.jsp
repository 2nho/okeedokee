<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
#arti1 {
	height: 680px;
	margin: 20px 0 0 0;
}

#arti1 #LoginBoard h1:nth-child(1)::after{
	content: "";
	display: block;
	width: 100%;
	border-bottom: 2px solid black;
	margin-top: 10px;
}

#arti1 #LoginBoard{
	width: 50%;
	margin: 0 auto;
    border: 25px solid #f9f1c0;
    border-radius: 25px;
    padding: 25px;
    line-height: 2;
}

#arti1 #LoginBoard input{
	border : 1px solid #FBD157;
	outline: none;
}

#arti1 #LoginBoard form ul li:nth-of-type(4){
	border: 2px solid #FBD157;
    padding: 5px;
    border-radius: 13px;
}

#arti1 #LoginBoard form ul li a{
	padding: 5px;
	display: block;
}

#arti1 #LoginBoard form ul li a::after{
	content: "";
    display: block;
    width: 0px;
    border-bottom: 2px solid black;
    margin-top: 1px;
    transition: .5s ease;
}

#arti1 #LoginBoard form ul li a:hover::after{
	width: 15px;
}

#arti1 #LoginBoard form ul li a{transition:0.5s;}


.button {
  width: 180px;
  height: 60px;
  position: absolute;
}
button {
  width: 90px;
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
				<div id="LoginBoard">
					<h1>아이디찾기</h1><br />
					<form action="${pageContext.request.contextPath }/member/findIdResult" method="post" id="submit">
						<ul>
							<li><label for="name">성명</label><input type="text" name="name" id="name" style="margin-left: 21px;"/></li>
							<li><label for="email">이메일 </label><input type="email" name="email" id="email"/></li>
							<li>
								<button type="button" id="submitBtn">
							         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>아이디 찾기</span>
							    </button>
							</li>
						</ul>
					</form>
						
					<div id="board"></div>
				</div>
			</article>
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
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
			
			
			$("#submitBtn").click(function(){
				let $name = $('[name=name]'); 
				let $email = $('[name=email]'); 
				$.ajax({ 
					type: 'post', 
					url: '${pageContext.request.contextPath}/member/findIdResult', 
					data: {name: $name.val(),email: $email.val()}, 
					success: function(data) { 
						alert("아이디는 "+data.id+"입니다");
						location.href = "${pageContext.request.contextPath}/member/loginPage";
					}, 
					error: function() { 
						alert("존재하지 않는 아이디입니다."); 
					}
				});
				
				
				
			});
		});
		
		
	</script>
</div>
</body>
</html>