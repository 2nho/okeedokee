<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	main {
	display: flex;
	flex-direction: row;
}

main section {
	width: 1200px;
	height: 680px;
	margin: auto;
}

/* article1 */

main section article #noticeBoard {
	height:620px;
	margin: 20px 25px 0 25px;
	padding: 25px;
	border: 25px solid #f9f1c0;
    border-radius: 25px;
    overflow: auto;
}

main section #arti1 #noticeBoard h1:nth-child(1)::after {
	content: "";
	display: block;
	width: 100%;
	border-bottom: 2px solid black;
	margin-top: 10px;
}

main section #arti1 #noticeBoard h2{
	background-color: #f9f1c0;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

main section #arti1 #noticeBoard h4{
	border-bottom: 1px solid black;
	padding:5px;
}

main section #arti1 #noticeBoard p{
	padding:10px;
}

main section #arti1 #noticeButtons{
	text-align: end;
    margin: 5px 60px 0 0px;
}

.button {
  width: 180px;
  height: 60px;
  position: absolute;
}
button {
  width: 60px;
  height: 25px;
  cursor: pointer;
  background: transparent;
  border: 1px solid #FBD157;
  outline: none;
  transition: 1s ease-in-out;
}
svg {
  position: absolute;
  left: 0;
  top: 0;
  fill: none;
  stroke: #fff;
  stroke-dasharray: 150 480;
  stroke-dashoffset: 150;
  transition: 1s ease-in-out;
}
button:hover {
  transition: 1s ease-in-out;
  background: #FBD157;
}
button:hover svg {
  stroke-dashoffset: -480;
}
button span {
  color: black;
  font-size: 15px;
  font-weight: 500;
}

#noticeBoardFiles{
	position: relative;
	top:70px;
	border: 2px solid #FBD157;
    border-radius: 10px;
    padding: 10px;
}

#noticeBoardFiles a:hover{
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="totalContainer">
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />
		
		<main>
			<section>
				<article id="arti1">
					<div id="noticeBoard">
						<h1>게시글</h1></h1><br /><br /><br />
						<h2>${NoticeVO.title }</h2>
						<h4>${NoticeVO.name } | ${NoticeVO.date }</h4><br /><br />
						<p>${NoticeVO.content }</p>
						<div id="noticeBoardFiles">
							<h3>첨부 파일 : </h3>
							<c:forEach var="file" items="${filelist}">
								<a href="${pageContext.request.contextPath }/downloadFile/${file.serverName}/${file.localName}">${file.localName}</a><br />
							</c:forEach>
						</div>
					</div>
					<div id="noticeButtons">
						<button id="delete">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>삭제</span>
					    </button>
					    <button id="modify">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>수정</span>
					    </button>
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
	<script>
		$(function(){
			
			$("#delete").click(function(){
				if(confirm("정말로 삭제하시겠습니까?")){
					location.href = "${pageContext.request.contextPath }/Notice/delete_notice?num=${NoticeVO.num}";	
				}
			});
			$("#modify").click(function(){
				if(confirm("정말로 수정하시겠습니까?")){
					location.href = "${pageContext.request.contextPath }/Notice/modify_notice?num=${NoticeVO.num}";	
				}
			});
			$("#listMove").click(function(){
					location.href = "${pageContext.request.contextPath }/Notice/main";
			});
			
		});
	</script>
</body>
</html>