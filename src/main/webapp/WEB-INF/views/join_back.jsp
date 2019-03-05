<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            }
        }).open();
    }
</script>

<script>
    $(document).ready(function(){
    	
    	$("#chkID").on("click", function(){
    		if($("#id").val() == ""){
                alert("아이디를 입력하세요.");
                $("#id").focus();
                return false;
            } else{
            	var query = "id="+$("#id").val();
 				 $.post(
 						 "checkID.jsp",
 						 query,
 						 function(msg){ 							 
 							 if(msg != -1){
 								alert("동일한 아이디가 존재합니다. 사용할 수 없습니다.");
 							 } else{
 								alert("사용가능한 아이디입니다.");
 							 } 							 
 							$("#chkID_result").val(msg);
 							console.log(msg);
 						 }
 				);
            }
    	});

       // $("#join_btn").on("click", check_form);
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
          
            
            /* if($("#chkID_result").val() == "" || $("#chkID_result").val() != -1){
            	alert("아이디 중복체크를 하세요.");
            	return false;
            } */
            
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
	                	<form:form id="joinForm" action="joinProcess" modelAttribute="member" method="post">	                  
	                    <table id="register_table">
	                        <tr>
	                            <th>이름 *</th>
	                            <td><form:input path="name" class="input"/><form:errors path="name"/>
	                        </tr>
	                        <tr>
	                            <th>아이디 *</th>
	                            <td><form:input path="id" class="input"/> &#160;&#160;<input type="" id="chkID_result" value="사용가능합니다"/><a href="#" title="아이디 중복 확인" id="chkID">중복조회</a></td>
	                        </tr>
	                        <tr>
	                            <th>비밀번호 *</th>
	                            <td><form:password path="pwd" class="input"/> &#160; <span style="font-size:10px; color:white;">비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합하여 10자~16자로 입력해주세요.</span> </td>
	                        </tr>
	                        <tr>
	                            <th>비밀번호 확인 *</th>
	                            <td><input value="" type="password" size="25" id="rePwd" /></td>
	                        </tr>
	                        <tr>
	                            <th>주소 *</th>
	                            <td>
	                                <form:input path="post_no" readonly="true" style="margin-top: 5px; margin-bottom: 5px;" /> <a href="#none"
	                                    title="우편번호 검색(새창으로 열기)" onclick="" id="postBtn" class="" style="margin-left:10px">우편번호  검색</a><br />
	                               	<form:input path="addr1" readonly="true" size="45"/>
	                                <form:input path="addr2"  size="25" style="margin-bottom: 5px"/></td>
	                        </tr>
	                        <tr>
	                            <th>전화 *</th>
	                            <td>
	                            	<form:select path="tel1">
	                            		<form:option value="02">02</form:option>
	                            		<form:option value="031">031</form:option>
	                            		<form:option value="032">032</form:option>
	                            		<form:option value="033">033</form:option>
	                            		<form:option value="041">041</form:option>
	                            		<form:option value="042">042</form:option>
	                            		<form:option value="043">043</form:option>
	                            		<form:option value="044">044</form:option>
	                            		<form:option value="051">051</form:option>
	                            		<form:option value="052">052</form:option>
	                            		<form:option value="053">053</form:option>
	                            		<form:option value="054">054</form:option>
	                            		<form:option value="055">055</form:option>
	                            		<form:option value="061">061</form:option>
	                            		<form:option value="062">062</form:option>
	                            		<form:option value="063">063</form:option>
	                            		<form:option value="064">064</form:option>
	                            		<form:option value="0502">0502</form:option>
	                            		<form:option value="0505">0505</form:option>
	                            		<form:option value="0506">0506</form:option>
	                            		<form:option value="070">070</form:option>
	                            		<form:option value="010">010</form:option>
	                            		<form:option value="011">011</form:option>
	                            		<form:option value="016">016</form:option>
	                            		<form:option value="017">017</form:option>
	                            		<form:option value="018">018</form:option>
	                            		<form:option value="019">019</form:option>
	                            	</form:select>-<form:input path="tel2"/>-<form:input path="tel3"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>휴대전화</th>
	                            <td>
	                            	<form:select path="cellphone1">
	                            		<form:option value="">없음</form:option>
	                            		<form:option value="010">010</form:option>
	                            		<form:option value="011">011</form:option>
	                            		<form:option value="016">016</form:option>
	                            		<form:option value="017">017</form:option>
	                            		<form:option value="018">018</form:option>
	                            		<form:option value="019">019</form:option>
	                            	</form:select>-<form:input path="cellphone2"/>-<form:input path="cellphone3"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>SMS 수신</th>
	                            <td>
	                                <form:label path="" for=""></form:label><form:checkbox path="sms_check" value="Y" checked="true"/>동의함 </td>
	                        </tr>
	                        <tr>
	                            <th>이메일</th>
	                            <td>
	                                <form:input path="email"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>뉴스레터 수신</th>
	                            <td>
	                            	<form:radiobutton path="newsletter_check" checked="true" value="Y"/><form:label path="">수신함</form:label>
	                            	<form:radiobutton path="newsletter_check" value="N"/><form:label path="">수신안함</form:label>
	                            </td>
	                        </tr>
	                    </table>
	                    <div class="join_section_btn"><br><input type="submit"  id="join_btn" value="회원가입"> <input type="reset"  class="total_btn" value="취소"></div>
	                    </form:form>
	                </section>
	                <div class="mid_line"></div>
	            </div>
	        </div>
	    </article>	
	    <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
</body>
</html>