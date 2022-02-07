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
						<a href="Save" id="focus"><h4>자원봉사</h4></a> 
						<a href="donation"><h4>후원하기</h4></a>
					</div>
				</div>
			</nav>

			<div id="volunteerNav">
				<div class="in">
					<h1>자원봉사 리스트 등록하기</h1>
				</div>
			</div>


			<div id="adminlist">
				<table>
					<colgroup>
						<col style="width: 40%;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<!-- 관리자 -->
							<td>관리자</td>
							<td>
								<input type="text" name="id" size="50" maxlength="50" value="${sessionScope.account.id}" readonly>
							</td>
						</tr>
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="title" size="50" maxlength="50">
							</td>
						</tr>
						<tr>
							<td>보호소 이름</td>
							<td>
								<input type="text" name="name" id="name" size="50" maxlength="50">
							</td>
						</tr>
						<tr>
							<td>보호소 연락처</td>
							<td>
								<input type="text" name="phNum" id="phNum" size="50" maxlength="11">
							</td>
						</tr>
						<tr>
							<td>보호소 주소</td>
							<td>
								<input type="text" name="addr" id="addr" size="50" maxlength="50">
							</td>
						</tr>
						<tr>
							<td>상세설명</td>
							<td>
								<textarea name="detailText" id="detailText" rows="10" cols="50"></textarea>
							</td>
						</tr>
						<tr>
							<td>활동기간</td>
							<td>
								<input type="date" id="dateFrom" name="dateFrom">
								<span> ~ </span>
								<input type="date" id="dateTo" name="dateTo">
							</td>
						</tr>
						<tr>
							<td>사진첨부</td>
							<td>
								<a href="#">사진 추가하기</a> 
								<a href="#">사진 삭제하기</a>
								<div id="fifl1">
									<input type="file" name="file">
								</div></td>
						</tr>
					</tbody>
				</table>
				<div id="admin3" align="center">
					<button>등록하기</button>
				</div>
			</div>
			
		</main>


		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
</body>
</html>