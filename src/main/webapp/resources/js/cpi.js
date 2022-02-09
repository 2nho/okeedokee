/**
 * 
 */

$(function(){
	let address = null;
	
	$(document).ready(function(){
		let path = window.location.pathname;
		console.log($("#addressBefore").val());
		if(path == "/okeedokee/cpi"){
			address = $("#addressBefore").val().split(",");
			$("#postcode").val(address[0]);
			$("#roadAddress").val(address[1]);
			$("#jibunAddress").val(address[2]);
			$("#detailAddress").val(address[3]);
			$("#extraAddress").val(address[4]);
		}
	});
	
	$("#modifyBtn").click(function(){
		let address = [$("#postcode").val(),$("#roadAddress").val(),$("#jibunAddress").val(),
						$("#detailAddress").val(),$("#extraAddress").val()].join();
		$("#address").val(address);
		console.log($("#address").val());
	});
});

// mypage
$(function(){
	$("#submitBtn").click(function(){
		if($("#id").val() == ""){
			alert("아이디를 입력하세요.");
		}else if($("#pw").val() == ""){
			alert("비밀번호를 입력하세요.");
		}else{ $("#submit").submit();}
	});
});


// mypage_cpi
$(function(){
	$(document).ready(function(){
		let path = window.location.pathname;
		
		if(path == "/okeedokee/cpi"){
			$("#id").attr("readonly",true);
		}
		
	});

	($("#pet1").val()=="Y")? $("#pet1").prop('checked', true) : $("#pet2").prop('checked', true);
	
	if($("#size").val() == "b"){
		$("#size1").prop('checked', true);
	}else if($("#size").val() == "m"){
		$("#size2").prop('checked', true);
	}else if($("#size").val() == "s"){
		$("#size3").prop('checked', true);
	}else{
		$("#size4").prop('checked', true);
	}
	
	$("#modifyBtn").click(function(){
		let $id = $('[name=id]'); 
		let $pw = $('[name=pw]');
		let $chkpw = $('[name=chkpw]');
		if(($pw.val() != "") &&($pw.val()==$chkpw.val())){
			$.ajax({ 
				type: 'post', 
				url: '/okeedokee/member/findCpi', 
				data: {id: $id.val(),pw: $pw.val()}, 
				success: function(data) { 
					alert("정보가 변경되었습니다.");
					$("#submitUpdate").submit();
				}, 
				error: function() { 
					alert("존재하지 않는 아이디입니다.");
				}
			});
		}else{
			alert("비밀번호를 확인해주세요.");
		}
	});
	
	$("#deleteBtn").click(function(){
		let $id = $('[name=id]'); 
		let $pw = $('[name=pw]');
		let $chkpw = $('[name=chkpw]');
		if(($pw.val() != "") &&($pw.val()==$chkpw.val())){
			$.ajax({ 
				type: 'post', 
				url: '/okeedokee/member/findCpi', 
				data: {id: $id.val(),pw: $pw.val()}, 
				success: function(data) { 
					alert("탈퇴가 완료되었습니다.");
					location.href="/okeedokee/member/cpiDelete?id="+data.id;
				}, 
				error: function() { 
					alert("존재하지 않는 아이디입니다."); 
				}
			});
		}else{
			alert("비밀번호를 확인해주세요.");
		}
	});
});

/* 주소 api */
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}
