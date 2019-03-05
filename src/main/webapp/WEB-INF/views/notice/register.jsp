<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<form role="form" method="post" modelAttribute="notice">
	<div class="box-body">
		<!-- page와 perPageNum  추가 -->
		<input type="hidden" name="page" value="${cri.page}" />
		<input type="hidden" name="perPageNum" value="${cri.perPageNum}" />
		
		<div class="form-group">
			<label for="title">Title</label>
			<input type="text" id="title" name="title" class="form-control" placeholder="Enter Title"/>		
		</div>
		<div class="form-group">
			<label for="content">Content</label>
			<textarea name="contents" id="contents" class="form-control" rows="3" placeholder="Enter"></textarea>		
		</div>
		<div class="form-group">
			<label for="writer">Writer</label>
			<input type="text" name="writer" id="writer" class="form-control" placeholder="Enter Writer"/>		
		</div>
	</div>
	<div>
		<button type="submit" class="btn btn-primary">Submit</button>
		<a href="/notice/listPage${cri.makeQuery()}" class="btn btn-danger">Cancel</a>
	</div>
</form>
<%@include file="../include/footer.jsp" %>