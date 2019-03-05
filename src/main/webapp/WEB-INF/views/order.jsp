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
            width: 70%;
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
        
    </style>
</head>

<body>
	<div id="container">
		<header><jsp:include page="header.jsp"></jsp:include></header>
		<!--컨텐츠-->
		<article>
		    <div id="contents">
		        <section class="order_section">
		        	<form id="orderForm">
		        	<section>
		            	<div class="about_title"><h3>주문하기</h3></div>
		            </section>       	
		            <input type="hidden" name="user_id" value="${member.id}">
		            <table id="table">
		                <tr style="background: #c0c0c0">
						    <th class="cell">사진</th>
						    <th class="cell">상품명</th>
						    <th class="cell">수량</th>
						    <th class="cell">상품가격</th>
						    <th class="cell">합계</th>
						</tr>
						<c:forEach var="cartList" items="${cartList}" varStatus="status">
						<tr>
						    <td class="cell"><img src="<spring:url value='/uploadImage/${cartList.image_file}'/>" width="50"/></td>
							<td class="cell">${cartList.product_name}<input type="hidden" name="product_idx" value="${cartList.product_idx }"></td>
							<td class="cell"><input type="text" name="count" value="${cartList.count}" min=1 max=10 style="width:40px; text-align:center;" readonly></td>
							<td class="cell"><fmt:formatNumber value="${cartList.price}" pattern="#,###"/>원</td>
							<td class="cell"><fmt:formatNumber value="${cartList.sumPrice}" pattern="#,###"/>원</td>
						</tr>
						</c:forEach>
					</table>
					
					<table id="table">
					<tr>
					    <td style="text-align: right;font-weight:bold;" class="cell">상품금액합계:&nbsp; <fmt:formatNumber value="${sumPriceTotal}" pattern="#,###"/>원</td>
					    </tr>
					</table><br><br><hr>
		
					<section>
						<div class="about_title"><h3>배송지정보</h3></div>
					</section>
					
					<table id="table">
					    <tr>
					        <th class="col1">수취인</th>
					        <td class="order_td"><input type="hidden" name="payee_id" value="${member.id}"><input type="text" name="payee_name" value="${member.name}"></td>
					    </tr>
					    <tr>
					        <th class="col1">배송지주소</th>
					        <td class="order_td"><input id="post_no" name="post_no" readonly style="margin-top: 5px; margin-bottom: 5px;" value="${member.post_no }"/> <a href="#none" title="우편번호 검색(새창으로 열기)" id="postBtn" class="" style="margin-left:10px">우편번호  검색</a><br />
					   							<input id="addr1" name="addr1" readonly size="45" value="${member.addr1 }"/>&nbsp;<input id="addr2" name="addr2"  size="25" style="margin-bottom: 5px" value="${member.addr2 }"/></td>
					    </tr>
					    <tr>
						    <th class="col1">전화 *</th>
						    <td class="order_td">
						    	<select id="tel1" name="tel1">
						    		<option value="02" <c:if test="${member.tel1 eq '02'}">selected</c:if>>02</option>
						    		<option value="031" <c:if test="${member.tel1 eq '031'}">selected</c:if>>031</option>
						    		<option value="032" <c:if test="${member.tel1 eq '032'}">selected</c:if>>032</option>
						    		<option value="033" <c:if test="${member.tel1 eq '033'}">selected</c:if>>033</option>
						    		<option value="041" <c:if test="${member.tel1 eq '041'}">selected</c:if>>041</option>
						    		<option value="042" <c:if test="${member.tel1 eq '042'}">selected</c:if>>042</option>
						    		<option value="043" <c:if test="${member.tel1 eq '043'}">selected</c:if>>043</option>
						    		<option value="044" <c:if test="${member.tel1 eq '044'}">selected</c:if>>044</option>
						    		<option value="051" <c:if test="${member.tel1 eq '051'}">selected</c:if>>051</option>
						    		<option value="052" <c:if test="${member.tel1 eq '052'}">selected</c:if>>052</option>
						    		<option value="053" <c:if test="${member.tel1 eq '053'}">selected</c:if>>053</option>
						    		<option value="054" <c:if test="${member.tel1 eq '054'}">selected</c:if>>054</option>
						    		<option value="055" <c:if test="${member.tel1 eq '055'}">selected</c:if>>055</option>
						    		<option value="061" <c:if test="${member.tel1 eq '061'}">selected</c:if>>061</option>
						    		<option value="062" <c:if test="${member.tel1 eq '062'}">selected</c:if>>062</option>
						    		<option value="063" <c:if test="${member.tel1 eq '063'}">selected</c:if>>063</option>
						    		<option value="064" <c:if test="${member.tel1 eq '064'}">selected</c:if>>064</option>
						    		<option value="0502" <c:if test="${member.tel1 eq '0502'}">selected</c:if>>0502</option>
						    		<option value="0505" <c:if test="${member.tel1 eq '0505'}">selected</c:if>>0505</option>
						    		<option value="0506" <c:if test="${member.tel1 eq '0506'}">selected</c:if>>0506</option>
						    		<option value="070" <c:if test="${member.tel1 eq '070'}">selected</c:if>>070</option>
						    		<option value="010" <c:if test="${member.tel1 eq '010'}">selected</c:if>>010</option>
						    		<option value="011" <c:if test="${member.tel1 eq '011'}">selected</c:if>>011</option>
						    		<option value="016" <c:if test="${member.tel1 eq '016'}">selected</c:if>>016</option>
						    		<option value="017" <c:if test="${member.tel1 eq '017'}">selected</c:if>>017</option>
						    		<option value="018" <c:if test="${member.tel1 eq '018'}">selected</c:if>>018</option>
						    		<option value="019" <c:if test="${member.tel1 eq '019'}">selected</c:if>>019</option>
						    	</select>-<input id="tel2" name="tel2" value="${member.tel2 }"/>-<input id="tel3" name="tel3" value="${member.tel3 }"/>
						    </td>
						</tr>
						<tr>
							<th class="col1">휴대전화</th>
							<td class="order_td">
							 	<select id="cellphone1" name="cellphone1">
							 		<option value="" <c:if test="${member.cellphone1 eq ''}">selected</c:if>>없음</option>
							 		<option value="010" <c:if test="${member.cellphone1 eq '010'}">selected</c:if>>010</option>
							 		<option value="011" <c:if test="${member.cellphone1 eq '011'}">selected</c:if>>011</option>
							 		<option value="016" <c:if test="${member.cellphone1 eq '016'}">selected</c:if>>016</option>
							 		<option value="017" <c:if test="${member.cellphone1 eq '017'}">selected</c:if>>017</option>
							 		<option value="018" <c:if test="${member.cellphone1 eq '018'}">selected</c:if>>018</option>
							 		<option value="019" <c:if test="${member.cellphone1 eq '019'}">selected</c:if>>019</option>
							 	</select>-<input id="cellphone2" name="cellphone2" value="${member.cellphone2 }"/>-<input id="cellphone3" name="cellphone3" value="${member.cellphone3 }"/>
							</td>
						</tr>
						<tr>
							<th class="col1">배송메세지</th>
							<td class="order_td"><textarea rows="3" cols="70" id="message" name="message"></textarea></td>
						</tr>
					</table>
					<hr>
					
					<section>
						<div class="about_title"><h3>결제정보</h3></div>
					</section>
					<table id="table">
						<tr>
							<th class="col1">결제금액</th>
							<td class="order_td"><b><fmt:formatNumber value="${sumPriceTotal}" pattern="#,###"/>원</b><input type="hidden" name="total_amt" value="${sumPriceTotal}"></td>
						</tr>
						<tr>
							<th class="col1">결제방법</th>
							<td class="order_td"><input type="radio" name="payment_type" value="무통장입금" checked>무통장입금&nbsp;
							<input type="radio" name="payment_type" value="신용카드" readonly>신용카드</td>
						</tr>
					</table><br><br>
					
					<div class="orderdiv"><input type="button" id="orderBtn" class="total_btn" value="주문하기"></div>
					</form>
		        </section>
		    </div>
		</article>
		<br><br>
	
		<!--footer-->
		<footer><jsp:include page="footer.jsp"></jsp:include></footer>
		</div>
		   
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
		    
		    $("#orderBtn").click(function(){
		    	if(confirm("주문하시겠습니까?")){
		    		$("#orderForm").attr("method", "post");
		            $("#orderForm").attr("action", "order_complete").submit();
		    	}
		    });
		})
		</script>    
</body>
</html>