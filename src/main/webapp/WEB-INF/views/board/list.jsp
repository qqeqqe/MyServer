<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.js"></script>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
           
<html>
<head>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/profile.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/myServerJS.js"></script>

<title>Document</title>
	
</head>
<style>
*{
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}

.box0{
	width: 100%;		height: 100%;
	position: absolute;
	background-image:url(<%=request.getContextPath()%>/resources/img/bg.png);
	z-index: -3;
}

.box1-bg1{
	width: 100%;
	height: 128px;
	border-bottom: 4px solid silver;
	background-color: black;
	opacity: 0.7;
	z-index: -1;
	position: absolute;
}

.box1-bg2{
	width: 100%;
	height: 100%;
	border-bottom: 4px solid silver;
	background-color: black;
	opacity: 0.5;
	z-index: -2;
	position: fixed;
}

.box1-1{
position: absolute;
left: 1%; top:2%; 
cursor: pointer;
}

.box1-2{
width: 300px; height: 80px;
color: whitesmoke;
transform: translate(200%,-15px);
font-size: 80px;
}

.box1-2a{
width: 300px; height: 80px;
color: whitesmoke;
transform: translate(204%,-128px);
font-size: 80px;
color: red;
}

.box1-3{
position: absolute;
left: 38%;
transform: translate(200%,-153px);
width: 300px; height: 60px;
}

.box1-4:after{content:'\25Bf';}

.box2{
	width: 100%;
	height: 55px;
	margin-top: 20px
}

.box2-0{
	margin-right: 0px;
}

.box2-1{
	width: 100px;
	margin-left: 10px;
}

.box2-3{
	width: 200px;
}

.box2-4{
	transform: translate(-23px, 0px);
	color: red;
	border-color: red;
}

.box2-4:hover, .btn-outline-info:not(:disabled):not(.disabled):active{
	background-color: red;
	border-color: red;
	color: whitesmoke;
}

.box2-5{
	position: absolute;		width: 10%;		left: 88%;    transform: translate(5px, -47px);;
}

.box3-2{
	color: white;
	text-align:center;
}

.box3-3:focus{
outline-color: red;
text-align: center;
}

.box3-5{
	margin-left: 20px;
}

.public-line{
	/* border: 1px solid magenta; */
}

.public-displayNone{
display: none;
}
 

/*사진 수정 눌렀을대 나오는 효과들*/
	.box1-9c {
		height: 165%;
		width: 275%;
		display: none;
		position: relative;
		z-index: 2;
		background-color: rgba(115,115,115, 0.9);
		transform: translate(0px,60px);
	}

	/*컨탠츠 안 박스설정*/
	.box1-9d{
		border: 1px ghostwhite solid;
		width: 102px;
		height: 112px;
		top: 12%;
		position: relative;
		left: 5%;
		float: left;
	}
	
	.box1-9e{
		position: relative;
		left: 10%; top: 10%
	}

	.box1-9f{
		position: relative;
		top: 22%; left: 17px;		
	}
	
	/*컨탠츠 안에 확인버튼*/
	.box1-9g {
		text-decoration: none;
		font-size: 16px;
		transition: 0.3s;
	}

	/*X 버튼*/
	.closebtn {
		position: absolute;
		right: 10px; top: -5px;
		font-size: 30px;
		z-index: 3;
		text-decoration: none;
		color: #ddd;
	}

	.closebtn:hover{
		text-decoration: none;
	}

	@media screen and (max-height: 450px) {
		.box1-9g {font-size: 20px}
		.closebtn {
		font-size: 40px;
		top: 15px;
		right: 35px;
		}
	}
</style>
<body >
<div class="box0" ></div>
	<div class="box1 public-line public-font">
	
	 <jsp:include page="/WEB-INF/views/common/profile.jsp"></jsp:include>
	 <!-- 프로필사진에 대한정보 -->
	 
		<div class="box1-bg1"></div>
		<div class="box1-bg2"></div>
			<a href="<%=request.getContextPath()%>/board/mainList">
			<div class="box1-1"><img src="<%=request.getContextPath()%>/resources/img/topLogo.png" alt="" width="150px" height="50px"></div></a>
			<div class="box1-2">Q n A</div>
			<div class="box1-2a">..</div>
		
			
			<div class="box1-3" >
				<a href="<%=request.getContextPath()%>/board/register">
				<button type="button" class="btn btn-danger" style="font-size: 20px"><i class="far fa-edit"></i></button></a>
				<a href="<%=request.getContextPath()%>/board/mainList"><button type="button" class="btn btn-danger" style="font-size: 20px"><i class="fas fa-home"></i></button></a>
				<button type="button" class="btn btn-danger" style="font-size: 20px"><i class="fas fa-globe"></i></button>
				<c:if test="${user eq null}">
					<a href="<%=request.getContextPath()%>/signin"><button type="button" class="btn btn-danger" style="font-size: 20px"><i class="fas fa-key"></i></button></a>
				</c:if>
				<c:if test="${user ne null}">
					<button type="button" class="btn btn-danger" onclick="myInFo()" id="profilePhoto"><b class="box1-4">${user.name}</b></button>			
				</c:if>
			</div><!-- box1-3 끝부분 -->
	</div><!-- box1 끝부분 -->
					
	<div class="box2 public-line public-font">
			<form action="" method="get" class="row mb-2 mt-2 box2-0">
				<div class="form-group col-1 mb-0">
					<select class="form-control box2-1" name="type">
						<option value="0" >선택</option>
						<!-- <c:if test="${pageMaker.criteria.type == 0 }">selected</c:if> -->
						<option value="1" >제목</option>
						<option value="2" >작성자</option>
						<option value="3" >내용</option>
					</select>
				</div>
				<div class="form-group col-2 mb-0 box2-2">
					<input type="text" class="form-control box2-3" name="search" value="">
				</div>
				<button type="submit" class="btn btn-outline-info box2-4" >검색</button>
			</form>

			<div class="box2-5">
				<select class="form-control box2-6" id="perPageNum">
					<option <c:if test="${pageMaker.criteria.perPageNum == 0}" >selected</c:if> value="0">0page</option>
					<option <c:if test="${pageMaker.criteria.perPageNum == 5}" >selected</c:if> value="5">5page</option>
					<option <c:if test="${pageMaker.criteria.perPageNum == 10}">selected</c:if> value="10">10page</option>
					<option <c:if test="${pageMaker.criteria.perPageNum == 20}">selected</c:if> value="20">20page</option>
				</select>
			</div>
	</div><!-- box2의 끝 -->

	<div class="box3 public-line public-font">
		<div class="box3-1">
			<table class="table box3-2">
				<tr class="box3-3">
					<th width="10%">번호</th>
					<th width="40%">제목</th>
					<th width="20%">작성자</th>
					<th width="20%">등록일</th>
					<th width="10%">조회수</th>
				</tr>
				<c:forEach var="board" items="${list}">
					<tr>
						<th>${board.num}</th>
						<th><a href="<%=request.getContextPath()%>/board/display?num=${board.num}">${board.title}</a></th>
						<th>${board.writer}</th>
						<th>${board.registered}</th>
						<th>${board.views}</th>
					</tr>
				</c:forEach>
			</table>
		</div><!-- box3-1 의 끝 -->
		
		<div class="box3-4">
				<!-- 일반적인페이지네이션 -->	
				<ul class="pagination" style="justify-content: center;">
					<c:if test="${pageMaker.prev}">
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.startPage-1}&perPageNum=${pageMaker.criteria.perPageNum}"><i class="fas fa-angle-left"></i></a> 
						</li>
					</c:if>
						
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage}" var="index">
						<!-- 이부분은 페이지 네비에 현재 이용중인 페이지에 색을 입히는 코드 -->
						<c:if test="${pageMaker.criteria.page == index }">
							<li class="page-item active" >
								<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a> 
							</li>
						</c:if>
								
						<c:if test="${pageMaker.criteria.page != index }">
							<li class="page-item" >
								<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${index}&perPageNum=${pageMaker.criteria.perPageNum}">${index}</a> 
							</li>
						</c:if>
					</c:forEach>
					<!-- end -->
						
					<c:if test="${pageMaker.next}">
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.endPage+1}&perPageNum=${pageMaker.criteria.perPageNum}"><i class="fas fa-angle-right"></i></a> 
						</li>
					</c:if>
				</ul>
		</div><!-- box3-4 의 끝 -->
			<div class="box3-5">
				<a href="<%=request.getContextPath()%>/board/register">
						<button type="button" class="btn btn-danger"><i class="far fa-edit"></i> 등록</button>
				</a>
		</div>
	</div><!-- box3 의 끝 -->
	
<script>
</script>
</body>
</html>