<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<title><spring:message code="project.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=1">
<link rel="stylesheet" href="/css/admin.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="services" style="margin-top:50px">
    <h1 class="w3-xxlarge w3-text-red"><b>상품분류리스트</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <table class="list-table">
		<tr class="list-tr w3-sand">
			<th class="list-th"><spring:message code="productTypeList.column1"/></th>
			<th class="list-th"><spring:message code="productTypeList.column2"/></th>
			<th class="list-th"><spring:message code="productTypeList.column3"/></th>
			<th class="list-th"><spring:message code="productTypeList.column4"/></th>
			<th class="list-th">수정</th>
		</tr>	
		<c:set var="productTypeListLength" value="${fn:length(productTypeList)}"/>
		<c:forEach var="productTypeList" items="${productTypeList}" varStatus="status">
		<tr class="list-tr">
			<td class="list-td">${productTypeList.idx}<input type="hidden" id="productTypeIdx" value="${productTypeList.idx}"></td>
			<td class="list-td"><a href="/admin/productTypeUpdate?idx=${productTypeList.idx}">${productTypeList.type}</a></td>
			<td class="list-td"><c:set var="view_check" value="${productTypeList.view_check}"/>
					<c:choose>
						<c:when test="${view_check eq 'Y'}">사용</c:when>
						<c:when test="${view_check eq 'N'}">숨김</c:when>
					</c:choose></td>
			<td class="list-td">${productTypeList.reg_date}</td>
			<td class="list-td"><a href="/admin/productTypeUpdate?idx=${productTypeList.idx}">
				<input type="button" class="w3-btn w3-red w3-round" value="수정" id="btn_update"></a>
			</td>			
		</tr>	
		</c:forEach>		
	</table>
  </div>
</div>

<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
