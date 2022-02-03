<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminHome</title>
<link href="../css/layout.css" rel="stylesheet" />
<link href="../css/adminHome.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://d3js.org/d3.v7.min.js"></script>
</head>

<body>
	<!--ctrl + alt 화살표 복사   -->
	<div id="container">
		<header></header>
		<main>
			<aside>
				<ul>
					<li><h2>관리자모드</h2></li>
					<li><h3 class="red">Home</h3></li>
					<li><h3>회원관리</h3></li>
					<li><h3>신고관리</h3></li>
					<li><h3>일정관리</h3></li>
				</ul>
			</aside>
			<section>
				<div class="box">
					<div>
						<h1>${total}</h1>
						<h2>회원수</h2>
					</div>
					<div>
						<%-- <h1>${(money == null)? "0":money}</h1>  삼항도 가능하나 간단하게 연산자로 기본값 0가능--%>
						<h1>${0+money}</h1>
						<h2>이번달 후원금액</h2>
					</div>
					<div>
						<!-- 게시글 count 더하기 -->
						<h1>${missing+witness}</h1>
						<h2>새실종/목격글</h2>
					</div>
					<div>
						<h1>${nMember}</h1>
						<h2>신규회원</h2>
					</div>
				</div>
				<div class="chart">
					<!-- 가변을 위해 크기지정X -->
					<svg viewBox="0 0 1200 300"></svg>
					${map}
				</div>
			</section>
		</main>
	</div>
	<script type="text/javascript">
	$.ajax({
		//요청을 보낼 주소
		url : '${pageContext.request.contextPath}/admin/ajax',
		// 넘길 데이터
		data:  {},
		// 데이터 전송 방법
		type: "post",
		// 전송할 데이터 타입
        contentType: "application/json; charset=utf-8",
        // 서버에서 받아올 데이터 형태
        dataType: "text",
        //성공시 결과값 매개변수로 받아서
        success: function(result) {
           console.log(result);
           //d3를 여기다 구현 // makeGraph(result); 
           }})
</script>
	<!-- <script type="text/javascript" src="../js/chart.js">
	</script> -->
</body>
</html>