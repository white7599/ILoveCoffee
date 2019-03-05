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
<link rel="stylesheet" href="/css/w3.css?ver=1"/>
<link rel="stylesheet" href="/css/admin.css?ver=1"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
    $("#popbutton").click(function(){
    	$idx = $("#idx").val();
        $('div.modal').modal({remote : 'layer?idx='+$idx});
    })
})
</script>
</head>

<body>
	<input type="text" name="idx" id="idx" value=12345>
	<button class="btn btn-default" id="popbutton">모달출력버튼</button><br/>
	<div class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	        <!-- remote ajax call이 되는영역 -->aere
	    </div>
	  </div>
	</div>	
</body>
</html>