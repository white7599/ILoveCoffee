<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><spring:message code="project.title"/></title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <style>
        tr{
            height: 35px;
        }
        #btnsubmit{
            background-color: black;
            color: white;
            border: none;
            padding: 5px 30px;
        }

        #btnsubmit:hover{
            background-color: rgb(170, 12, 12);
            color: white;
            border: none;
            padding: 5px 30px;
        }
    </style>
</head>

<body>
	<div id="container">
        <header><jsp:include page="header.jsp"></jsp:include></header>
        
        <article>
            <div id="divcontents">
                <div class="login_container">
                    <section>
                        <div class="about_title"><h3>[1:1 문의]</h3></div>
                    </section>

                    <section>
	                    <form id="askForm" method="post">
	                    <table>
	                    <tbody>
	                    <tr>
	                        <td>질문유형</td>
	                        <td>
	                            <select id="type" name="type">
	                                <option value="쇼핑몰 이용 문의">쇼핑몰 이용 문의</option>
	                                <option value="원두 도매 문의">원두 도매 문의</option>
	                                <option value="생두 도매 문의">생두 도매 문의</option>
	                                <option value="교육 문의">교육 문의</option>
	                                <option value="마케팅, 취재 문의">마케팅, 취재 문의</option>
	                            </select>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>이메일 *</td>
	                        <td><input id="email" name="email" type="email" size="50" value="${login.email}"></td>
	                    </tr>
	                    <tr>
	                        <td>휴대폰</td>
	                        <td><input id="cellphone" name="cellphone" placeholder="" value="${login.cellphone1}${login.cellphone2}${login.cellphone3}" type="text" size="50"></td>
	                    </tr>
	                    
	                    <tr>
	                        <td>작성자 *</td>
	                        <td>${login.name}<input id="writer" name="writer" value="${login.id}" type="hidden" size="50"></td>
	                    </tr>
	                    <tr>
	                        <td>내용 *</td>
	                        <td><textarea rows="10" cols="100" id="contents"></textarea></td>
	                    </tr>
	                    </tbody>
	                    
	                    
	                    <tbody class="">
	                    <tr>
	                        <td width="200">개인정보 수집 및 이용 동의</td>
	                        <td>회사는 원활한 상담을 위하여 고객 정보(이름, 이메일, 연락처) 및 기타 상담 내용에 따라 접속 정보, 환불 계좌정보 등의 추가 정보를 수집하며 이용 목적 달성 시 폐기합니다.
	                        <p class="gBlank5"><input id="info_agree1" name="info_agree" value="Y" type="radio" checked="checked"><label for="info_agree1">동의함</label>
	                        <input id="info_agree2" name="info_agree" value="N" type="radio"><label for="info_agree2">동의안함</label></p>
	                        </td>
	                    </tr>
	                    </tbody>
	
	                    <tr>
	                        <td colspan="2" width="500" style="text-align: center;"><input type="button" id="btnsubmit" value="보내기"></td>
	                    </tr>
	                    </table>
	                    </form>
                    </section>
                    
                </div>
            </div><br><br>
        </article>
    
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
    
<script>
$(function(){
	$("#btnsubmit").click(function(){
		if($("#email").val() == ""){
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return false;
		}
		if($("#writer").val() == ""){
			alert("작성자를 입력하세요.");
			$("#writer").focus();
			return false;
		}
		if($("#contents").val() == ""){
			alert("내용을 입력하세요.");
			$("#contents").focus();
			return false;
		}
		
		var info_agree = $("input[name='info_agree']:checked").val();
		
		
		var allData = {"type":$("#type").val(), "email":$("#email").val(), "cellphone":$("#cellphone").val(), "writer":$("#writer").val(),"contents":$("#contents").val(), "info_agree":info_agree};

		console.log(allData);
	    $.ajax({

	    	data: allData,
	        url:"askProcess",
	        type:'POST',
	        
	        success:function(data){
	            alert("1:1문의가 정상적으로 등록되었습니다.!");
	            window.location.reload();
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("1:1 문의가 정상적으로 등록되지 않았습니다.~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
		
	});
	
});


</script>
</body>
</html>