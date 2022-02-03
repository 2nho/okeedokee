<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" />
<style>

/* 네비 */
main nav {
	flex: 1;
}
main nav #saveNav {
	width: 250px;
	height: 200px;
	background-color: #f9f1c0;
	padding: 10px;
	border-radius: 15px 15px;
}
main nav #saveNav #saveTitle{
	padding-bottom: 5px;
}
main nav #saveNav #saveTitle::after {
	content: "";
	display: block;
	width: 100%;
	border-bottom: 2px solid black;
	padding-bottom: 5px;
}
main nav #saveSubTitle {
	padding: 0 10px;
}
main nav #saveSubTitle a {
	line-height: 40px;
}
main nav #saveSubTitle a:not(:last-child):after {
	content: "";
	display: block;
	width: 100%;
	border-bottom: 1px solid black;
	margin: 5px 0;
}
main nav #saveSubTitle a#focus h4 {
	background-color: RGB(251, 209, 87, .5);
	border-radius: 10px 10px;
	font-weight: 500;
}
main nav #saveSubTitle a h4 {
	padding-left: 5px;
	font-weight: 400;
}
main nav #saveSubTitle a:hover > h4 {
	background-color: RGB(251, 209, 87, .5);
	border-radius: 10px 10px;
	font-weight: 500;
}
/* 게시판 영역 */
main section {
	flex: 9;
	width: 100%;
	height: 100%;
	padding: 0 30px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.in {
	border-bottom: 2px solid black;
	text-align: center;
}
/* 지역명 */
#selectcity {
	text-align: left;	
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
}
#selectcity select {
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
}

#selectcity select option {
	background-color: #fbd157;
}
#valbtn{
	width: 100%;
	text-align: right;
	margin-top: 20px;
	
}
/* 버튼 색상 */
.ClickBtn {
	padding: 6px;
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
}
.ClickBtn:hover {
	background-color: #f9f1c0;
	padding: 5px;
	border: 2px solid #fbd157;
	
}

.btn{
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
}
/* 페이징 버튼*/
#pagingBox {
	width: 100%;
	display: flex;
	justify-content: center;
	padding-top: 20px;
	
}

#SupportNav {
	text-align: center;
	border-bottom: 1px solid #fbd157;
}
.text1 {
	text-align: center;
	margin-top: 180px;
}

.listup {
	text-align: center;
	border-bottom: 1px solid #fbd157;
}

#money1 option {
	text-align: center;
}

#check_module {
	padding: 6px;
	background-color: #fbd157;
	border: none;
	outline: none;
	font-weight: bold;
	cursor: pointer;
	text-align: center;
	
}

#adminlist{
	margin-left: 30px;
}


footer {
	margin-top: 330px;
}



</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
 <div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />
		
		<main>
		<nav>
			<!-- support and voluntee 줄여서 save -->
			<div id="saveNav">
				<div id="saveTitle">
					<h3>후원 / 자원봉사</h3>
				</div>
				<div id="saveSubTitle">
					<a href="Sav"><h4>자원봉사</h4></a>
					<a href="supporting" id="focus"><h4>보호소 후원하기</h4></a>
					<a href="supportuse"><h4>후원금 사용내역</h4></a>
				</div>
			</div>
		</nav>
		
		<div id="volunteerNav">
		<div class="in">
		<h1>보호소 후원하기</h1>
		</div>
		</div>
		<div class="text1">
			<h4>소중한 후원금은 동물들을 위해 다음과 같이 쓰입니다.</h4>
			<p>1. 동물보호 캠페인 및 홍보 : 동물의 보호 및 유기동물입양 증대를 위한 홍보</p>
			<p>2. 입양지원 : 유기동물의 안락사 수를 줄이고 입양을 통한 새 삶의 기회 부여</p>
			<p>3. 개인보호소 지원 : 열악한 개인보호소 지원을 통한 동물보호 및 자립심 부여</p>
		</div>
		<table id="money1">
			<tbody>
			<tr>
			<td align="center" valign="bottom">
			<p>
			<select name="area1">
			<option value selected>후원금액</option>
			<option value="10,000">10,000</option>
			<option value="20,000">20,000</option>
			<option value="30,000">30,000</option>
			<option value="40,000">40,000</option>
			<option value="50,000">50,000</option>
			</select>
			<a href="#"><button id="check_module" type="button">후원하기</button></a>
			</p>
			</td>
			</tr>
			</tbody>
		</table>
		</main>
		
		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
		</div>
		<script>
$("#check_module").click(function () {
	var IMP = window.IMP; 
	IMP.init('imp11277506'); 
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	IMP.request_pay({
		pg: 'kakao',
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		/* 
		 *  merchant_uid에 경우 
		 *  https://docs.iamport.kr/implementation/payment
		 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		 */
		name: '후원하기',
		// 결제창에서 보여질 이름
		// name: '주문명 : ${auction.a_title}',
		// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
		amount: 10000,
		// amount: ${bid.b_bid},
		// 가격 
		buyer_name: '이름',
		// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
		// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
		buyer_postcode: '123-456',
		}, function (rsp) {
			console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '결제 금액 : ' + rsp.paid_amount;
			// success.submit();
			// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다..
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
});
</script>
</body>
</html>