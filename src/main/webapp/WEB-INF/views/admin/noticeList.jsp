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
<link rel="stylesheet" href="/css/w3.css"/>
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
    <h1 class="w3-xxlarge w3-text-red"><b>NEWS리스트</b></h1>
    <hr style="width:50px;border:5px solid red" class="w3-round">
    <table class="list-table">
		<tr class="list-tr w3-sand">
			<th class="list-th">순번</th>
			<th class="list-th">제목</th>
			<th class="list-th">등록일</th>
		</tr>	
		<c:set var="noticeListLength" value="${fn:length(noticeList)}"/>
		<c:forEach var="noticeList" items="${noticeList}" varStatus="status">
		<tr class="list-tr">
			<td class="list-td padding10">${noticeList.idx}</td>
			<td class="list-td padding10"><a href="/admin/noticeView${pageMaker.makeQuery(pageMaker.cri.page)}&idx=${noticeList.idx}">${noticeList.title}</a></td>
			<td class="list-td padding10">${noticeList.reg_date}</td>
		</tr>	
		</c:forEach>		
	</table>
  </div>
  
  <%@include file="noticePaging.jsp" %>
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
	}
	
	//next 버튼 활성화, 비활성화 처리
	var canNext = '${pageMaker.next}';
	if(canNext !== 'true'){
		$('#page-next').addClass('disabled');
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
		window.location.href = "noticeList?page="+thisPage+"&perPageNum="+$perPageSel.val();
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
		
		
		//검색 조건 입력 안했으면 경고창 
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
		var url = "noticeList?page=1"
			+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
			+ "&searchType=" + searchTypeVal
			+ "&keyword=" + encodeURIComponent(keywordVal);
		window.location.href = url;
		
		
	})
}
</script>

<script type="text/javascript" src="/js/admin.js"></script>

</body>
</html>
