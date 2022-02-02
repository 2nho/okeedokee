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
                
                <div class="main-advertisement" id="main_advertisement">
                    <div class="slidershow fade">
                            <img src="media/main/advertisement_img1.jpg" alt="">
                    </div>
                    <div class="slidershow fade">
                            <img src="media/main/advertisement_img2.jpg" alt="">
                    </div>
                    <div class="slidershow fade">
                            <img src="media/main/advertisement_img3.jpg" alt="">
                    </div>
                    <div class="slidershow fade">
                            <img src="media/main/advertisement_img4.jpg" alt="">
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
                    <div class="main-link-img1">
                    	<a href="">                    	
                        <img src="media/main/main-link1.jpg" alt="">
                    	</a>
                    </div>
                    <div class="main-link-img2">
                        <a href="">
	                        <img src="media/main/main-link2.jpg" alt="">
                        </a>
                    </div>
                    <div class="main-link-img3">
						<a href="">
	                        <img src="media/main/main-link3.jpg" alt="">
						</a>	
                    </div>
                </div>
                <div class="nearby-dog">
                    <div class="nearby-dog-title">
                        <h1>내 근처 아이 알아보기</h1>
                    </div>
                    <div class="nearby-dog-content">
                    	<c:forEach var="dog" items="${result.item}" begin="1" end="20" varStatus="status">                   		
                    			<div class="nearby-dog-div" id="nearby_${dog.desertionNo}">                    			
		                        <div class="nearby-dog-img">
		                            <img alt="" src="${dog.popfile}" id="dog_img_${dog.desertionNo}" class="profilePhoto">
		                        </div> 
		                        <div class="hover-div" id="${dog.desertionNo}">
		                        	<ul>
		                        		<li id="dog_age_${dog.desertionNo}">나이 : ${dog.age}</li>
										<li id="dog_sexCd_${dog.desertionNo}">성별 : ${dog.sexCd}</li>
										<li id="dog_kindCd_${dog.desertionNo}">견종 : ${dog.kindCd}</li>
										<li id="dog_processState_${dog.desertionNo}">${(dog.processState=="보호중")? dog.processState:"종료"}</li>
										<li class="dog-hidden" id="dog_orgNm_${dog.desertionNo}">지역 : ${dog.orgNm}</li>
										<li class="dog-hidden" id="dog_noticeSdt_${dog.desertionNo}">등록일 : ${dog.noticeSdt}</li>
										<li class="dog-hidden" id="dog_careNm_${dog.desertionNo}">보호소 : ${dog.careNm}</li>
										<li class="dog-hidden" id="dog_happenPlace_${dog.desertionNo}">구조지역 : ${dog.happenPlace}</li>
										<li class="dog-hidden" id="dog_specialMark_${dog.desertionNo}">특징 : ${dog.specialMark}</li>
										<li class="dog-hidden" id="dog_careTel_${dog.desertionNo}">보호소 번호 : ${dog.careTel}</li>
										<li class="dog-hidden" id="dog_chargeNm_${dog.desertionNo}">담당자 : ${dog.chargeNm}</li>
										<li class="dog-hidden" id="dog_careAddr_${dog.desertionNo}">보호소 주소 : ${dog.careAddr}</li>
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
	
	<script type="text/javascript">
		var dogData = new Array();
	    var json = {};

	    <c:forEach items="${result.item}" var="item">
	    	json = {};
	        json.desertionNo = "${item.desertionNo}";
	        json.kindCd = "${item.kindCd}";
	        json.orgNm = "${item.orgNm}";
	        json.age = "${item.age}";
	        json.sexCd = "${item.sexCd}";
	        json.happenDt = "${item.happenDt}";
	        json.noticeSdt = "${item.noticeSdt}";
	        json.careNm = "${item.careNm}";
	        json.happenPlace = "${item.happenPlace}";
	        json.popfile = "${item.popfile}";
	        json.processState = "${item.processState}";
	        json.specialMark = "${item.specialMark}";
	        json.careTel = "${item.careTel}";
	        json.chargeNm = "${item.chargeNm}";
	        json.careAddr = "${item.careAddr}";
	        dogData.push(json);
	    </c:forEach>
	</script>
	
	<script src="js/main/main.js" type="text/javascript"></script>
</body>
</html>
