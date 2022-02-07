<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/Introduction.css" />
</head>
<body>
	<div class="container">
		
		 <section>
            <div class="main-content">
                <div class="expanation">
                    <div class="content-explanation">
                        <div class="fade-in-box1">
                            <p>OKEE&DOKEE</p>
                        </div>
                        <div class="fade-in-box2">
                            <p>사람을 좋아하고 따르지만</p>
                            <p>매년 우리로부터 버림받는 아이들,</p>
                            <p>그들을 우린 '유기견'이라고 부릅니다.</p>
                        </div>
                        <div class="fade-in-box3">
                            <p><span class="sub-title">Who we are?</span></p>
                            <p>아이들의 두번째 이름을 찾아주기 위한 플랫폼입니다.</p>
                        </div>
                        <div class="fade-in-box4">
                            <p><span class="sub-title">What we do?</span></p>
                            <p><span class="sub-text">유기견공고</span></p>
                            <p>전국 유기견보호소를 통해 사랑이 필요한 아이들을 <br>
                               입양하실 수 있습니다.</p>
                            <p><span class="sub-text">실종&목격</span></p>
                            <p>소중한 반려동물을 잃어버리신 분들을 위한 게시판입니다.</p>
                        </div>
                    </div>
                    <div class="content-title">
                        <div class="expanation-title">
                            <h1>
                                OKEE&DOKEE
                            </h1>
                        </div>
                        <div class="expanation-button">
                            <div class="button">
                                 <button class="btn" id="btn">
                                     <svg width="180px" height="50px" viewBox="0 0 180 50" class="border">
                                         <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
                                         <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
                                     </svg>
                                     <span>시작하기</span>
                                 </button>
                             </div>
                        </div>
                    </div>
                </div>
                <div class="background-img1">
                    <div class="img-color1">
                        <div class="welcome-img1 img"></div>
                        </div>
                        <div class="img-color2">
                            <div class="welcome-img2 img"></div>
                        </div>
                        <div class="img-color3">
                            <div class="welcome-img3 img"></div>
                        </div>
                </div>
                <div class="background-img2">
                    <div class="img-color4">
                    <div class="welcome-img4 img"></div>
                    </div>
                    <div class="img-color5">
                        <div class="welcome-img5 img"></div>
                    </div>
                    <div class="img-color6">
                        <div class="welcome-img6 img"></div>
                    </div>
                </div>
            </div>
        </section>
	</div>
	
	<script type="text/javascript">
		$("#btn").on("click", function () {
			location.href = "${pageContext.request.contextPath}/main";
		});
	</script>
	
	<script src="js/Introduction.js" type="text/javascript"></script>
	<script src="js/common.js" type="text/javascript"></script>
</body>
</html>