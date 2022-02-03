/**
 * 
 */

$(function(){
		
		$("#chkid").click(function(){
			id_check();
		});
		
		function id_check() { 
			let $id = $('[name=id]'); 
			if($id.hasClass('chkid')) return;
			 
			let data = join.tag_status($id); 
			console.log(data);
		
			if(data.code != 'valid') { 
				alert('아이디 중복 확인 불필요\n' + data.desc); 
				$id.focus();
				return; 
			} 
			
			$.ajax({ 
				type: 'post', 
				url: '${pageContext.request.contextPath}/member/idCheck', 
				data: {id: $id.val()}, 
				success: function(data) { 
					data = join.id_usable(data); 
					display_status($id.siblings('div'), data); 
					$id.addClass('chkid'); 
				}, 
				error: function(req, text) { 
					alert(text + ': ' + req.status); 
				}
			});
		}
		
		//유효성 검사 
		$('.chk').on('keyup', function(){ 
			if($(this).attr('name') == 'id') { 
				if(event.keyCode == 13) { id_check(); } 
				else { 
					$(this).removeClass('chkid'); 
					validate( $(this) ); } 
				} 
			else { 
				validate($(this)); 
			} 
		});
		
		$('.chkra').on('focus', function(){		
 			let tag = $(this).attr("name");
 			const div = $(this);
 			let data=null;
			if(tag == 'petOwn'){
				if($(this).val() != ""){
					data = { code: 'valid', desc: '보유여부를 선택하셨습니다.' };
				}
			}else if(tag == 'size'){
				if($(this).val() != ""){
					data = { code: 'valid', desc: '선호크기를 선택하셨습니다.' };
				}
			}
			display_status(div.siblings('div'), data);
		});
		
		function validate(t) { 
			let data = join.tag_status(t);
			display_status(t.siblings('div'), data);
		}

		function display_status(div, data) { 
			div.text(data.desc); 
			div.removeClass(); 
			div.addClass(data.code);
		}
	});