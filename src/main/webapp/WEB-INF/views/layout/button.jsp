<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.button {
  width: 180px;
  height: 60px;
  position: relative;
}

.btn {
  width: 180px;
  height: 60px;
  cursor: pointer;
  background: transparent;
  border: 1px solid #FBD157;
  outline: none;
  transition: 1s ease-in-out;
}

svg {
  position: absolute;
  left: 0;
  top: 0;
  fill: none;
  stroke: #fff;
  stroke-dasharray: 150 480;
  stroke-dashoffset: 150;
  transition: 1s ease-in-out;
}

.btn:hover {
  transition: 1s ease-in-out;
  background: #FBD157;
}

.btn:hover svg {
  stroke-dashoffset: -480;
}

.btn span {
  color: black;
  font-size: 18px;
  font-weight: 100;
}
</style>
</head>
<body>
 	<div class="button">
       <button class="btn">
         <svg width="180px" height="60px" viewBox="0 0 180 60" class="border">
           <polyline points="179,1 179,59 1,59 1,1 179,1" class="bg-line" />
           <polyline points="179,1 179,59 1,59 1,1 179,1" class="hl-line" />
         </svg>
         <span>시작하기</span>
       </button>
    </div>
</body>
</html>