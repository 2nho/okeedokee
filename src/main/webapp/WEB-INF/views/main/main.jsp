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
                        <h1>내 근처 아이 알아보기</h1>
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
                    		</c:if>
                    		<c:if test="${fn:length(result.item) eq 0}">
                   				<h1>데이터가 없습니다</h1>
                   			</c:if>      					   
                    	</c:forEach>
                    </div>
                </div>
                <div class="find-dog">
                    <div class="find-dog-title">
                        <h1>가족을 찾고 있어요</h1>
                    </div>
                  	<div class="missing-sighting">
                        <div class="missing-title" id="missing_title">
                            <h2>실종</h2>
                        </div>
                        <div class="sighting-title" id="sighting_title">
                            <h2>목격</h2>
                        </div>
                    </div>
                    <div class="find-dog-content" id="find_dog_content">
                    	<c:forEach var="Missing" items="${result.Missing}" begin="0" end="5" varStatus="status">
                    	<c:if test="${fn:length(result.Missing) ne 0}">
	                        <div class="find-dog-info">
	                            <div class="find-info-img">
	                               <a href="${pageContext.request.contextPath}/read?bdiv=3&num=${Missing.num}">
										<!-- 저장된 파일 가져오기 -->
										<c:set var="loop_flag" value="false" />
										<c:forEach var="file" items="${filelist}">
											<c:if test="${not loop_flag }">
											<c:if test="${(Missing.hasimg eq 'Y') and (file.bnum == Missing.num)}">
												<img src="media/img/${file.localName}" alt=""/>
												  <c:set var="loop_flag" value="true" />
											</c:if>
											<c:if test="${Missing.hasimg ne 'Y'}">
												<img src="media/logo/mainLogo.png" alt=""/>
												  <c:set var="loop_flag" value="true" />
											</c:if>
											</c:if>
										</c:forEach>
									</a>
	                            </div>
	                            <a href="${pageContext.request.contextPath}/read?bdiv=3&num=${Missing.num}" class="acontent">
		                           <div class="find-info-content">
		                            	<p>${Missing.title}</p>
		                                <p>성별 : ${(Missing.sex == 'F')? "여":(Missing.sex == 'M')? "남":"미상"}</p>
		                                <p>견종 : ${Missing.species }</p>
		                                <p>특징 : ${Missing.characters}</p>
		                                <p>실종일 : ${Missing.date}</p>
		                                <p>실종장소 : ${Missing.location}</p>
		                           </div>
		                         </a>
	                        </div>
                    	</c:if>
                    	<c:if test="${fn:length(result.Missing) eq 0}">
                    		<h1>데이터가 없습니다</h1>
                    	</c:if>
                    	</c:forEach>
                    </div>
                    <div class="sighting-dog-content" id="sighting_dog_content">
                    	<c:forEach var="Sighting" items="${result.Sighting}" begin="0" end="5" varStatus="status">
                     	<div class="sighting-dog-info">
                     		<div class="sighting-info-img">
                     			<a href="${pageContext.request.contextPath}/read?bdiv=4&num=${Sighting.num}">
									<!-- 저장된 파일 가져오기 -->
									<c:set var="loop_flag" value="false" />
									<c:forEach var="file" items="${filelist}">
										<c:if test="${not loop_flag }">
										<c:if test="${(Sighting.hasimg eq 'Y') and (file.bnum == Sighting.num)}">
											<img src="media/img/${file.localName}" alt=""/>
											  <c:set var="loop_flag" value="true" />
										</c:if>
										<c:if test="${Sighting.hasimg ne 'Y'}">
											<img src="media/logo/mainLogo.png" alt=""/>
											  <c:set var="loop_flag" value="true" />
										</c:if>
										 </c:if>
									</c:forEach>
								</a>
                     		</div>
                     		<div class="sighting-info-content">
	                      		<a href="${pageContext.request.contextPath}/read?bdiv=4&num=${Sighting.num}">
	                      			<p>${Sighting.title }</p>
	                      			<p>성별 : ${(Sighting.sex == 'F')? "여":(Sighting.sex == 'M')? "남":"미상"}</p>
	                      			<p>견종 : ${Sighting.species }</p>
	                      			<p>특징 : ${Sighting.characters}</p>
	                      			<p>목격일 : ${Sighting.date}</p>
	                      			<p>목격장소 : ${Sighting.location}</p>
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
