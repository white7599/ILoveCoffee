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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
	    function daumPostCode(){
	        new daum.Postcode({
	            oncomplete: function(data){
	                document.getElementById("post_no").value = data.zonecode;  
	                document.getElementById("addr1").value = data.address;
	                document.getElementById("addr2").focus();
	            }
	        }).open();
	    }
	</script>
	
	<script>
		$(function(){
			

	        $("#postBtn").on("click", daumPostCode); 
	        $("#post_no").on("click", daumPostCode); 

	        var totalData = "";           
	        $("#edit_btn").click(function(){
	        	
	        	if($("#name").val() == ""){
	                alert("이름을 입력하세요.");
	                $("#name").focus();
	                return false;
	            }
	            totalData += "이름: " + $("#name").val()+"\n";
	            if($("#id").val() == ""){
	                alert("아이디를 입력하세요.");
	                $("#id").focus();
	                return false;
	            }
	            totalData += "아이디: " + $("#id").val()+"\n";
	            if($("#pwd").val() == ""){
	                alert("비밀번호를 입력하세요.");
	                $("#pwd").focus();
	                return false;
	            } 

	            if($("#rePwd").val() == "" || ($("#pwd").val() != $("#rePwd").val())){
	                alert("비밀번호를 확인하세요.");
	                $("#rePwd").select();
	                return false;
	            } 
	          
	            if($("#post_no").val() == ""){
	                alert("우편번호를 입력하세요.");
	                $("#post_no").focus();
	                return false;
	            }
	            if($("#addr1").val() == ""){
	                alert("주소를 입력하세요.");
	                $("#addr1").focus();
	                return false;
	            }
	            if($("#addr2").val() == ""){
	                alert("상세주소를 입력하세요.");
	                $("#addr2").focus();
	                return false;
	            }

	            if($("#tel2").val() == ""){
	                alert("전화번호를 입력하세요.");
	                $("#tel2").focus();
	                return false;
	            }
	            if($("#tel3").val() == ""){
	                alert("전화번호를 입력하세요.");
	                $("#tel3").focus();
	                return false;
	            }
	            
	            if($("#cellphone1").val() != ""){
	                if($("#cellphone2").val() == ""){
	                    alert("휴대전화번호를 입력하세요.");
	                    $("#cellphone2").focus();
	                    return false;
	                }
	                if($("#cellphone3").val() == ""){
	                    alert("휴대전화번호를 입력하세요.");
	                    $("#cellphone3").focus();
	                    return false;
	                }
	            }  
	            
	            $("#editForm").attr("method", "post");
	            $("#editForm").attr("action", "memberUpdateProcess").submit();
	            
	            
	            
	        }); 
			
			
			
		})
	</script>

<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="contact" style="margin-top:50px">
    <h1 class="w3-xxlarge w3-text-red"><b>회원수정</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    	<form method="post" id="editForm">
    	<table class="list-table">
				<tr>
					<th class="list-th w3-sand">아이디</th>
					<td class="list-td-left">&nbsp;${member.id}<input type="hidden" name="id" id="id" value="${member.id}" ></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">이름</th>
					<td class="list-td-left">&nbsp;<input class="w3-input-small w3-border" type="text" name="name" value="${member.name}" required></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">비밀번호</th>
					<td class="list-td-left">&nbsp;<input class="w3-input-small w3-border" type="password" name="pwd"  value="${member.name}" required></td>
				</tr>
				
				<tr>
					<th class="list-th w3-sand">주소</th>
					<td class="list-td-left list-td-bottom">&nbsp;<input name="post_no" id="post_no" readonly style="margin-top: 5px; margin-bottom: 5px;"  value="${member.post_no}"/> <a href="#none"
	                                    title="우편번호 검색(새창으로 열기)" onclick="" id="postBtn" class="" style="margin-left:10px; color:red;">우편번호  검색</a><br />
	                               	&nbsp;<input id="addr1" name="addr1" readonly size="45" value="${member.addr1}"/>
	                                <input id="addr2" name="addr2"  size="25" style="margin-bottom: 5px" value="${member.addr2}"/>
					
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">전화번호</th>
					<td class="list-td-left">&nbsp;<input class="w3-input-tiny-small w3-border" type="text" name="tel1" value="${member.tel1}"/>-
						<input class="w3-input-tiny-small w3-border" type="text" name="tel2" value="${member.tel2}">-
						<input class="w3-input-tiny-small w3-border" type="text" name="tel3" value="${member.tel3}">
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">휴대전화</th>
					<td class="list-td-left">&nbsp;<input class="w3-input-tiny-small w3-border" type="text" name="cellphone1" value="${member.cellphone1}"/>-
						<input class="w3-input-tiny-small w3-border" type="text" name="cellphone2" value="${member.cellphone2}">-
						<input class="w3-input-tiny-small w3-border" type="text" name="cellphone3" value="${member.cellphone3}">
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">sms수신여부</th>
					<td class="list-td-left">&nbsp;<select class="w3-select-small w3-border" name="sms_check">
							<option value="Y" <c:if test="${member.sms_check eq 'Y'}">selected</c:if>> 수신</option>
							<option value="N" <c:if test="${member.sms_check eq 'N'}">selected</c:if>> 미수신</option>
						</select>
					</td>
				</tr>
				<tr>
					<th class="list-th w3-sand">이메일</th>
					<td class="list-td-left">&nbsp;<input type="email" name="email" id="email" class="w3-input-small w3-border" value="${member.email}" size="30"/></td>
				</tr>
				<tr>
					<th class="list-th w3-sand">뉴스레터수신여부</th>
					<td class="list-td-left">&nbsp;<select class="w3-select-small w3-border" name="newsletter_check">
							<option value="Y" <c:if test="${member.newsletter_check eq 'Y'}">selected</c:if>> 수신</option>
							<option value="N" <c:if test="${member.newsletter_check eq 'N'}">selected</c:if>> 미수신</option>
						</select>
					</td>
				</tr>
			</table>
			
			<div class="w3-section text-align"><button type="button" class="w3-btn w3-red w3-round" id="edit_btn">수정완료</button>&nbsp;
			<a href="/admin/memberView${cri.makeQuery()}&id=${member.id}" class="w3-btn w3-green w3-round">이전페이지(view)</a></div>
			
			</form>
  	</div>
</div>
   
<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
