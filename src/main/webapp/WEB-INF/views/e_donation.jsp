<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/snv.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<div class="container">
		<!-- 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/header.jsp" />

		<main>
			<nav>
				<div id="saveNav">
					<div id="saveTitle">
						<h3>후원 / 자원봉사</h3>
					</div>
					<div id="saveSubTitle">
						<a href="Save"><h4>자원봉사</h4></a> 
						<a href=donation id="focus"><h4>후원하기</h4></a>
					</div>
				</div>
			</nav>

			<div id="volunteerNav">
				<div class="in">
					<h1>후원하기</h1>
				</div>
			</div>

			<div id="donaList">
				<div class="text1">
					<h2>후원금은 다음과 같이 쓰입니다.</h2>
					<br />
					<p>유기견 캠페인 : 유기견 보호 및 입양 프로모션</p>
					<p>입양지원 : 입양에 필요한 기본 품목 지원</p>
					<p>보호소 지원 : 보호소 지원을 통한 유기견 복지 증대</p>
				</div>
				<table id="money1">
					<tbody>
						<tr>
							<td align="center" valign="bottom">
								<p>
									<select name="donaAmount" id="donaAmount" required="required">
										<option value="0" disabled="disabled" selected="selected">후원금액</option>
										<option value="10">10,000</option>
										<option value="20">20,000</option>
										<option value="30">30,000</option>
										<option value="40">40,000</option>
										<option value="50">50,000</option>
									</select>
									<button id="check_module" type="button">후원하기</button>
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</main>

		<!-- 푸터 불러오기 -->
		<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
	</div>
	<script>
		$("#check_module").click(function() {
			//후원금액 0원 이상일때만
			if($('#donaAmount').val() > 0) {
				
				var IMP = window.IMP;
				IMP.init('imp23364357');
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
				IMP.request_pay({
					pg : 'html5_inicis',
					pay_method : 'card',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '후원하기',
					amount : $('#donaAmount').val(),
					buyer_email: '${sessionScope.account.email}',
					buyer_name : '${sessionScope.account.name}',
					buyer_postcode : '',
				}, function(rsp) {
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '결제 금액 : ' + rsp.paid_amount;
						if(true) {
							addDonation();
						}
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			}
			else {
				alert("후원 금액을 선택해주세요");
			}
			
		});
		
		function addDonation() {
			//기부금액
			let donation = $('#donaAmount').val();
			let mnum = ${sessionScope.account.mnum};
			
			//기부날짜
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var date = year + '-' + month  + '-' + day;
			
			let donaData = { donation:donation, mnum:mnum, date:date };
			
			$.ajax({
				url: "addDonation",
				type: "POST",
				data: JSON.stringify(donaData),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(result) {
					console.log(result);
					location.href="donationList";
				}
			});
		}
	</script>
</body>
</html>