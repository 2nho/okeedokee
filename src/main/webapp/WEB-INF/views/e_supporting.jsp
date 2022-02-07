<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/snv.css" />
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
					</div>
				</div>
			</nav>

			<div id="volunteerNav">
				<div class="in">
					<h1>보호소 후원하기</h1>
				</div>
			</div>
			<div>
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
									<select name="area1" id="donaAmount" required="required">
										<option value="" disabled="disabled">후원금액</option>
										<option value="10,000">10,000</option>
										<option value="20,000">20,000</option>
										<option value="30,000">30,000</option>
										<option value="40,000">40,000</option>
										<option value="50,000">50,000</option>
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
			var IMP = window.IMP;
			IMP.init('imp11277506');
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
			IMP.request_pay({
				pg : 'kakao',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				/* 
				 *  merchant_uid에 경우 
				 *  https://docs.iamport.kr/implementation/payment
				 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
				 */
				name : '후원하기',
				amount : $('#donaAmount').value,
				// amount: ${bid.b_bid},
				// 가격 
				buyer_name : ${sessionScope.account.name},
				buyer_postcode : ,
			}, function(rsp) {
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