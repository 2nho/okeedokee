<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h1>자원봉사 신청하기</h1>
				</div>
			</div>
			
			<div class="clearfix">
				<img alt="" src="media/logo/mainLogo.png">
			</div>
			
			<table width="685" border="0" style="margin-left: auto; margin-right: auto;">

				<tr>
					<td width="152">제목</td>
					<td width="220">구디아카데미 쉼터 자원 봉사자모집</td>
				</tr>
				<tr>
					<td width="116">단체 및 시설 이름</td>
					<td width="202">서울시 유기견보호회</td>
				</tr>
				<tr>
					<td width="116">주소</td>
					<td width="202">서울시 땡땡시 떙떙구</td>
				</tr>
				<tr>
					<td width="116">시설 연락처</td>
					<td width="202">010-0000-0000</td>
				</tr>
				<tr>
					<td width="116">모집 기간</td>
					<td width="202">상시 모집</td>
				</tr>
				<tr>
					<td width="116">봉사 활동기간</td>
					<td width="202">2022-01-14 ~ 2022-02-09</td>
				</tr>
			</table>

			

			<table width="685" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td>상세 내용</td>
					<td width="571" valign="top" style="padding-top: 7px;">안녕하세요<br>
						구디아카데미 쉼터에 자원봉사하실 분을 모집합니다.<br> 장소는 서울시에 있습니다.<br> 하는일은
						000입니다.<br></td>
				</tr>
			</table>
			<h2 style="text-align: center;">신청자 리스트</h2>
			<table style="margin-left: auto; margin-right: auto;">
				<colgroup>
					<col width="100px" />
					<col width="200px" />
					<col width="100px" />
					<col width="200px" />
				</colgroup>
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>신청일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>예시 이름</td>
						<td>예시 전화번호</td>
						<td>예시 이메일</td>
						<td>예시 신청일<a href="#" role="button" class="btn btn-info">삭제</a></td>
					</tr>
					
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>신청일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>예시 이름</td>
						<td>예시 전화번호</td>
						<td>예시 이메일</td>
						<td>예시 신청일</td>
					</tr>
				</tbody>
				
			</table>
			<a href="#" role="button" class="btn out-info2">수정하기</a>
			<button type="submit" class="btn submit" style="text-align: right;">신청하기</button>
		</main>



		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>


</body>
</html>