<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	pageContext.setAttribute("br", "<br>");
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<title><spring:message code="project.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=2">
<link rel="stylesheet" href="/css/admin.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="contact" style="margin-top:50px">
    <h1 class="w3-xxlarge w3-text-red"><b>상품보기</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    	
    	<table class="list-table">
				<tr>
					<th class="list-th w3-sand width20">상품 분류</th>
					<td class="list-td-left">&nbsp;${product.type}
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">진열여부</th>
					<td class="list-td-left"><c:set var="view_check" value="${product.view_check}"/>
						<c:choose>
							<c:when test="${view_check eq 'Y'}">&nbsp;진열</c:when>
							<c:when test="${view_check eq 'N'}">&nbsp;숨김</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">상품명</th>
					<td class="list-td-left">&nbsp;${product.name}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">영문상품명</th>
					<td class="list-td-left">&nbsp;${product.eng_name}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">이미지</th>
					<td class="list-td-left list-td-bottom">&nbsp;<img src="<spring:url value='/uploadImage/${product.image_file}'/>" height="100px"/>
						&nbsp;<input type="hidden" name="image_file" value="${product.image_file}" size="80" readonly>
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">원산지</th>
					<td class="list-td-left">&nbsp;${product.origin}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">가격</th>
					<td class="list-td-left">&nbsp;<fmt:formatNumber value="${product.price}" pattern="#,###"/> 원</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">무게</th>
					<td class="list-td-left">&nbsp;${product.weight} g</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">설명1</th>
					<td class="list-td-left">&nbsp;${fn:replace(product.desc1, cn, br)}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">설명2</th>
					<td class="list-td-left">&nbsp;${fn:replace(product.desc2, cn, br)}</td>
				</tr>
			</table>
			
			<div class="w3-section text-align"><a href="/admin/productUpdate${cri.makeQuery()}&idx=${product.idx}" class="w3-btn w3-red w3-round">수정</a>
			<button id="btn-remove" class="w3-btn w3-black w3-round">삭제</button></div>
  	</div>
</div>
   
<script type="text/javascript" src="/js/admin.js"></script>

<script>
	var result = '${result}';
	$(function(){
		
		$('#btn-remove').click(function(){
			if(confirm("삭제하시겠습니까?")){
				self.location.href = "/admin/productRemove${cri.makeQuery()}&idx=${product.idx}";
			}
		});
		
	});
</script>

</body>
</html>
