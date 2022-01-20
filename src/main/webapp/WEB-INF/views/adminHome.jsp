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
					<li><h3>게시글관리</h3></li>
					<li><h3>관리자관리</h3></li>
					<li><h3>신고관리</h3></li>
					<li><h3>문의사항 답변</h3></li>
				</ul>
			</aside>
			<section>
				<div class="box">
					<div>
						<h1>${352}</h1>
						<h2>회원수</h2>
					</div>
					<div>
						<h1>${132123}</h1>
						<h2>이번달 후원금액</h2>
					</div>
					<div>
						<h1>${12}</h1>
						<h2>입양건수</h2>
					</div>
					<div>
						<h1>${21}</h1>
						<h2>신규회원</h2>
					</div>
				</div>
				<div class="chart"></div>
			</section>
		</main>
	</div>
	<script type="text/javascript" src="js/chart.js"></script>
</body>
</html>