<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<title><spring:message code="project.title"/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/css/w3.css?ver=1"/>
<link rel="stylesheet" href="/css/admin.css"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins"/>
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

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
	    <h1 class="w3-xxlarge w3-text-red"><b>상품리스트</b></h1>
	    <hr style="width: 50px; border: 5px solid red" class="w3-round">
	    
	    <div class="search">
	    	<select id="searchTypeSel" name="searchType">
	    		<option value="">전체조회</option>
		  		<option value="t">상품명</option> 
		  		<option value="c">영문명</option>
		  		<option value="all">상품명+영문명</option>
			</select>
			<input class="form-control" type="text" id="keyword" name="keyword" 
				value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/> <button id="searchBtn" class="w3-btn w3-red w3-round">Search</button>
			<%-- <hr><table class="searchTable">
				<tr>
					<td>카테고리 선택: <select id="searchCategory">
							<option value="">--전체--</option>
							<c:forEach var="productTypeList" items="${productTypeList }" varStatus="status">
								<option value="${productTypeList.idx}">${productTypeList.type}</option>
							</c:forEach>
						</select>
					</td>
					<td>가격:  <input type="text" size="8" name="searchPrice1" id="searchPrice1">원 - <input type="text" size="8" name="searchPrice2" id="searchPrice2">원 </td>
					<td>진열 여부: <input type="checkbox" value="Y" name="view_check1" id="view_check1">진열&nbsp;&nbsp;<input type="checkbox" value="N" name="view_check2" id="view_check2">숨김</td>
					<td><button id="searchBtn" class="w3-btn w3-red w3-round">Search</button></td>
				</tr>
			</table> --%>
	    </div><br>
	   
	    
	    <table class="list-table">
			<tr class="list-tr w3-sand">
				<th class="list-th">번호</th>
				<th class="list-th">카테고리</th>
				<th class="list-th">상품명</th>
				<th class="list-th">영문명</th>
				<th class="list-th">가격</th>
				<th class="list-th">상태</th>
				<th class="list-th">등록일</th>
				<th class="list-th">수정</th>
			</tr>	
			<c:set var="productListLength" value="${fn:length(productList)}"/>
			<c:forEach var="productList" items="${productList}" varStatus="status">
			<tr class="list-tr">
				<td class="list-td">${productList.idx}</td>
				<td class="list-td">${productList.type}</td>
				<%-- <td class="list-td"><img src="/resources/uploadImg/${productList.image_file}" height="100"></td> --%>
				<td class="list-td"><a href="/admin/productView${pageMaker.makeQuery(pageMaker.cri.page)}&idx=${productList.idx}">${productList.name}</a></td>
				<td class="list-td"><a href="/admin/productView${pageMaker.makeQuery(pageMaker.cri.page)}&idx=${productList.idx}">${productList.eng_name}</a></td>	
				<td class="list-td" style="text-align:right"><fmt:formatNumber value="${productList.price}" pattern="#,###"/> 원&nbsp; </td>
				<td class="list-td">
					<c:set var="view_check" value="${productList.view_check}"/>
					<c:choose>
						<c:when test="${view_check eq 'Y'}">진열</c:when>
						<c:when test="${view_check eq 'N'}">숨김</c:when>
					</c:choose>
				</td>
				<td class="list-td"><fmt:formatDate value="${productList.reg_date}" pattern="YYYY-MM-dd"/></td>
				<td class="list-td"><a href="/admin/productUpdate${pageMaker.makeQuery(pageMaker.cri.page)}&idx=${productList.idx}">
				<input type="button" class="w3-btn w3-red w3-round" value="수정" id="btn_update"></a></td>
			</tr>	
			</c:forEach>		
		</table>
	</div>
	<%@ include file="productPaging.jsp" %>

</div>

<script>
$(function(){
	
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
	
	$("#searchTypeSel").on('change', function(){
		inputClear();
	});
})

function setPerPageNumSelect(){
	var perPageNum = "${pageMaker.cri.perPageNum}";
	var $perPageSel = $('#perPageSel');
	var thisPage = '${pageMaker.cri.page}';
	$perPageSel.val(perPageNum).prop("selected",true);
	//PerPageNum가 바뀌면 링크 이동
	$perPageSel.on('change',function(){
		//pageMarker.makeQuery 사용 못하는 이유: makeQuery는 page만을 매개변수로 받기에 변경된 perPageNum을 반영못함
		window.location.href = "productListPage?page="+thisPage+"&perPageNum="+$perPageSel.val();
	})
}

function setSearchTypeSelect(){
	var $searchTypeSel = $('#searchTypeSel');
	var $keyword = $('#keyword');
	
	
	$searchTypeSel.val('${pageMaker.cri.searchType}').prop("selected",true);
	
	//검색 버튼이 눌리면
	$('#searchBtn').on('click',function(){
		var searchTypeVal = $searchTypeSel.val();
		var keywordVal = $keyword.val();
		
		
		/* //검색 조건 입력 안했으면 경고창 
		if(!searchTypeVal){
			alert("검색 조건을 선택하세요!");
			$searchTypeSel.focus();
			return false;
		//검색어 입력 안했으면 검색창
		}else if(!keywordVal){
			alert("검색어를 입력하세요!");
			$('#keyword').focus();
			return false;
		}  
		if(!keywordVal){
			alert("검색어를 입력하세요!");
			$('#keyword').focus();
			return false;
		}*/
		var url = "productListPage?page=1"
			+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
			+ "&searchType=" + searchTypeVal
			+ "&keyword=" + encodeURIComponent(keywordVal);
		window.location.href = url;
		
		
	})
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
