<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="/css/admin.css?ver=1"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="contact" style="margin-top:50px">
    <h1 class="w3-xxlarge w3-text-red"><b>1:1문의보기</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    	
    	<table class="list-table">
			<tr>
				<th class="list-th w3-sand">질문유형</th>
				<td class="list-td-left">&nbsp;${directQuestionVo.type}</td>
			</tr>
			<tr>
				<th class="list-th w3-sand">이메일</th>
				<td class="list-td-left">&nbsp;${directQuestionVo.email}</td>
			</tr>
			<tr>
				<th class="list-th w3-sand">휴대폰</th>
				<td class="list-td-left">&nbsp;${directQuestionVo.cellphone}</td>
			</tr>
			<tr>
				<th class="list-th w3-sand">작성자아이디 / 작성자명</th>
				<td class="list-td-left">&nbsp;${directQuestionVo.writer} / ${directQuestionVo.name}</td>
			</tr>
			<tr>
				<th class="list-th w3-sand">질문내용</th>
				<td class="list-td-left list-td-bottom">&nbsp;${fn:replace(directQuestionVo.contents, cn, br)}</td>
			</tr>
			<tr>
				<th class="list-th w3-sand">개인정보 수집 및 이용 동의</th>
				<td class="list-td-left"><c:set var="info_agree" value="${directQuestionVo.info_agree}"/>
					<c:choose>
						<c:when test="${info_agree eq 'Y'}">&nbsp;동의</c:when>
						<c:when test="${info_agree eq 'N'}">&nbsp;동의안함</c:when>
					</c:choose></td>
			</tr>				
			<tr>
				<th class="list-th w3-sand">등록일</th>
				<td class="list-td-left">&nbsp;${directQuestionVo.reg_date}</td>
			</tr>
			<tr>
				<th class="list-th w3-sand">답변상태</th>
				<td class="list-td-left"><c:set var="answer_state" value="${directQuestionVo.answer_state}"/>
					<c:choose>
						<c:when test="${answer_state eq 'Y'}">&nbsp;답변완료</c:when>
						<c:when test="${answer_state eq 'N'}">&nbsp;미답변</c:when>
					</c:choose></td>
			</tr>	
		</table>
		<hr>
		
		<form id="directAnswerForm">
		<input type="hidden" value="${directQuestionVo.idx}" id="directQuestionIdx">
		<table class="list-table">
			<tr>
				<th class="list-th w3-sand">답변</th>
				<td class="list-td-left">&nbsp;<textarea name="answer" id="answer" cols="100" rows="8" <c:if test="${directQuestionVo.answer ne ''}">readonly</c:if>>${directQuestionVo.answer}</textarea></td>
			</tr>
		</table>
		</form>
		<div class="w3-section text-align"><c:if test="${directQuestionVo.answer eq '' || directQuestionVo.answer eq null}"><input type="button" id="answerBtn" class="w3-btn w3-red w3-round" value="답변하기"></c:if>
		<a href="/admin/directList" class="w3-btn w3-green w3-round">리스트</a><!-- <button id="btn-remove" class="w3-btn w3-black w3-round">삭제</button> --></div>
  	</div>
</div>
   
<script type="text/javascript" src="/js/admin.js"></script>

<script>
	
	$(function(){
		
		$('#answerBtn').click(function(){
			if($("#answer").val() == ""){
				alert("답변을 입력하세요.");
				return false;
			}
			if(confirm("답변 등록 하시겠습니까?")){
				
				var answer = {"idx" : $("#directQuestionIdx").val(), "answer":$("#answer").val()};
	            $.ajax({
	            	data : answer,
	                url : 'insertAnswer',
	                type : 'post',
	                
	                success:function(returnData){
	    	            alert("등록 되었습니다.");
	    	            window.location.reload();
	    	        },
	    	        error:function(jqXHR, textStatus, errorThrown){
	    	            alert("오류가 발생하였습니다." + textStatus + " : " + errorThrown);
	    	        }            
	            });   
			}
		});
		
	});
</script>

</body>
</html>
