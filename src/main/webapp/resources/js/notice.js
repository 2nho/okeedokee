/**
 * 
 */

$(function(){
	// common
	const detailNum = $("#detailNum").val();
	$("#listMove").click(function(){
		location.href = "/okeedokee/Notice/main";
	});
	
	$("#deleteNotice").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href = "/okeedokee/Notice/delete_notice?num="+detailNum;	
		}
	});
	
	
	
	// notice
	$("#createNoticeMove").click(function(){
		location.href = "/okeedokee/Notice/notice_create";
	});
	
	$("#search").click(function(){
		let category = $("#category").val();
		let text = $("#text").val();
		
		if(category == "title"){
			location.href = "/okeedokee/Notice/main?title="+text;
		}else if(category == "content"){
			location.href = "/okeedokee/Notice/main?content="+text;
		}else if(category == "both"){
			location.href = "/okeedokee/Notice/main?content="+text+"&title="+text;
		}
	});
	
	
	
	// notice_create
	$("#createNotice").click(function(){
		if(confirm("작성하시겠습니까?")){
			const formData = new FormData();
			const $upload = $("#upload");
			let files = $upload[0].files;
			for (let i = 0; i < files.length; i++) {
				formData.append("uploadFile", files[i])
			}
			
			$.ajax({
				url : '/okeedokee/Notice/uploadfile',
				processData : false,
				contentType : false,
				data : formData,
				type : "post",
				datatype: "json",
				success : function(result){
					console.log(JSON.stringify(result));
					$("#filelist").val(JSON.stringify(result));
					$("#NoticeVO").submit();
				}
			});
		}
	});
	
	
	
	// notice_detail
	$("#modifyNotice").click(function(){
		if(confirm("정말로 수정하시겠습니까?")){
			location.href = "/okeedokee/Notice/modify_notice?num="+detailNum;	
		}
	});
	
	
	
	//notice_detail_result
	let flagSingle = false;
	let flagAll = false;
	let bnum = 0;
	let num = [];

	$(".deleteFile").click(function() {
		flagSingle = true;
		num.push({
			num : this.dataset.num
		});
		$(this).parent().remove();
	});

	$(".alldelete").click(function() {
		flagAll = true;
		bnum = this.dataset.bnum;
		$(".file-item").remove();
	});

	$("#modifyNoticeResult").click(function() {
		if (confirm("정말로 수정하시겠습니까?")) {
			if (flagAll) {
				$.ajax({
					url : '/okeedokee/Notice/deleteFileAll',
					data : JSON.stringify({bnum : bnum}),
					type : "post",
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					success : function(result) {
						console.log(JSON.stringify(result));
					}
				});
			} else if (flagSingle) {
				$.ajax({
					url : '/okeedokee/Notice/deleteFile',
					data : JSON.stringify(num),
					type : "post",
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					success : function(result) {
						console.log(JSON.stringify(result));
					}
				});
			}

			const formData = new FormData();
			const $upload = $("#upload");
			let files = $upload[0].files;

			if (files.length != 0) {
				for (var i = 0; i < files.length; i++) {
					formData.append("uploadFile",files[i])
				}

				$.ajax({
					url : '/okeedokee/Notice/uploadfile',
					processData : false,
					contentType : false,
					data : formData,
					type : "post",
					datatype : "json",
					success : function(result) {
						$("#filelist").val(JSON.stringify(result));
						$("#noticeModifyResultSubmit").submit();
					}
				});
			} else {
				$("#noticeModifyResultSubmit").submit();
			}
		}
	});
	
});

function textEdit() {
	let oEditors = [];
	smartEditor = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "/okeedokee/smartEditor/SmartEditor2Skin.html",
			fCreator: "createSEditor2",
			htParams: {
				bUseToolbar: true,
				bUseVerticalResizer: false,
				bUseModeChanger: false,
			}
		});
	}
	
	$(document).ready(function() {
		smartEditor();
	});
	
	submitPost = function()  {	
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	}
	
}textEdit();
