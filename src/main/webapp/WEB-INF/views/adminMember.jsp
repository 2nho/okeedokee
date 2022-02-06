<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMember</title>
<link href="../css/layout.css" rel="stylesheet" />
<link href="../css/adminBBS.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/70977de212.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="container">
		<header> </header>
		<main>
			<aside>
				<ul>
					<li><h2>관리자모드</h2></li>
					<li><h3>Home</h3></li>
					<li><h3 class="red">회원관리</h3></li>
					<li><h3>신고관리</h3></li>
					<li><h3>일정관리</h3></li>
				</ul>
			</aside>
			<section>
				<div>
					<h1>회원관리</h1>
					<article class="article3">
						<label for="search"><i class="fas fa-search"></i></label> <select
							name="choice" id="choice">
							<option value="id">아이디</option>
							<option value="email">이메일</option>
							<option value="level">구분</option>
						</select> <input type="text" id="text" />
						<button id="search">검색</button>
					</article>
					<article class="article1">
						<h3>회원리스트</h3>
					</article>
					<!--  검색  -->
					<article class="article2">
						<table>
							<thead>
								<tr>
									<th><input type="checkbox" class="checkboxAll" /></th>
									<th>번호</th>
									<th>이름</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>이메일</th>
									<th>구분</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list}">
									<tr>
										<td><input type="checkbox" class="checkbox" /></td>
										<td name="mnum">${item.mnum}</td>
										<td>${item.name}</td>
										<td>${item.id}</td>
										<td>${item.pw}</td>
										<td>${item.email}</td>
										<td><select name="choiceLevel" id="choiceLevel">
												<option value="${item.level}" id="mainLevel">${item.level}</option>
												<c:set var="level" value="${item.level}" scope="page" />
												<%-- <c:if test="${level eq 'member'}"><option value="dbp1">admin</option></c:if>
										<c:if test="${level eq 'admin'}"><option value="dbp1">member</option></c:if> --%>
												<c:choose>
													<c:when test="${level eq 'U'}">
														<option value="A">A</option>
													</c:when>
													<c:otherwise>
														<option value="U">U</option>
													</c:otherwise>
												</c:choose>
										</select></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:choose>
							<c:when test="${(minBlock-1) < 1 }">
								<span>◀◀</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/adminMember?num=${minBlock-1}${query}">◀◀</a>
							</c:otherwise>
						</c:choose>
						&nbsp;&nbsp;
						<c:choose>
							<c:when test="${num==1 }">
								<span>◀</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/adminMember?num=${num-1}${query}">◀</a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${minBlock}"
							end="${(total<maxBlock)?total:maxBlock}" step="1" var="i">
							<c:choose>
								<c:when test="${num == i}">
									<span>${i}</span>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/admin/adminMember?num=${i}${query}">${i}</a>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<c:choose>
							<c:when test="${num == total }">
								<span>▶</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/adminMember?num=${num+1}${query}">▶</a>
							</c:otherwise>
						</c:choose>
						&nbsp;&nbsp;
						<c:choose>
							<c:when test="${maxBlock > total }">
								<span>▶▶</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/admin/adminMember?num=${maxBlock+1}${query}">▶▶</a>
							</c:otherwise>
						</c:choose>
						<button id="modify">수정</button>
					</article>
				</div>
			</section>
		</main>
	</div>
	<script type="text/javascript">
		      	$(function() {		
					$("#search").click(function(){
						let category = $("#choice").val();
						let text = $("#text").val();
						
						if(category == "id"){
				      		location.href = "${pageContext.request.contextPath}/admin/adminMember?id="+text;
				      	}else if(category == "email"){
				      		location.href = "${pageContext.request.contextPath}/admin/adminMember?email="+text;
				      	}else if(category == "level"){
				      		location.href = "${pageContext.request.contextPath}/admin/adminMember?level="+text;
						}
					});
				});
		      	$(function() {
		    		// 전체 선택 클릭시 전부 선택 / 해제
		    		$(".checkboxAll").change(function() {
		    			$(".checkbox").prop("checked", $(this).prop("checked"));
		    		});

		    		// 4개 전부 체크시 전체 선택 체크 / 하나라도 체크 해제시 전체 선택 해제
		    		$(".checkbox").click(function() {
		    			if ($(".checkbox:checked").length == $(".checkbox").length) {
		    				$(".checkboxAll").prop("checked", true);
		    			} else {
		    				$(".checkboxAll").prop("checked", false);
		    			}
		    		});
		    	});
		      	
		    	$(function() {		
		    		$("[name=choiceLevel]").change(function(){
						let level = $(this).val();
				 		console.log(level);			 		
				 		
				 		var index = $("[name=choiceLevel]").index(this);
				 		console.log(index);
				 		// 위랑 같음 제이쿼리 홈페이지 index() 참고 
				 		/* var index1 = $(this).index("[name=choiceLevel]");
				 		console.log(index1); */
				 		
				 		var mnum = $("[name=mnum]").eq(index).text();
				 		console.log(mnum);
				 		//FormData 랑 변수명 동일시 금지! 에러남
				 		var formData = new FormData();
				 		
				 		formData.set('mnum',mnum);
				 		formData.append('level',level);
				 		
				 		// 값이빔..
				 		console.log(JSON.stringify(formData));
				 		

				 		
							$.ajax({
								//요청을 보낼 주소
								url : '${pageContext.request.contextPath}/admin/updateLevel',
								// 전송할 데이터 level값하고 mnum값을 보내야함
								data: JSON.stringify(formData),
								// 데이터 전송 방법
								type: "PATCH",
								// 전송할 데이터 타입
						        contentType: "application/json; charset=utf-8",
						        // 서버에서 받아올 데이터 형태
						        dataType: "json",
						        //성공시 결과값 매개변수로 받아서
						        success: function(result) {						        
						        	console.log("성공");
						        },
						        error: function(err){
						        	console.log(err);	
						        }
						        }); 
					});
		});
	
	</script>
</body>
</html>