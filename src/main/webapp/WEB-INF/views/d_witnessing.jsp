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
					<a href="missing"><h4>유기견 실종 신고</h4></a>
					<a href="witnessing" id="focus"><h4>유기견 목격 신고</h4></a>
					<a href="selfFlyer"><h4>셀프 전단지</h4></a>
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
						<h1>유기견 목격 신고 게시판</h1>
						<div id="board">
							<div id="writeBox">
								<button id="writeBtn">글쓰기</button>
							</div>
							<table>
								<colgroup>
									<col width="5%">
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
										<th>내용</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>
											<a href="">
												<img src="media/logo/mainLogo.png" alt="" style="width: 180px; height: 120px;"/>
											</a>
										</td>
										<td>
											<h3>1테스트제목</h3>
											<p>견종 : </p>
											<p>성별 :</p>
											<p>특징 :</p>
											<p>실종일 :</p>
											<p>실종 장소 :</p>
											<p>사례금 :</p>
										</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>2</td>
										<td>
											<a href="">
												<img src="media/logo/mainLogo.png" alt="" style="width: 180px; height: 120px;"/>
											</a>
										</td>
										<td>
											<h3>2테스트제목</h3>
											<p>견종 : </p>
											<p>성별 :</p>
											<p>특징 :</p>
											<p>실종일 :</p>
											<p>실종 장소 :</p>
											<p>사례금 :</p>
										</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>3</td>
										<td>
											<a href="">
												<img src="media/logo/mainLogo.png" alt="" style="width: 180px; height: 120px;"/>
											</a>
										</td>
										<td>
											<h3>3테스트제목</h3>
											<p>견종 : </p>
											<p>성별 :</p>
											<p>특징 :</p>
											<p>실종일 :</p>
											<p>실종 장소 :</p>
											<p>사례금 :</p>
										</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>4</td>
										<td>
											<a href="">
												<img src="media/logo/mainLogo.png" alt="" style="width: 180px; height: 120px;"/>
											</a>
										</td>
										<td>
											<h3>4테스트제목</h3>
											<p>견종 : </p>
											<p>성별 :</p>
											<p>특징 :</p>
											<p>실종일 :</p>
											<p>실종 장소 :</p>
											<p>사례금 :</p>
										</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
									<tr>
										<td>5</td>
										<td>
											<a href="">
												<img src="media/logo/mainLogo.png" alt="" style="width: 180px; height: 120px;"/>
											</a>
										</td>
										<td>
											<h3>5테스트제목</h3>
											<p>견종 : </p>
											<p>성별 :</p>
											<p>특징 :</p>
											<p>실종일 :</p>
											<p>실종 장소 :</p>
											<p>사례금 :</p>
										</td>
										<td>테스트</td>
										<td>2022-01-20</td>
										<td>3</td>
									</tr>
								</tbody>
							</table>
							<div id="pagingBox">
								<!-- 임시 페이징 표시 -->
								<span><< < 1 2 3 4 5 > >></span>
							</div>
							<!-- form으로 수정 필요 -->
							<div class="searchBox">
								<select name="searchType" id="searchType">
									<option value="">작성자</option>
									<option value="">제목</option>
									<option value="">내용</option>
									<option value="">제목+내용</option>
								</select>
								<input type="text" id="search" name="search" placeholder="검색어를 입력해주세요"/>
								<button type="button" id="searchBtn">검색</button>
							</div>
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