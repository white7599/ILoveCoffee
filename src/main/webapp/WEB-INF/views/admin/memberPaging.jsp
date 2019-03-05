<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="text-center">
	<nav aria-label="pagination">
		<ul class="pagination">
			<!-- prev 버튼 -->
			<li id="page-prev">
				<a href="memberList${pageMaker.makeQuery(pageMaker.startPage-1)}" aria-label="Prev">
					<span aria-hidden="true">«</span>
				</a>
			</li>
			
			<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<li id="page${idx}">
				<a href="memberList${pageMaker.makeQuery(idx)}">
				<!-- 시각 장애인을 위한 추가 -->
				<span>${idx}<span class="sr-only">(current)</span></span>
				 </a>
			</li>
			</c:forEach>
			
			<!-- next 버튼 -->
			<li id="page-next">
			    <a href="memberList${pageMaker.makeQuery(pageMaker.endPage+1)}" aria-label="Next">
			    	<span aria-hidden="true">»</span>
			    </a>
			</li>
		</ul>
	</nav>
</div>