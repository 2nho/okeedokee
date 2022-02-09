<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/okeedokee/css/notice.css" />
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />
</head>
<body>
	<div class="totalContainer">
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />
		<main>
			<section>
				<article id="arti1">
					<div id="noticeDetailBoard">
						<h1>게시글</h1></h1><br /><br /><br />
						<h2>${NoticeVO.title }</h2>
						<h4>${NoticeVO.name } | ${NoticeVO.date }</h4><br /><br />
						<form:textarea path="content" cols="145" rows="19" id="content" name="content"
						style="resize:none; outline:none; word-break: break-all;">${NoticeVO.content}</form:textarea>
						<input type="hidden" value="${NoticeVO.num}" id="detailNum"/>
						<div id="noticeDetailBoardFiles">
							<h3>첨부 파일 : </h3>
							<c:forEach var="file" items="${filelist}">
								<a href="/okeedokee/downloadFile/${file.serverName}/${file.localName}">${file.localName}</a><br />
							</c:forEach>
						</div>
					</div>
					<div id="noticeButtons">
						<c:choose>
						<c:when test="${sessionScope.account.level == 'U'}"></c:when>
						<c:when test="${sessionScope.account.level == 'A'}">
							<button id="deleteNotice">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>삭제</span>
					    </button>
					    <button id="modifyNotice">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>수정</span>
					    </button>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					    <button id="listMove">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
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