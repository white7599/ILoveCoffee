<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>

<%@include file="../include/header.jsp" %>

<div id="registerOK" class="alert alert-info hidden" role="alert">새 글이 등록되었습니다.</div>	
<div id="removeOK" class="alert alert-danger hidden" role="alert">글이 삭제되었습니다.</div>

	
<div class="row">
	<div class="col-md-11">
		<div class="form-inline">
			<select id="searchTypeSel" name="searchType">
		  		<option value="">검색조건</option>
		  		<option value="t">제목</option> 
		  		<option value="c">내용</option>
		  		<option value="tc">제목+내용</option>
		  		<option value="all">전체조건</option>
			</select>
			<input class="form-control" type="text" id="keyword" name="keyword" 
				value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요"/>
			<button id="searchBtn" class="btn btn-primary">Search</button>
		</div>
	</div>	
	<div class="col-md-1 text-right">
		<!-- perPageNum의 값을 정하는 select 박스 -->
		<select class="form-control" id="perPageSel">
	  		<option value="10">10</option>
	  		<option value="15">15</option>
	  		<option value="20">20</option>
		</select>
	</div>
</div>


	
<!-- 데이터 출력 -->	
<table class="table table-bordered">
	<tr>
		<th style="width: 10px">idx</th>
		<th>TITLE</th>
		<th>reg_date</th>
	</tr>
	<c:forEach items="${list}" var="noticeVO">
		<tr>
			<td>${ noticeVO.idx }</td>
			<!-- PageMaker의 makeQuery 메소드 이용해서 URI 생성 -->
			<td><a href="/notice/read${pageMaker.makeQuery(pageMaker.cri.page)}&idx=${noticeVO.idx}">${noticeVO.title}</a></td>
			<td><fmt:formatDate pattern="YYYY-MM-dd HH:mm:ss" value="${ noticeVO.reg_date}"/></td>
			
		</tr>
	</c:forEach>
</table>

<!-- 등록, dummy 버튼 -->
<div>
	<a href="/notice/register${pageMaker.makeQuery(pageMaker.cri.page)}"><button class="btn btn-primary">새글등록</button></a>
	<a href="/notice/listPage" class="btn btn-warning">처음목록</a>
	<a href="/notice/dummy"><button class="btn btn-danger">dummy생성</button></a>
</div>

<!-- 페이지 번호 -->	
<div class="text-center">
	<nav aria-label="pagination">
		<ul class="pagination">
		
			<!-- prev 버튼 -->
			<li id="page-prev">
				<a href="listPage${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">
					<span aria-hidden="true">«</span>
				</a>
			</li>
			
			<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <li id="page${idx}">
				    <a href="listPage${pageMaker.makeQuery(idx)}">
				    	<!-- 시각 장애인을 위한 추가 -->
				      	<span>${idx}<span class="sr-only">(current)</span></span>
				    </a>
			    </li>
			</c:forEach>
			
			<!-- next 버튼 -->
			<li id="page-next">
			    <a href="listPage${pageMaker.makeQuery(pageMaker.endPage + 1)}" aria-label="Next">
			    	<span aria-hidden="true">»</span>
			    </a>
			</li>
			
		</ul>
	</nav>
</div>
	
<script>
	$(function(){
		//perPageNum select 박스 설정
		setPerPageNumSelect();
		setSearchTypeSelect()
		
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
			window.location.href = "listPage?page="+thisPage+"&perPageNum="+$perPageSel.val();
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
				return;
			//검색어 입력 안했으면 검색창
			}else if(!keywordVal){
				alert("검색어를 입력하세요!");
				$('#keyword').focus();
				return;
			}
			var url = "listPage?page=1"
				+ "&perPageNum=" + "${pageMaker.cri.perPageNum}"
				+ "&searchType=" + searchTypeVal
				+ "&keyword=" + encodeURIComponent(keywordVal);
			window.location.href = url;
		})
	}
</script>
<%@include file="../include/footer.jsp" %>