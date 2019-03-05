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
        
    </style>
</head>

<body>
	<div id="container">
        <header><jsp:include page="header.jsp"></jsp:include></header>
        <!--컨텐츠-->
        <article>
            <div id="contents">
                <section class="news_section">
                    <div class="news_title"><h3><b>[장바구니]</b></h3></div>
                    <c:set var="cartListLength" value="${fn:length(cartList)}"/>
                    <c:choose>
                    	<c:when test="${cartListLength eq 0 }">
		                    <div id="table">
		                        <br><br>
		                        <table id="table">
		                        	<tr style="">
			                    		<th class="cell"><img src="<spring:url value='/images/order/images.png'/>"></th>
		                    		</tr>
			                    	<tr style="">
			                    		<th class="cell">장바구니가 비었습니다.</th>
		                    		</tr>
	                    		</table>
		                    </div>
		            	</c:when>
                    	<c:otherwise>
                    		<form id="basketForm">
		                    <table id="table">
		                    	<tr style="background: rgb(230, 196, 196)">
		                    		<th class="cell">사진</th>
		                    		<th class="cell">상품명</th>
		                    		<th class="cell">수량</th>
		                    		<th class="cell">상품가격</th>
		                    		<th class="cell">합계</th>
		                    		<th class="cell">선택</th>
		                    	</tr>
		                    	<c:forEach var="cartList" items="${cartList}" varStatus="status">
		                    	<tr>
		                    		<td class="cell"><img src="<spring:url value='/uploadImage/${cartList.image_file}'/>" width="50"/></td>
		                    		<td class="cell">${cartList.product_name}</td>
		                    		<td class="cell"><input type="number" name="count" value="${cartList.count}" min=1 max=10 style="width:40px">&nbsp;<input type="button" name="countUpdate"  value="수정"></td>
		                    		<td class="cell"><fmt:formatNumber value="${cartList.price}" pattern="#,###"/>원</td>
		                    		<td class="cell"><fmt:formatNumber value="${cartList.sumPrice}" pattern="#,###"/>원</td>
		                    		<td class="cell"><input type="checkbox" name="checkbox_name" id="chkBox" value="${cartList.idx }"></td>
		                    	</tr>
		                    	</c:forEach>
		                    </table>
		                    <table id="table">
		                    	<tr>
		                    		<td style="text-align: right">상품금액합계: <fmt:formatNumber value="${sumPriceTotal}" pattern="#,###"/>원</td>
		                    	</tr>
		                    	<tr>
		                    		<td style="text-align: right">&nbsp;</td>
		                    	</tr>
		                    	<tr>
		                    		<td style="text-align: right"><input type="button" id="orderBtn" class="total_btn" value="전체상품 주문하기"></td>
		                    	</tr>
		                    	
		                    </table>
		                    
		                    <div id="table"><input type="button" id="item_del" value="선택상품 삭제" class="total_btn">&nbsp;<input type="button" id="basket_empty" value="장바구니 비우기" class="total_btn"></div>
		                    </form>
		                </c:otherwise>
                	</c:choose>
                </section>
            </div>
        </article>
        <br><br>

        <!--footer-->
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
    
    <script>
        $(function(){
        	
        	// 선택상품 삭제
            $("#item_del").on("click", function(){    
            	$chkedCnt = $("input:checkbox[name=checkbox_name]:checked").length;
            	
				if($chkedCnt == 0){
					alert("선택된 상품이 없습니다.");
					return false;
				} else {
					if(confirm("삭제하시겠습니까?")){
						var list = [];
		            	$("input:checkbox[name=checkbox_name]:checked").each(function() {   
		            		
		                    list.push($(this).val());                    
		               	}); 
		            	
		            	$.ajax({
			       	    	data: {"checkedArr":list},
		        	        url:"dropCheckedProduct",
		        	        type:'POST',
		        	        success:function(responseData){
		        	        	alert("삭제 되었습니다.");  
		        	        	window.location.reload(); 		       	        		       	        	
		        	        },
		        	        error:function(jqXHR, textStatus, errorThrown){
		        	            alert("오류가 발생하였습니다." + textStatus + " : " + errorThrown);
		        	        }
		        	    });
					}					
				}            	
            });
            
			// 장바구니 비우기
            $("#basket_empty").on("click", function(){
                if(confirm("장바구니를 비우시겠습니까?")){
                	$("#basketForm").attr("method", "post");
                    $("#basketForm").attr("action", "emptyBasket").submit();
                }
            });
            
           
			// 수량 수정(버튼 클릭 시 변경 처리 로직)			
            $("#basketForm input[name=countUpdate]").on("click", function(){ 
            	$index = $("#basketForm input[name=countUpdate]").index(this);
            	if($("#basketForm input[name=count]").eq($index).val() == 0){
            		alert("수량은 1이상이어야 합니다.");
            		$("#count").focus();
            	} else{            		
            		$.ajax({
    	       	    	data: {"count":$("#basketForm input[name=count]").eq($index).val(), "idx":$("input:checkbox[name=checkbox_name]").eq($index).val()},
            	        url:"updateCountProduct",
            	        type:'POST',
            	        success:function(responseData){
            	        	window.location.reload();
            	        },
	        	        error:function(jqXHR, textStatus, errorThrown){
	        	            alert("오류가 발생하였습니다." + textStatus + " : " + errorThrown);
	        	        }
            	    });  
            	}
            }); 
			
			/* 수량 수정 (넘버 박스 변경 시 처리 로직)
			$("#basketForm input[name=count]").on("change", function(){
				$index = $("#basketForm input[name=count]").index(this);
				if($("#basketForm input[name=count]").eq($index).val() == 0){
            		alert("수량은 1이상이어야 합니다.");
            		$($("#basketForm input[name=count]").eq($index)).focus();
            	} else{            		
            		$.ajax({
    	       	    	data: {"count":$("#basketForm input[name=count]").eq($index).val(), "idx":$("input:checkbox[name=checkbox_name]").eq($index).val()},
            	        url:"updateCountProduct",
            	        type:'POST',
            	        success:function(responseData){
            	        	window.location.reload();
            	        },
	        	        error:function(jqXHR, textStatus, errorThrown){
	        	            alert("오류가 발생하였습니다." + textStatus + " : " + errorThrown);
	        	        }
            	    });  
            	}
			}); */
			
            
			// 주문화면으로
            $("#orderBtn").click(function(){
           		$("#basketForm").attr("method", "post");
                $("#basketForm").attr("action", "order").submit();
            	
            });
        })
    </script>
    
</body>
</html>