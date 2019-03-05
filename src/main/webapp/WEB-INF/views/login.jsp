<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="project.title"/></title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 2018.10.30 추가(jQuery 추가 시작) -->
<Script>
    $(function(){
    	
        $("input:submit").on("click", function(){
            if($("#id").val() == ""){
                alert("아이디를 입력하세요.");
                $("#id").focus();
                return false;                    
            }
            if($("#pwd").val() == ""){
                alert("비밀번호를 입력하세요.");
                $("#pwd").focus();
                return false;    
            }
            
            
            /* var sendData = $("#loginForm").serialize();
            $.post(
            		"loginCheck.jsp", 
            		sendData,
            		function(msg){
            				alert(msg);
            		}
            	); */
            $("#loginForm").attr("method", "post");
            $("#loginForm").submit();
            //$("#loginForm").attr("action", "loginProcess").submit();
        });
        
        $("#joinToBtn").on("click", function(){
        	/* $("#loginForm").attr("action", "join").submit(); */
        	window.location.href="join";
        }); 
    })
</Script>
<!-- 2018.10.30 추가(jQuery 추가 종료) -->
    
</head>
<body>
	<div id="container">
	    <header><jsp:include page="header.jsp"></jsp:include></header>	        
	    <!--컨텐츠-->
	    <article>
	        <div id="contents">
	            <div class="login_container">
	                <section>
	                    <div class="about_title"><h3>[로그인]</h3></div>
	                </section>
	                <section>
	                    <form id="loginForm"> 
	                        <div class="login_section">
	                            <div><label>아이디: </label><input type="text" size="25" name="id" id="id"></div>
	                            <div><label>비밀번호: </label><input type="password" size="25" name="pwd" id="pwd"></div>
	                            <div><input type="submit" value="로그인">&nbsp;<input type="button" value="회원가입" id="joinToBtn"></div>
	                            <c:if test="${msg eq 'failure'}">
				                    <div style="color: red">
				                        아이디 또는 비밀번호가 일치하지 않습니다.
				                    </div>
				                </c:if>
	                        </div>
	                    </form>
	                </section>
	            </div>
	        </div><br><br>
	    </article>	
	    <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
</body>
</html>