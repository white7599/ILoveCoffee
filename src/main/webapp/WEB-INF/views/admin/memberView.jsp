<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html lang="ko">
<title><spring:message code="project.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=2">
<link rel="stylesheet" href="/css/admin.css?ver=1"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="contact" style="margin-top:50px">
    <h1 class="w3-xxlarge w3-text-red"><b>회원보기</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    	
    	<table class="list-table">
				<tr>
					<th class="list-th w3-sand">아이디</th>
					<td class="list-td-left">&nbsp;${member.id}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">이름</th>
					<td class="list-td-left">&nbsp;${member.name}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">비밀번호</th>
					<td class="list-td-left">&nbsp;${member.name}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">우편번호</th>
					<td class="list-td-left">&nbsp;${member.post_no}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">주소</th>
					<td class="list-td-left list-td-bottom">&nbsp;${member.addr1}&nbsp;${member.addr2 }
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">전화번호</th>
					<td class="list-td-left">&nbsp;${member.tel1}-${member.tel2}-${member.tel3}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">휴대전화</th>
					<td class="list-td-left">&nbsp;${member.cellphone1}-${member.cellphone2}-${member.cellphone3}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">sms수신여부</th>
					<td class="list-td-left"><c:set var="sms_check" value="${member.sms_check}"/>
						<c:choose>
							<c:when test="${sms_check eq 'Y'}">&nbsp;수신</c:when>
							<c:when test="${sms_check eq 'N'}">&nbsp;미수신</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">이메일</th>
					<td class="list-td-left">&nbsp;${member.email}</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">뉴스레터수신여부</th>
					<td class="list-td-left"><c:set var="newsletter_check" value="${member.newsletter_check}"/>
						<c:choose>
							<c:when test="${newsletter_check eq 'Y'}">&nbsp;수신</c:when>
							<c:when test="${newsletter_check eq 'N'}">&nbsp;미수신</c:when>
						</c:choose></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">등록일</th>
					<td class="list-td-left">&nbsp;${member.reg_date}</td>
				</tr>
			</table>
			
			<div class="w3-section text-align"><a href="/admin/memberUpdate${cri.makeQuery()}&id=${member.id}" class="w3-btn w3-red w3-round">수정</a>
			<a href="/admin/memberList${cri.makeQuery()}" class="w3-btn w3-green w3-round">리스트</a><!-- <button id="btn-remove" class="w3-btn w3-black w3-round">삭제</button> --></div>
  	</div>
</div>
   
<script type="text/javascript" src="/js/admin.js"></script>

<script>
	var result = '${result}';
	$(function(){
		
		$('#btn-remove').click(function(){
			if(confirm("삭제하시겠습니까?")){
				document.location.href = "memberRemove${cri.makeQuery()}&id=${member.id}";
			}
		});
		
	});
</script>

</body>
</html>
