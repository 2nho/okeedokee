<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
	int total = (Integer) request.getAttribute("total");
	int minBlock = (Integer) request.getAttribute("minBlock");
	int maxBlock = (Integer) request.getAttribute("maxBlock");
	
	String query = "";
	
	String title = (String)request.getAttribute("title");
	String content = (String)request.getAttribute("content");
	
	if(title!=null){
		query += "&title="+title;
	}
	
	if(content != null){
		query += "&content="+content;
	}
	
	pageContext.setAttribute("query", query);
%>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/okeedokee/css/notice.css" />
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />

</head>
<body>
	<div class="totalContainer">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />

		<main>
			<section>
				<article id="arti1">
					<div id="noticeBoard">
						<h1>공지사항</h1>
						<div id="board">
							<table>
								<thead>
									<tr>
										<th>순번</th>
										<th>제목</th>
										<th>작성일</th>
										<th>작성자</th>
										<th>첨부파일</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<c:forEach var="item" items="${list}">
											<tr>
												<td>${item.num }</td>
												<td><a href="/okeedokee/Notice/detail?num=${item.num}">${item.title }</a></td>
												<td>${item.date }</td>
												<td>이제승</td>
												<td>
													<c:if test="${item.hasfile == 'Y'}">
														<p>유</p>
													</c:if>
													<c:if test="${item.hasfile == 'N'}">
														<p>무</p>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tr>
								</tbody>
							</table>
							
							<div id="NoticeBBS">
								<c:choose>
									<c:when test="${(minBlock-1) < 1 }">
										<!-- <span>◀</span> -->
									</c:when>
									<c:otherwise>
										<a href="/okeedokee/Notice/main?num=${minBlock-1}${query}">◀◀</a>
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;
								<c:choose>
									<c:when test="${num==1}">
										<!-- <span>◀◀</span> -->
									</c:when>
									<c:otherwise>
										<a href="/okeedokee/Notice/main?num=${num-1}${query}">◀</a>
									</c:otherwise>
								</c:choose>
								
								<!-- 삼항 연산자를 사용하여 페이징 생성 -->
								<c:forEach begin="${minBlock}" end="${(total<maxBlock)?total:maxBlock }" step="1" var="i" >
									<c:choose>
										<c:when test="${num==i}">
											<!-- jstl을 이용해서 i와 num이 같으면 span처리 -->
											<span>${i}</span>
										</c:when>
										<c:otherwise>
											<!-- 계산된 값으로 페이지 재 호출 -->
											<a href="/okeedokee/Notice/main?num=${i}${query}">${i }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${num==total }">
										<!-- <span>▶</span> -->
									</c:when>
									<c:otherwise>
										<a href="/okeedokee/Notice/main?num=${num+1}${query}">▶</a>		
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;
								<c:choose>
									<c:when test="${maxBlock > total }">
									<!-- 	<span>▶▶</span> -->
									</c:when>
									<c:otherwise>
										<a href="/okeedokee/Notice/main?num=${maxBlock+1}${query}">▶▶</a>
									</c:otherwise>
								</c:choose><br />
								<%
									if((title!=null)&&(content!=null)){%>
										<select name="category" id="category">
											<option value="title">제목</option>
											<option value="content">내용</option>
											<option value="both" selected>제목+내용</option>
										</select>
										<input type="text" id="text" name="text" value="${title}"/>
								<% 	}else if(title!=null){%>
										<select name="category" id="category">
											<option value="title" selected>제목</option>
											<option value="content">내용</option>
											<option value="both">제목+내용</option>
										</select>
										<input type="text" id="text" name="text" value="${title}"/>
								<% 	}else if(content!=null){%>
										<select name="category" id="category">
											<option value="title" >제목</option>
											<option value="content" selected>내용</option>
											<option value="both">제목+내용</option>
										</select>
										<input type="text" id="text" name="text" value="${content}"/>
								<% 	}else{%>
								
								<select name="category" id="category">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="both">제목+내용</option>
								</select>
								<input type="text" id="text" name="text" />
								<%} %>
								
								<button id="search">검색</button>
							</div>
						</div>
					</div>
					<c:choose>
						<c:when test="${sessionScope.account.level == 'U'}"></c:when>
						<c:when test="${sessionScope.account.level == 'A'}">
							<div id="noticeButtons">
							    <button id="createNoticeMove">
							         <svg width="90px" height="30px" viewBox="0 0 90 30" class="border">
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
							           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
							         </svg>
							         <span>글쓰기</span>
							    </button>
							</div><br /> 
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>

	<script type="text/javascript" src="/okeedokee/js/notice.js"></script>
</body>
</html>