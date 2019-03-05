<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp" %>

<div id="registerOK" class="alert alert-info hidden" role="alert">새 글이 등록되었습니다.</div>	
<div id="removeOK" class="alert alert-danger hidden" role="alert">글이 삭제되었습니다.</div>

<table class="table table-bordered">
	<tr>
		<th style="width: 10px">idx</th>
		<th>title</th>
		<th>reg_date</th>
	</tr>
	<!-- for 문 -->
	<c:forEach items="${list}" var="noticeVO"> <!-- model의 속성 list에 담겨있는 조회결과를 차례로 boardVO에 대입-->
		<tr>
			<td>${ noticeVO.idx }</td>
			<td><a href="/notice/read?idx=${noticeVO.idx}">${ noticeVO.title }</a></td>
			<td><fmt:formatDate pattern="YYYY-MM-dd HH:mm:ss" value="${ noticeVO.reg_date}"/></td>
			
		</tr>
	</c:forEach>
</table>
<!-- 등록페이지로 가는 버튼 -->
<a href="/notice/register"><button class="btn btn-primary">새글등록</button></a>
<a href="/notice/dummy"><button class="btn btn-primary">dummy생성</button></a>
<script>
var result = '${result}';
$(function(){
	if(result == 'registerOK'){
		$('#registerOK').removeClass('hidden');
		$('#registerOK').fadeOut(2000);
	}
	if(result == 'removeOK'){
		$('#removeOK').removeClass('hidden');
		$('#removeOK').fadeOut(2000);
	}
})
</script>
<%@include file="../include/footer.jsp" %>