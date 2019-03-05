<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Sidebar/menu -->
<style>
	a:hover{
		text-decoration:none;
	}
	a:link{
		text-decoration:none;
	}
</style>
<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
  <div class="w3-container"><%if (session.getAttribute("sessionAdminId") != null) {%><a href="/admin/logout" style="color:white">${sessionAdminName} 님 로그아웃</a><%} %>
    <h3 class="w3-padding-16"><b><a href="#" style="text-decoration:none; color:white;font-family: 'Nanum Gothic',sans-serif;">I Love Coffee!!<br>Admin
    </a></b></h3>
  </div>
  <div class="w3-bar-block">
    <div class="w3-bar-item w3-button">[상품관리]</div> 
    <a href="/admin/productTypeList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 상품분류리스트</a> 
    <a href="/admin/productTypeReg" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 상품분류등록</a>
    <a href="/admin/productListPage" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 상품리스트</a> 
    <a href="/admin/productReg" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 상품등록</a>
    <div class="w3-bar-item w3-button">[주문관리]</div> 
    <a href="/admin/orderList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 주문리스트</a> 
    <!-- <a href="/admin/orderList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 주문리스트</a> --> 
    <div onclick="w3_close()" class="w3-bar-item w3-button">[회원관리]</div> 
    <a href="/admin/memberList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 회원리스트</a> 
    <div onclick="w3_close()" class="w3-bar-item w3-button">[NEWS관리]</div>
    <a href="/admin/noticeList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- NEWS리스트</a> 
    <a href="/admin/noticeReg" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- NEWS등록</a>
    <div onclick="w3_close()" class="w3-bar-item w3-button">[FAQ관리]</div>
    <a href="/admin/faqList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- FAQ리스트</a> 
    <div onclick="w3_close()" class="w3-bar-item w3-button">[1:1문의관리]</div>
    <a href="/admin/directList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 1:1문의리스트</a> 
    <!-- <a href="#" onclick="w3_close()" class="w3-bar-item w3-button">[1:1문의관리]</a>
    <a href="/admin/directList" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">&nbsp;&nbsp;- 1:1문의리스트</a>  -->
  </div>
</nav>
