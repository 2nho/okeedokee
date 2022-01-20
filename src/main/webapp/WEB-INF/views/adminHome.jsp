<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminHome</title>
<link href="css/layout.css" rel="stylesheet" />
<link href="css/adminHome.css" rel="stylesheet" />
<script src="https://d3js.org/d3.v7.min.js"></script>
</head>
<body>
	<!--ctrl + alt ȭ��ǥ ����   -->
	<div id="container">
		<header></header>
		<main>
			<aside>
				<ul>
					<li><h2>�����ڸ��</h2></li>
					<li><h3>Home</h3></li>
					<li><h3>ȸ������</h3></li>
					<li><h3>�Խñ۰���</h3></li>
					<li><h3>�����ڰ���</h3></li>
					<li><h3>�Ű����</h3></li>
					<li><h3>���ǻ��� �亯</h3></li>
				</ul>
			</aside>
			<section>
				<div class="box">
					<div>
						<h1>${352}</h1>
						<h2>ȸ����</h2>
					</div>
					<div>
						<h1>${132123}</h1>
						<h2>�̹��� �Ŀ��ݾ�</h2>
					</div>
					<div>
						<h1>${12}</h1>
						<h2>�Ծ�Ǽ�</h2>
					</div>
					<div>
						<h1>${21}</h1>
						<h2>�ű�ȸ��</h2>
					</div>
				</div>
				<div class="chart"></div>
			</section>
		</main>
	</div>
	<script>
// svg �ڽ��� �����ϱ� ���� ���� ���� ���� ���� ��
const width = 800;
const height = 300;
const margin = {top: 40, left: 40, bottom: 40, right: 40};

// svg �� ���� ������ ������ �ְ� body�±׿� ����
const svg = d3.select('.chart').append('svg').style('width', width).style('height', height);

// data�� db���� �̾ƿ;���
const data = [
    {name: '1��', value: 10},
    {name: '2��', value: 29},
    {name: '3��', value: 32},
    {name: '4��', value: 25},
    {name: '5��', value: 23},
    {name: '6��', value: 15},
    {name: '7��', value: 10},
    {name: '8��', value: 29},
    {name: '9��', value: 32},
    {name: '10��', value: 25},
    {name: '11��', value: 23},
    {name: '12��', value: 15}
  ];
 
/* data = [1, 2, 3, 4, 5] ���� ������ �����Ͱ� �ְ�

����ϰ��� �ϴ� ��Ʈ SVG �ʺ� 100px�̶�� �ϸ�,

    .domain([1,5])

    .range([1,100]) �� �ȴ�. */

//�ð�ȭ�� �������� �� domain 
// �ݿ��� �� range

// scaleband = x�� , scaleLinear = y��
// ������ ���ڿ����� scaleBand, �Ϲ� ���ڰ��� scaleLinear�� ����Ѵ�.
const x = d3.scaleBand()
//.domain(data.map(function(d){return d.name}); �迭
//scaleband.domain(�迭)
  .domain(data.map(d => d.name))
  // marin left�� margin right�� �� ����
  .range([margin.left, width - margin.right])
  .padding(0.3);

 
 //d3.scale.linear - ������ ���� ������(��ô)�� �����Ѵ�
const y = d3.scaleLinear()
// nice() �ݿø��� ���� ���� �̻ڰ�
// .domain(0,max)
  .domain([0, d3.max(data, d => d.value)]).nice()
    .range([height - margin.bottom, margin.top]);
 //g ������� 
 /* �׷��� ��
    �ٸ� ���� ��Ҹ� ��� ����
    Ʈ������ ��� ���밡�� 
    */
 /* call 
 	���õ� ������ ������ �ҷ���
 */   
 
 //axis ������
const xAxis = g => g
// transform: translate(0,���̿����������Ұ�������)
//                      x�� y��
  .attr('transform', `translate(0, 260)`)
  // bottom x���� �Ʒ�
  .call(d3.axisBottom(x)
		  //�����׵θ� �� �׵θ� ���� 
    .tickSizeOuter(0));
 
const yAxis = g => g
/*�޷� ``(��ƽ)  el�� jstl �� ��ġ�⶧���� jsp�󿡼��� �޷�{height - margin-left} �� �Ұ�  */
 // ����ʹٸ� $ �տ� \ ���̱�
  .attr('transform', `translate(40, 0)`)
  // left y���� ���ʿ�
  .call(d3.axisLeft(y));
  //.call(g => g.select('.domain').remove()); ������ 
 

 
svg.append('g').call(xAxis);
svg.append('g').call(yAxis);
svg.append('g')
  // rect �� date ���ε� ������ rect����
  .selectAll('rect').data(data).enter().append('rect')
  //svg ���� fill ä�� ��
  .attr('fill', 'steelblue')
  // x position ���� �� x ��ǥ   ���� 1 name?
  .attr('x', d => x(d.name))
  // y position ���� �� y��ǥ
  .attr('y', d => y(d.value))
  // ���� ����  ����2 y(0) ��?
  .attr('height', d => y(0) - y(d.value))
  // ����   banwidth() ������ bar ���� ��ȯ
  .attr('width', x.bandwidth());
// selection.node() function in D3.js is used to return the first element in the selection.
//svg.node();
</script>
</body>
</html>