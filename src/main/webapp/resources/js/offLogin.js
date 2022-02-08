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