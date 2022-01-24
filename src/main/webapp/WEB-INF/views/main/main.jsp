<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main/main.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<section>
            <div class="main-content">
                <!-- 슬라이드 광고 -->
                <!-- 이미지 추가만 하면 완료 -->
                <div class="main-advertisement" id="main_advertisement">
                    <div class="slidershow fade">
                            <img src="media/advertisement/main-advertisement1.jpg" alt="">
                    </div>
                    <div class="slidershow fade">
                            <img src="" alt="">
                    </div>
                    <div class="slidershow fade">
                            <img src="" alt="">
                    </div>
                    <div class="slidershow fade">
                            <img src="" alt="">
                    </div>
                </div>
                <div class="slider-dot">
                    <span class="dot"></span> 
                    <span class="dot"></span> 
                    <span class="dot"></span> 
                    <span class="dot"></span> 
                </div>
                <!-- notice support  -->
                 <div class="main-link">
                    <div>
                        <img src="" alt="">
                    </div>
                    <div>
                        <img src="" alt="">
                    </div>
                    <div>
                        <img src="" alt="">
                    </div>
                </div>
                <div class="nearby-dog">
                    <div class="nearby-dog-title">
                        <h1>내 근처 아이 알아보기</h1>
                    </div>
                    <div class="nearby-dog-content">
                    	<c:forEach var="dog" items="${result.item}" begin="1" end="20" varStatus="status">                   		
                    			<div class="nearby-dog-div" id="nearby_${dog.desertionNo}">                    			
		                        <div class="nearby-dog-img${status.count} nearby-dog-img">
		                            <img alt="" src="${dog.popfile}" id="img_${dog.desertionNo}" class="profilePhoto${status.count} profilePhoto">
		                        </div> 
		                        <div class="hover-div" id="${dog.desertionNo}">
		                        	<ul>
		                        		<li>나이 : ${dog.age}</li>
										<li>성별 : ${dog.sexCd}</li>
										<li>견종 : ${dog.kindCd}</li>
										<li>${(dog.processState=="보호중")? dog.processState:"종료"}</li>
		                        	</ul>
		                        </div>
                    			</div>       					   
                    	</c:forEach>
                    </div>
                </div>
                <div class="find-dog">
                    <div class="find-dog-title">
                        <h1>가족을 찾고 있어요</h1>
                    </div>
                    <div class="find-dog-content">
                        <p>안녕하세요</p>
                    </div>
                </div>
            </div>
        </section>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</div>
	
	<script src="js/main/main.js" type="text/javascript"></script>
</body>
</html>
