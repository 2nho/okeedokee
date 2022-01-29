<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminHome</title>
<link href="css/layout.css" rel="stylesheet" />
<link href="css/adminHome.css" rel="stylesheet" />
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
						<h1>${money}</h1>
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
				<svg viewBox="0 0 1200 300"></svg></div>
			</section>
		</main>
	</div>
	<script type="text/javascript" src="js/chart.js"></script>
</body>
</html>