<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.js"></script>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
           pageEncoding="UTF-8"%>
           
<html>
<head>

<jsp:include page="/WEB-INF/views/common/listHeader.jsp"></jsp:include>
							<!-- 부트스트랩 연결되는 부분 -->

	<title>게시판 리스트</title>
	 
</head>
<style>
th{
text-align: center;
}
</style>
<body>
	
   
   
							<!-- common에서 nav.jsp파일을 가져온다 --> 
<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
<div class="container-fluid" style="margin-top:80px">




	<div class="form-group col-3 float-right">
	  <select class="form-control" id="perPageNum">
	    <option <c:if test="${pageMaker.criteria.perPageNum == 0}" >selected</c:if> value="0">0page</option>
    	<option <c:if test="${pageMaker.criteria.perPageNum == 5}" >selected</c:if> value="5">5page</option>
    	<option <c:if test="${pageMaker.criteria.perPageNum == 10}">selected</c:if> value="10">10page</option>
    	<option <c:if test="${pageMaker.criteria.perPageNum == 20}">selected</c:if> value="20">20page</option>
	  </select>
    </div>
        
    
	<h1>게시판</h1>
	<table class="table">
		<tr>
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
	 <!-- 일반적인페이지네이션 -->	
	<ul class="pagination" style="justify-content: center;">
	    <c:if test="${pageMaker.prev}">
	        <li class="page-item">
	            <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.startPage-1}&perPageNum=${pageMaker.criteria.perPageNum}">Previous</a> 
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
	          <a class="page-link" href="<%=request.getContextPath()%>/board/list?page=${pageMaker.endPage+1}&perPageNum=${pageMaker.criteria.perPageNum}">Next</a> 
	       </li>
	    </c:if>
	</ul>
		 <a href="<%=request.getContextPath()%>/board/register">
			<button type="button" class="btn btn-outline-success">등록</button>
		</a>
	</div>	
</body>
</html>