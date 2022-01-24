/**
 * 
 */

//글읽기 사진 슬라이더
function showSlider() {
	//초기화 리스트 (이미지, 인덱스 초기넘버)
	let imgs = document.querySelectorAll(".mySlides");
	//console.log(imgs.length);
	//console.log(imgs);
	let dotbox = document.querySelector(".dotbox");
	let num = 0;

	if (imgs.length > 0) {
		//이미지 갯수만큼 dot 생성하기
		createDots();

		//슬라이드 초기 설정
		showSlides(num);

		//dot클릭시 슬라이드 이동
		clickDots();

	}
	function createDots() {
		for (let i = 0; i < imgs.length; i++) {
			let tagForDot = document.createElement("span");
			tagForDot.classList.add("dot");
			tagForDot.setAttribute("data-num", i);
			dotbox.append(tagForDot);
		}
	}

	function showSlides(n) {
		let dots = document.querySelectorAll(".dot");
		for (let i = 0; i < imgs.length; i++) {
			imgs[i].style.display = "none";
			dots[i].classList.remove("active");
		}
		imgs[n].style.display = "block";
		dots[n].classList.add("active");
	
	}

	function clickDots() {
		let dots = document.querySelectorAll(".dot");
		for (let i = 0; i < dots.length; i++) {
			dots[i].addEventListener("click", function() {
				showSlides(dots[i].dataset.num);
			});

		}
	}

} showSlider();


//코멘트 가져오기
function getCmmt() {
	//게시글 번호
	const num = document.querySelector("#bnum").value;
	
	//게시글에 해당하는 댓글 보여지게 만들기
	$.ajax({
		url: "getCmt/"+num,
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
				//작성자 아이디
				const h5 = document.createElement("h5");
				h5.innerText = item.id;
				//댓글 내용
				const p = document.createElement("p");
				p.innerText = item.cmt;

				//본인이 작성한 댓글의 삭제버튼만 나타나도록
				if (userId == item.id) {
					//삭제버튼
					const button = document.createElement("button");
					button.id = "cmtDelete"
					button.innerText = "삭제"
					

					//버튼에 이벤트 추가
					button.addEventListener("click", function() {
						//alert("삭제완.");
						let yn = confirm("삭제고?");
						console.log(yn);

						//삭제 true면
						if (yn) {
							//commentData 에 item.num을 넣어준다! 즉 게시글의 번호를 넣어준다
							commentData = { num: item.num };

							//ajax를 통해 전달
							$.ajax({
								url: "${pageContext.request.contextPath}/comment/delete",
								type: "DELETE",
								data: JSON.stringify(commentData),
								contentType: "application/json; charset=utf-8",
								dataType: "json",
								success: function() {
									console.log("삭제 완.");
								}
							});
						}
					});

					//div안에 생성된 버튼 삽입
					div.append(button);
				}


				//div안에 생성된 내용 삽입
				//버튼이 먼저 삽입됐기 때문에 버튼 위로 추가
				div.prepend(p);
				div.prepend(h3);


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
		let comment = document.querySelector("#commentCreator").value;
		let bnum = document.querySelector("#bnum").value;

		console.log(comment);

		if (comment.length > 0) {
			let commentData = { comment, bnum };

			$.ajax({
				url: "createComment",
				type: "POST",
				data: JSON.stringify(commentData),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(data) {
					console.log(data);
				}
			});
		}
		else {
			alert("코멘트를 작성해주세요.");
		}


	});
} submitCmt();


