<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html lang="ko">
<title><spring:message code="project.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=2">
<link rel="stylesheet" href="/css/admin.css?ver=2"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left: 340px; margin-right: 40px">
	<div class="w3-container" id="contact" style="margin-top: 50px">
		<h1 class="w3-xxlarge w3-text-red">
			<b>상품분류수정</b>
		</h1>
		<hr style="width: 50px; border: 5px solid red" class="w3-round">

		<form method="post">
			<table class="list-table">
				<tr>
					<th class="list-th w3-sand">사용여부</th>
					<td class="list-td-left">&nbsp;<select class="w3-select-small w3-border" name="view_check">
							<option value="Y" <c:if test="${productType.view_check eq 'Y'}">selected</c:if>> 사용</option>
							<option value="N" <c:if test="${productType.view_check eq 'N'}">selected</c:if>> 숨김</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">상품 분류명</th>
					<td class="list-td-left">&nbsp;<input class="w3-input-small w3-border" type="text" name="type"  value="${productType.type}" required></td>
				</tr>
			</table>
			
			<div class="w3-section text-align"><button type="submit" class="w3-btn w3-red w3-round">수정</button>&nbsp;
				<a href="/admin/productTypeList" class="w3-btn w3-green w3-round">리스트</a></div>
		</form>
	</div>
</div>


<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
