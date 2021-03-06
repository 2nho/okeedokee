<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main/main.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<section>
            <div class="main-content">
                
                <div class="main-advertisement" id="main_advertisement">
                    <div class="slidershow fade">
                    	<a href="/okeedokee/Save">
	                   		<img src="media/main/advertisement_img1.jpg" alt="">
                    	</a>
                    </div>
                    <div class="slidershow fade">
                    	<a href="/okeedokee/Announcement">
                         	<img src="media/main/advertisement_img2.jpg" alt="">
                    	</a>
                    </div>
                    <div class="slidershow fade">
                    	<a href="/okeedokee/Notice/main">
	                        <img src="media/main/advertisement_img3.jpg" alt="">
                    	</a>
                    </div>
                    <div class="slidershow fade">
                    	<a href="/okeedokee/Introduction">
	                   		<img src="media/main/advertisement_img4.jpg" alt="">
                    	</a>
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
                    	<a href="/okeedokee/Notice/main">                    	
                        <img src="media/main/main-link1.jpg" alt="">
                    	</a>
                    </div>
                    <div class="main-link-img2">
                        <a href="/okeedokee/Save">
	                        <img src="media/main/main-link2.jpg" alt="">
                        </a>
                    </div>
                    <div class="main-link-img3">
						<a href="/okeedokee/Announcement">
	                        <img src="media/main/main-link3.jpg" alt="">
						</a>	
                    </div>
                </div>
                <div class="nearby-dog">
                    <div class="nearby-dog-title">
                        <h1>?????? ????????????</h1>
                    </div>
                    <div class="nearby-dog-content">
                    	<c:forEach var="dog" items="${result.item}" begin="0" end="19" varStatus="status">
	                    	<c:if test="${fn:length(result.item) ne 0}">                   		
                    			<div class="nearby-dog-div" id="nearby_${dog.desertionNo}">                    			
			                        <div class="nearby-dog-img">
			                            <img alt="" src="${dog.popfile}" id="dog_img_${dog.desertionNo}" class="profilePhoto">
			                        </div> 
			                        <div class="hover-div" id="${dog.desertionNo}">
			                        	<ul>
			                        		<li id="dog_age_${dog.desertionNo}">?????? : ${dog.age}</li>
											<li id="dog_sexCd_${dog.desertionNo}">?????? : ${dog.sexCd}</li>
											<li id="dog_kindCd_${dog.desertionNo}">?????? : ${dog.kindCd}</li>
											<li id="dog_processState_${dog.desertionNo}">${(dog.processState=="?????????")? dog.processState:"??????"}</li>
											<li class="dog-hidden" id="dog_orgNm_${dog.desertionNo}">?????? : ${dog.orgNm}</li>
											<li class="dog-hidden" id="dog_noticeSdt_${dog.desertionNo}">????????? : ${dog.noticeSdt}</li>
											<li class="dog-hidden" id="dog_careNm_${dog.desertionNo}">????????? : ${dog.careNm}</li>
											<li class="dog-hidden" id="dog_happenPlace_${dog.desertionNo}">???????????? : ${dog.happenPlace}</li>
											<li class="dog-hidden" id="dog_specialMark_${dog.desertionNo}">?????? : ${dog.specialMark}</li>
											<li class="dog-hidden" id="dog_careTel_${dog.desertionNo}">????????? ?????? : ${dog.careTel}</li>
											<li class="dog-hidden" id="dog_chargeNm_${dog.desertionNo}">????????? : ${dog.chargeNm}</li>
											<li class="dog-hidden" id="dog_careAddr_${dog.desertionNo}">????????? ?????? : ${dog.careAddr}</li>
			                        	</ul>
			                        </div>
                    			</div>
                    		</c:if>
                    		<c:if test="${fn:length(result.item) eq 0}">
                   				<h1>???????????? ????????????</h1>
                   			</c:if>      					   
                    	</c:forEach>
                    </div>
                </div>
                <div class="find-dog">
                    <div class="find-dog-title">
                        <h1>????????? ?????? ?????????</h1>
                    </div>
                  	<div class="missing-sighting">
                        <div class="missing-title" id="missing_title">
                            <h2>??????</h2>
                        </div>
                        <div class="sighting-title" id="sighting_title">
                            <h2>??????</h2>
                        </div>
                    </div>
                    <div class="find-dog-content" id="find_dog_content">
                    	<c:forEach var="Missing" items="${result.Missing}" begin="0" end="5" varStatus="status">
                    	<c:if test="${fn:length(result.Missing) ne 0}">
	                        <div class="find-dog-info">
	                            <div class="find-info-img">
	                               <a href="${pageContext.request.contextPath}/read?bdiv=3&num=${Missing.num}">
										<c:set var="loop_flag" value="false" />
										<c:if test="${not loop_flag }">
											<c:if test="${Missing.hasimg eq 'Y'}">
												<img src="media/img/${Missing.localName}" alt=""/>
												  <c:set var="loop_flag" value="true" />
											</c:if>
											<c:if test="${Missing.hasimg ne 'Y'}">
												<img src="media/logo/mainLogo.png" alt=""/>
												  <c:set var="loop_flag" value="true" />
											</c:if>
										</c:if>
									</a>
	                            </div>
	                            <a href="${pageContext.request.contextPath}/read?bdiv=3&num=${Missing.num}" class="acontent">
		                           <div class="find-info-content">
		                            	<p>${Missing.title}</p>
		                                <p>?????? : ${(Missing.sex == 'F')? "???":(Missing.sex == 'M')? "???":"??????"}</p>
		                                <p>?????? : ${Missing.species }</p>
		                                <p>?????? : ${Missing.characters}</p>
		                                <p>????????? : ${Missing.date}</p>
		                                <p>???????????? : ${Missing.location}</p>
		                           </div>
		                         </a>
	                        </div>
                    	</c:if>
                    	<c:if test="${fn:length(result.Missing) eq 0}">
                    		<h1>???????????? ????????????</h1>
                    	</c:if>
                    	</c:forEach>
                    </div>
                    <div class="sighting-dog-content" id="sighting_dog_content">
                    	<c:forEach var="Sighting" items="${result.Sighting}" begin="0" end="5" varStatus="status">
                     	<div class="sighting-dog-info">
                     		<div class="sighting-info-img">
                     			<a href="${pageContext.request.contextPath}/read?bdiv=4&num=${Sighting.num}">
									<!-- ????????? ?????? ???????????? -->
									<c:set var="loop_flag" value="false" />
									<c:if test="${not loop_flag }">
										<c:if test="${Sighting.hasimg eq 'Y'}">
											<img src="media/img/${Sighting.localName}" alt=""/>
											  <c:set var="loop_flag" value="true" />
										</c:if>
										<c:if test="${Sighting.hasimg ne 'Y'}">
											<img src="media/logo/mainLogo.png" alt=""/>
											  <c:set var="loop_flag" value="true" />
										</c:if>
									</c:if>
								</a>
                     		</div>
                     		<div class="sighting-info-content">
	                      		<a href="${pageContext.request.contextPath}/read?bdiv=4&num=${Sighting.num}">
	                      			<p>${Sighting.title }</p>
	                      			<p>?????? : ${(Sighting.sex == 'F')? "???":(Sighting.sex == 'M')? "???":"??????"}</p>
	                      			<p>?????? : ${Sighting.species }</p>
	                      			<p>?????? : ${Sighting.characters}</p>
	                      			<p>????????? : ${Sighting.date}</p>
	                      			<p>???????????? : ${Sighting.location}</p>
	                      		</a>
                     		</div>
                     	</div>
                    	</c:forEach>
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
