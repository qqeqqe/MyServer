<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.js"></script>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
           
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainList.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<html>
<head>
	<title>게시판 리스트</title>

	
		</head>
		<body>
		<div class="box0"></div>

	<div class="boxFrame">
	
	<!-- box1에 대한 링크값 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	
		<div class="box2 public-line public-font">
			<div class="box2-0">
				<div class="box2-0a public-box" onclick="openTap(event, 'a1')">추천공포 </div>
				<div class="box2-0b public-box" onclick="openTap(event, 'a2')">오컬트</div>
				<div class="box2-0c public-box" onclick="openTap(event, 'a3')">인형</div>
				<div class="box2-0d public-box" onclick="openTap(event, 'a4')">좀비</div>
				<div class="box2-0e public-box" onclick="openTap(event, 'a5')">범죄</div>
				<div class="box2-0f public-box" onclick="openTap(event, 'a6')">미스테리</div>
				<div class="box2-0g public-box" onclick="openTap(event, 'a7')">고어</div>
				<a href="<%=request.getContextPath()%>/board/freeBoard" id="box2-0h"><div class="box2-0h public-box" >자유게시판</div></a>
				
				<div class="box2-8">
				<form class="search" action="/action_page.php" style="max-width:300px">
					<input type="text" placeholder="검색" name="search2" class="inPocus">
					<button type="submit"><i class="fa fa-search"></i></button>
				</form>				
				</div>
			</div>
		</div>

		<div class="box3 public-line public-font">
			<div class="public-hidden" id="a1">
				<div class="public-box2">몰 볼까? 걱정되시죠? Horror-Q에서 제일많이보신영화를 보여드려요</div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/c1.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">꼭두각시<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>				
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/d1.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">애나벨:집으로<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/d3.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">애나벨:인형의주인<br>　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/g3.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">큐브<br>　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m5.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">팔로우<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m12.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">오큘러스<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o2.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">컨저링<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>

				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o4.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">곡성<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o11.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">식스센스<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/z2.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">강시<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				</div>

			<div class="public-hidden" id="a2">
			<div class="public-box2">귀신! 악마!! 실제로 벌어진일이나 초자연적인 현상을 보여드립니다!</div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o1.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">0.0MHz<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o2.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">컨저링<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o3.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">검은사제들<br>　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o4.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">곡성<br>　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o5.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">디아볼리칼<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o6.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">엑소시스트<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o7.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">주온2<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>

				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o8.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">여고괴담5<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o9.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">불신지옥<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o10.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">고사<br>　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o11.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">식스센스<br>　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/o12.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">디아이<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
			</div>

			<div class="public-hidden" id="a3">
			<div class="public-box2">귀엽거나 소중한 인형들이...무서운곳으로 변하는 이곳!</div>
			<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/d1.jpg" width="150px" height="200px" class="image">
				<div class="public-box1-a1"><div class="public-box1-a2">에나벨:집으로<br>　　</div></div>	
				<div class="public-box public-box3">더보기</div></div>
			<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/d2.jpg" width="150px" height="200px" class="image">
				<div class="public-box1-a1"><div class="public-box1-a2">사탄의인형<br>　　</div></div>	
				<div class="public-box public-box3">더보기</div></div>
			<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/d3.jpg" width="150px" height="200px" class="image">
				<div class="public-box1-a1"><div class="public-box1-a2">애나벨:인형의주인<br>　</div></div>	
				<div class="public-box public-box3">더보기</div></div>
			</div>

			<div class="public-hidden" id="a4">
				<div class="public-box2">스윽~ 스윽~ 다리를 질질끌며 다가오는좀비!! 좀비영화관 입니다.</div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/z1.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">새벽의저주<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/z2.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">강시<br>　	</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				</div>

				<div class="public-hidden" id="a5">
					<div class="public-box2">탕탕 ~ 총소리가 울리며 범죄가 난무하는 이곳! 범죄 스릴러 공포영화관입니다.</div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/c1.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">꼭두각시<br>　　</div></div>	
						<div class="public-box public-box3">더보기</div></div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/c2.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">마<br>　	</div></div>	
						<div class="public-box public-box3">더보기</div></div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/c3.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">미드나잇<br>미트트레인</div></div>	
						<div class="public-box public-box3">더보기</div></div>
				</div>

				<div class="public-hidden" id="a6">
					<div class="public-box2">미확인비행물체(UFO)!! 그외 초자연적인 현상을 보는곳!!</div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m1.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">암전<br>　　</div></div>	
						<div class="public-box public-box3">더보기</div></div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m2.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">폴라로이드<br>　　</div></div>	
						<div class="public-box public-box3">더보기</div></div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m8.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">사일런스<br>　</div></div>	
						<div class="public-box public-box3">더보기</div></div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m4.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">사자<br>　</div></div>	
						<div class="public-box public-box3">더보기</div></div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m5.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">팔로우<br>　　</div></div>	
						<div class="public-box public-box3">더보기</div></div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m6.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">변신<br>　　</div></div>	
						<div class="public-box public-box3">더보기</div></div>
					<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/m7.jpg" width="150px" height="200px" class="image">
						<div class="public-box1-a1"><div class="public-box1-a2">인보카머스<br>　　</div></div>	
						<div class="public-box public-box3">더보기</div></div>
				</div>

			<div class="public-hidden" id="a7">
				<div class="public-box2">피가 난자한 고어물이 보고싶은가요?</div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/g1.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">쏘우<br>　　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/g2.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">호스텔<br>　</div></div>	
					<div class="public-box public-box3">더보기</div></div>
				<div class="public-box1"><img src="<%=request.getContextPath()%>/resources/post/g3.jpg" width="150px" height="200px" class="image">
					<div class="public-box1-a1"><div class="public-box1-a2">큐브<br>　</div></div>	
					<div class="public-box public-box3">더보기</div></div>					
			</div>
		
			<div class="public-hidden" id="a8">
				<div class="public-box2">아직 준비되지 않았어요</div>
		</div>

		</div>

		<div class="box4 public-line public-font">
			<div class=" box4-1">
				<div class="pagination box4-2">
					<a href="#">&laquo;</a>
					<a href="#">1</a>
					<a class="active" href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#">6</a>
					<a href="#">&raquo;</a>
				</div>
			</div>
		</div>
		
	</div>

	<script>
		// 네비바 정리하는곳
			function openTap(evt, cityName) {
				var i, tabcontent, tablinks;
				tabcontent = document.getElementsByClassName("public-hidden");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("public-box");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(" active", "");
				}
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";
			}

		
			function myInFo() {
			$('.box1-5').toggleClass('public-displayNone');
			document.getElementById("box1-9c").style.display = "none";
			}
			
			function pfOpen() {
				document.getElementById("box1-9c").style.display = "block";
			}

			function pfclose() {
				document.getElementById("box1-9c").style.display = "none";
			}
			</script>
		</body>
		</html>