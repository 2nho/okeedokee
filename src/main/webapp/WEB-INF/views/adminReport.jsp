<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminReport</title>
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
					<li><h3>회원관리</h3></li>
					<li><h3>게시글관리</h3></li>
					<li><h3 class="red">신고관리</h3></li>
					<li><h3>문의사항 답변</h3></li>
				</ul>
			</aside>
			<section>
				<div>
					<h1>회원관리</h1>
					<article class="article3">
						<form action="#">
							<label for="search"><i class="fas fa-search"></i></label> 
							<select	name="choice">
								<option value="title">제목</option>
								<option value="id">아이디</option>
								<option value="class">신고구분</option>
								<option value="state">처리상태</option>
							</select> <input type="text" /><input type="text" />
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
									<th>제목</th>
									<th>신고내용</th>
									<th>신고자아이디</th>
									<th>신고일</th>
									<th>처리상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<td><input type="checkbox" /></td>
										<td>${item.num}</td>
										<td>${item.title}</td>
										<td>${item.content}</td>
										<td>${item.id}</td>
										<td>${item.date}</td>
										<td>${item.state}</td>
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