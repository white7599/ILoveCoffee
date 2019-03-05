<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><spring:message code="project.title"/></title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css?after">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <style>
        #table {
            display: table;
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
        }

        .row {
            display: table-row;
        }

        .cell {
            display: table-cell;
            padding: 10px;
            border-bottom: 1px solid #DDD;
            text-align: center;
        }

        .col1 {
            width: 20%;
            border-bottom: 1px solid #DDD;
            padding: 10px;
            background:#c0c0c0;
        }

        .col2 {
            width: 40%;
        }

        .col4 {
            width: 30%;
        }
        .font_weight{
            font-weight: bold;
        }
        
        .order_td{
        	width: 200px;
        	border-bottom: 1px solid #DDD;
            padding: 10px;
        }
        .orderdiv{
            width: 80%;
            margin-left: auto;
            margin-right: auto;
            text-align:center;
        }
        
        .order_box{
        	width: 70%;
        	height: 400px;
        	margin-left: auto;
            margin-right: auto;
        	border: 3px solid #DDD;
        }
        .order_text{
        	width: 50%;
        	margin-top: 90px;
        	margin-left: auto;
            margin-right: auto;
            text-align:center;            
        }
        
        .order_table{
        	width: 70%;
        	margin-top: 30px;
        	margin-left: auto;
            margin-right: auto;
        	border-top: 2px solid black;
        	border-bottom: 1px solid #DDD;
        }
        
        .order_table th{
        	background: #dfdfdf;
        	width: 30%;
			padding: 6px;
			padding-left: 50px;
			border-bottom: 1px solid #808080;
		}
		.order_table td{       	
        	
			padding: 6px;
			padding-left: 50px;
			border-bottom: 1px solid #808080;
		}
		.font-red{
			color:red;
		}
        
        
    </style>
</head>

<body>
	<div id="container">
		<header><jsp:include page="header.jsp"></jsp:include></header>
		<!--컨텐츠-->
		<article>
		    <div id="contents">
		        <section class="order_section"><br> 
		        	<form id="orderForm">
		        	<section>
		            	<div class="about_title"><h3>주문완료</h3></div>
		            </section>      	
		            <input type="hidden" name="user_id" value="${member.id}">
		            <br>
		            <div class="order_box">
		            	<div class="order_text">
		            		<h3 class="font_weight">주문이 정상적으로 접수되었습니다.</h3>
		            		<h5>입금기한내에 입금이 되지 않는 경우 주문이 자동 취소 됩니다.</h5>
		            	</div>
		            	
		            	<table class="order_table">
			            	<tr>
			            		<th>입금금액</th>
			            		<td class="font-red font_weight"><fmt:formatNumber value="${sumPriceTotal}" pattern="#,###"/> 원</td>
			            	</tr>
			            	<tr>
			            		<th>입금은행</th>
			            		<td class="font_weight">신한은행</td>
			            	</tr>
			            	<tr>
			            		<th>계좌번호</th>
			            		<td class="font_weight">123-456-7890</td>
			            	</tr>
			            	<tr>
			            		<th>입금기한</th>
			            		<td class="font_weight">2019-03-12 23:59:59</td>
			            	</tr>
			            </table>
		            </div>
		            		            
					<br>
					<div class="orderdiv"><input type="button" id="orderViewBtn" class="total_btn" value="주문내역확인">&nbsp;<input type="button" id="goHomeBtn" class="total_btn" value="홈화면"></div>
					</form>
		        </section>
		    </div>
		</article>
		<br><br>
	
		<!--footer-->
		<footer><jsp:include page="footer.jsp"></jsp:include></footer>
		</div>
		<script>
		$(function(){		    
		    $("#goHomeBtn").click(function(){
		    	window.location.href="/";
		    });
		    $("#orderViewBtn").click(function(){
		    	window.location.href="myorderlist";
		    });
		})
		</script>    
</body>
</html>