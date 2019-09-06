<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/profile.css">
<script src="<%=request.getContextPath()%>/resources/js/myServerJS.js"></script>


<body>



<div class="profileBox1-5 public-line2 public-displayNone" id="loginBox">
	<div class="profileBox1-6 public-line2"><img src="<%=request.getContextPath()%>/resources/img/icon.png"></div>
		<div class="profileBox1-7">
		<div class="profileBox1-8 public-line2">
			<div class="profileBox1-9 public-line2 ">
			
			<!-- 프로필 사진 업로드 하는곳 -->
				<div class="profileBox1-9a"><img src="<%=request.getContextPath()%>/resources/upload${user.profile}" width="100px" height="110px"></div>	
				
					<div class="profileBox1-9b"><img src="<%=request.getContextPath()%>/resources/img/porfile.png" width="34px" height="34px" onclick="pfOpen()"></div>
					
						<div id="profilePhoto" class="profileBox1-9c">
							<a href="javascript:void(0)" class="closebtn" onclick="pfclose()">&times;</a>
							<!-- 프로필 사진 임시 업로드 하는곳 -->
							<div class="profileBox1-9d"><img src="<%=request.getContextPath()%>/resources/upload${user.profile}" width="100px" height="110px"></div>
							<div class="profileBox1-9e">Photo Size <br>가로100px, 세로110px</div>
							<div class="profileBox1-9f">
							
							<form action="<%=request.getContextPath()%>/member/fileUpload" id="fileUpload" name="file" method="post" enctype="multipart/form-data">
						    	<input type="file" name="file"><br>
						    	<input type="submit" name="profile" id="profile" value="확인" class="profileBox1-9g"><br>
						    </form>
								
							</div>
						</div>
				</div>
				
			<div class="profileBox1-10  ">
				<div class="profileBox1-10a profile-font1">${user.name} 님</div>
				<a href="<%=request.getContextPath()%>/signout"><div class="profileBox1-10b profile-font1">로그아웃</div></a>
				<div class="profileBox1-10c profile-font1">Email: ${user.email}</div>
				<div class="profileBox1-10d profile-font1">나의 Q 포인트:</div>
				<div class="profileBox1-10e profile-font1">${user.point}</div>									
			</div>
		</div>
		<div class="profileBox1-11">
			<div class="profileBox1-12 profile-font1">내가본영상</div>
			<div class="profileBox1-13 profile-font1">내가찜한영상</div>
			<a href="<%=request.getContextPath()%>/member/modify"><div class="profileBox1-14 profile-font1">내정보</div></a>
		</div>
	</div>
</div>	

</body>