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
<script type="text/javascript" src="/okeedokee/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="/okeedokee/css/reservation.css" />
<link rel="stylesheet" href="/okeedokee/css/buttonCommon.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	d038fe03dc6e4e500c465865653e5635&libraries=services"></script>
</head>
<body>

<div class="totalContainer">
	<!-- 헤더 불러오기 -->
	<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		<main>
			<section class="reserCreate">
				<article id="arti1">
					<div id="reserBoard">
						<h1>방문 예약 상세</h1>
						<form:form modelAttribute="rvo" action="/okeedokee/reservationModify" type="POST" id="submitModify">
							<form:hidden path="rnum" id="modifyRnum" value="${rvo.rnum}"/>
							<form:hidden path="mnum" id="deleteMnum" value="${rvo.mnum}"/>
							<form:hidden path="careNm" id="shelterName" value="${rvo.careNm}"/>
							<form:hidden path="careAddr" id="shelterDetail" value="${rvo.careAddr}"/>
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
								<li><h3>방문 신청인 : ${sessionScope.account.name}</h3><li>
								<li><h3>방문 신청일 : ${rvo.reserDate }</h3></li>
								<li><h3>${rvo.careNm}</h3></li>
								<li><h3>${rvo.careTel}</h3></li>
								<li><h3>상담사전정보 : </h3></li>
								<li style="position: absolute;"><textarea path="content" cols="70" rows="10" readonly id="content" name="content" 
				     			>${rvo.content}</textarea>
				     			<img src="${rvo.dogImg}" alt="" style="opacity: 0"></li>
				     			<li>
				     				<div class="main-content-map">
				                        <div class="map-api" id="map">
				                            
				                        </div>
				                    </div>
				     			</li>
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
	                                            <li>${rvo.kindCd}</li>
	                                            <li>${rvo.sexCd}</li>
	                                            <li>${rvo.age}</li>
	                                            <li>${rvo.specialMark}</li>
	                                            <li>${rvo.processState}</li> 
	                                            <li>${rvo.noticeSdt}</li>
	                                            <li>${rvo.happenPlace}</li>
	                                        </ul>
	                                    </div>
	                                </div>
	                                <div class="profile-img">
	                                    <img src="${rvo.dogImg}" alt="">
	                                </div>
	                            </div>
	                            <div class="shelter-info">
	                                <div class="shelter-title">
	                                    <h2>보호소 정보</h2>
	                                </div>
	                                <div class="shelter-detail">
	                                    <ul>
	                                    	<li>${rvo.careNm}</li>
	                                        <li>${rvo.careAddr}</li>
	                                        <li>${rvo.careTel}</li>
	                                        <li>${rvo.chargeNm}</li>
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
				    	<button id="modifyReser">
				         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
				           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
				           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
				         </svg>
				         <span>수정</span>
					    </button>
					    <button id="deleteReser">
				         <svg width="60px" height="25px" viewBox="0 0 180 60" class="border">
				           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
				           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
				         </svg>
				         <span>삭제</span>
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