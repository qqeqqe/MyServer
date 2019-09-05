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

<form action="<%=request.getContextPath()%>/board/modify" method="post">
<input type="hidden" name="num" value="${board.num}">
 
<div class="container-fluid" style="margin-top:80px;">


	<div class="form-group">
	  <label for="usr">제목</label>
	  <input type="text" class="form-control" name="title" value="${board.title}">
	</div>
	<br>
	<div class="form-group">
	  <label for="usr">작성자</label>
	  <input type="text" class="form-control" name="writer"  value="${board.writer}" readonly>
	</div>
	<br>
	<div class="form-group">
	  <label for="usr">조회</label>
	  <input type="text" class="form-control" name="views" value="${board.views}" readonly>
	</div>
	<br>
	<div class="form-group">
	  <label for="usr">내용</label>
	  <textarea rows="10" class="form-control" name="contents">${board.contents}</textarea>
	</div>
	<br>
	<div class="form-group">
	  <label for="usr">파일</label>
	  <input type="text" class="form-control" name="file" value="${board.file}" >
	</div>
	

	
	<button type="submit" class="btn btn-success">수정확인</button>
	
	<a href="<%=request.getContextPath()%>/board/display?num=${board.num}"><button type="button" class="btn btn-success">취소</button></a>
	</div>
	</form>
</body>
</html>
