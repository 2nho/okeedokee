<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
<style>
/* 네비 */
main nav {
	flex: 1;
}
main nav #saveNav {
	width: 250px;
	height: 200px;
	background-color: #f9f1c0;
	padding: 10px;
	border-radius: 15px 15px;
}
main nav #saveNav #saveTitle{
	padding-bottom: 5px;
}
main nav #saveNav #saveTitle::after {
	content: "";
	display: block;
	width: 100%;
	border-bottom: 2px solid black;
	padding-bottom: 5px;
}
main nav #saveSubTitle {
	padding: 0 10px;
}
main nav #saveSubTitle a {
	line-height: 40px;
}
main nav #saveSubTitle a:not(:last-child):after {
	content: "";
	display: block;
	width: 100%;
	border-bottom: 1px solid black;
	margin: 5px 0;
}
main nav #saveSubTitle a#focus h4 {
	background-color: RGB(251, 209, 87, .5);
	border-radius: 10px 10px;
	font-weight: 500;
}
main nav #saveSubTitle a h4 {
	padding-left: 5px;
	font-weight: 400;
}
main nav #saveSubTitle a:hover > h4 {
	background-color: RGB(251, 209, 87, .5);
	border-radius: 10px 10px;
	font-weight: 500;
}
/* 게시판 영역 */
main section {
	flex: 9;
	width: 100%;
	height: 100%;
	padding: 0 30px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.in {
	border-bottom: 2px solid black;
	text-align: center;
}
/* 지역명 */
#selectcity {
	text-align: left;	
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
}
#selectcity select {
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
}

#selectcity select option {
	background-color: #fbd157;
}
#valbtn{
	width: 100%;
	text-align: right;
	margin-top: 20px;
	
}
/* 버튼 색상 */
.ClickBtn {
	padding: 6px;
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
}
.ClickBtn:hover {
	background-color: #f9f1c0;
	padding: 5px;
	border: 2px solid #fbd157;
	
}

.btn{
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
}
/* 페이징 버튼*/
#pagingBox {
	width: 100%;
	display: flex;
	justify-content: center;
	padding-top: 20px;
	
}

#SupportNav {
	text-align: center;
	border-bottom: 1px solid #fbd157;
}
.text1 {
	text-align: center;
	margin-top: 180px;
}

.listup {
	text-align: center;
	border-bottom: 1px solid #fbd157;
}

#check_module {
	padding: 6px;
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
	
}



#adminlist{
	margin-left: 30px;
}
#admin3 button {
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
}

footer {
	margin-top: 330px;
}
</style>
</head>
<body>

<div class="container">
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

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
					<a href="supportuse"><h4>후원금 사용내역</h4></a>
				</div>
			</div>
		</nav>
		
		<div id="volunteerNav">
		<div class="in">
		<h1>자원봉사 보호소 리스트 등록하기</h1>
		</div>
		</div>
		
		
		<div id="adminlist">
		<table width="762" border="0">
			<tbody>
				<tr>
				<td height="25">
					등록인
				</td>
				<td>
				<input type="text" name="subject" size="50" maxlength="50" value="관리자" readonly>
				</td>
				</tr>
			</tbody>
		</table>
		<table width="762" border="0">
			<tbody>
				<tr>
				<td height="25">
					제목
				</td>
				<td>
				<input type="text" name="subject" size="50" maxlength="50">
				</td>
				</tr>
			</tbody>
		</table>
		<table width="762" border="0">
			<tbody>
				<tr>
				<td height="25">
					단체 및 시설이름
				</td>
				<td>
				<input type="text" name="subject" size="50" maxlength="50">
				</td>
				</tr>
			</tbody>
		</table>
		<table width="762" border="0">
			<tbody>
				<tr>
				<td height="25">
					단체시설 연락처(보호소)
				</td>
				<td>
				<input type="text" name="subject" size="50" maxlength="50">
				</td>
				</tr>
			</tbody>
		</table>
		<table width="762" border="0">
			<tbody>
				<tr>
				<td height="25">
					보호소 주소
				</td>
				<td>
				<input type="text" name="subject" size="50" maxlength="50">
				</td>
				</tr>
			</tbody>
		</table>
		<table width="762" border="0">
			<tbody>
				<tr>
				<td height="25">
					상세설명
				</td>
				<td>
				<textarea name="detailExp" rows="10" cols="50"></textarea>
				</td>
				</tr>
			</tbody>
		</table>
		<table width="762" border="0">
			<tbody>
				<tr>
				<td height="25">
					활동기간
				</td>
				<td>
				<textarea name="detailExp" rows="10" cols="40"></textarea>
				</td>
				</tr>
			</tbody>
		</table>
		
		<table width="762" border="0">
			<tbody>
				<tr>
				<td height="25">
					사진첨부
				</td>
				<td>
				<a href="#">사진 추가하기</a>
				<a href="#">사진 삭제하기</a>
					<div id="fifl1">
					<input type="file" name="file">
					</div>
				</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div id="admin3" align="center">
			<button>등록하기</button>
		</div>
		</main>
		

<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>
</body>
</html>