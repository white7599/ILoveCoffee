<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<style>
*{
  padding:0; 
  margin:0;
}

ul{
  width:900px; 
  border:3px solid #ccc; 
  border-radius:8px; 
  margin:10px 0 0 10px; 
  list-style:none;
}

ul li{
  padding:10px 0 0 10px; 
  border-top:1px dotted #ccc; 
  margin-bottom:10px;
}

ul li:first-child{
  border:0 none;
}

ul li a{
  height:20px; 
  line-height:20px; 
  display:block; 
  text-decoration:none; 
  color:#000;
}
ul li p{color:#f00;}
</style>
<script>
	$(document).ready(function(){
	  $("p").hide();
	  $("ul li a").click(function(){
	    $(this).next().slideToggle(300);
	    $("ul li a").not(this).next().slideUp(300);
	    return false;
	  });
	  $("ul li a").eq(0).trigger("click");
	});
</script>
<ul>
  <li>
    <a href="#">첫 번째 토글</a>
    <p>첫 번째 내용</p>
  </li>
  <li>
    <a href="#">두 번째 토글</a>
    <p>두 번째 내용</p>
  </li>
  <li>
    <a href="#">세 번째 토글</a>
    <p>세 번째 내용</p>
  </li>
  
  <c:forEach var="faqList" items="${faqList}" varStatus="status">
  <li>
    <a href="#">${faqList.question}</a>
    <p>${faqList.answer}</p>
  </li>
  </c:forEach>
</ul>