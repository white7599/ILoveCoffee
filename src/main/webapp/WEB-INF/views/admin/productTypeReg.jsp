<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<title><spring:message code="project.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=2">
<link rel="stylesheet" href="/css/admin.css?ver=2"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
		<div class="w3-container" id="contact" style="margin-top: 50px">
			<h1 class="w3-xxlarge w3-text-red">
				<b>상품분류등록</b>
			</h1>
			<hr style="width: 50px; border: 5px solid red" class="w3-round">
			
			<form method="post">
				<table class="list-table">
					<tr>
						<th class="list-th w3-sand">상품분류명</th>
						<td class="list-td-left">&nbsp;<input class="w3-input-small w3-border" type="text" name="type" required></td>
					</tr>
					<tr>
						<th class="list-th w3-sand">사용여부</th>
						<td class="list-td-left">&nbsp;<select class="w3-select-small w3-border" name="view_check">
								<option value="Y"> 사용</option>
								<option value="N"> 숨김</option>
							</select>
						</td>
					</tr>
				</table>
				
				<div class="w3-section text-align"><button type="submit" class="w3-btn w3-red w3-round">등록</button> <button type="reset" class="w3-btn w3-green w3-round">다시쓰기</button></div>
			</form>
		</div>
		<!-- End page content -->
</div>

<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
