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
  width: 130px;
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
							<a href="signUp">회원가입</a>
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
					<h1>회원가입</h1><br />
					<form action="${pageContext.request.contextPath}/mail/findPwAuth" method="post" id="submit">

                            이메일 <input type="email" name="e_mail" placeholder="이메일주소를 입력하세요."><br />
                           	     <input type="hidden" name="hidden" id="hidden"/>
 						<button type="button" id="submitBtn">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>인증 메일 보내기</span>
					    </button><br />
 					</form>
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
				$($(this)).attr('disabled',true);
				let $name = $('[name=name]'); 
				let $id = $('[name=id]'); 
				let $email = $('[name=e_mail]'); 
				$.ajax({ 
					type: 'post', 
					url: '${pageContext.request.contextPath}/member/findPwResult', 
					data: {name: $name.val(),email: $email.val(),id: $id.val()}, 
					success: function(data) { 
						$("#hidden").val(data.pw);
						alert("이메일로 비밀번호를 발송했습니다. 확인해주십시오.");
						$("#submit").submit();
						
					}, 
					error: function() { 
						alert("정보를 다시 확인해주십시오."); 
						$("#submitBtn").attr('disabled',false);
					}
				});
			});
		});
		
		
	</script>
</div>
</body>
</html>