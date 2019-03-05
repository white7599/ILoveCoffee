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
			<b>FAQ 등록</b>
		</h1>
		<hr style="width: 50px; border: 5px solid red" class="w3-round">
		<form method="post">
			<table class="list-table">
				<tr>
					<th class="list-th w3-sand">질문</th>
					<td class="list-td-left">&nbsp;<input class="w3-input w3-border" type="text" name="question" id="question" required></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">답변</th>
						<td class="list-td-left">&nbsp;<textarea class="w3-input w3-border" name="answer" id="answer" cols="100px" rows="15"></textarea></td>
				</tr>
			</table>
			<div class="w3-section text-align"><button type="submit" class="w3-btn w3-red">등록</button> <button type="reset" class="w3-btn w3-black">다시쓰기</button></div>
		</form>
	</div>
</div>

<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
