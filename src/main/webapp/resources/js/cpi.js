/**
 * 
 */

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
					$("#submit").submit();
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



  


