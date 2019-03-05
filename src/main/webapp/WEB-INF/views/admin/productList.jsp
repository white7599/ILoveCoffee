<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<title>I Love Coffee!!</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<style>
body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
body {font-size:16px;}
.w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
.w3-half img:hover{opacity:1}

.list-table{
	width: 70%;
	border: 1px solid gray;
	border-collapse: collapse;
}
.list-tr, .list-td, .list-th{
	border: 1px solid gray;
	padding: 10px;
}
</style>
<body>

<jsp:include page="leftmenu.jsp"></jsp:include>

<!-- Top menu on small screens -->
<header class="w3-container w3-top w3-hide-large w3-red w3-xlarge w3-padding">
  <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">Menu</a>
  <span>I Love Coffee!!</span>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="services" style="margin-top:75px">
    <h1 class="w3-xxxlarge w3-text-red"><b>상품리스트</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <table class="list-table">
		<tr class="list-tr">
			<th class="list-th">순번</th>
			<th class="list-th">이미지</th>
			<th class="list-th">상품명</th>
			<th class="list-th">영문명</th>
			<th class="list-th">원산지</th>
			<th class="list-th">가격</th>
			<th class="list-th">무게</th>
		</tr>	
		<c:set var="productListLength" value="${fn:length(productList)}"/>
		<c:forEach var="productList" items="${productList}" varStatus="status">
		<tr class="list-tr">
			<td class="list-td">${productListLength - status.index}</td>
			<td class="list-td"><img src="/resources/uploadImg/${productList.image_file}" height="100"></td>
			<td class="list-td"><a href="view/${productList.idx}">${productList.name}</a></td>
			<td class="list-td">${productList.eng_name}</td>			
			<td class="list-td">${productList.origin}</td>
			<td class="list-td"><fmt:formatNumber value="${productList.price}" pattern="#,###"/> 원</td>
			<td class="list-td"><fmt:formatNumber value="${productList.weight}" pattern="#,###"/> g</td>
		</tr>	
		</c:forEach>		
	</table>
  </div>
  
<!-- End page content -->
</div>

<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
