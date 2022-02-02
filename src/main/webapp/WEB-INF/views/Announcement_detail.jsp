<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
                                            <li>${dog.dog_processState}</li> 
                                            <li>${dog.dog_noticeSdt}</li>
                                            <li>${dog.dog_happenPlace}</li>
                                            <li>${dog.dog_specialMark}</li>
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
                                <div class="shelter-detail" id="dog_${dog.dog_careNm}">
                                    <ul>
                                    	<li>${dog.dog_careNm}</li>
                                        <li>${dog.dog_careAddr}</li>
                                        <li>${dog.dog_careTel}</li>
                                        <li>${dog.dog_chargeNm}</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="Announcement-btn">
                            <div class="button">
                                <button class="btn">
                                <svg width="150px" height="40px" viewBox="0 0 150 40" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>방문예약</span>
                                </button>
                            </div>
                            <div class="button">
                                <button class="btn">
                                <svg width="150px" height="40px" viewBox="0 0 150 40" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>문의하기</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="main-content-map">
                        <div class="map-api" id="map">
                            
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