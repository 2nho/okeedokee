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
	const bdiv = document.querySelector("#bdiv").value;
	
	console.log(num);
	console.log("getComment/"+num+"/"+bdiv);
	
	//게시글에 해당하는 댓글 보여지게 만들기
	$.ajax({
		url: "getComment/"+num+"/"+bdiv,
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
								url: "deleteComment",
								type: "DELETE",
								data: JSON.stringify(commentData),
								contentType: "application/json; charset=utf-8",
								dataType: "text",
								success: function() {
									console.log("삭제완");
									location.reload(true);
								}
							});
						}
					});

					//div안에 생성된 버튼 삽입
					div2.append(button);
				}
				
					
				if(userId != item.id) {
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
				url: "createComment",
				type: "POST",
				data: JSON.stringify(commentData),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(data) {
					console.log(data);					
					location.reload(true);
				}
			});
		}
		else {
			alert("코멘트를 작성해주세요.");
		}
	});
} submitCmt();


