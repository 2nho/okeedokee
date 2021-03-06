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
		<header>
			<div class="head">
				<p>OKEEDOKEE - 관리자페이지</p>
			</div>
		</header>
		<main>
			<aside>
				<ul>
					<li><h1>관리자모드</h1></li>
					<li><h2>
							<a href="adminHome">Home</a>
						</h2></li>
					<li><h2 class="red">회원관리</h2></li>
					<li><h2>
							<a href="adminReport">신고관리</a>
						</h2></li>
					<li><h2>
							<a href="adminCalendar">일정관리</a>
						</h2></li>
				</ul>
				<br /> <span><a
					href="${pageContext.request.contextPath}/main">메인으로</a></span>
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
										<c:if test="${level eq 'admin'}"><option value="dbp1">member</option></c:if>   위의 방법과 주석처리된 두가지 방법이 가능하다--%> 
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
						<div class="page">
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
							<button class="submit">선택삭제</button>
						</div>
					</article>
				</div>
			</section>
		</main>
	</div>
	<script type="text/javascript">
	// 검색 
	   $(function () {
	        $("#search").click(function () {
	          let category = $("#choice").val();
	          let text = $("#text").val();
	          
	          if (category == "id") {
	            location.href =
	              "${pageContext.request.contextPath}/admin/adminMember?id=" + text;
	          } else if (category == "email") {
	            location.href =
	              "${pageContext.request.contextPath}/admin/adminMember?email=" +
	              text;
	          } else if (category == "level") {
	            location.href =
	              "${pageContext.request.contextPath}/admin/adminMember?level=" +
	              text;
	          }
	        });
	      });
	// 체크박스 
	      $(function () {
	        // 전체 선택 클릭시 전부 선택 / 해제
	        $(".checkboxAll").change(function () {
	          $(".checkbox").prop("checked", $(this).prop("checked"));
	        });
	        // 4개 전부 체크시 전체 선택 체크 / 하나라도 체크 해제시 전체 선택 해제
	        $(".checkbox").click(function () {      	
	           if ($(".checkbox:checked").length == $(".checkbox").length) {
	            $(".checkboxAll").prop("checked", true);
	          } else {
	            $(".checkboxAll").prop("checked", false);
	          } 
	        });
	        // 체크박스 클릭후 전송시 이벤트
	        $(function(){
	        	$(".submit").click(function(){
	        		 $(".checkbox:checked").each(function(index,value){	   
	        			 // index 값은 0부터 시작하기 때문에 value값을 이용해 idx를 새로구하기
	        			var idx = $(value).index(".checkbox");
	        			var mnum = $("[name=mnum]").eq(idx).text();
	        			var data = {mnum};
	        			 $.ajax({
		        			 //요청을 보낼 주소
		    	            url: "${pageContext.request.contextPath}/admin/updateMember",
		    	            // 보낼 데이터 (mnum값 보내기)
		    	            data: JSON.stringify(data),
		    	            // 데이터 전송 방법
		    	            type: "PATCH",
		    	            // 전송할 데이터 타입
		    	            contentType: "application/json; charset=utf-8",
		    	            // 서버에서 받아올 데이터 형태
		    	            dataType: "text",
		    	            //성공시 결과값 매개변수로 받아서
		    	            success: function (result) {
								location.href="${pageContext.request.contextPath}/admin/adminMember"
		    	            } 
		        		})  	
	        		 });
	        	})
	        })
	      });
	// 레벨 변경 
	      $(function () {
	        $("[name=choiceLevel]").change(function () {
	          let level = $(this).val();
	          var index = $("[name=choiceLevel]").index(this);
	         위랑 같음 제이쿼리 홈페이지 index() 참고
	       /*  var index1 = $(this).index("[name=choiceLevel]");
					 		console.log(index1); */
	          var mnum = $("[name=mnum]").eq(index).text();
	          console.log(mnum);
	          // 구조분해할당
	          var data1 = { mnum, level };
	          $.ajax({
	            url: "${pageContext.request.contextPath}/admin/updateLevel",
	            // 전송할 데이터 level값하고 mnum값을 보내야함
	            data: JSON.stringify(data1),
	            type: "PATCH",
	            contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            success: function (result) {
	              if (result.level == "A") {
	                alert("일반회원에서 관리자로 변경");
	              } else {
	                alert("관리자에서 일반회원으로 변경");
	              }
	            },
	            error: function (err) {
	              console.log(err);
	            },
	          });
	        });
	      });
	</script>
</body>
</html>