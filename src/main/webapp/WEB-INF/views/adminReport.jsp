<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><h3 class="red">신고관리</h3></li>
					<li><h3>일정관리</h3></li>
				</ul>
			</aside>
			<section>
				<div>
					<h1>회원관리</h1>
					<article class="article3">
						<form action="#">
							<label for="search"><i class="fas fa-search"></i></label> <select
								name="choice" id="choice">
								<option value="title">제목</option>
								<option value="id">아이디</option>
								<option value="class">신고구분</option>
								<option value="state">처리상태</option>
							</select> <input type="text" id="text" />
							<button id="search">검색</button>
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
								<c:forEach var="item" items="${report}">
									<tr>
										<td><input type="checkbox" /></td>
										<td>${item.num}</td>
										<td>${item.title}</td>
										<td>${item.content}</td>
										<td>${item.id}</td>
										<td>${item.createdate}</td>
										<td>${item.status}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<hr />
	<!-- num -> 1~10 11~20 21~30 => ((num-1)/10)+1 -->
	 <%
		// 현재 페이지
		int num = (Integer)request.getAttribute("num");
		// 전체 데이터 개수
		int count = (Integer)request.getAttribute("count");
		// 전체 페이지 개수
		int total = count/10+((count%10==0)?0:1);
		// 한 블럭에서 가장 작은 번호를 가지는 페이지 번호
		int minBlock = (((num-1)/10)*10)+1;
		// 한 블럭에서 가장 큰 번호를 가지는 페이지 번호
		int maxBlock = (((num-1)/10)+1)*10;
		
		pageContext.setAttribute("total", total);
		pageContext.setAttribute("minBlock", minBlock);
		pageContext.setAttribute("maxBlock", maxBlock);
		
		// 검색 데이터 연동
		String query = "";
		
		String title = (String)request.getAttribute("title");
		String content = (String)request.getAttribute("content");
		
		if(title != null){
			query += "&title="+title;
		}
		
		if(content != null){
			query += "&content="+content;
		}
		
		pageContext.setAttribute("query", query);
	%> 
	<c:choose>
		<c:when test="${(minBlock-1) < 1 }">
			<span>◀◀</span>	
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/bbs/main?num=${minBlock-1}${query}">◀◀</a>
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;
	<c:choose>
		<c:when test="${num==1 }">
			<span>◀</span>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/bbs/main?num=${num-1}${query}">◀</a>
		</c:otherwise>
	</c:choose>
	<c:forEach begin="${minBlock}" end="${(total<maxBlock)?total:maxBlock}" step="1" var="i">
		<c:choose>
			<c:when test="${num == i}">
				<span>${i}</span>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/bbs/main?num=${i}${query}">${i}</a>
			</c:otherwise>
		</c:choose>

	</c:forEach>
	<c:choose>
		<c:when test="${num == total }">
			<span>▶</span>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/bbs/main?num=${num+1}${query}">▶</a>	
		</c:otherwise>
	</c:choose>
	&nbsp;&nbsp;
	<c:choose>
		<c:when test="${maxBlock > total }">
			<span>▶▶</span>	
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/bbs/main?num=${maxBlock+1}${query}">▶▶</a>
		</c:otherwise>
	</c:choose>
					</article>
				</div>
			</section>
		</main>
	</div>
	<script type="text/javascript">
	$(function(){
		$("#search").click(function(){
			let category = $("#choice").val();
			let text = $("#text").val();
			
			if(category == "title"){
				location.href = "${pageContext.request.contextPath}/bbs/main?title="+text;	
			}else if(category == "id"){
				location.href = "${pageContext.request.contextPath}/bbs/main?id="+text;
			}else if(category == "class"){
				location.href = "${pageContext.request.contextPath}/bbs/main?class="+text;	
			}else if(category == "state"){
				location.href = "${pageContext.request.contextPath}/bbs/main?state="+text;
			
		});
	</script>
</body>
</html>