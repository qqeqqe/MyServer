<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>

<!-- 상단에 네비바 --> 

<body>
<nav class="navbar navbar-expand-sm bg-danger navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">2</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">3</a>
    </li>
   
   	    <li class="nav-item" >
	    <a class="nav-link" href="<%=request.getContextPath()%>/board/list" >List</a>
	    </li>
	
	 <%-- <c:if test="${user.id ne board.writer or board.num}"> --%> 
	 
	 <c:if test="${user eq null}">
	 <span style="right: 100px; position:absolute;">
	   <li class="nav-item" >
	   <a class="nav-link" href="<%=request.getContextPath()%>/signin" >Sign in</a>
	   </li>
	   </span>
	 </c:if>
    
    <c:if test="${user ne null}">
    <span style="right: 10px; position:absolute;">
       <li class="nav-item" >
	   <a class="nav-link" href="<%=request.getContextPath()%>/signout" >Sign Out</a>
	   </li>
	</span>
	</c:if>
	
  </ul>
</nav>
로그인 유저 ID :${user.id}<p>
로그인 유저명 :${user.name} 

<c:if test="${user ne null}">
<!-- ne는 not eq는 같다 -->
<a href="<%=request.getContextPath()%>/member/modify" class="float-right">회원정보 수정</a>
</c:if>
<p><p>
</body>