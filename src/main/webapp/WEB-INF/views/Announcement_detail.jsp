<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Announcement_detail.css" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	d038fe03dc6e4e500c465865653e5635&libraries=services"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

		 <section>
            <div class="main-container">
                <div class="main-content">
                    <div class="main-content-info">
                        <div class="dog-shelter">
                            <div class="dog-profile">
                                <div class="dog-info">
                                    <div class="dog-title">
                                        <h2>강아지 정보</h2>
                                    </div>
                                    <div class="dog-detail">
                                        <ul>
                                            <li>${dog.dog_kindCd}</li>
                                            <li>${dog.dog_sexCd}</li>
                                            <li>${dog.dog_age}</li>
                                            <li>${dog.dog_specialMark}</li>
                                            <li>${dog.dog_processState}</li> 
                                            <li>${dog.dog_noticeSdt}</li>
                                            <li>${dog.dog_happenPlace}</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="profile-img">
                                    <img src="${dog.dog_img}" alt="">
                                </div>
                            </div>
                            <div class="shelter-info">
                                <div class="shelter-title">
                                    <h2>보호소 정보</h2>
                                </div>
                                <div class="shelter-detail" id="${dog.dog_careAddr}">
                                    <ul>
                                    	<li class="shelter-name" id="${dog.dog_careNm}">${dog.dog_careNm}</li>
                                        <li>${dog.dog_careAddr}</li>
                                        <li>${dog.dog_careTel}</li>
                                        <li>${dog.dog_chargeNm}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="Announcement-btn">
                        	<div class="button" id="road_search">
                                <button class="btn" id="road_search_btn">
                                <svg width="150px" height="40px" viewBox="0 0 150 40" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>길찾기</span>
                                </button>
                            </div>
                        	<div class="button" id="map_enlargement">
                                <button class="btn" id="enlargement_btn">
                                <svg width="150px" height="40px" viewBox="0 0 150 40" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>지도 확대하기</span>
                                </button>
                            </div>
                        	<div class="button" id="map_reduction">
                                <button class="btn" id="reduction_btn">
                                <svg width="150px" height="40px" viewBox="0 0 150 40" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>지도 축소하기</span>
                                </button>
                            </div>
                            <!-- 상담 예약 데이터 form (이제승) -->
                        	<form:form modelAttribute="rvo" action="reservationMove" method="POST" id="reservationSubmit" >
	                           <form:hidden path="kindCd" value="${dog.dog_kindCd}"/>
	                           <form:hidden path="sexCd" value="${dog.dog_sexCd}"/>
	                           <form:hidden path="age" value="${dog.dog_age}"/>
	                           <form:hidden path="specialMark" value="${dog.dog_specialMark}"/>
	                           <form:hidden path="processState" value="${dog.dog_processState}"/>
	                           <form:hidden path="noticeSdt" value="${dog.dog_noticeSdt}"/>
	                           <form:hidden path="happenPlace" value="${dog.dog_happenPlace}"/>
	                           <form:hidden path="dogImg" value="${dog.dog_img}"/>
	                           <form:hidden path="careNm" value="${dog.dog_careNm}"/>
	                           <form:hidden path="careAddr" value="${dog.dog_careAddr}"/>
	                           <form:hidden path="careTel" value="${dog.dog_careTel}"/>
	                           <form:hidden path="chargeNm" value="${dog.dog_chargeNm}"/>
	                         
	                            <div class="button" id="reservation_button">
	                                <button class="btn" id="reservation_btn">
	                                <svg width="150px" height="40px" viewBox="0 0 150 40" class="border">
	                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
	                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
	                                </svg>
	                                <span>방문예약</span>
	                                </button>
	                            </div>
                           	</form:form>
                           	<!-- 상담 예약 데이터 form (이제승) -->
                        </div>
	                    <div class="main-content-map">
	                        <div class="map-api" id="map">
	                            
	                        </div>
	                    </div>
                    </div>
                    <div class="enlargement-map">
                        <div class="map-enlargement" id="map2">
                            
                        </div>
	                </div>
                </div>
            </div>
        </section>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</div>
	
	<script src="../js/Announcement_detail.js" type="text/javascript"></script>
	<script src="../js/common.js" type="text/javascript"></script>
</body>
</html>