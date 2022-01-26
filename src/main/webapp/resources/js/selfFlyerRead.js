/**
 * 
 */
//전단지 프린트
function printFlyer() {
	const printBtn = document.querySelector("#printBtn");

	printBtn.addEventListener("click", function() {

		//프린트
		window.print();
		//페이지 새로고침
		location.reload();

	});

} printFlyer();




//코멘트 가져오기
function getCmmt() {
	//게시글 번호
	const num = document.querySelector("#bnum").value;
	const bdiv = document.querySelector("#bdiv").value;

	console.log(num);
	console.log("getFlyerComment/" + num + "/" + bdiv);

	//게시글에 해당하는 댓글 보여지게 만들기
	$.ajax({
		url: "getFlyerComment/" + num + "/" + bdiv,
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

				div.classList.add("cmt");
				div2.classList.add("cmtInform");

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


				//본인이 작성한 댓글의 삭제버튼만 나타나도록
				if (userId == item.id) {
					//삭제버튼
					const button = document.createElement("button");
					button.classList.add("cmtDelete");
					button.innerText = "삭제"


					//버튼 클릭시 댓글 삭제
					button.addEventListener("click", function() {
						let yn = confirm("댓글을 삭제하시겠습니까?");
						console.log(yn);

						//삭제 true면
						if (yn) {
							//commentData 에 item.num을 넣어준다! 즉 게시글의 번호를 넣어준다
							commentData = { num: item.num, bdiv: bdiv };

							//ajax를 통해 전달
							$.ajax({
								url: "deleteFlyerComment",
								type: "DELETE",
								data: JSON.stringify(commentData),
								contentType: "application/json; charset=utf-8",
								dataType: "text",
								success: function() {
									console.log("삭제완");
									//새로고침 방법은 트래픽 증가 BUT 사용은 되는 방법임	
									//location.reload(true);

									//동적 삭제
									div.remove();
								}
							});
						}
					});

					//div안에 생성된 버튼 삽입
					div2.append(button);
				}


				if (userId != item.id) {
					//신고버튼
					const report = document.createElement("button");
					report.classList.add("cmtReport");
					report.innerText = "신고";

					/*report.addEventListener("click", function(){
						location.href =  "report/"
					});*/

					div2.append(report);
				}

				//div안에 생성된 내용 삽입
				//버튼이 먼저 삽입됐기 때문에 버튼 위로 추가
				div2.prepend(h5);

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
		let bdiv = document.querySelector("#bdiv").value;

		console.log(cmt);

		if (cmt.length > 0) {
			let commentData = { cmt, bnum, bdiv };

			$.ajax({
				url: "createFlyerComment",
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

					div.classList.add("cmt");
					div2.classList.add("cmtInform");

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
					const button = document.createElement("button");
					button.classList.add("cmtDelete");
					button.innerText = "삭제"


					//버튼 클릭시 댓글 삭제
					button.addEventListener("click", function() {
						let yn = confirm("댓글을 삭제하시겠습니까?");
						console.log(yn);

						//삭제 true면
						if (yn) {
							//commentData 에 item.num을 넣어준다! 즉 게시글의 번호를 넣어준다
							commentData = { num: data.num, bdiv: bdiv };

							//ajax를 통해 전달
							$.ajax({
								url: "deleteComment",
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
					div2.append(button);

					//div안에 생성된 내용 삽입
					//버튼이 먼저 삽입됐기 때문에 버튼 위로 추가
					div2.prepend(h5);

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



function resizeFont() {
	let characters = document.getElementById("characters");
	let locations = document.getElementById("location");

	//글자수 20자리 이상시 fontSize = 20px
	if (locations.value.length >= 20) {
		locations.style.fontSize = "20px";
	}
	else if (locations.value.length >= 30) {
		locations.style.fontSize = "17px";
	}

	if (characters.value.length >= 20) {
		characters.style.fontSize = "20px";
	}
	else if (characters.value.length >= 30) {
		characters.style.fontSize = "17px";
	}
} resizeFont();
