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
	<!--ctrl + alt ȭ��ǥ ����   -->
	<div id="container">
		<header></header>
		<main>
			<aside>
				<ul>
					<li><h2>�����ڸ��</h2></li>
					<li><h3 class="red">Home</h3></li>
					<li><h3>ȸ������</h3></li>
					<li><h3>�Խñ۰���</h3></li>
					<li><h3>�����ڰ���</h3></li>
					<li><h3>�Ű����</h3></li>
					<li><h3>���ǻ��� �亯</h3></li>
				</ul>
			</aside>
			<section>
				<div class="box">
					<div>
						<h1>${352}</h1>
						<h2>ȸ����</h2>
					</div>
					<div>
						<h1>${132123}</h1>
						<h2>�̹��� �Ŀ��ݾ�</h2>
					</div>
					<div>
						<h1>${12}</h1>
						<h2>�Ծ�Ǽ�</h2>
					</div>
					<div>
						<h1>${21}</h1>
						<h2>�ű�ȸ��</h2>
					</div>
				</div>
				<div class="chart"></div>
			</section>
		</main>
	</div>
	<script type="text/javascript" src="js/chart.js"></script>
</body>
</html>