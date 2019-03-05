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
    <h1 class="w3-xxlarge w3-text-red"><b>FAQ리스트</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <div style="text-align:right; width:90%;"><input type="button" value="등록" id="faqBtn" class="w3-btn w3-red w3-round"></div><br>
    <table class="list-table">
		<tr class="list-tr w3-sand">
			<th class="list-th" style="width:10%;">번호</th>
			<th class="list-th" style="width:60%;">질문</th>
			<th class="list-th" style="width:10%;">등록일</th>
			<th class="list-th" style="width:10%;">수정</th>
			<th class="list-th" style="width:10%;">삭제</th>
		</tr>	
		<c:set var="faqListLength" value="${fn:length(faqList)}"/>
		<c:forEach var="faqList" items="${faqList}" varStatus="status">	
		<tr class="list-tr">
			<td class="list-td">${faqListLength - status.index}</td>
			<td class="list-td"><a>${faqList.question}</a><p>${fn:replace(faqList.answer, cn, br)}</p></td>
			<td class="list-td">${faqList.reg_date}</td>
			<td class="list-td"><button value="${faqList.idx}" id="editBtn" class="w3-btn w3-red w3-round">수정</button></td>
			<td class="list-td"><button value="${faqList.idx}" id="deleteBtn" class="w3-btn w3-round w3-brown">삭제</button></td>
			
			<td style="display:none">${faqList.question}</td>
			<td style="display:none">${fn:replace(faqList.answer, cn, br)}</td>
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
                        <td><textarea class="form-control" id="faqAnswer" rows="10"></textarea></td>
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
<script>

$(document).ready(function(){
	$("p").hide();
	$("tr td a").click(function(){
		$(this).next().slideToggle(300);
		$("tr td a").not(this).next().slideUp(300);
		return false;
	});
	
	$("#faqBtn").on("click", function(){
		window.location.href="faqReg";
	});	
	
	// 수정하기 버튼 클릭
    $("button[id=editBtn]").click(function(){
        action='modify';
        type = 'PUT';
        idx = $(this).val();
 
        // content 담기
        var row = $(this).parent().parent();
        var tr = row.children();
        
        var faqQuestion = tr.eq(5).text();
        var faqAnswer = tr.eq(6).html();
        faqAnswer = faqAnswer.replace(/<br>/g, '\n');   
        faqAnswer = faqAnswer.replace(/&gt;/g, '>');
        faqAnswer = faqAnswer.replace(/&lt;/g, '<');
 
        $("#modal-title").text("Faq 수정하기");
 
        $("#faqQuestion").val(faqQuestion);
        $("#faqAnswer").text(faqAnswer);
        
        $("#myModal").modal();
    });
	
	
 	// 삭제하기 버튼 클릭
    $("button[id='deleteBtn']").click(function(){
    	if(confirm("삭제하시겠습니까?")){
    		idx = {"idx" : $(this).val()};
            $.ajax({
            	data : idx,
                url : 'deleteFaq',
                type : 'post',
                
                success:function(data){
    	            alert("삭제 되었습니다.");
    	            window.location.reload();
    	        },
    	        error:function(jqXHR, textStatus, errorThrown){
    	            alert("오류가 발생하였습니다." + textStatus + " : " + errorThrown);
    	        }            
            });            
    	}
        
    });
 	
 	
 	// Modal의 Submit 버튼 클릭
    $("#modalSubmit").click(function(){
    	console.log($("#faqAnswer").val());
        var data = {
            "idx" : idx,
            "question" : $("#faqQuestion").val(),
            "answer" : $("#faqAnswer").val()
        };        
        
        $.ajax({
            url : "modifyFaq",
            type : 'post',
            data : data,
            success: function(data){ 
            	alert("수정 되었습니다.");
	            window.location.reload();
            	$("#myModal").modal('toggle'); 
            },
            error:function(jqXHR, textStatus, errorThrown){
	            alert("오류가 발생하였습니다." + textStatus + " : " + errorThrown);
	        }     
        })
    });



	
});


</script>

</body>
</html>
