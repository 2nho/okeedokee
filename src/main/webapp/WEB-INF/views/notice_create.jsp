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
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />
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

#noticeBoard::-webkit-scrollbar{width: 15px;}
#noticeBoard::-webkit-scrollbar-track {background-color:white;}
#noticeBoard::-webkit-scrollbar-thumb {background-color:#FBD157;border-radius: 10px;}
#noticeBoard::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
width:16px;height:16px;background:#f1ef79;} 

</style>
</head>
<body>
	<div class="totalContainer">
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />
		
		<main>
			<section>
				<article id="arti1">
					<div id="noticeBoard">
						<h1>공지사항 작성</h1><br /><br />
						<form:form modelAttribute="NoticeVO" action="${pageContext.request.contextPath}/Notice/create_result">
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
	<script>
		$(function(){
			$("#listMove").click(function(){
				location.href = "${pageContext.request.contextPath}/Notice/main";
			});
			
			$("#createNotice").click(function(){
				if(confirm("작성하시겠습니까?")){
					const formData = new FormData();
					const $upload = $("#upload");
					let files = $upload[0].files;
					for (let i = 0; i < files.length; i++) {
						formData.append("uploadFile", files[i])
					}
					
					$.ajax({
						url : '${pageContext.request.contextPath}/Notice/uploadfile',
						processData : false,
						contentType : false,
						data : formData,
						type : "post",
						datatype: "json",
						success : function(result){
							console.log(JSON.stringify(result));
							$("#filelist").val(JSON.stringify(result));
							$("#NoticeVO").submit();
						}
					});
				}
				
			});
		});
	</script>
</body>
</html>