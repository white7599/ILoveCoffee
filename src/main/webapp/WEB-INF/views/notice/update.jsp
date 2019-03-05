<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>
<form role="form" method="post">
	<div class="box-body">
		<span><b>글번호:</b> ${noticeVO.idx}</span>
		<input type="hidden" name="idx" value="${noticeVO.idx }" />
		<!-- page와 perPageNum  추가 -->
		<input type="hidden" name="page" value="${cri.page}" />
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
			
		<div class="form-group">
			<label for="title">Title</label>
			<input type="text" id="title" name="title" class="form-control" value="${noticeVO.title}"/>		
		</div>
			
		<div class="form-group">
			<label for="content">Contents</label>
			<textarea name="contents" id="contents" class="form-control" rows="3" >${noticeVO.contents}</textarea>		
		</div>
			
		
	</div>
	<div>
		<button type="submit" class="btn btn-primary">Save</button>
		<a href="/notice/read${cri.makeQuery()}&idx=${noticeVO.idx}" class="btn btn-danger">Cancel</a>
	</div>		
</form>
<%@include file="../include/footer.jsp" %>