<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/okeedokee/media/logo/favicon.ico">
<link rel="stylesheet" href="/okeedokee/css/loginpage.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">



/* main */
main{
	margin-bottom:300px;
}

#arti1 {
	max-width:900px;
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
    margin-bottom:6px;
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

#sign{width:100px;}


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
			<div class="mypageNav">
				<div>
					<div class="mypageTitle">
						<h3>로그인/회원가입</h3>
					</div>
					<div class="mypageSubTitle">
						<a href="loginPage" class="focus"><h4>로그인</h4></a>
						<a href="signUp" ><h4>회원가입</h4></a>
						<a href="findId" ><h4>아이디 찾기</h4></a>
						<a href="findPw" ><h4>비밀번호 찾기</h4></a>
					</div>
					<br /><br /><br />
				</div>
				<br />
				
			</div>
		</nav>
		
		<section>
			<article id="arti1">
				<div id="LoginBoard">
					<h1>로그인</h1><br />
					<form action="${pageContext.request.contextPath }/member/login" method="post" id="submit">
						<ul>
							<li><label for="id">아이디</label><input type="text" name="id" id="id" style="margin-left: 18px;"/></li>
							<li><label for="password">비밀번호 </label><input type="password" name="pw" id="pw"/></li><br />
							<li>
								<button type="button" id="submitBtn">
							         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>로그인</span>
							    </button>
							    <button type="button" id="sign">
							         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>회원가입</span>
								</button><br /><br />
							</li>
							<li>
								<a href="findId">아이디 찾기</a>
								<a href="findPw">비밀번호 찾기</a>
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
			
			$("#sign").click(function(){
				location.href = "${pageContext.request.contextPath }/member/signupAuth";
			}); 
			
			$("#submitBtn").click(function(){
				
				if($("#id").val() == ""){
					alert("아이디를 입력하세요.");
				}else if($("#pw").val() == ""){
					alert("비밀번호를 입력하세요.");
				}else{ $("#submit").submit();}
				
			});
		});
		
		
	</script>
</div>
</body>
</html>