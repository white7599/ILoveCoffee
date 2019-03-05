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
<link rel="stylesheet" href="/css/admin.css?ver=1"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="services" style="margin-top:50px">
    <h1 class="w3-xxlarge w3-text-red"><b>FAQ리스트</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <table class="list-table">
		<tr class="list-tr">
			<th class="list-th"><spring:message code="productList.column1"/></th>
			<th class="list-th"><spring:message code="productList.column2"/></th>
			<th class="list-th"><spring:message code="productList.column3"/></th>
			<th class="list-th"><spring:message code="productList.column4"/></th>
		</tr>	
		<c:set var="faqListLength" value="${fn:length(faqList)}"/>
		<c:forEach var="faqList" items="${faqList}" varStatus="status">
		<tr class="list-tr">
			<td class="list-td">${faqListLength - status.index}</td>
			<td class="list-td"><a href="view/${faqList.idx}">${faqList.idx}</a></td>
			<td class="list-td">${faqList.question}</td>
			<td class="list-td">${faqList.answer}</td>
			<td class="list-td">${faqList.reg_date}</td>
		</tr>	
		</c:forEach>		
	</table>
  </div>

  
<!-- End page content -->
</div>

<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
