<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("br", "<br>");
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title><spring:message code="project.title" /></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
	<link href="<c:url value='css/main.css' />"  rel="stylesheet" />
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
	<style>
		a:hover{
			cursor:pointer;
			text-decoration: none;
		}
	</style>

</head>
<body>
	<div id="container">
		<header><jsp:include page="header.jsp"></jsp:include></header>
		<div id="contents">
		<div class="login_container">
		<h2>My Page</h2>
		<div></div><br><br>

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">회원정보수정</a></li>
			<li><a data-toggle="tab" href="#menu1">1:1 문의</a></li>
		</ul>

		<div class="tab-content">
		
			<!-- Tab1 -->
			<div id="home" class="tab-pane fade in active" style="background: white!important;">
				<h3>회원정보수정</h3>
				<section class="join_section">
				<form id="editForm" method="post">	                  
                    <table id="register_table">
                        <tr>
                            <th>이름 *</th>
                            <td><input name="name" id="name" class="input" value="${memberEdit.name}" maxlength="10"/>
                        </tr>
                        <tr>
                            <th>아이디 *</th>
                            <td><input name="id" id="id" class="input" value="${memberEdit.id}" readonly/></td>
                        </tr>
                        <tr>
                            <th>비밀번호 *</th>
                            <td><input type="password" name="pwd" id="pwd" class="input" value="${memberEdit.pwd}" maxlength="10"/> </td>
                        </tr>
                        <tr>
	                            <th>비밀번호 확인 *</th>
	                            <td><input value="" type="password" size="25" id="rePwd" name="rePwd" maxlength="10"/></td>
	                        </tr>
	                        <tr>
	                            <th width="20%">주소 *</th>
	                            <td width="400px">
	                                <input name="post_no" id="post_no" readonly style="margin-top: 5px; margin-bottom: 5px;"  value="${memberEdit.post_no}"/> <a href="#none"
	                                    title="우편번호 검색(새창으로 열기)" onclick="" id="postBtn" class="" style="margin-left:10px">우편번호  검색</a><br />
	                               	<input id="addr1" name="addr1" readonly size="45" value="${memberEdit.addr1}"/>
	                                <input id="addr2" name="addr2"  size="25" style="margin-bottom: 5px" value="${memberEdit.addr2}"/></td>
	                        </tr>
	                        <tr>
	                            <th>전화 *</th>
	                            <td>
	                            	<select id="tel1" name="tel1">
	                            		<option value="02" <c:if test="${memberEdit.tel1 eq '02'}">selected</c:if>>02</option>
	                            		<option value="031" <c:if test="${memberEdit.tel1 eq '031'}">selected</c:if>>031</option>
	                            		<option value="032" <c:if test="${memberEdit.tel1 eq '032'}">selected</c:if>>032</option>
	                            		<option value="033" <c:if test="${memberEdit.tel1 eq '033'}">selected</c:if>>033</option>
	                            		<option value="041" <c:if test="${memberEdit.tel1 eq '041'}">selected</c:if>>041</option>
	                            		<option value="042" <c:if test="${memberEdit.tel1 eq '042'}">selected</c:if>>042</option>
	                            		<option value="043" <c:if test="${memberEdit.tel1 eq '043'}">selected</c:if>>043</option>
	                            		<option value="044" <c:if test="${memberEdit.tel1 eq '044'}">selected</c:if>>044</option>
	                            		<option value="051" <c:if test="${memberEdit.tel1 eq '051'}">selected</c:if>>051</option>
	                            		<option value="052" <c:if test="${memberEdit.tel1 eq '052'}">selected</c:if>>052</option>
	                            		<option value="053" <c:if test="${memberEdit.tel1 eq '053'}">selected</c:if>>053</option>
	                            		<option value="054" <c:if test="${memberEdit.tel1 eq '054'}">selected</c:if>>054</option>
	                            		<option value="055" <c:if test="${memberEdit.tel1 eq '055'}">selected</c:if>>055</option>
	                            		<option value="061" <c:if test="${memberEdit.tel1 eq '061'}">selected</c:if>>061</option>
	                            		<option value="062" <c:if test="${memberEdit.tel1 eq '062'}">selected</c:if>>062</option>
	                            		<option value="063" <c:if test="${memberEdit.tel1 eq '063'}">selected</c:if>>063</option>
	                            		<option value="064" <c:if test="${memberEdit.tel1 eq '064'}">selected</c:if>>064</option>
	                            		<option value="0502" <c:if test="${memberEdit.tel1 eq '0502'}">selected</c:if>>0502</option>
	                            		<option value="0505" <c:if test="${memberEdit.tel1 eq '0505'}">selected</c:if>>0505</option>
	                            		<option value="0506" <c:if test="${memberEdit.tel1 eq '0506'}">selected</c:if>>0506</option>
	                            		<option value="070" <c:if test="${memberEdit.tel1 eq '070'}">selected</c:if>>070</option>
	                            		<option value="010" <c:if test="${memberEdit.tel1 eq '010'}">selected</c:if>>010</option>
	                            		<option value="011" <c:if test="${memberEdit.tel1 eq '011'}">selected</c:if>>011</option>
	                            		<option value="016" <c:if test="${memberEdit.tel1 eq '016'}">selected</c:if>>016</option>
	                            		<option value="017" <c:if test="${memberEdit.tel1 eq '017'}">selected</c:if>>017</option>
	                            		<option value="018" <c:if test="${memberEdit.tel1 eq '018'}">selected</c:if>>018</option>
	                            		<option value="019" <c:if test="${memberEdit.tel1 eq '019'}">selected</c:if>>019</option>
	                            	</select>-<input id="tel2" name="tel2" value="${memberEdit.tel2}" maxlength="4"/>-<input maxlength="4" id="tel3" name="tel3" value="${memberEdit.tel3}"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>휴대전화</th>
	                            <td>
	                            	<select id="cellphone1" name="cellphone1">
	                            		<option value="" <c:if test="${memberEdit.cellphone1 eq ''}">selected</c:if>>없음</option>
	                            		<option value="010" <c:if test="${memberEdit.cellphone1 eq '010'}">selected</c:if>>010</option>
	                            		<option value="011" <c:if test="${memberEdit.cellphone1 eq '011'}">selected</c:if>>011</option>
	                            		<option value="016" <c:if test="${memberEdit.cellphone1 eq '016'}">selected</c:if>>016</option>
	                            		<option value="017" <c:if test="${memberEdit.cellphone1 eq '017'}">selected</c:if>>017</option>
	                            		<option value="018" <c:if test="${memberEdit.cellphone1 eq '018'}">selected</c:if>>018</option>
	                            		<option value="019" <c:if test="${memberEdit.cellphone1 eq '019'}">selected</c:if>>019</option>
	                            	</select>-<input id="cellphone2" name="cellphone2" value="${memberEdit.cellphone2}" maxlength="4"/>-<input maxlength="4" id="cellphone3" name="cellphone3" value="${memberEdit.cellphone3}"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>SMS 수신</th>
	                            <td>
	                                <input type="radio" name="sms_check" id="sms_check" value="Y" <c:if test="${memberEdit.sms_check eq 'Y'}">checked</c:if>/><label for="sms_check">동의함</label>
	                                <input type="radio" name="sms_check" id="sms_check" value="N"  <c:if test="${memberEdit.sms_check eq 'N'}">checked</c:if>/><label for="sms_check">동의안함</label> </td>
	                        </tr>
	                        <tr>
	                            <th>이메일</th>
	                            <td>
	                                <input id="email" name="email" value="${memberEdit.email}" size="30" maxlength="50"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>뉴스레터 수신</th>
	                            <td>
	                            	<input type="radio" name="newsletter_check" checked value="Y" <c:if test="${memberEdit.newsletter_check eq 'Y'}">checked</c:if>/><label>수신함</label>
	                            	<input type="radio" name="newsletter_check" value="N" <c:if test="${memberEdit.newsletter_check eq 'N'}">checked</c:if>/><label>수신안함</label>
	                            </td>
	                        </tr>
                     </table>
                     <div class="join_section_btn"><br><input type="button" id="edit_btn" class="total_btn" value="회원정보수정"> <!-- <input type="reset"  class="total_btn" value="취소"> --></div>
                  </form>
                  </section>
			</div>
			<!-- Tab1 -->
			
			
			
			
			
			
			<!-- Tab2 -->
			<div id="menu1" class="tab-pane fade" style="background: white!important;height: 500px;">
				<h3>1:1 문의</h3>
				<br>
				<table class="table">
					<thead>
						<tr class="danger">
							<th width="10%">답변상태</th>
							<th width="20%">질문유형</th>
							<th width="60%">질문내용</th>
							<th width="10%">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="myDirectQuestionList" items="${myDirectQuestionList}" varStatus="status">
							<tr>
								<td>
									<c:set var="answer_state" value="${myDirectQuestionList.answer_state}" /> 
									<c:choose>
											<c:when test="${answer_state eq 'Y'}">답변완료</c:when>
											<c:when test="${answer_state eq 'N'}">답변대기중</c:when>
									</c:choose>
								</td>
								<td>${myDirectQuestionList.type}</td>
								<td><a>${fn:replace(myDirectQuestionList.contents, cn, br)}</a>
									<p style="background:#ebcccc;"><span style="font-size:0.8em">${myDirectQuestionList.answer_date}</span><br><br>${fn:replace(myDirectQuestionList.answer, cn, br)}</p></td>
								<td>${myDirectQuestionList.reg_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
			</div>
			<!-- Tab2 -->
			
			</div>
		</div>
		</div>
		<footer><jsp:include page="footer.jsp"></jsp:include></footer>
	</div>
	
	<script>
		function checkNumber(checkVal){
			var returnNum = true;
			
			if(checkVal.length > 0){
				for(i=0; i<checkVal.length; i++){
					if(!(checkVal.charAt(i) >= '0' && checkVal.charAt(i) <= '9')){
						returnNum = false;
					}
				}
			}		
			return returnNum;
		}	
		
		$(function(){
			$("p").hide();
			$("tr td a").click(function(){
				$(this).next().slideToggle(300);
				$("tr td a").not(this).next().slideUp(300);
				return false;
			});	
			


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
	            } else{
	            	if(!checkNumber($("#tel2").val())){
	            		alert("숫자만 입력하세요.");
	            		$("#tel2").focus();
	            		return false;
	            	}
	            }
	            
	            if($("#tel3").val() == ""){
	                alert("전화번호를 입력하세요.");
	                $("#tel3").focus();
	                return false;
	            } else{
	            	if(!checkNumber($("#tel3").val())){
	            		alert("숫자만 입력하세요.");
	            		$("#tel3").focus();
	            		return false;
	            	}
	            }
	            
	            if($("#cellphone1").val() != ""){
	                if($("#cellphone2").val() == ""){
	                    alert("휴대전화번호를 입력하세요.");
	                    $("#cellphone2").focus();
	                    return false;
	                } else{
	                	if(!checkNumber($("#cellphone2").val())){
	                		alert("숫자만 입력하세요.");
	                		$("#cellphone2").focus();
	                		return false;
	                	}
	                }
	                
	                if($("#cellphone3").val() == ""){
	                    alert("휴대전화번호를 입력하세요.");
	                    $("#cellphone3").focus();
	                    return false;
	                } else{
	                	if(!checkNumber($("#cellphone3").val())){
	                		alert("숫자만 입력하세요.");
	                		$("#cellphone3").focus();
	                		return false;
	                	}
	                }   
	            }
	            
	            if($("#email").val() != ""){
	            	var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;//이메일 정규식
	              	 
	            	if(!emailRule.test($("input[id='email']").val())) {            
	          	    	alert("이메일 형식을 바르게 입력하세요.")
	          	        return false;
	            	}            	
	            }
	            
	            $("#editForm").attr("action", "editProcess").submit();
	            
	        }); 
		})
	</script>
</body>
</html>
