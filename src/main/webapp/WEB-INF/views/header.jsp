<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
    <!--고정된 메뉴 바-->
   <div id="top_menu_fixed">
       <div id="top_menu_fixed_right">
       <% if (session.getAttribute("sessionUserID") != null) { %>
       		<a href="logout" id="logout">로그아웃</a>&nbsp;|&nbsp;
       		<a href="mypage">마이페이지</a>&nbsp;|&nbsp;
       <% } else {%>
           <a href="login">로그인</a>&nbsp;|&nbsp;
       <%} %>
           <a href="myorderlist">주문/배송</a>&nbsp;|&nbsp;           
           <a href="basket">장바구니(${cartCnt})</a><!-- &nbsp;|&nbsp; -->
       </div>
       <!--로고-->
       <div id="top_logo">
           <h1><a href="/"><spring:message code="project.title"/></a></h1>
       </div>

       <!--리얼메뉴-->
       <div class="menu_nav">
           <ul class="menu_nav_ul">
               <li class="menu_nav_li">
                   <a href="about"><spring:message code="project.header.menu1"/></a>
                   <ul class="menu_nav_sub_ul">
                       <li class="menu_nav_sub_li"><a href="about">서울/경기</a></li>
                       <li class="menu_nav_sub_li" style="width:55px"><a href="about#aboutK">강릉</a></li>
                   </ul>
               </li>
               <li class="menu_tap">&nbsp;|&nbsp;</li>
               <li class="menu_nav_li"><a href="shop"><spring:message code="project.header.menu2"/></a>
                   <ul class="menu_nav_sub_ul">
                   		<c:forEach var="productTypeList" items="${productTypeListMain}">
                   			<li class="menu_nav_sub_li" style="width:55px">
	                   			<c:choose>
	                   				<c:when test="${productTypeMenu.idx ne '1' }"><a href="shop#${productTypeList.link_category}">${productTypeList.type}</a></c:when>
	                   				<c:otherwise><a href="shop">${productTypeList.type}</a></c:otherwise>
	                   			</c:choose>
                   			</li>
                   		</c:forEach>
                   </ul>
               </li>
               <li class="menu_tap">&nbsp;|&nbsp;</li>
               <li class="menu_nav_li"><a href="news"><spring:message code="project.header.menu3"/></a></li>
               <li class="menu_tap">&nbsp;|&nbsp;</li>
               <li class="menu_nav_li"><a href="faq"><spring:message code="project.header.menu4"/></a>
                   <ul class="menu_nav_sub_ul">
                       <li class="menu_nav_sub_li"><a href="ask"><spring:message code="project.header.menu4_1"/></a></li>
                       <li class="menu_nav_sub_li" style="width:55px"><a href="faq"><spring:message code="project.header.menu4_2"/></a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

