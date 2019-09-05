<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<title>리스트</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
<div class="container-fluid" style="margin-top:80px;">

	<div class="form-group">
	  <label for="usr">제목</label>
	  <input type="text" class="form-control" name="title" value="${board.title}" readonly>
	</div>
	<br>
	
	
	<div class="form-group">
	  <label for="usr">작성자</label>
	  <input type="text" class="form-control" name="writer" value="${board.writer}" readonly>
	</div>
	<br>
	
	<div class="form-group">
	  <label for="usr"> 시간</label>
	  <input type="text"   class="form-control" name="registered" value="${board.registered}" readonly>
	</div>
	<br>
	
	<div class="form-group">
	  <label for="usr">조회</label>
	  <input type="text" class="form-control" name="views" value="${board.views}" readonly>
	</div>
	<br>
	
	 <br>
	  
	<div class="form-group">
	  <label for="usr">내용</label>
	  <textarea rows="10" class="form-control" name="contents" readonly>${board.contents}</textarea>
	</div>
	<br>
	 
	
	<div class="form-group">
	  <label for="usr">파일</label>
	  <input type="text" class="form-control" name="file" value="${board.file}" readonly>
		
	</div>
	
	<a href="<%=request.getContextPath()%>/board/list"><button type="button" class="btn btn-outline-success">목록</button></a>
	
	<a href="<%=request.getContextPath()%>/board/register"><button type="button" class="btn btn-outline-success">등록</button></a>
	
	<!-- 현재 코드는 사용자 외에 수정버튼이 안보이게 하는법 -->
	<c:if test="${user ne null && user.id eq board.writer}">
	<a href="<%=request.getContextPath()%>/board/modify?num=${board.num}"><button type="button" class="btn btn-outline-success">수정</button></a>
	<a href="<%=request.getContextPath()%>/board/delete?num=${board.num}"><button type="button" class="btn btn-outline-success">삭제</button></a>
	</c:if>
	
	</div>
</body>
</html>