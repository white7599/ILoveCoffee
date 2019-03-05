<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title><spring:message code="project.title"/></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================	-->
	<link rel="icon" type="image/png" href="/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!--===============================================================================================아이콘!-->
	<link rel="stylesheet" type="text/css" href="/images/fonts/font-awesome-4.7.0/css/font-awesome.css"> 
	<link rel="stylesheet" type="text/css" href="/css/util_admin.css">
	<link rel="stylesheet" type="text/css" href="/css/main_adminlogin.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url('/images/admin/bg-01.jpg');">
					<span class="login100-form-title-1">
						로그인
					</span>
				</div>

				<form class="login100-form validate-form" id="loginForm">
				<div class="wrap-input100 validate-input m-b-26" data-validate="아이디를 입력하세요.">
					<span class="label-input100">아이디</span>
					<input class="input100" type="text" name="id" id="id" placeholder="아이디를 입력하세요.">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-18" data-validate = "비밀번호를 입력하세요.">
					<span class="label-input100">비밀번호</span>
					<input class="input100" type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요.">
					<span class="focus-input100"></span>
				</div>									
				<div class="container-login100-form-btn ">
					<input type="button" class="login100-form-btn" id="loginBtn" value="로그인">&nbsp;&nbsp;
					<input type="reset" class="cancel100-form-btn" id="cancelBtn" value="취소">
				</div>
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="/js/admin_main.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#loginBtn").on("click", function(){
				if($("#id").val() == "") {
					alert("아이디를 입력하세요.");
					$("#id").focus();
					return false;
				}
				if($("#pwd").val() == ""){
					alert("비밀번호를 입력하세요.");
					$("#pwd").focus();
					return false;
				}
				
				var allData = {"id":$("#id").val(), "pwd":$("#pwd").val()};

				console.log(allData);
				
			    $.ajax({

			    	data: allData,
			        url:"loginProcess",
			        type:'POST',
			        
			        success:function(data){
			        	
			        	if(data == "success"){
			        		alert("관리자님 로그인 되었습니다.");
			        		window.location.href="productTypeList";
			        	}
			        	else{
			        		alert("아이디나 비밀번호를 확인하세요.");
			        		window.location.reload();
			        	}
			        },
			        error:function(jqXHR, textStatus, errorThrown){
			            alert("error~~ \n" + textStatus + " : " + errorThrown);
			        }
			    });
			    
			});
		})
	</script>
</body>
</html>