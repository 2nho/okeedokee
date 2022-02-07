<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		<!-- 게시판 -->
		<div id="volunteerNav">
		<div class="in">
		<h1>기부 / 자원봉사 신청하기</h1>
		</div>
		</div>
		
		<div id="valbtn">
		<a href="VolunteeList"><button class="ClickBtn">자원봉사 등록하기</button></a>
		</div>
		<table>
			<tbody>
			<tr>
			<td align="center" valign="bottom">
			<p id="selectcity">
			<select name="area">
			<option value selected>지역명</option>
			<option value>전체지역</option>
			<option value="서울시">서울시</option>
			<option value="인천시">인천시</option>
			<option value="대전시">대전시</option>
			<option value="광주시">광주시</option>
			<option value="대구시">대구시</option>
			<option value="울산시">울산시</option>
			<option value="부산시">부산시</option>
			<option value="경기도">경기도</option>
			<option value="강원도">강원도</option>
			<option value="충청남도">충청남도</option>
			<option value="충청북도">충청북도</option>
			<option value="전라남도">전라남도</option>
			<option value="전라북도">전라북도</option>
			<option value="경상남도">경상남도</option>
			<option value="경상북도">경상북도</option>
			<option value="제주도">제주도</option>
			</select>
			<a href="#">검색</a>
			</p>
			</td>
			</tr>
			</tbody>
		</table>
		


	<table id="col1"> 
	<colgroup>
			<col style="width:10%;" />

			<col style="width:20%;" />

			<col style="width:20%;" />

			<col style="width:10%;" />

			<col style="width:10%;" />
			
			<col style="width:10%;" />
		</colgroup>
		<thead>
			<tr bgcolor="#f9f1c0">
				<th>NO</th>

				<th>단체명</th>

				<th>주소</th>

				<th>등록일</th>

				<th>조회수</th>
				
				<th>사진</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<th>1</th>
			<td>구디아카데미</td>
			<td>서울</td>
			<td>2022-01-20</td>
			<td>123</td>
			<td><a href="MemberSave"><img alt="" src="media/logo/mainLogo.png" style="width: 180px; height: 120px;"></a></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
			<th>2</th>
			<td>구디아카데미</td>
			<td>서울</td>
			<td>2022-01-20</td>
			<td>123</td>
			<td><img alt="" src="media/logo/mainLogo.png" style="width: 180px; height: 120px;"></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
			<th>3</th>
			<td>구디아카데미</td>
			<td>서울</td>
			<td>2022-01-20</td>
			<td>123</td>
			<td><img alt="" src="media/logo/mainLogo.png" style="width: 180px; height: 120px;"></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
			<th>4</th>
			<td>구디아카데미</td>
			<td>서울</td>
			<td>2022-01-20</td>
			<td>123</td>
			<td><img alt="" src="media/logo/mainLogo.png" style="width: 180px; height: 120px;"></td>
			</tr>
		</tbody>
		<tbody>
			<tr>
			<th>5</th>
			<td>구디아카데미</td>
			<td>서울</td>
			<td>2022-01-20</td>
			<td>123</td>
			<td><img alt="" src="media/logo/mainLogo.png" style="width: 180px; height: 120px;"></td>
			</tr>
		</tbody>
	</table>
	<div id="pagingBox">
		<!-- 임시 페이징 표시 -->
	<span><< < 1 2 3 4 5 > >></span>
	</div>
	
	<form>
	<input type='button' class='btn' name='btn' name="search" maxlength=255 value='조회' style="float: right;">
		<input type="text" maxlength=255  Placeholder ="검색어" style="float: right;">
	</form>
	
	</main>



<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>
<script>
<!-- 챗봇 코드 -->
    window.dyc = {
        chatbotUid: "9431422cef3497f7"
    };
</script>
<script async src="https://cloudturing.chat/v1.0/chat.js"></script>
<!-- End CLOUDTURING -->
</body>
</html>