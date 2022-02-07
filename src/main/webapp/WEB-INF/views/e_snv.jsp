<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/snv.css" />
</head>
<body>

	<div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />


		<main>
			<nav>
				<!-- support and voluntee 줄여서 save -->
				<div id="saveNav">
					<div id="saveTitle">
						<h3>후원 / 자원봉사</h3>
					</div>
					<div id="saveSubTitle">
						<a href="Sav" id="focus"><h4>자원봉사</h4></a> 
						<a href="supporting"><h4>보호소 후원하기</h4></a>
					</div>
				</div>
			</nav>

			<!-- 게시판 -->
			<div id="volunteerNav">
				<div class="in">
					<h1>기부 • 봉사 신청하기</h1>
				</div>
			</div>
			
			<div id="volList">
				<div id="valbtn">
					<c:if test="${sessionScope.account.level eq 'A'}">
					<a href="VolunteeList">
						<button class="ClickBtn">자원봉사 등록하기</button>
					</a>
					</c:if>
				</div>
	
				<table id="col1">
					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 20%;" />
						<col style="width: 25%;" />
					</colgroup>
					<thead>
						<tr bgcolor="#f9f1c0">
							<th>No.</th>
							<th>단체명</th>
							<th>지역</th>
							<th>등록일</th>
							<!-- <th>사진</th> -->
						</tr>
					</thead>
					<tbody>
						<tr>
							<th>1</th>
							<td><a href="MemberSave">구디아카데미</a></td>
							<td>서울</td>
							<td>2022-01-20</td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>2</th>
							<td>구디아카데미</td>
							<td>서울</td>
							<td>2022-01-20</td>
							
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>3</th>
							<td>구디아카데미</td>
							<td>서울</td>
							<td>2022-01-20</td>
							
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>4</th>
							<td>구디아카데미</td>
							<td>서울</td>
							<td>2022-01-20</td>
							
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th>5</th>
							<td>구디아카데미</td>
							<td>서울</td>
							<td>2022-01-20</td>
							
						</tr>
					</tbody>
				</table>
				<div id="pagingBox">
					<!-- 임시 페이징 표시 -->
					<span><< < 1 2 3 4 5 > >></span>
				</div>

				<!-- 검색 -->
				<div class="searchBox">
					<select name="searchType" id="searchType">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> 
					<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요" />
					<button type="button" id="searchBtn">검색</button>
				</div>
			</div>
		</main>



		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	<script>
	<!-- 챗봇 코드 -->
		window.dyc = {
			chatbotUid : "9431422cef3497f7"
		};
	</script>
	<script async src="https://cloudturing.chat/v1.0/chat.js"></script>
	<!-- End CLOUDTURING -->
</body>
</html>