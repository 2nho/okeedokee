<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/okeedokee/css/notice.css" />
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />
</head>
<body>
	<div class="totalContainer">
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />
		<main>
			<section>
				<article id="arti1">
					<div id="noticeModifyBoard">
						<h1>공지사항 수정</h1><br /><br />
						<form:form modelAttribute="NoticeVO" action="/okeedokee/Notice/modify_result" type="POST" id="noticeModifyResultSubmit">
							<ul>
								<li><label for="title"></label>
								<form:input path="title"
										style="width:100%; border:none; outline:none; background-color:#f9f1c0;
										border-top:1px solid black; border-bottom:1px solid black;
										font-size:1.5rem; padding:5px;" /></li>
								<h4>${NoticeVO.name }| ${NoticeVO.date }</h4>
								<br />
								<li><form:textarea path="content" cols="145" rows="19" /></li>
								<form:hidden path="num" />
								<form:hidden path="filelist" />
							</ul>
						</form:form>
						<label for="upload">파일 추가 :</label><input type="file" id="upload" name="upload" multiple><br>
						<c:forEach var="file" items="${filelist}">
							<div class="file-item">
								<a href="/okeedokee/downloadFile/${file.localName}/${file.serverName}">${file.localName}</a>
								<button data-num="${file.num}" class="deleteFile">삭제</button>
							</div>
						</c:forEach>

						<button class="alldelete" data-bnum="${NoticeVO.num}">전체삭제</button>
						
					</div>
					<div id="noticeButtons">
						<button id="deleteNotice">
							<svg width="60px" height="25px" viewBox="0 0 180 60"
								class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1"
									class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1"
									class="hl-line" />
					         </svg>
							<span>삭제</span>
						</button>
						<button id="modifyNoticeResult">
							<svg width="60px" height="25px" viewBox="0 0 180 60"
								class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1"
									class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1"
									class="hl-line" />
					         </svg>
							<span>수정</span>
						</button>
						<button id="listMove">
							<svg width="60px" height="25px" viewBox="0 0 180 60"
								class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1"
									class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1"
									class="hl-line" />
					         </svg>
							<span>목록</span>
						</button>
					</div>
				</article>
			</section>
		</main>
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	<script type="text/javascript" src="/okeedokee/js/notice.js"></script>
</body>
</html>