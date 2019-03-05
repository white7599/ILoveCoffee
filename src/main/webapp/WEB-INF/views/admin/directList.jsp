<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("br", "<br>");
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><spring:message code="project.title"/></title>
<link rel="stylesheet" href="/css/w3.css?ver=1"/>
<link rel="stylesheet" href="/css/admin.css?ver=1"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
.list-td{
padding: 10px;
}
.list-td>a{
	color:black;
}
.list-td>a:link{
	color:red!important;
	text-decoration:none!important;
}
.list-td a:hover{
	cursor: pointer;
	color:red!important;
	text-decoration:none!important;
}
.list-td p{
	/* background-color: #85B8CB;
	border-top: 2px solid #1D6A96; */
	background-color: #E1DCD9;
	border-top: 2px solid #A67F78;
	margin-top: 10px;
	padding: 7px;	
}
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>
<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="services" style="margin-top:50px">
    <h1 class="w3-xxlarge w3-text-red"><b>1:1문의리스트</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    
    <table class="list-table">
		<tr class="list-tr w3-sand">
			<th class="list-th" style="width:10%;">번호</th>
			<th class="list-th" style="width:30%;">질문유형</th>
			<th class="list-th" style="width:10%;">작성자아이디</th>
			<th class="list-th" style="width:10%;">작성자명</th>
			<th class="list-th" style="width:10%;">이메일</th>
			<th class="list-th" style="width:10%;">답변상태</th>
		</tr>	
		<c:set var="directQuestionListLength" value="${fn:length(directQuestionList)}"/>
		<c:forEach var="directQuestionList" items="${directQuestionList}" varStatus="status">	
		<tr class="list-tr">
			<td class="list-td">${directQuestionListLength - status.index}</td>
			<td class="list-td"><a href="directView?idx=${directQuestionList.idx}">${directQuestionList.type}</a></td>
			<td class="list-td">${directQuestionList.writer}</td>
			<td class="list-td">${directQuestionList.name}</td>
			<td class="list-td">${directQuestionList.email}</td>
			<td class="list-td">
			<c:set var="answer_state" value="${directQuestionList.answer_state}"/>
				<c:choose>
					<c:when test="${answer_state eq 'Y'}">&nbsp;답변완료</c:when>
					<c:when test="${answer_state eq 'N'}">&nbsp;<span style="color:red">미답변</span></c:when>
				</c:choose>
			</td>
		</tr>
		</c:forEach>				
	</table>
  </div>
</div>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
 
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 id="modal-title" class="modal-title"></h4>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tr>
                        <td>질문</td>
                        <td><input class="form-control" id="faqQuestion" type="text"></td>
                    </tr>
                    <tr>
                        <td>답변</td>
                        <td><textarea class="form-control" id="faqAnswer" rows="8"></textarea></td>
                    </tr>                    
                </table>
            </div>
            <div class="modal-footer">
                <button id="modalSubmit" type="button" class="w3-btn w3-red w3-round">수정</button>
                <button type="button" class="w3-btn w3-round w3-green" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

	

<script type="text/javascript" src="/js/admin.js"></script>


</body>
</html>
