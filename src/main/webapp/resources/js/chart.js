// svg 박스를 설정하기 위한 높이 넓이 마진 설정 값
// 이였으나 가변을 위해 x축 y축 그래프를 위한 값으로 
const width = 1500;
const height = 250;
const margin = {top: 40, left: 40, bottom: 40, right: 40};

// svg 에 위에 설정한 값들을 넣고 body태그에 삽입
//const svg = d3.select('.chart').append('svg').style('width', width).style('height', height);
 const svg = d3.select('svg');
// data를 db에서 뽑아와야함
function makeGraph(result){
			const width = 1200;
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
        	  .attr('fill', '#cb7f2b')
        	  .attr('x', d => x(d.name))
        	  .attr('y', d => y(d.value))
        	  .attr('height', d => y(0) - y(d.value))
        	  .attr('width', x.bandwidth());
};
//const data = ;   
/*[
    {name: '1월', value: 10},
    {name: '2월', value: 29},
    {name: '3월', value: 32},
    {name: '4월', value: 25},
    {name: '5월', value: 23},
    {name: '6월', value: 15},
    {name: '7월', value: 10},
    {name: '8월', value: 29},
    {name: '9월', value: 32},
    {name: '10월', value: 25},
    {name: '11월', value: 23},
    {name: '12월', value: 15}
  ];*/
/* data = [1, 2, 3, 4, 5] 값을 가지는 데이터가 있고

출력하고자 하는 차트 SVG 너비가 100px이라고 하면,

    .domain([1,5])

    .range([1,100]) 이 된다. */

//시각화할 데이터의 값 domain 
// 반영할 값 range

// scaleband = x축 , scaleLinear = y축
// 고정된 문자열에는 scaleBand, 일반 숫자값은 scaleLinear을 사용한다.
const x = d3.scaleBand()
//.domain(data.map(function(d){return d.name}); '배열'
//scaleband.domain(배열)
  .domain(data.map(d => d.name))
  // marin left와 width에서 margin right을 뺀 길이
  .range([margin.left, width - margin.right])
  .padding(0.3);

 
 //d3.scale.linear - 정량적 선형 스케일(축척)을 생성한다
const y = d3.scaleLinear()
// nice() 반올림을 통해 축을 이쁘게
// .domain(0,max) '범위'
  .domain([0, d3.max(data, d => d.value)]).nice()
    .range([height - margin.bottom, margin.top]);
 //g 문서요소 
 /* 그룹을 뜻
    다른 문서 요소를 담는 역할
    트랜스폼 요소 적용가능 
    */
 /* call 
 	선택된 변수의 내용을 불러옴
 */   
 
 //axis 단위값
const xAxis = g => g
// transform: translate(0,높이에서마진바텀값을뺀값)
//                      x축 y축
  .attr('transform', `translate(0, 260)`)
  // bottom x축을 아래
  .call(d3.axisBottom(x)
		  //시작테두리,끝 테두리 길이 
    .tickSizeOuter(0));
 
const yAxis = g => g
/*달러 ``(백틱)  el과 jstl 과 겹치기때문에 jsp상에서는 달러{height - margin-left} 등 불가  */
 // 쓰고싶다면 $ 앞에 \ 붙이기
  .attr('transform', `translate(40, 0)`)
  // left y축을 왼쪽에
  .call(d3.axisLeft(y));
  //.call(g => g.select('.domain').remove()); 선제거 
 

 
svg.append('g').call(xAxis);
svg.append('g').call(yAxis);
svg.append('g')
  // rect 에 date 바인딩 없으면 rect생성
  .selectAll('rect').data(data).enter().append('rect')
  //svg 에서 fill 채울 색
  .attr('fill', 'steelblue')
  // x position 왼쪽 위 x 좌표   질문 1 name?
  .attr('x', d => x(d.name))
  // y position 왼쪽 위 y좌표
  .attr('y', d => y(d.value))
  // 높이 설정  질문2 y(0) 값?
  .attr('height', d => y(0) - y(d.value))
  // 넓이   banwidth() 각각의 bar 넓이 반환
  .attr('width', x.bandwidth());
// selection.node() function in D3.js is used to return the first element in the selection.
//svg.node();