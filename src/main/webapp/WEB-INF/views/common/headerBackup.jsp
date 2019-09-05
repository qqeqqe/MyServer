<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
           
<div class="box1 public-line public-font">
<div class="box1-1"><i>HORROR-Q</i><br></div>
			<div class="box1-2" style="vertical-align:80% ">
		 		<button type="button" class="btn btn-danger box1-3"><b>Language</b></button>
			 		<c:if test="${user eq null}">
						<a href="<%=request.getContextPath()%>/signin"><button type="button" class="btn btn-danger box1-3"><b>Login</b></button></a>
					</c:if>
					
					<c:if test="${user ne null}">
						<button type="button" class="btn btn-danger" onclick="myInFo()"><b class="box1-4">${user.name}</b></button>			
					</c:if>
			</div>	
			
			<div class="box1-5 public-line2 public-displayNone" id="box1-5">
				<div class="box1-6 public-line2"><img src="<%=request.getContextPath()%>/resources/img/icon.png"></div>
					<div class="box1-7">
					<div class="box1-8 public-line2">
						<div class="box1-9 public-line2 ">
							<div class="box1-9a"></div>	
							
								<div class="box1-9b"><img src="<%=request.getContextPath()%>/resources/img/porfile.png" width="34px" height="34px" onclick="pfOpen()"></div>
								
									<div id="box1-9c" class="box1-9c">
										<a href="javascript:void(0)" class="closebtn" onclick="pfclose()">&times;</a>
										<div class="box1-9d"></div>
										<div class="box1-9e">Photo Size <br>가로100px, 세로110px</div>
										<div class="box1-9f">
											<a href="#">등록/변경</a>					
											<a href="#">삭제</a>
										</div>
									</div>
							</div>
							
						<div class="box1-10 public-line2 ">
							<div class="box1-10a public-font2 public-line2">${user.name} 님</div>
							<a href="<%=request.getContextPath()%>/signout"><div class="box1-10b public-font2 public-line2">로그아웃</div></a>
							<div class="box1-10c public-font2 public-line2">Email: ${user.email}</div>
							<div class="box1-10d public-font2 public-line2">나의 Q 포인트:</div>
							<div class="box1-10e public-font2 public-line2">${user.point}</div>									
						</div>
					</div>
					<div class="box1-11 public-line2">
						<div class="box1-12 public-line2 public-font2">내가본영상</div>
						<div class="box1-13 public-line2 public-font2">내가찜한영상</div>
						<a href="<%=request.getContextPath()%>/member/modify"><div class="box1-14 public-line2 public-font2">내정보</div></a>
					</div>
				</div>
			</div>	
			
			<div id="demo" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>
				
				<!-- The slideshow -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="<%=request.getContextPath()%>/resources/post/g1.jpg">
						<img src="<%=request.getContextPath()%>/resources/post/g2.jpg">
						<img src="<%=request.getContextPath()%>/resources/post/c3.jpg">
						<img src="<%=request.getContextPath()%>/resources/post/d1.jpg">
						
					</div>
					<div class="carousel-item ">
						<img src="<%=request.getContextPath()%>/resources/post/c1.jpg">
						<img src="<%=request.getContextPath()%>/resources/post/c2.jpg" >
						<img src="<%=request.getContextPath()%>/resources/post/g1.jpg" >
						<img src="<%=request.getContextPath()%>/resources/post/g2.jpg" >
					</div>
					<div class="carousel-item ">
						<img src="<%=request.getContextPath()%>/resources/post/m1.jpg">
						<img src="<%=request.getContextPath()%>/resources/post/m2.jpg" >
						<img src="<%=request.getContextPath()%>/resources/post/m3.jpg" >
						<img src="<%=request.getContextPath()%>/resources/post/m4.jpg" >
					</div>
					<div class="carousel-item ">
						<img src="<%=request.getContextPath()%>/resources/post/m5.jpg">
						<img src="<%=request.getContextPath()%>/resources/post/m7.jpg" >
						<img src="<%=request.getContextPath()%>/resources/post/m8.jpg" >
						<img src="<%=request.getContextPath()%>/resources/post/m9.jpg" >
					</div>
				</div>
				<!-- Left and right controls -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
			</div>
			
			
 --%>			