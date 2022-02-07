/**
 * 
 */
 

//코멘트 가져오기
function getCmmt() {
	//게시글 번호
	const num = document.querySelector("#bnum").value;
	
	//게시글에 해당하는 댓글 보여지게 만들기
	$.ajax({
		url: "getRepCmt/"+num,
		type: "GET",
		dataType: "json",
		success: function(data) {
			//데이터 넘어오는지 체크
			console.log(data);

			for (const item of data) {

				//삭제버튼 보여주기 위해 세션 회원 아이디 가져오기
				let userId = document.querySelector("#sessionId").value;

				//순수JS 동적쿼리로 댓글 보여지게 하기
				const commentList = document.querySelector("#commentList");
				const div = document.createElement("div");
				const div2 = document.createElement("div");
				const div3 = document.createElement("div");

				div.classList.add("cmt");
				div2.classList.add("cmtInform");
				div3.classList.add("cmtBtns");
			
				//작성자 아이디
				const h5 = document.createElement("h5");
				h5.innerText = item.id;
				h5.classList.add("cmtWriter");
				
				//작성일
				const date = document.createElement("p");
				date.innerText = item.createdate;
				date.classList.add("cmtDate");
				
				//댓글 내용
				const p = document.createElement("p");
				p.innerText = item.cmt;
				p.classList.add("cmtContent");
			

				if (userId == item.id) {
				//삭제버튼
				const delBtn = document.createElement("button");
				delBtn.classList.add("cmtDelete");
				delBtn.innerText = "삭제"


				//버튼 클릭시 댓글 삭제
				delBtn.addEventListener("click", function() {
					let yn = confirm("댓글을 삭제하시겠습니까?");
					console.log(yn);

					//삭제 true면
					if (yn) {
						//commentData 에 item.num을 넣어준다! 즉 게시글의 번호를 넣어준다
						commentData = { num: item.num };

						//ajax를 통해 전달
						$.ajax({
							url: "deleteRepCmt",
							type: "DELETE",
							data: JSON.stringify(commentData),
							contentType: "application/json; charset=utf-8",
							dataType: "text",
							success: function() {
								console.log("삭제완");
								//동적 삭제
								div.remove();
							}
						});
					}
				});

				//div안에 생성된 버튼 삽입
				div3.append(delBtn);

				//수정 버튼
				const modiBtn = document.createElement("button");
				modiBtn.classList.add("cmtModify");
				modiBtn.innerText = "수정";

				modiBtn.addEventListener("click", function() {
					//수정 textarea를 위한 설정
					//const editBox = document.createElement("div");
					const editor = document.createElement("textarea");
					editor.cols = "200";
					editor.rows = "5";
					editor.classList.add("cmtEditor");

					//댓글 내용 p를 가져와 textarea에 삽입
					editor.value = p.innerText;
					//댓글 수정 완료 버튼 
					const editModify = document.createElement("button");
					editModify.classList.add("editModify");
					editModify.innerText = "수정완료";
					//댓글 수정 취소
					const editCancel = document.createElement("button");
					editCancel.classList.add("editCancel");
					editCancel.innerText = "수정취소";

					//textarea를 기존 댓글 자리에 넣기
					p.append(editor);

					//수정완료, 수정취소 버튼을 삭제/수정 자리에 넣기
					div3.append(editModify);
					div3.append(editCancel);

					//기존 댓글 p 다음에 editor 넣기
					p.after(editor);
					//div는 숨기기
					p.style.display = "none";
					modiBtn.style.display = "none";
					delBtn.style.display = "none";

					//댓글 수정 취소 버튼 이벤트
					editCancel.addEventListener("click", function() {
						//기존 댓글창, 수정, 삭제 버튼 되돌리기
						p.style.display = "block";
						modiBtn.style.display = "inline";
						delBtn.style.display = "inline";
						//수정완료, 수정취소, 수정창 지우기
						editModify.remove();
						editCancel.remove();
						editor.remove();
					});

					//댓글 수정 완료
					editModify.addEventListener("click", function() {
						if (confirm("댓글을 수정하시겠습니까?")) {
							let modiCmt = editor.value;
							console.log(modiCmt);

							const modiData = { cmt: modiCmt, num: item.num }

							$.ajax({
								url: "updateRepCmt",
								type: "PATCH",
								data: JSON.stringify(modiData),
								contentType: "application/json; charset=uft-8",
								dataType: "json",
								success: function(data) {
									console.log(data);
									//수정된 댓글 내용으로 바꾸기
									p.innerText = data.cmt;
									//기존 댓글창, 수정, 삭제 버튼 되돌리기
									p.style.display = "block";
									modiBtn.style.display = "inline";
									delBtn.style.display = "inline";
									//수정완료, 수정취소, 수정창 지우기
									editModify.remove();
									editCancel.remove();
									editor.remove();
								}

							});
						}
					});
				});

				//div안에 생성된 수정 버튼 삽입
				div3.append(modiBtn);
				}

				//div안에 생성된 내용 삽입
				//버튼이 먼저 삽입됐기 때문에 버튼 위로 추가
				div2.prepend(h5);
				div2.append(div3);

				div.append(div2);
				div.append(date);
				div.append(p);

				//commentList안에 div추가
				commentList.append(div);
			}
		}
	});

} getCmmt();


//코멘트 추가
function submitCmt() {
	const submitCmt = document.querySelector("#cmtSubmit");
	
	submitCmt.addEventListener("click", function() {
		let cmt = document.querySelector("#commentCreator").value;
		let bnum = document.querySelector("#bnum").value;

		console.log(cmt);

		if (cmt.length > 0) {
			let commentData = { cmt, bnum };

			$.ajax({
				url: "createRepCmt",
				type: "POST",
				data: JSON.stringify(commentData),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(data) {
					console.log(data);
					//새로고침 방법은 트래픽 증가 BUT 사용은 되는 방법임					
					//location.reload(true);
					document.querySelector("#commentCreator").value = '';

				//순수JS 동적쿼리로 추가된 댓글 보여지게 하기
				const commentList = document.querySelector("#commentList");
				const div = document.createElement("div");
				const div2 = document.createElement("div");
				const div3 = document.createElement("div");

				div.classList.add("cmt");
				div2.classList.add("cmtInform");
				div3.classList.add("cmtBtns");

			
				//작성자 아이디
				const h5 = document.createElement("h5");
				h5.innerText = data.id;
				h5.classList.add("cmtWriter");
				
				//작성일
				const date = document.createElement("p");
				date.innerText = data.createdate;
				date.classList.add("cmtDate");
				
				//댓글 내용
				const p = document.createElement("p");
				p.innerText = data.cmt;
				p.classList.add("cmtContent");
			
				//삭제버튼
				const delBtn = document.createElement("button");
				delBtn.classList.add("cmtDelete");
				delBtn.innerText = "삭제"
				

				//버튼 클릭시 댓글 삭제
				delBtn.addEventListener("click", function() {
					let yn = confirm("댓글을 삭제하시겠습니까?");
					console.log(yn);

					//삭제 true면
					if (yn) {
						//commentData 에 item.num을 넣어준다! 즉 게시글의 번호를 넣어준다
						commentData = { num: data.num };

						//ajax를 통해 전달
						$.ajax({
							url: "deleteRepCmt",
							type: "DELETE",
							data: JSON.stringify(commentData),
							contentType: "application/json; charset=utf-8",
							dataType: "text",
							success: function() {
								console.log("삭제완");
								//동적 삭제
								div.remove();
							}
						});
					}
				});

				//div안에 생성된 버튼 삽입
				div3.append(delBtn);
					
				//수정 버튼
				const modiBtn = document.createElement("button");
				modiBtn.classList.add("cmtModify");
				modiBtn.innerText = "수정";
				
				modiBtn.addEventListener("click", function(){
					//수정 textarea를 위한 설정
					//const editBox = document.createElement("div");
					const editor = document.createElement("textarea");
					editor.cols = "200";
					editor.rows = "5";
					editor.classList.add("cmtEditor");
					
					//댓글 내용 p를 가져와 textarea에 삽입
					editor.value = p.innerText;
					//댓글 수정 완료 버튼 
					const editModify = document.createElement("button");
					editModify.classList.add("editModify");
					editModify.innerText = "수정완료";
					//댓글 수정 취소
					const editCancel = document.createElement("button");
					editCancel.classList.add("editCancel");
					editCancel.innerText = "수정취소";
						
					//textarea를 기존 댓글 자리에 넣기
					p.append(editor);
					
					//수정완료, 수정취소 버튼을 삭제/수정 자리에 넣기
					div3.append(editModify);
					div3.append(editCancel);
						
					//기존 댓글 p 다음에 editor 넣기
					p.after(editor);
					//div는 숨기기
					p.style.display = "none";
					modiBtn.style.display = "none";
					delBtn.style.display = "none";
						
					//댓글 수정 취소 버튼 이벤트
					editCancel.addEventListener("click", function(){
						//기존 댓글창, 수정, 삭제 버튼 되돌리기
						p.style.display = "block";
						modiBtn.style.display = "inline";
						delBtn.style.display = "inline";
						//수정완료, 수정취소, 수정창 지우기
						editModify.remove();
						editCancel.remove();
						editor.remove();
					});
						
					//댓글 수정 완료
					editModify.addEventListener("click", function(){
						if(confirm("댓글을 수정하시겠습니까?")) {
							let modiCmt = editor.value;
							console.log(modiCmt);
							
							const modiData = { cmt:modiCmt, num: data.num }
							
							$.ajax({
								url: "updateRepCmt",
								type: "PATCH",
								data: JSON.stringify(modiData),
								contentType: "application/json; charset=uft-8",
								dataType: "json",
								success: function(data){
									console.log(data);
									//수정된 댓글 내용으로 바꾸기
									p.innerText = data.cmt;
									//기존 댓글창, 수정, 삭제 버튼 되돌리기
									p.style.display = "block";
									modiBtn.style.display = "inline";
									delBtn.style.display = "inline";										//수정완료, 수정취소, 수정창 지우기
									editModify.remove();
									editCancel.remove();
									editor.remove();
								}
								
							});
						}
					});
				});
					
				//div안에 생성된 수정 버튼 삽입
				div3.append(modiBtn);	
				
				//div안에 생성된 내용 삽입
				//버튼이 먼저 삽입됐기 때문에 버튼 위로 추가
				div2.prepend(h5);
				div2.append(div3);

				div.append(div2);
				div.append(date);
				div.append(p);

				//commentList안에 div추가
				commentList.append(div);
				}
			});
		}
		else {
			alert("코멘트를 작성해주세요.");
		}
	});
} submitCmt();
