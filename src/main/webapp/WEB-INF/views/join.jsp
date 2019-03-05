<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="project.title"/></title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="<c:url value='css/main.css' />"  rel="stylesheet" />

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 2018.10.30 추가(jQuery 추가 시작) -->
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

	
    $(document).ready(function(){
    	
    	$("#chkID").on("click", function(){
    		if($("#id").val() == ""){
                alert("아이디를 입력하세요.");
                $("#id").focus();
                return false;
            } else{
        		var returnValue = "";
        		
        	     $.ajax({
	       	    	data: {"id":$("#id").val()},
        	        url:"checkID",
        	        type:'POST',
        	        success:function(responseData){
        	        	var data = JSON.parse(responseData);
        	        	console.log(data);
        	        	if(!data){
        	        		alert("사용가능합니다.");  
        	        		$("#pwd").focus();
        	        		returnValue = -1;	// null 반환되는 경우 사용 가능(-1로 세팅)
        	        	} else{
        	        		alert("동일한 아이디가 존재합니다. 사용할 수 없습니다.");
        	        		returnValue = 1;
        	        	}
        	        	$("#chkID_result").val(returnValue);
        	        }
        	    });    
        	     
            }
    	});


        $("#postBtn").on("click", daumPostCode); 
        $("#post_no").on("click", daumPostCode); 

        var totalData = "";           
        $("#join_btn").click(function(){
        	
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
            
          
            
            if($("#chkID_result").val() == "" || $("#chkID_result").val() != -1){
            	alert("아이디 중복체크를 하세요.");
            	return false;
            }
            
            $("#joinForm").attr("action", "joinProcess").submit();            
        });          
    });
    
</script>
<!-- 2018.10.30 추가(jQuery 추가 종료) --> 
</head>
<body>
	<div id="container">
		<!-- 상단 메뉴 -->
		<header><jsp:include page="header.jsp"></jsp:include></header>	
	    <article>
	        <div id="contents">
	            <div class="login_container">
	                <section>
	                    <h3><span class="font_weight"><spring:message code="project.join.title"/></span></h3>
	                </section>
	
	                <section class="join_section">
	                	<form id="joinForm" action="joinProcess" method="post">	                  
	                    <table id="register_table">
	                        <tr>
	                            <th>이름 *</th>
	                            <td><input name="name" id="name" class="input" maxlength="10"/>
	                        </tr>
	                        <tr>
	                            <th>아이디 *</th>
	                            <td><input name="id" id="id" class="input" maxlength="15"/> &#160;&#160;<input type="hidden" name="chkID_result" id="chkID_result" /><a href="#" title="아이디 중복 확인" id="chkID">중복조회</a></td>
	                        </tr>
	                        <tr>
	                            <th>비밀번호 *</th>
	                            <td><input type="password" name="pwd" id="pwd" class="input" maxlength="10"/></td>
	                        </tr>
	                        <tr>
	                            <th>비밀번호 확인 *</th>
	                            <td><input value="" type="password" size="25" id="rePwd" name="rePwd" maxlength="10"/></td>
	                        </tr>
	                        <tr>
	                            <th>주소 *</th>
	                            <td>
	                                <input name="post_no" id="post_no" readonly style="margin-top: 5px; margin-bottom: 5px;" /> <a href="#none"
	                                    title="우편번호 검색(새창으로 열기)" onclick="" id="postBtn" class="" style="margin-left:10px">우편번호  검색</a><br />
	                               	<input id="addr1" name="addr1" readonly size="45"/>
	                                <input id="addr2" name="addr2"  size="25" style="margin-bottom: 5px"/></td>
	                        </tr>
	                        <tr>
	                            <th>전화 *</th>
	                            <td>
	                            	<select id="tel1" name="tel1">
	                            		<option value="02">02</option>
	                            		<option value="031">031</option>
	                            		<option value="032">032</option>
	                            		<option value="033">033</option>
	                            		<option value="041">041</option>
	                            		<option value="042">042</option>
	                            		<option value="043">043</option>
	                            		<option value="044">044</option>
	                            		<option value="051">051</option>
	                            		<option value="052">052</option>
	                            		<option value="053">053</option>
	                            		<option value="054">054</option>
	                            		<option value="055">055</option>
	                            		<option value="061">061</option>
	                            		<option value="062">062</option>
	                            		<option value="063">063</option>
	                            		<option value="064">064</option>
	                            		<option value="0502">0502</option>
	                            		<option value="0505">0505</option>
	                            		<option value="0506">0506</option>
	                            		<option value="070">070</option>
	                            		<option value="010">010</option>
	                            		<option value="011">011</option>
	                            		<option value="016">016</option>
	                            		<option value="017">017</option>
	                            		<option value="018">018</option>
	                            		<option value="019">019</option>
	                            	</select>-<input type="text" id="tel2" name="tel2" maxlength="4"/>-<input id="tel3" name="tel3" maxlength="4"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>휴대전화</th>
	                            <td>
	                            	<select id="cellphone1" name="cellphone1">
	                            		<option value="">없음</option>
	                            		<option value="010">010</option>
	                            		<option value="011">011</option>
	                            		<option value="016">016</option>
	                            		<option value="017">017</option>
	                            		<option value="018">018</option>
	                            		<option value="019">019</option>
	                            	</select>-<input id="cellphone2" name="cellphone2" maxlength="4"/>-<input id="cellphone3" name="cellphone3" maxlength="4"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>SMS 수신</th>
	                            <td>
	                                <input type="radio" name="sms_check" id="sms_check" value="Y" checked/><label for="sms_check">동의함</label>
	                                <input type="radio" name="sms_check" id="sms_check" value="N" /><label for="sms_check">동의안함</label> </td>
	                        </tr>
	                        <tr>
	                            <th>이메일</th>
	                            <td>
	                                <input type="email" id="email" name="email" maxlength="50" size="30" />
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>뉴스레터 수신</th>
	                            <td>
	                            	<input type="radio" name="newsletter_check" checked value="Y"/><label>수신함</label>
	                            	<input type="radio" name="newsletter_check" value="N"/><label>수신안함</label>
	                            </td>
	                        </tr>
	                    </table>
	                    <div class="join_section_btn"><br><input type="button" id="join_btn" value="회원가입"> <input type="reset"  class="total_btn" value="취소"></div>
	                    </form>
	                </section>
	                <div class="mid_line"></div>
	            </div>
	        </div>
	    </article>	
	    <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
</body>
</html>