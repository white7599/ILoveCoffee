<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="project.title"/></title>
</head>
<body>

	<!-- header -->
	<div class="modal-header">
	    <!-- 닫기(x) 버튼 -->
	  <button type="button" class="close" data-dismiss="modal">×</button>
	  <!-- header title -->
	  <h4 class="modal-title">Header</h4>
	</div>
	<!-- body -->
	<div class="modal-body">
	    Body<input type="text" id="idx" value="${idx}">
	</div>
	<!-- Footer -->
	<div class="modal-footer">
	    Footer
	  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	</div>
	

</body>
</html>