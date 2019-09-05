<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<title>Document</title>
	
</head>
<style>
	*{
		margin: 0px;
		padding: 0px;
		box-sizing: border-box;
	}



.box0{
	position: absolute;
	width: 1440px;
	left: 50%;
	transform: translate(-50%);
	
}
/* 1단 시작 */

.box1{
	height: 150px;
	position: absolute;
	width: 100%;
	color:gray	
}


.box1-1{
	left: 74%;
	position: relative;
	width: 280px;
	margin: 0px;
	}

/*네비 안에 있는 글자 숨기기*/
.box1-openNav {
  height: 100%;
  width: 0;
  position: fixed;
  top: 0;
  right: 0%;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
	z-index: 1;
}

/*네비 안에 있는 글자들 설정*/
.box1-openNav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
	z-index: 1;
}

/*네비안에 글자 호버효과*/
.box1-openNav a:hover {
  color: red;
}

/*클로즈 버튼*/
.box1-openNav .box1-close {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

.title{
	position: absolute;
	
	width: 266px;
	height: 48px;
	left: 50%; top:15%; 
	transform: translate(-50%);
	cursor: pointer;
	background-image: url(<%=request.getContextPath()%>/resources/img/topLogo.png);
}

.bgBox{
	width: 100%;
	height: 100%;
	background-image: url(<%=request.getContextPath()%>/resources/img/bg.png);
}

/* 1단 끝 */
/* 2단 시작 */
.box2{
	position: absolute;
	width: 100%; height: 550px;
	top: 22%;
	overflow: hidden;
}

.box2-1{
width: 650px;
left: 50%;
top: 20%;
transform: translate(-50%);
position: relative;
text-align: center;
}

.box2-2{
	position:relative;
	left: 42%; top:30%;
	width: 500px;
	padding: 0px;
	}

.box2-3{
	position: relative;
	left: 42%; top: 50%;
	
}

.box2-3-a{
	cursor: pointer;
	/* text-decoration: none; */
	color: white;
}

/* 2단 끝 */

/* 3단 시작 */
.box3{
	width: 100%; height: 150px;
	position: absolute;
	top: 98%;
}

/* .bBox3-b0{
	position: relative;
	left: 50%;
	transform: translate(-50%);
} */

.box3-1{
position: relative;
left: 5%;
}

.box3-2{
position: relative;
left: 5%;
}
/* 3단 끝 */

/* 공용 시작 */
.public-font1{
color: white;
}

.public-font2{
	float: left;
	color: gray;
	width: 650px;
}

.public-line{
	/* border: 1px blue solid; */
}
/* 공용 끝 */

/* 바탕화면이미지 시작*/
.bgBox-frame{
	/* border: 1px solid magenta; */
	left: 50%;
	/* width: 1440px; */
	height: 890px;
}

.bg{
	width: 100%; height: 100%;
}
/* 바탕화면이미지 끝*/



</style>
<body >
<!-- 바탕화면이미지 -->
<div class="bg" >
<div class="box0">
	<div class="bgBox-frame">
		<div class="bgBox" onclick="closeNav()"></div>
	</div>
</div>

	<!-- 1단 -->
<div class="box1 public-line">
	<div class="title "><a href="#"></a></div>

	<div class="box1-1" style="vertical-align:80% ">
		<!-- 드롭다운 시작-->
		<button type="button" class="btn btn-danger"  onclick="openNav()">
			<a href="javascript:void(0)"><i class="fas fa-align-justify" style="color: white;"></i></a>
		</button>

		<div id="box1-nav" class="box1-openNav">
			<a href="javascript:void(0)" class="box1-close" onclick="closeNav()">&times;</a>
			<a href="<%=request.getContextPath()%>/board/list">추천공포</a>
			<a href="<%=request.getContextPath()%>/board/list">오컬트</a>
			<a href="<%=request.getContextPath()%>/board/list">인형</a>
			<a href="<%=request.getContextPath()%>/board/list">좀비</a>
			<a href="<%=request.getContextPath()%>/board/list">범죄</a>
			<a href="<%=request.getContextPath()%>/board/list">미스테리</a>
			<a href="<%=request.getContextPath()%>/board/list">고어</a>
		</div>

		
		<!-- 드롭다운 끝-->
		<button type="button" class="btn btn-danger"><b>Language</b></button>
		<a href="<%=request.getContextPath()%>/signin"><button type="button" class="btn btn-danger"><b>Login</b></button></a>
		</div>	
</div>


	<!-- 2단 -->
<div class="box2 public-line">
	<div class="box2-1">
		<h1 class="public-font1"><b>언제 어디서나 공포영화를 자유롭게</b></h1>
		<h3 class="public-font1"><b>HORROR-Q의 모든것! 무료입니다</b></h3>
	</div>

	<div class="box2-2">
		<a href="<%=request.getContextPath()%>/board/mainList"><button type="button" class="btn btn-danger"><h3><b>둘　러　보　기</b></h3></button></a>
	</div>

	<div class="box2-3">
		<h5 class="public-font1">회원이 아니세요? <a  href="<%=request.getContextPath()%>/signup"><i><ins class="box2-3-a">회원가입</ins></i></a></h5>
	</div>
</div>

<!-- 3단 -->

<div class="box3 public-line">
	<div class="box3-0">
	<div class="box3-1 public-font2">
			콘텐츠산업진흥법에 의한 표시<br><br>
			① 콘텐츠의 명칭 : 영상서비스<br>
			② 콘텐츠의 제작 및 표시 : 2019년 3월 29일 (갱신된 콘텐츠의 경우 갱신일)<br>
			③ 콘텐츠의 제작자 : HORROR-Q NKsoft<br>
			④ 콘텐츠의 이용조건 : 이용약관 참조 (동의없이 무단복제 및 가공을 금함)<br>
	</div>
	<div class="box3-2 public-font2">
			<br>
			<br>
			서울시 서초구 서초대로 308 동익성봉빌딩 16층 <br>
			사업자등록번호 : 110-81-34877<br>
			통신판매업 신고번호 : 2016-서울서초-0280호<br>
			
			직업정보제공사업 신고번호 : 서울청 제2016-77호<br>
	</div>
	</div>
</div>

<!-- 클래스 bg의 끝 -->
</div>

<script>
	function openNav() {
		document.getElementById("box1-nav").style.width = "300px"
	}
	
	function closeNav() {
		document.getElementById("box1-nav").style.width = "0";
		document.body.style.backgroundColor = "white";
	}
	</script>
</body>
</html>