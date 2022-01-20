<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/d_missingNwitnessing.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<div class="container">
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
	
	<main>
		<nav>
			<!-- missing and witnessing 줄여서 mnw -->
			<div id="mnwNav">
				<div id="mnwTitle">
					<h3>유기견 실종 / 목격 신고</h3>
				</div>
				<div id="mnwSubTitle">
					<a href=""><h4>유기견 실종 신고</h4></a>
					<a href=""><h4>유기견 목격 신고</h4></a>
					<a href=""><h4>셀프 전단지</h4></a>
				</div>
			</div>
		</nav>
		<section>
			<article id="arti1">
			<!-- 게시글 내용 슬라이드 -->
				<div id="slideBox">
					<div class="slides" id="slide1">
						<div class="slideContent">
							<img src="media/logo/mainLogo.png" alt="" />
							<div class="text">
								<h3>1제목제목제목제목제목제목제목제목제목</h3>
							</div>
						</div>
					</div>
					<div class="slides" id="slide2">
						<div class="slideContent">
							<img src="media/logo/mainLogo.png" alt="" />
							<div class="text">
								<h3>2제목제목제목제목제목제목제목제목제목</h3>
							</div>
						</div>
					</div>
					<div class="slides" id="slide3">
						<div class="slideContent">
							<img src="media/logo/mainLogo.png" alt="" />
							<div class="text">
								<h3>3제목제목제목제목제목제목제목제목제목</h3>
							</div>
						</div>
					</div>
					<div class="slides" id="slide4">
						<div class="slideContent">
							<img src="media/logo/mainLogo.png" alt="" />
							<div class="text">
								<h3>4제목제목제목제목제목제목제목제목제목</h3>
							</div>
						</div>
					</div>
					<div class="slides" id="slide5">
						<div class="slideContent">
							<img src="media/logo/mainLogo.png" alt="" />
							<div class="text">
								<h3>5제목제목제목제목제목제목제목제목제목</h3>
							</div>
						</div>
					</div>
				</div>
			</article>
			<div class="buttonBox">
				<button id="prev">◀◀</button>
				<button id="next">▶▶</button>
			</div>
			<!-- 게시판 -->
			<article id="arti2">
					<div id="missingBoard">
						<h1>유기견 실종 신고 게시판</h1>
						<div id="board">
							<table>
								<colgroup>
									<col width="1%">
									<col width="40%">
									<col width="25%">
									<col width="8%">
									<col width="10%">
									<col width="auto">
								</colgroup>
								<thead>
									<tr>
										<th>No.</th>
										<th>사진</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>2</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>3</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>4</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>5</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>6</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>7</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>8</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>9</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>10</td>
										<td><img src="media/logo/mainLogo.png" alt="" style="width: 50px; height: 50px;"/></td>
										<td>1테스트제목</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</article>
			
		</section>
	</main>
	
	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>

<script type="text/javascript" src="js/d_missingNwitnessing.js"></script>
</body>
</html>