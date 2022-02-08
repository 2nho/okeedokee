<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminHome</title>
<link href="../css/layout.css" rel="stylesheet" />
<link href="../css/adminHome.css" rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://d3js.org/d3.v7.min.js"></script>
</head>

<body>
	<!--ctrl + alt 화살표 복사   -->
	<div id="container">
		<header>
		<div class="head"><p>OKEEDOKEE - 관리자페이지</p></div>
		</header>
		<main>
			<aside>
				<ul>
					<li><h1>관리자모드</h1></li>
					<li><h2 class="red">Home</h2></li>
					<li><h2><a href="adminMember">회원관리</a></h2></li>
					<li><h2><a href="adminReport">신고관리</a></h2></li>
					<li><h2><a href="adminCalendar">일정관리</a></h2></li>
				</ul>
				<br />
				<span><a href="${pageContext.request.contextPath}/main">메인으로</a></span>
			</aside>
			<section>
				<div class="box">
					<div>
						<h1>${total+="명"}</h1>
						<h2>회원수</h2>
					</div>
					<div>
						<%-- <h1>${(money == null)? "0":money}</h1>  삼항도 가능하나 간단하게 연산자로 기본값 0가능--%>
						<h1>${money+="원"}</h1>
						<h2>이번달 후원금액</h2>
					</div>
					<div>
						<!-- 게시글 count 더하기 -->
						<h1>${missing+witness+="건"}</h1>
						<h2>새실종/목격글</h2>
					</div>
					<div>
						<h1>${nMember+="명"}</h1>
						<h2>신규회원</h2>
					</div>
				</div>
				<div class="chart">
					<!-- 가변을 위해 크기지정X -->
					<svg viewBox="0 0 1200 300"></svg>
				</div>
			</section>
		</main>
	</div>
	<script type="text/javascript">
	$(function(){
	$.ajax({
		//요청을 보낼 주소
		url : '${pageContext.request.contextPath}/admin/ajax',
		// 데이터 전송 방법
		type: "post",
		// 전송할 데이터 타입
        contentType: "application/json; charset=utf-8",
        // 서버에서 받아올 데이터 형태
        dataType: "json",
        //성공시 결과값 매개변수로 받아서
        success: function(result) {
        	makeGraph(result);
        	/* const width = 1200;
        	const height = 300;
        	const margin = {top: 40, left: 40, bottom: 40, right: 40};
        	const svg = d3.select('svg');
        	
        	const data = result;
        	
        	const x = d3.scaleBand()
        	.domain(data.map(d => d.name))
        	.range([margin.left, width - margin.right])
        	  .padding(0.3);
        	const y = d3.scaleLinear()
        	.domain([0, d3.max(data, d => d.value)]).nice()
            .range([height - margin.bottom, margin.top]);
        	const xAxis = g => g
        	 .attr('transform', `translate(0, 260)`)
        	 .call(d3.axisBottom(x)
        	 .tickSizeOuter(0));
        	const yAxis = g => g
        	 .attr('transform', `translate(40, 0)`)
        	 .call(d3.axisLeft(y));
        	
        	svg.append('g').call(xAxis);
        	svg.append('g').call(yAxis);
        	svg.append('g')
        	  .selectAll('rect').data(data).enter().append('rect')
        	  .attr('fill', 'steelblue')
        	  .attr('x', d => x(d.name))
        	  .attr('y', d => y(d.value))
        	  .attr('height', d => y(0) - y(d.value))
        	  .attr('width', x.bandwidth()); */
        },
        error: function(err){
        	console.log(err);	
        }
        });
	});
</script>
<script type="text/javascript" src="../js/chart.js"></script>
</body>
</html>