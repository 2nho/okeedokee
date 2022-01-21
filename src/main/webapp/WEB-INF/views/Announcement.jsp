<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/Announcement.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
		
		<section>
            <div class="main-container">
                <div class="main-content-search">
                    <div class="search-contents">
                        <div class="date-search-title">
                            <h1>날짜</h1>
                        </div>
                        <div class="date-search">
                            <input type="date">
                            <p>~</p>
                            <input type="date">
                            <div class="button">
                                <button class="btn">
                                <svg width="80px" height="25px" viewBox="0 0 80 25" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>검색</span>
                                </button>
                            </div>
                        </div>
                        <div class="kind-search-title">
                            <h1>품종</h1>
                        </div>
                        <div class="kind-search">
                            <input type="text">
                            <div class="button">
                                <button class="btn">
                                <svg width="80px" height="25px" viewBox="0 0 80 25" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>검색</span>
                                </button>
                            </div>
                        </div>
                        <div class="size-search-title">
                            <h1>크기</h1>
                        </div>
                        <div class="size-search">
                            <input type="text">
                            <div class="button">
                                <button class="btn">
                                <svg width="80px" height="25px" viewBox="0 0 80 25" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>검색</span>
                                </button>
                            </div>
                        </div>
                        <div class="shelter-search-title">
                            <h1>보호소</h1>
                        </div>
                        <div class="shelter-search">
                            <input type="text">
                            <div class="button">
                                <button class="btn">
                                <svg width="80px" height="25px" viewBox="0 0 80 25" class="border">
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                    <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                </svg>
                                <span>검색</span>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="statistics-contents">
                        <div class="">

                        </div>
                    </div>
                </div>
                <div class="main-content-profile">
	                <c:forEach var="dog" items="${result.item}">
		             	<div class="profile-div">
		                 	<div class="profile-contents">
		                     	<div class="profile-photo">
		                         	<img src="${dog.popfile}" alt="">
		                     	</div>
			                    <div>	
			                         <ul>
			                             <li>품종 : ${dog.kindCd}</li>
			                             <li>나이 :${dog.age}</li>
			                             <li>성별 : ${dog.sexCd}</li>
			                             <li>등록일 : ${dog.noticeSdt}</li>
			                             <li>보호소 : ${dog.orgNm}</li>
			                             <li>구조지역 :${dog.happenPlace}</li>
			                         </ul>
			                    </div>
		                 	</div>
                    	</div>
	                </c:forEach>
                </div>
            </div>
        </section>
		
		<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
	</div>
</body>
</html>