/**
 * 
 */
 
 
//코멘트 가져오기
function getCmmt() {
	//게시글 번호
	const bnum = document.querySelector("#bnum").value;

	console.log(bnum);
	console.log("getVolte/" + bnum);

	//게시글에 해당하는 댓글 보여지게 만들기
	$.ajax({
		url: "getVolte/" + bnum ,
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

				//봉사할 기간
				const p = document.createElement("p");
				p.innerText = "신청기간 : " + item.dateFrom + " ~ " +item.dateTo;
				p.classList.add("cmtContent");
				
				//연락처
				const ph = document.createElement("p");
				ph.innerText = "연락처 : " + item.phNum;
				p.classList.add("cmtContent");


				//본인이 작성한 댓글의 삭제버튼만 나타나도록
				if (userId == item.id) {
					//삭제버튼
					const delBtn = document.createElement("button");
					delBtn.classList.add("cmtDelete");
					delBtn.innerText = "삭제"


					//버튼 클릭시 댓글 삭제
					delBtn.addEventListener("click", function() {
						let yn = confirm("신청 내역을 삭제하시겠습니까?");
						console.log(yn);

						//삭제 true면
						if (yn) {
							//commentData 에 item.num을 넣어준다! 즉 게시글의 번호를 넣어준다
							commentData = { num: item.num };

							//ajax를 통해 전달
							$.ajax({
								url: "deleteVolte",
								type: "DELETE",
								data: JSON.stringify(commentData),
								contentType: "application/json; charset=utf-8",
								dataType: "json",
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
					
				}

				//div안에 생성된 내용 삽입
				//버튼이 먼저 삽입됐기 때문에 버튼 위로 추가
				div2.prepend(h5);
				div2.append(div3);

				div.append(div2);
				div.append(date);
				div.append(p);
				div.append(ph);

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
		let mnum = document.querySelector("#mnum").value;
		let id = document.querySelector("#sessionId").value;
		let bnum = document.querySelector("#bnum").value;
		let careName = document.querySelector("#careName").value;
		let dateFrom = document.querySelector("#dateFrom1").value;
		let dateTo = document.querySelector("#dateTo1").value;
		let phNum = document.querySelector("#phNum").value;

		console.log(dateFrom);
		console.log(dateTo);

		if (dateFrom.length > 0 && dateTo.length > 0) {
			let commentData = { mnum, id, bnum, careName, dateFrom, dateTo, phNum };

			$.ajax({
				url: "createVolte",
				type: "POST",
				data: JSON.stringify(commentData),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(data) {
					console.log(data);
					//새로고침 방법은 트래픽 증가 BUT 사용은 되는 방법임					
					//location.reload(true);

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

					//봉사 기간 내용
					const p = document.createElement("p");
					p.innerText = "신청기간 : " + data.dateFrom + " ~ " + data.dateTo;
					p.classList.add("cmtContent");

					//연락처
					const ph = document.createElement("p");
					ph.innerText = "연락처 : " + data.phNum;
					p.classList.add("cmtContent");
					
					//삭제버튼
					const delBtn = document.createElement("button");
					delBtn.classList.add("cmtDelete");
					delBtn.innerText = "삭제"


					//버튼 클릭시 댓글 삭제
					delBtn.addEventListener("click", function() {
						let yn = confirm("신청내역을 삭제하시겠습니까?");
						console.log(yn);
						console.log("즉삭번호1"+data.num);
						
						//삭제 true면
						if (yn) {
							//commentData 에 item.num을 넣어준다! 즉 게시글의 번호를 넣어준다
							commentData = { num: data.num };
							console.log("즉삭번호2"+data.num);

							//ajax를 통해 전달
							$.ajax({
								url: "deleteVolte",
								type: "DELETE",
								data: JSON.stringify(commentData),
								contentType: "application/json; charset=utf-8",
								dataType: "json",
								success: function(data) {
									console.log("삭제완");
									console.log(data);
									//동적 삭제
									div.remove();
								}
							});
						}
					});

					//div안에 생성된 버튼 삽입
					div3.append(delBtn);
					
					//div안에 생성된 내용 삽입
					//버튼이 먼저 삽입됐기 때문에 버튼 위로 추가
					div2.prepend(h5);
					div2.append(div3);

					div.append(div2);
					div.append(date);
					div.append(p);
					div.append(ph);

					//commentList안에 div추가
					commentList.append(div);
				}
			});
		}
		else {
			alert("봉사 일정을 작성해주세요.");
		}
	});
} submitCmt();
