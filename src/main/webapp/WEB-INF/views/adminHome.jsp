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
	<!--ctrl + alt ȭ��ǥ ����   -->
	<div id="container">
		<header>
		<div class="head"><p>OKEEDOKEE - ������������</p></div>
		</header>
		<main>
			<aside>
				<ul>
					<li><h1>�����ڸ��</h1></li>
					<li><h2 class="red">Home</h2></li>
					<li><h2><a href="adminMember">ȸ������</a></h2></li>
					<li><h2><a href="adminReport">�Ű����</a></h2></li>
					<li><h2><a href="adminCalendar">��������</a></h2></li>
				</ul>
				<br />
				<span><a href="${pageContext.request.contextPath}/main">��������</a></span>
			</aside>
			<section>
				<div class="box">
					<div>
						<h1>${total+="��"}</h1>
						<h2>ȸ����</h2>
					</div>
					<div>
						<%-- <h1>${(money == null)? "0":money}</h1>  ���׵� �����ϳ� �����ϰ� �����ڷ� �⺻�� 0����--%>
						<h1>${money+="��"}</h1>
						<h2>�̹��� �Ŀ��ݾ�</h2>
					</div>
					<div>
						<!-- �Խñ� count ���ϱ� -->
						<h1>${missing+witness+="��"}</h1>
						<h2>������/��ݱ�</h2>
					</div>
					<div>
						<h1>${nMember+="��"}</h1>
						<h2>�ű�ȸ��</h2>
					</div>
				</div>
				<div class="chart">
					<!-- ������ ���� ũ������X -->
					<svg viewBox="0 0 1200 300"></svg>
				</div>
			</section>
		</main>
	</div>
	<script type="text/javascript">
	$(function(){
	$.ajax({
		//��û�� ���� �ּ�
		url : '${pageContext.request.contextPath}/admin/ajax',
		// ������ ���� ���
		type: "post",
		// ������ ������ Ÿ��
        contentType: "application/json; charset=utf-8",
        // �������� �޾ƿ� ������ ����
        dataType: "json",
        //������ ����� �Ű������� �޾Ƽ�
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