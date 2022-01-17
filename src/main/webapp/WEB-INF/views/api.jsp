<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, tr, th, td {
		border-collapse: collapse;
		border: 1px solid black;
	}
	th {
	
		font-size: 30px;
	}
	td {
		font-size: 20px;
	}
	#profilePhoto {
		width: 200px;
		height: 200px;
	}
	#profileCont {
		width: 100%;
		height: 30px;
		display: grid;
		grid-template-columns: repeat(4, 300px);
		gap: 30px;
		justify-content: center;
		align-items: center;
	}
	#profile {
		width: 250px;
		height: 450px;
		padding: 10px;
		background-color: lightsalmon;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}
	#container {
		display : flex;
		flex-direction: column;
	}
	header {
		flex: 3;
		width: 100%;
		height: 100%;
		background-color: lightgreen;
	}
	header nav {
		height: 200px;
	}
	#content {
		flex: 10;
		display: flex;
		flex-direction: row;
		width: 100%;
		height: calc(100vh - 300px);
		overflow: hidden;
	}
	#content aside {
		flex: 2;
		height: 100vh;
		background-color: gray;
		
	}
	#content main {
		flex: 8;
		height: 100vh;
		overflow: scroll;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	#totalCount {
		width: 100%;
		padding-left: 100%;
	}
	#totalCount h3 {
		
	}
</style>
</head>
<body>
	<div id="container">
		<header>
			<nav>
			 <h1>게시판 목록</h1>
			</nav>
		</header>
		<div id="content">
			<aside>
			<h1>검색</h1>
			</aside>
			<main>
				<div id="totalCount"><h3>총 ${result.totalCount}건</h3></div>
				<div id="profileCont">
				 <c:forEach var="dog" items="${result.item}">
				<div id="profile">
					<div class="img">
						<img alt="" src="${dog.popfile}" id="profilePhoto">
					</div>
					<div class="inform">
						<ul>
							<li>${dog.age }</li>
							<li>${dog.sexCd }</li>
							<li>${dog.kindCd}</li>
							<li>${(dog.processState=="보호중")? dog.processState:"종료"}</li>
						</ul>
					</div>
				</div>
				</c:forEach>
			</div>
			</main>
		</div>
	</div>
	<%-- <table>
		<thead>
			<tr>
				<th>이미지</th>
				<th>썸네일</th>
				<th>나이</th>
				<th>성별</th>
				<th>몸무게</th>
				<th>특징</th>
				<th>품종</th>
				<th>상태</th>
				<th>보호소</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>공고번호</th>
				<th>공고일</th>
				<th>발견장소</th>
			</tr>
		</thead>
		 <tbody>
		 <c:forEach var="dog" items="${result.item}">
			<tr>
				<td> <img alt="" src="${dog.popfile}" id="profilePhoto"> </td>
				<td> <img alt="" src="${dog.filename}" id=""> </td>
				<td>${dog.age }</td>
				<td>${dog.sexCd }</td>
				<td>${dog.weight }</td>
				<td>${dog.specialMark }</td>
				<td>${dog.kindCd }</td>
				<td>${dog.processState }</td>
				<td>${dog.careNm }</td>
				<td>${dog.careAddr }</td>
				<td>${dog.officetel }</td>
				<td>${dog.noticeNo }</td>
				<td>${dog.noticeEdt }</td>
				<td>${dog.happenPlace }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table> --%>
	
	<script type="text/javascript">
		document.cookie = "safeCookie1=foo; SameSite=None; Secure"; 
		document.cookie = "safeCookie2=foo"; 
		document.cookie = "crossCookie=bar; SameSite=None; Secure";
	</script>

</body>
</html>