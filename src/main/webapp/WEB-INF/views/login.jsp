<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.6.0.min.js"></script>
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

#arti1 #LoginBoard form ul li a{transition:0.5s;}

#arti1 #LoginBoard form ul li a:hover{
	color: #FBD157;
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
								<a href="#">아이디 찾기</a><br />
								<a href="#">비밀번호 찾기</a>
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
			$("#sign").click(function(){
				location.href = "${pageContext.request.contextPath }/member/signUp";
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