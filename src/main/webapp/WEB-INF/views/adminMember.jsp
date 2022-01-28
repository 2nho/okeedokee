<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMember</title>
<link href="css/layout.css" rel="stylesheet" />
<link href="css/adminBBS.css" rel="stylesheet" />
<script src="https://d3js.org/d3.v7.min.js"></script>
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
					<li><h3>신고관리</h3></li>
					<li><h3>일정관리</h3></li>
				</ul>
			</aside>
			<section>
				<div>
					<h1>회원관리</h1>
					<article class="article3">
						<form action="#">
							<label for="search"><i class="fas fa-search"></i></label>
							 <select name="choice">
								<option value="id">아이디</option>
								<option value="email">이메일</option>
								<option value="level">구분</option>
							</select> <input type="text" />
							<button type="submit" id="search">검색</button>
						</form>
					</article>
					<article class="article1">
						<h3>회원리스트</h3>
					</article>
					<!--  검색  -->
					<article class="article2">
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
										<td>${item.mnum}</td>
										<td>${item.name}</td>
										<td>${item.id}</td>
										<td>${item.pw}</td>
										<td>${item.email}</td>
										<td>${item.level}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</article>
				</div>
			</section>
		</main>
	</div>
</body>
</html>