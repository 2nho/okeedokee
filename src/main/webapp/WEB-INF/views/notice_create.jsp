<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
					<div id="noticeCreateBoard">
						<h1>공지사항 작성</h1><br /><br />
						<form:form modelAttribute="NoticeVO" action="/okeedokee/Notice/create_result">
							<ul>
								<li><label for="title"></label><form:input path="title" 
								style="width:100%; border:none; outline:none; background-color:#f9f1c0;
										border-top:1px solid black; border-bottom:1px solid black;
										font-size:1.5rem; padding:5px;" placeholder="제목"/></li>
								<h4>작성자 : ${sessionScope.account.name}</h4><br />
								<li><form:textarea path="content" cols="145" rows="19" 
													style="resize:none; outline:none;"/></li>
								<form:hidden path="num"/>
								<form:hidden path="filelist"/>
							</ul>
						</form:form>
						
						<br>
						<label for="upload">파일 추가 :</label><input type="file" id="upload" name="upload" multiple><br>
					</div>
					
					<div id="noticeButtons">
					    <button id="listMove">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>목록</span>
					    </button>
				    	<button id="createNotice">
				         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
				           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
				           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
				         </svg>
				         <span>작성 완료</span>
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