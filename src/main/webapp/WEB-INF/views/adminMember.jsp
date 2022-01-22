<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMember</title>
<link href="css/layout.css" rel="stylesheet" />
<link href="css/adminMember.css" rel="stylesheet" />
<script src="https://d3js.org/d3.v7.min.js"></script>
<style type="text/css">
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/70977de212.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="container">
		<header> </header>
		<main>
			<aside>
				<ul>
					<li><h2>관리자모드</h2></li>
					<li><h3>Home</h3></li>
					<li><h3 class="red">회원관리</h3></li>
					<li><h3>게시글관리</h3></li>
					<li><h3>신고관리</h3></li>
					<li><h3>문의사항 답변</h3></li>
				</ul>
			</aside>
			<section>
				<h1>회원관리</h1>
				<article class="article1">
					<h3>회원리스트</h3>
				</article>
				<!--  검색  -->
				<article class="article2">
					<form action="">
						<label for="search"><i class="fas fa-search"></i></label><input
							type="text" />
						<button type="submit">검색</button>
					</form>
				</article>
				<article class="article3">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" /></th>
								<th>번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>비밀번호</th>
								<th>이메일</th>
								<th>구분</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td><input type="checkbox" /></td>
									<td>${item.num}</td>
									<td>${item.name}</td>
									<td>${item.id}</td>
									<td>${item.password}</td>
									<td>${item.email}</td>
									<td>${item.level}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</article>
			</section>
		</main>
	</div>
</body>
</html>