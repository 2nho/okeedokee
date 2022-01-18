<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://d3js.org/d3.v7.min.js"></script>
</head>
<body><script>
const width = 400;
const height = 400;
const margin = {top: 40, left: 40, bottom: 40, right: 40};

const svg = d3.select('body').append('svg').style('width', width).style('height', height);

const data = [
    {name: 'a', value: 10},
    {name: 'b', value: 29},
    {name: 'c', value: 32},
    {name: 'd', value: 25},
    {name: 'e', value: 23},
    {name: 'f', value: 15}
  ];
 
const x = d3.scaleBand()
  .domain(data.map(d => d.name))
  .range([margin.left, width - margin.right])
  .padding(0.2);
 
const y = d3.scaleLinear()
  .domain([0, d3.max(data, d => d.value)]).nice()
    .range([height - margin.bottom, margin.top]);
 
const xAxis = g => g
  .attr('transform', `translate(0, ${height - margin.bottom})`)
  .call(d3.axisBottom(x)
    .tickSizeOuter(0));
 
const yAxis = g => g
  .attr('transform', `translate(${margin.left}, 0)`)
  .call(d3.axisLeft(y))
  .call(g => g.select('.domain').remove());
 

 
svg.append('g').call(xAxis);
svg.append('g').call(yAxis);
svg.append('g')
  .attr('fill', 'steelblue')
  .selectAll('rect').data(data).enter().append('rect')
  .attr('x', d => x(d.name))
  .attr('y', d => y(d.value))
  .attr('height', d => y(0) - y(d.value))
  .attr('width', x.bandwidth());

svg.node();
</script>
</body>
</html>