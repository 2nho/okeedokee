<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMember</title>
<style type="text/css">
table, th, tr, td {
	border-collapse: collapse;
	border: 1px solid black;
}

table {
	width: 99%;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
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
				<h1>자유게시판</h1>
				<table>
					<thead>
						<tr>
							<th>순번</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.num}</td>
								<td><a
									href="${pageContext.request.contextPath}/bbs/detail?num=${item.num}">${item.title}</a></td>
								<td>${item.ownername}</td>
								<td>${item.createdate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<hr />
				<!-- num -> 1~10 11~20 21~30 => ((num-1)/10)+1 -->
				<%
				// 현재 페이지
				int num = (Integer) request.getAttribute("num");
				// 전체 데이터 개수
				int count = (Integer) request.getAttribute("count");
				// 전체 페이지 개수
				int total = count / 10 + ((count % 10 == 0) ? 0 : 1);
				// 한 블럭에서 가장 작은 번호를 가지는 페이지 번호
				int minBlock = (((num - 1) / 10) * 10) + 1;
				// 한 블럭에서 가장 큰 번호를 가지는 페이지 번호
				int maxBlock = (((num - 1) / 10) + 1) * 10;

				pageContext.setAttribute("total", total);
				pageContext.setAttribute("minBlock", minBlock);
				pageContext.setAttribute("maxBlock", maxBlock);

				// 검색 데이터 연동
				String query = "";

				String title = (String) request.getAttribute("title");
				String content = (String) request.getAttribute("content");

				if (title != null) {
					query += "&title=" + title;
				}

				if (content != null) {
					query += "&content=" + content;
				}

				pageContext.setAttribute("query", query);
				%>
				<c:choose>
					<c:when test="${(minBlock-1) < 1 }">
						<span>◀◀</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.request.contextPath}/bbs/main?num=${minBlock-1}${query}">◀◀</a>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;
				<c:choose>
					<c:when test="${num==1 }">
						<span>◀</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.request.contextPath}/bbs/main?num=${num-1}${query}">◀</a>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="${minBlock}"
					end="${(total<maxBlock)?total:maxBlock}" step="1" var="i">
					<c:choose>
						<c:when test="${num == i}">
							<span>${i}</span>
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath}/bbs/main?num=${i}${query}">${i}</a>
						</c:otherwise>
					</c:choose>

				</c:forEach>
				<c:choose>
					<c:when test="${num == total }">
						<span>▶</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.request.contextPath}/bbs/main?num=${num+1}${query}">▶</a>
					</c:otherwise>
				</c:choose>
				&nbsp;&nbsp;
				<c:choose>
					<c:when test="${maxBlock > total }">
						<span>▶▶</span>
					</c:when>
					<c:otherwise>
						<a
							href="${pageContext.request.contextPath}/bbs/main?num=${maxBlock+1}${query}">▶▶</a>
					</c:otherwise>
				</c:choose>
				<hr />
				<%
				if ((title != null) && (content != null)) {
				%>
				<select name="category" id="category">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="both" selected>제목+내용</option>
				</select> <input type="text" id="text" name="text" value="${title}" />
				<%
				} else if (title != null) {
				%>
				<select name="category" id="category">
					<option value="title" selected>제목</option>
					<option value="content">내용</option>
					<option value="both">제목+내용</option>
				</select> <input type="text" id="text" name="text" value="${title}" />

				<%
				} else if (content != null) {
				%>
				<select name="category" id="category">
					<option value="title">제목</option>
					<option value="content" selected>내용</option>
					<option value="both">제목+내용</option>
				</select> <input type="text" id="text" name="text" value="${content}" />
				<%
				} else {
				%>
				<select name="category" id="category">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="both">제목+내용</option>
				</select> <input type="text" id="text" name="text" />
				<%
				}
				%>
				<button id="search">검색</button>
				<hr />
				<button id="create-btn">추가</button>
			</section>
		</main>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#create-btn")
					.click(
							function() {
								location.href = "${pageContext.request.contextPath}/bbs/create";
							});

			$("#search")
					.click(
							function() {
								let category = $("#category").val();
								let text = $("#text").val();

								if (category == "title") {
									location.href = "${pageContext.request.contextPath}/bbs/main?title="
											+ text;
								} else if (category == "content") {
									location.href = "${pageContext.request.contextPath}/bbs/main?content="
											+ text;
								} else if (category == "both") {
									location.href = "${pageContext.request.contextPath}/bbs/main?title="
											+ text + "&content=" + text;
								}

							});
		});
	</script>
</body>
</html>