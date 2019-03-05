<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title><spring:message code="project.title"/></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/css/w3.css?ver=1"/>
	<link rel="stylesheet" href="/css/admin.css"/>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
	<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
	<style type="text/css">
		#table {
			display: table;
			width: 90%;
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
		
		
		.order_inner{
			width:100%;
			border-collapse: collapse;
			margin: 0px;
		}
		
				
		.col1 {
			width: 20%;
			border-bottom: 1px solid #DDD;
			padding: 10px;
			background: #c0c0c0;
		}
		
		.col2 {
			width: 40%;
		}
		
		.col4 {
			width: 30%;
		}
		
		.font_weight {
			font-weight: bold;
		}
		
				
		.orderdiv {
			width: 80%;
			margin-left: auto;
			margin-right: auto;
			text-align: center;
		}
		
		
				
		.width10 {
			width: 100px;margin:0px;
		}
		
		.width15 {
			width: 150px;margin:0px;
		}
		
		.width20 {
			width: 200px;margin:0px;
		}
		
		.width35 {
			width: 350px;
			margin:0px;
		}
		
		.left {
			text-align: left;
		}
		
		.order_subsection {
			height: 1000px;
		}
		
		.border_bottom {
			border-bottom: 1px solid gray;
		}
		.border_right{
			border-right: 1px solid gray;
		}
		
		.orderList-td{
			padding: 15px;
			text-align: center;
			border_bottom: 1px solid gray;
		}
		.btncalendar {
			display: inline-block;
			width: 22px;
			height: 22px;
			background: url(../../images/order/calendar1.jpg) center center no-repeat;
			text-indent: -999em
		}
	</style>
</head>
<body>
<%@include file="leftmenu.jsp" %>
<%@include file="hiddenMenu.jsp" %>

<div class="row">
	<div class="col-md-11"></div>	
	<div class="col-md-1 text-right">
		<!-- perPageNum의 값을 정하는 select 박스 -->
		<select class="form-control" id="perPageSel">
	  		<option value="5">5</option>
	  		<option value="10">10</option>
		</select>
	</div>
</div>

<div class="w3-main" style="margin-left:340px;margin-right:40px">
	<div class="w3-container" id="services" style="margin-top:30px">
	    <h1 class="w3-xxlarge w3-text-red"><b>주문리스트</b></h1>
	    <hr style="width: 50px; border: 5px solid red" class="w3-round">
	    
	    <div class="search">	   
	    	<form id="MyOrderListForm" >
	    	<input type="hidden" name="fileName" id="fileName">   	
	    	<select id="searchTypeSel" name="searchType">
	    		<option value="">검색조건</option>
		  		<option value="t">주문번호</option> 
		  		<option value="c">주문자아이디</option>
		  		<option value="all">주문기간</option>
			</select>
			<input class="form-control" type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/> 
			<span class="dset">기간: <input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" value="${pageMaker.cri.searchStartDate}" size="10px"></span> 
			<span class="demi">~</span>
			<span class="dset"> <input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" value="${pageMaker.cri.searchEndDate}" size="10px"></span> 
			</form>
			<div style="text-align: right;">
			<button id="searchBtn" class="w3-btn w3-red w3-round" >Search</button>&nbsp;<button id="excelBtn" class="w3-btn w3-red w3-round" >List DownLoad</button></div>
			
	    </div><br>
	    
	    <table class="list-table">
			<tr class="list-tr w3-sand">
				<th class="cell width15">주문일자</th>
				<th class="cell width15">주문자명(아이디)</th>
				<th class="cell width15">주문번호</th>
				<th class="cell width35">상품정보</th>
				<th class="cell width10">수량</th>
				<th class="cell width10">결제금액</th>
				<th class="cell width10">주문상태</th>
			</tr>	
			<c:set var="orderListLength" value="${fn:length(orderList)}"/>
			<c:choose>
			<c:when test="${orderListLength eq 0 }">
			<tr>
				<td colspan="7" class="orderList-td border_bottom"> 주문 내역이 없습니다.</td>
			</tr>
			</c:when>
            <c:otherwise>
			<c:forEach var="orderList" items="${orderList}" varStatus="status">
			<tr class="list-tr">
				<td class="cell">${orderList.order_date}</td>
				<td class="cell">${orderList.user_name}(${orderList.user_id})</td>
				<td class="cell">${orderList.order_idx}</td>	
				<td class="cell" colspan="3">
				<table class="order_inner">
					<c:forEach var="detailList" items="${detailList}" varStatus="status">
						<c:forEach items="${detailList}" var="detailListSub">
							<c:if test="${detailListSub.order_idx eq orderList.idx}">
								<tr>
									<c:set var="productCount" value="${detailListSub.count}"/>
									<c:set var="productPrice" value="${detailListSub.product_price}"/>
									<c:set var="totalPrice" value="${productCount*productPrice}" />
									<td class="width35 left"><img src="<spring:url value='/uploadImage/${detailListSub.image_file}'/>" height="30px" />&nbsp;${detailListSub.product_name }</td>
									<td class="width10">${detailListSub.count }</td>
									<td class="width10" style="text-align:right;"><fmt:formatNumber value="${totalPrice}" pattern="#,###" />원</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>
				</table>
				</td>
				<td class="cell width10"><c:set var="order_status" value="${orderList.status}" /> 
				<c:choose>
					<c:when test="${order_status eq '0'}">&nbsp;입금전</c:when>
					<c:when test="${order_status eq '1'}">&nbsp;입금완료</c:when>
				</c:choose>
				</td>			
			</tr>	
			</c:forEach>	
			</c:otherwise>
			</c:choose>	
		</table>
		
	</div>
	<%@ include file="orderPaging.jsp" %>

</div>

<script>

$(function(){
	$("#excelBtn").on("click",function(){
		var $searchTypeSel = $('#searchTypeSel').val();
		var $keyword = $('#keyword').val();
		var searchStartDate = $("#searchStartDate").val();
		var searchEndDate = $("#searchEndDate").val();	
		var fileName = $keyword+"_"+searchStartDate+"_"+searchEndDate;
		$("#fileName").val(fileName);
		$("#MyOrderListForm").attr("method", "post");
		$("#MyOrderListForm").attr("action", "ExcelDown").submit();		
	});
	
	//검색 버튼이 눌리면
	$('#searchBtn').on('click',function(){
		var $searchTypeSel = $('#searchTypeSel');
		var $keyword = $('#keyword');
		var searchTypeVal = $searchTypeSel.val();
		var keywordVal = $keyword.val();
		var searchStartDate = $("#searchStartDate").val();
		var searchEndDate = $("#searchEndDate").val();	
		
		if(!searchTypeVal){
			alert("검색 조건을 선택하세요!");
			$searchTypeSel.focus();
			return false;
		} else{	// 검색조건 선택 시 기간인 경우는 keywordVal 체크 안 하고 searchStartDate, endDate check
			if(searchTypeVal == "all"){	// all인 경우 
				if(!searchStartDate){
					alert("시작일자를 선택하세요!");
					return false;
				} else if(!searchEndDate){
					alert("종료일자를 선택하세요!");
					return false;
				}
			} else {	// all 아닌 경우
				if(!keywordVal){
					alert("검색어를 입력하세요!");
					$('#keyword').focus();
					return false;
				}
			}
		}		
		
		var url = "orderList?page=1"
			+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
			+ "&searchType=" + searchTypeVal
			+ "&keyword=" + encodeURIComponent(keywordVal)
			+ "&searchStartDate=" + searchStartDate
			+ "&searchEndDate=" + searchEndDate;
		window.location.href = url;	
	});	
	
	$("#searchTypeSel").on('change', function(){
		inputClear();
	});

	//datepicker 한국어로 사용하기 위한 언어설정
	$.datepicker.setDefaults($.datepicker.regional['ko']);

	// Datepicker            
	$(".datepicker").datepicker({
		showButtonPanel : true,
		dateFormat : "yy-mm-dd",
		onClose : function(selectedDate) {

			var eleId = $(this).attr("id");
			var optionName = "";

			if (eleId.indexOf("StartDate") > 0) {
				eleId = eleId.replace("StartDate", "EndDate");
				optionName = "minDate";
			} else {
				eleId = eleId.replace("EndDate", "StartDate");
				optionName = "maxDate";
			}

			$("#" + eleId).datepicker("option", optionName, selectedDate);
			$(".searchDate").find(".chkbox2").removeClass("on");
		}
	});
	
	
	//perPageNum select 박스 설정
	setPerPageNumSelect();
	setSearchTypeSelect();
	
	
	//등록, 삭제 후 문구 처리
	var result = '${result}';
	$(function(){
		if(result === 'registerOK'){
			$('#registerOK').removeClass('hidden');
			$('#registerOK').fadeOut(2000);
		}
		if(result === 'removeOK'){
			$('#removeOK').removeClass('hidden');
			$('#removeOK').fadeOut(2000);
		}
	})
	
	//prev 버튼 활성화, 비활성화 처리
	var canPrev = '${pageMaker.prev}';
	if(canPrev !== 'true'){
		$('#page-prev').addClass('disabled');
//		$('#page-prev').addClass('hidden');
	}
	
	//next 버튼 활성화, 비활성화 처리
	var canNext = '${pageMaker.next}';
	if(canNext !== 'true'){
		$('#page-next').addClass('disabled');
//		$('#page-next').addClass('hidden');
	}
	
	//현재 페이지 파란색으로 활성화
	var thisPage = '${pageMaker.cri.page}';
	//매번 refresh 되므로 다른 페이지 removeClass 할 필요는 없음->Ajax 이용시엔 해야함
	$('#page'+thisPage).addClass('active');
})

function setPerPageNumSelect(){
	var perPageNum = "${pageMaker.cri.perPageNum}";
	var $perPageSel = $('#perPageSel');
	var thisPage = '${pageMaker.cri.page}';
	$perPageSel.val(perPageNum).prop("selected",true);
	//PerPageNum가 바뀌면 링크 이동
	$perPageSel.on('change',function(){
		//pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
		window.location.href = "orderList?page="+thisPage+"&perPageNum="+$perPageSel.val();
	})
}

function setSearchTypeSelect(){
	var $searchTypeSel = $('#searchTypeSel');
	var $keyword = $('#keyword');
	
	
	$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected",true);
	
	
}

function inputClear(){
	$("#keyword").val("");
	/*$("#searchStartDate").val('');
	$("#searchEndDate").val('');*/
}


	

</script>
<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
