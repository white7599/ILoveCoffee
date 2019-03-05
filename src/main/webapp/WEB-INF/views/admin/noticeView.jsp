<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<title><spring:message code="project.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=1"/>
<link rel="stylesheet" href="/css/admin.css?ver=2"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
		<div class="w3-container" id="contact" style="margin-top: 50px">
			<h1 class="w3-xxlarge w3-text-red">
				<b>NEWS 보기</b>
			</h1>
			<hr style="width: 50px; border: 5px solid red" class="w3-round">
			<table class="list-table">
				<tr>
					<th class="list-th w3-sand">제목</th>
					<td class="list-td-left">&nbsp;<input class="w3-input w3-border" type="text" name="title" required value="${notice.title}" readonly></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">내용</th>
					<td class="list-td-left">&nbsp;${notice.contents}</td>
				</tr>
			</table>
			<div class="w3-section text-align"><a href="/admin/noticeUpdate${cri.makeQuery()}&idx=${notice.idx}" class="w3-btn w3-red w3-round">수정</a>
			<button id="btn-remove" class="w3-btn w3-black w3-round">삭제</button></div>
		</div>
	</div>

<script type="text/javascript" src="/js/admin.js"></script>
<script>
	var result = '${result}';
	$(function(){
		
		$('#btn-remove').click(function(){
			if(confirm("삭제하시겠습니까?")){
				self.location.href = "/admin/noticeRemove${cri.makeQuery()}&idx=${notice.idx}";
			}
		});
		
	});
</script>
</body>
</html>
