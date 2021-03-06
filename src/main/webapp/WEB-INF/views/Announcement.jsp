<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/Announcement.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<section>
            <div class="main-container">
                <div class="main-content-search">
                    <div class="search-contents">
                    	<div class="search-contents-div">
	                        <div class="date-search-title">
	                            <h1>검색</h1>
	                        </div>
	                        <div class="search-data">
		                        <div class="date-search">
		                            <input type="date" id="start_date" name="start_date">
		                            <p>~</p>
		                            <input type="date" id="end_date" name="end_date">
		                        </div>
		                         <div class="kind-search">
		                            <div class="seach-select">
		                                <select name="seach-category" id="search_category">
		                                    <option value="kind">품종</option>
		                                    <option value="happenPlace">구조지역</option>
		                                    <option value="careNm">보호소</option>
		                                </select>
		                            </div>
		                            <div class="search-input">
		                                <input type="text" id="search" name="search" placeholder="검색어를 입력해주세요.">
		                            </div>
		                            <div class="button">
		                                <button class="btn" id="btn-search">
		                                <svg width="80px" height="25px" viewBox="0 0 80 25" class="border">
		                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
		                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
		                                </svg>
		                                <span>검색</span>
		                                </button>
		                            </div>
		                        </div>
	                        </div>
                    	</div>
                    	<!-- <div class="statistics-contents">
                    		<div class="statistics-title">
                    			<h1>유기견 통계</h1>
                    		</div>
                    		<div class="statistics-info">
                    			
                    		</div>
                    	</div> -->
                    </div>
                </div>
                <div class="main-content-profile" id="div_dogContentMain">
                    <%-- <c:set var="dog_data" value="${result.item}" /> --%>
	                <!-- <c:forEach var="dog" items="${result.item}">
		             	<div class="profile-div">
	                 		<div class="profile-contents" id="profile_${dog.desertionNo}">
	                     		<div class="profile-photo">
	                         		<img id="dog_img_${dog.desertionNo}" src="${dog.popfile}" alt="">
	                     		</div>
		                    	<div class="profile-info">
			                         <ul>
			                             <li id="dog_kindCd_${dog.desertionNo}">품종 : ${dog.kindCd}</li>
			                             <li id="dog_orgNm_${dog.desertionNo}" style="display: none;">지역 : ${dog.orgNm}</li>
			                             <li id="dog_age_${dog.desertionNo}">나이 : ${dog.age}</li>
			                             <li id="dog_sexCd_${dog.desertionNo}">성별 : ${dog.sexCd}</li>
			                             <li id="dog_noticeSdt_${dog.desertionNo}">등록일 : ${dog.happenDt}</li>
			                             <li id="dog_careNm_${dog.desertionNo}">보호소 : ${dog.careNm}</li>
			                             <li id="dog_happenPlace_${dog.desertionNo}">구조지역 :${dog.happenPlace}</li>
			                         	 <li>
				                         	 <div class="key" id="key_${dog.desertionNo}">
				                         	  	key : ${dog.desertionNo}
				                         	 </div>
			                         	 </li>
			                         </ul>
			                    </div>
	                 		</div>
                   		</div>
	                </c:forEach> -->
                </div>
            </div>
        </section>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</div>

    <script language=JavaScript>
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
	<script src="js/Announcement.js" type="text/javascript"></script>
	<script src="js/common.js" type="text/javascript"></script>
</body>
</html>