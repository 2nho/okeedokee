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
<style type="text/css">
/* 메인 */
main {
	display: flex;
	flex-direction: row;
}

main section {
	width: 1200px;
	height: 680px;
	margin: auto;
}

/* article1 */
main section article #noticeBoard {
	margin: 20px 25px 0 25px;
	padding: 25px;
	border: 25px solid #f9f1c0;
    border-radius: 25px;
}

main section #arti1 #noticeBoard h1:nth-child(1)::after {
	content: "";
	display: block;
	width: 100%;
	border-bottom: 2px solid black;
	margin-top: 10px;
}

table thead tr th:nth-of-type(1) {width: 100px;}
table thead tr th:nth-of-type(2) {width: 500px;}
table thead tr th:nth-of-type(3) {width: 350px;}
table thead tr th:nth-of-type(4) {width: 250px;}
table thead tr th:nth-of-type(5) {width: 100px;}
table thead tr:nth-child(1)::after {
	content: "";
	display: block;
	width: 100%;
	border-bottom: 2px solid black;
}

table {
	text-align: center;
	border-bottom: 1px solid black;
	border-collapse: collapse;
}

table tr{
	line-height:35px;
	text-align: center;
	border-bottom: 1px dotted black;
}

#NoticePage{
	margin-top:20px;
	text-align: center;
}

#NoticePage a {
	font-size:1.3rem;
	color:black;
	transition:0.7s;
}

#NoticePage span {
	font-size:1.3rem;
	color:#FBD157;
	transition:0.7s;
}

#NoticePage a:hover {
	transition:0.7s;
	color: #FBD157;
}

#NoticePage input, select{
	border : 1px solid #FBD157;
	outline: none;
}

main section #arti1 #noticeButtons{
	text-align: end;
    margin: 5px 60px 0 0px;
}

.button {
  width: 180px;
  height: 60px;
  position: absolute;
}
button {
  width: 60px;
  height: 25px;
  cursor: pointer;
  background: transparent;
  border: 1px solid #FBD157;
  outline: none;
  transition: 1s ease-in-out;
}
svg {
  position: absolute;
  left: 0;
  top: 0;
  fill: none;
  stroke: #fff;
  stroke-dasharray: 150 480;
  stroke-dashoffset: 150;
  transition: 1s ease-in-out;
}
button:hover {
  transition: 1s ease-in-out;
  background: #FBD157;
}
button:hover svg {
  stroke-dashoffset: -480;
}
button span {
  color: black;
  font-size: 15px;
  font-weight: 500
}
</style>
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
												<td><a href="${pageContext.request.contextPath}/Notice/detail?num=${item.num}">${item.title }</a></td>
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
							
							<div id="NoticePage">
								<c:choose>
									<c:when test="${(minBlock-1) < 1 }">
										<!-- <span>◀</span> -->
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/Notice/main?num=${minBlock-1}${query}">◀◀</a>
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;
								<c:choose>
									<c:when test="${num==1}">
										<!-- <span>◀◀</span> -->
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/Notice/main?num=${num-1}${query}">◀</a>
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
											<a href="${pageContext.request.contextPath}/Notice/main?num=${i}${query}">${i }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:choose>
									<c:when test="${num==total }">
										<!-- <span>▶</span> -->
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/Notice/main?num=${num+1}${query}">▶</a>		
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;
								<c:choose>
									<c:when test="${maxBlock > total }">
									<!-- 	<span>▶▶</span> -->
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/Notice/main?num=${maxBlock+1}${query}">▶▶</a>
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
					<div id="noticeButtons">
					    <button id="createNotice">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>글쓰기</span>
					    </button>
					</div><br /> 
				</article>
			</section>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	
	<script>
		$(function(){
			$("#createNotice").click(function(){
				location.href = "${pageContext.request.contextPath}/Notice/notice_create";
			});
			
			$("#search").click(function(){
				let category = $("#category").val();
				let text = $("#text").val();
				
				if(category == "title"){
					location.href = "${pageContext.request.contextPath}/Notice/main?title="+text;
				}else if(category == "content"){
					location.href = "${pageContext.request.contextPath}/Notice/main?content="+text;
				}else if(category == "both"){
					location.href = "${pageContext.request.contextPath}/Notice/main?content="+text+"&title="+text;
				}
				
				
			});
		});
	</script>
</body>
</html>