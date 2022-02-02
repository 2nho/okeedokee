<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OKEEDOKEE</title>
<link rel="icon" href="media/logo/favicon.ico">
<link rel="stylesheet" type="text/css"  href="css/mnw.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>


</head>
<body>

	<div class="container">

		<main>
			
			<section>
				<!-- 글쓰기 -->
				<article id="arti2" style="background-color: #fff;">
					<div id="boardBox" style="background-color:#fff;">
						<div id="board" >
							<div id="boardContent">
								<div id="informBox">
									<div id="inform">
										<div id="flyerContent">
											<div id="flyerTitle">
												<h1>강아지를 찾습니다.</h1>
											</div>
											<div class="imgBox">
												<img src="media/logo/mainLogo.png" alt="" id="image"/>
											</div>
											<table id="informTable">
												<tr>
													<td>이름</td>
													<td><input type="text" name="petName" id="petName"
														readonly="readonly" value="" /></td>
													
												</tr>

												<tr>
													<td>견종</td>
													<td><input type="text" name="species" id="species"
														readonly="readonly" value="" /></td>
												</tr>

												<tr>
													<td>특징</td>
													<td><input type="text" name="characters"
														id="characters" readonly="readonly"
														value="" /></td>
												</tr>

												<tr>
													<td>실종 장소</td>
													<td><input type="text" name="location" id="location"
														readonly="readonly" value="" /></td>
												</tr>
											</table>
											<ul id="flyerReward" style="list-style: none;">
												<li id="gratuity">
													
												</li>
												<li>
													<span id="gratuityCmt"></span>
												</li>
												<li id="phone">
													
												</li> 
											</ul>

										</div>
										
										
									</div>
								</div>
							</div>
						</div>
					</div>
				</article>
			</section>
		</main>

	</div>
	
	<script type="text/javascript">
	
		//부모창에서 값 가져오기
		
		let petName = document.getElementById("petName");
		let species = document.getElementById("species");
		let characters = document.getElementById("characters");
		let locations = document.getElementById("location");
		let phone = document.getElementById("phone");
		let image = document.getElementById("image");
		let flyerTitle = document.getElementById("flyerTitle");
		let gratuity = document.getElementById("gratuity");
		let gratuityCmt = document.getElementById("gratuityCmt");
		
		//이름, 나이, 성별
		let sex;
		
		if(opener.document.getElementById("sex").value == "F") {
			sex = "여"
		}
		else {
			sex = "남"
		}
		petName.value = opener.document.getElementById("petName").value+' ( '+opener.document.getElementById("age").value+' 살 / '+sex+' )';
		 
		 //견종
		 species.value = opener.document.getElementById("species").value;
		 //특징
		 characters.value = opener.document.getElementById("characters").value;
		 //실종위치
		 locations.value = opener.document.getElementById("location").value;
		 //전화번호
		 phone.innerText = "Tel. "+opener.document.getElementById("phone").value;
		 
		 //이미지
		 if(opener.document.getElementById("filePath").innerHTML == "") {
			 image.src = "media/logo/mainLogo.png";
		 }
		 else {
			 image.src = opener.document.getElementById("filePath").innerHTML;
		 }
		 
		 //제목 배경색
		 flyerTitle.style.backgroundColor = opener.document.getElementById("colorPicker").value;
		 
		 //사례금
		 
		 if(opener.document.getElementById("gratuity").value != "0") {
			 gratuity.innerText = "사례금 "+opener.document.getElementById("gratuity").value+"만원";
			 gratuityCmt.innerText = "꼭 사례하겠습니다.";
		 }
		 

		//글자수 20자리 이상시 fontSize = 20px
		if(locations.value.length >= 20) {
			locations.style.fontSize = "20px";
		}
		else if (locations.value.length >= 30) {
			locations.style.fontSize = "17px";
		}
		
		if(characters.value.length >= 20) {
			characters.style.fontSize = "20px";
		}
		else if (characters.value.length >= 30) {
			characters.style.fontSize = "17px";
		}
	</script>
</body>
</html>