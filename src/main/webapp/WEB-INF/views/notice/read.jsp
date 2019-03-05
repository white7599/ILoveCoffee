<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/header.jsp" %>

<div id="saveOK" class="alert alert-warning hidden" role="alert">글이 수정되었습니다.</div>

<div class="box-body">
	<span><b>글번호:</b> ${noticeVO.idx}</span>	
	
    	<div class="form-group">
		<label for="title">Title</label>
		<input type="text" id="title" name="title" class="form-control" value="${noticeVO.title}" readonly="readonly"/>		
	</div>
    
	<div class="form-group">
		<label for="content">Contents</label>
		<textarea name="contents" id="contents" class="form-control" rows="3" readonly="readonly">${noticeVO.contents}</textarea>		
	</div>
    
	<div class="form-group">
		<label for="content">reg_date</label>
		<input type="text" name="contents" id="contents" class="form-control"readonly="readonly" value="${noticeVO.reg_date}">		
	</div>
    
</div>

<div>
	<!-- 목록 버튼 -->
	<!-- <a href="/notice/noticeList" class="btn btn-primary">LIST ALL</a> -->
	<a href="/notice/listPage${cri.makeQuery()}" class="btn btn-primary">LIST ALL</a>
	<!-- 수정 버튼 -->
	<a href="/notice/update${cri.makeQuery()}&idx=${noticeVO.idx}" class="btn btn-warning">update</a>
	<%-- <a href="/notice/update?idx=${noticeVO.idx}" class="btn btn-warning">update</a> --%>
	<!-- 삭제 버튼 -->
	<button id="btn-remove" class="btn btn-danger">delete</button>
</div>

<script>
//삭제 버튼 누르면 삭제할 것이냐고 묻고 삭제한다고 하면 주소이동(BoardController의 remove 메소드 호출)
	var result = '${result}';
	
	$(function(){
		$('#btn-remove').click(function(){
			if(confirm("Are u sure?")){
				self.location.href = "/notice/remove${cri.makeQuery()}&idx=${noticeVO.idx}";
			}
		});
		
		//수정 성공시 문구 나타났다 사라짐
		if(result === 'saveOK'){
			$('#saveOK').removeClass('hidden');
			$('#saveOK').fadeOut(2000);
		}
	});
</script>
	
<%@include file="../include/footer.jsp" %>