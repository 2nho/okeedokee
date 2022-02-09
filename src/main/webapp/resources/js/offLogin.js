/**
 * 
 */

/* login */
$(function(){
	$("#sign").click(function(){
		location.href = "/okeedokee/member/signupAuthMove";
	}); 
	
	$("#submitBtn").click(function(){
		if($("#id").val() == ""){
			alert("아이디를 입력하세요.");
		}else if($("#pw").val() == ""){
			alert("비밀번호를 입력하세요.");
		}else{ $("#submit").submit();}
	});
});



/* signupAuth */
$(function(){
	let dice = null;
	const $email = $('[name=e_mail]'); 
	const $authNum = $('[name=authNum]'); 
	$("#submitSignupAuth").click(function(){
		if($email.val() != ""){
			$($(this)).attr('disabled',true);
			$.ajax({ 
				type: 'post', 
				url: '/okeedokee/mail/signupAuth', 
				data: {email: $email.val()}, 
				success: function(data) { 
					dice = data;
					alert("이메일로 인증번호를 발송했습니다. 확인해주십시오.");
					$("#authNum").css("display","block");
					$("#authBtn").css("display","inline");
					$("#submitSignupAuth").css("display","none");
				}, 
				error: function() { 
					alert("정보를 다시 확인해주십시오."); 
					$("#submitSignupAuth").attr('disabled',false);
				}
			});
		}else {
			alert("이메일을 입력해주세요.");
		}
	});		
	
	$("#authBtn").click(function(){
		if($authNum.val() == dice){
			alert("인증되었습니다.");
			location.href = '/okeedokee/member/signUp?email='+$email.val();
		}else{
			alert("인증번호를 다시 확인해주십시오.");
		}
	});	
});


/* findId */
$(function(){
	$("#submitFindId").click(function(){
		let $name = $('[name=name]'); 
		let $email = $('[name=email]'); 
		$.ajax({ 
			type: 'post', 
			url: '/okeedokee/member/findIdResult', 
			data: {name: $name.val(),email: $email.val()}, 
			success: function(data) { 
				alert("아이디는 "+data.id+"입니다");
				location.href = "/okeedokee/member/loginPage";
			}, 
			error: function() { 
				alert("존재하지 않는 아이디입니다."); 
			}
		});
		
	});
});


/* findPw */
$(function(){
	$("#submitFindPw").click(function(){
		$($(this)).attr('disabled',true);
		let $name = $('[name=name]'); 
		let $id = $('[name=id]'); 
		let $email = $('[name=e_mail]'); 
		$.ajax({ 
			type: 'post', 
			url: '/okeedokee/member/findPwResult', 
			data: {name: $name.val(),email: $email.val(),id: $id.val()}, 
			success: function(data) { 
				$("#hidden").val(data.pw);
				alert("이메일로 비밀번호를 발송했습니다. 확인해주십시오.");
				$("#submit").submit();
				
			}, 
			error: function() { 
				alert("정보를 다시 확인해주십시오."); 
				$("#submitFindPw").attr('disabled',false);
			}
		});
	});
});


/* signUp */
$(function(){
	$("#sign").click(function(){
		location.href = "/okeedokee/member/signUp";
	});
	
	$("#auth").click(function(){
		if(confirm("메일을 보내시겠습니까?")){
			const email = $("#email");
			$.ajax({
				url : '/okeedokee/auth',
				data : email,
				type : "post",
				datatype: "text",
				success : function(result){
				}
			});
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
$(function(){
	$("#signupBtn").click(function(){
		let address = [$("#postcode").val(),$("#roadAddress").val(),$("#jibunAddress").val(),
						$("#detailAddress").val(),$("#extraAddress").val()].join();
			
		$("#address").val(address);	
		addressSplit = address.split(",");
	});
});