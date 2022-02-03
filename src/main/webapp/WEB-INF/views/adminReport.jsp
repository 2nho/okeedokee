<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminReport</title>
<link href="../css/layout.css" rel="stylesheet" />
<link href="../css/adminBBS.css" rel="stylesheet" />
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
						<label for="search"><i class="fas fa-search"></i></label> <select
							name="category" id="category">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="both">제목+내용</option>
							<option value="status">처리상태</option>
						</select> <input type="text" id="text" />
						<button id="search">검색</button>
					</article>
					<article class="article1">
						<h3>회원리스트</h3>
					</article>
					<!--  검색  -->
					<article class="article2">
						<table>
							<thead>
								<tr>
									<th><input type="checkbox" class="checkboxAll" /></th>
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
										<td><input type="checkbox" class="checkbox" /></td>
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
						<c:choose>
							<c:when test="${(minBlock-1) < 1 }">
								<span>◀◀</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/adminReport?num=${minBlock-1}${query}">◀◀</a>
							</c:otherwise>
						</c:choose>
						&nbsp;&nbsp;
						<c:choose>
							<c:when test="${num==1 }">
								<span>◀</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/adminReport?num=${num-1}${query}">◀</a>
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
										href="${pageContext.request.contextPath}/admin/adminReport?num=${i}${query}">${i}</a>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<c:choose>
							<c:when test="${num == total }">
								<span>▶</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/adminReport?num=${num+1}${query}">▶</a>
							</c:otherwise>
						</c:choose>
						&nbsp;&nbsp;
						<c:choose>
							<c:when test="${maxBlock > total }">
								<span>▶▶</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/adminReport?num=${maxBlock+1}${query}">▶▶</a>
							</c:otherwise>
						</c:choose>
					</article>
				</div>
			</section>
		</main>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#search")
					.click(
							function() {
								let category = $("#category").val();
								let text = $("#text").val();

								if (category == "title") {
									location.href = "${pageContext.request.contextPath}/admin/adminReport?title="
											+ text;
								} else if (category == "content") {
									location.href = "${pageContext.request.contextPath}/admin/adminReport?content="
											+ text;
								} else if (category == "both") {
									location.href = "${pageContext.request.contextPath}/admin/adminReport?title="
											+ text + "&content=" + text;
								} else if (category == "status") {
									location.href = "${pageContext.request.contextPath}/admin/adminReport?status="
											+ text;
								}
							});
		});
		$(function() {
			// 전체 선택 클릭시 전부 선택 / 해제
			$(".checkboxAll").change(function() {
				$(".checkbox").prop("checked", $(this).prop("checked"));
			});

			// 4개 전부 체크시 전체 선택 체크 / 하나라도 체크 해제시 전체 선택 해제
			$(".checkbox").click(function() {
				if ($(".checkbox:checked").length == $(".checkbox").length) {
					$(".checkboxAll").prop("checked", true);
				} else {
					$(".checkboxAll").prop("checked", false);
				}
			});
		});
	</script>
</body>
</html>