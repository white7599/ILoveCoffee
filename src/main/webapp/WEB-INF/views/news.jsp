<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><spring:message code="project.title"/></title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css?ver=1">
    <link rel="stylesheet" href="css/admin.css?ver=1"/>
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
        .row:nth-child(n+2):hover{
            background-color:rgb(230, 196, 196);
        }
        #news_view:hover{
        	font-weight: bold;
        	text-decoration: none;
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
                    <div class="news_title">[공지사항]</div>
                    <div id="table">
                        <div class="row">
                            <span class="cell col1 font_weight">No</span>
                            <span class="cell col2 font_weight" style="width:60%">Title</span>
                            <span class="cell col3 font_weight" style="width:30%">Date</span>
                        </div>
                        <c:set var="noticeLength" value="${fn:length(noticeList)}"/>
                        <c:forEach var="newsList" items="${noticeList}" varStatus="status">
                        <div class="row">
                            <span class="cell col1">${newsList.idx}</span>
                            <span class="cell col2"><a id="news_view" href="news_view${pageMaker.makeQuery(pageMaker.cri.page)}&idx=${newsList.idx}">${newsList.title}</a></span>
                            <span class="cell col3">${newsList.reg_date}</span>
                        </div>
                        </c:forEach>
                    </div>
                    
                    <%@include file="newsPaging.jsp" %>
                    
                </section>
            </div>
        </article>
        <br><br>

        <!--footer-->
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
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
		//$('#page-prev').addClass('disabled');
		$('#page-prev').addClass('hidden');
	}
	
	//next 버튼 활성화, 비활성화 처리
	var canNext = '${pageMaker.next}';
	if(canNext !== 'true'){
		//$('#page-next').addClass('disabled');
		$('#page-next').addClass('hidden');
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

<script type="text/javascript" src="js/admin.js"></script>
</body>
</html>