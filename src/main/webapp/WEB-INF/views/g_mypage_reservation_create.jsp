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
<link rel="stylesheet" href="/okeedokee/css/reservation.css" />
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />

</head>
<body>

<div class="totalContainer">
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		<main>
			<section>
				<article id="arti1">
					<div id="reserBoard">
						<h1>방문 예약 신청</h1>
						<form:form modelAttribute="rvo" action="${pageContext.request.contextPath}/reservationCreate" type="POST" id="submitCreate">
							<form:hidden path="mnum" value="${sessionScope.account.mnum}"/>
							<form:hidden path="kindCd" value="${vo.kindCd}"/>
							<form:hidden path="sexCd" value="${vo.sexCd}"/>
							<form:hidden path="age" value="${vo.age}"/>
							<form:hidden path="specialMark" value="${vo.specialMark}"/>
							<form:hidden path="processState" value="${vo.processState}"/>
							<form:hidden path="noticeSdt" value="${vo.noticeSdt}"/>
							<form:hidden path="happenPlace" value="${vo.happenPlace}"/>
							<form:hidden path="dogImg" value="${vo.dogImg}"/>
							<form:hidden path="careNm" value="${vo.careNm}"/>
							<form:hidden path="careAddr" value="${vo.careAddr}"/>
							<form:hidden path="careTel" value="${vo.careTel}"/>
							<form:hidden path="chargeNm" value="${vo.chargeNm}"/>
							<ul>
								<li>
									<button type="button" id="openInfo">
								         <svg width="150px" height="40px" viewBox="0 0 150 40" class="border">
								           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
								           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
								         </svg>
								         <span>강아지정보 펼치기</span>
								    </button>
							    </li>	
								<li><h3>방문 신청인 : <input type="text" name="reserName" id="reserName" value="${sessionScope.account.name}"/></h3><li>
								<li><h3>방문 신청일 : <input type="date" id="reserDate" name="reserDate" style="width:175px;"/></h3></li>
								<li><h3>${vo.careNm}</h3></li>
								<li><h3>${vo.careTel}</h3></li>
								<li><h3>상담사전정보 : </h3></li>
								<form:textarea path="content" cols="70" rows="10" 
								style="resize:none; outline:none; position: relative; bottom: 100px;}"
								placeHolder="상담 사전 정보를 입력해주세요."/>
								<img src="${vo.dogImg}" alt="">
							</ul>
						</form:form>
						<div class="main-content-info">
							<div class="dog-shelter">
	                            <div class="dog-profile">
	                                <div class="dog-info">
	                                    <div class="dog-title">
	                                        <h2>강아지 정보</h2>
	                                    </div>
	                                    <div class="dog-detail">
	                                        <ul>
	                                            <li>${vo.kindCd}</li>
	                                            <li>${vo.sexCd}</li>
	                                            <li>${vo.age}</li>
	                                            <li>${vo.specialMark}</li>
	                                            <li>${vo.processState}</li> 
	                                            <li>${vo.noticeSdt}</li>
	                                            <li>${vo.happenPlace}</li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <div class="profile-img">
	                                    <img src="${vo.dogImg}" alt="">
	                                </div>
	                            </div>
	                            <div class="shelter-info">
	                                <div class="shelter-title">
	                                    <h2>보호소 정보</h2>
	                                </div>
	                                <div class="shelter-detail" >
	                                    <ul>
	                                    	<li>${vo.careNm}</li>
	                                        <li>${vo.careAddr}</li>
	                                        <li>${vo.careTel}</li>
	                                        <li>${vo.chargeNm}</li>
	                                        <li>
	                                        	<button type="button" id="closeInfo">
											         <svg width="150px" height="40px" viewBox="0 0 150 40" class="border">
											           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
											           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
											         </svg>
											         <span>강아지정보 접기</span>
											    </button>
	                                        </li>
	                                    </ul>
	                                </div>
	                            </div>
	                        </div>
						</div>
					</div>
					<div id="reserButtons">
					    <button id="listMove">
					         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
					           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
					         </svg>
					         <span>목록</span>
					    </button>
				    	<button id="createReser">
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

	<!-- 푸터 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</div>
<script type="text/javascript" src="/okeedokee/js/reservation.js"></script>
</body>
</html>