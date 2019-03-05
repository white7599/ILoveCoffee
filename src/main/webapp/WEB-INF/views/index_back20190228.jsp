<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="project.title"/></title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/main.js"></script>
<link rel="stylesheet" type="text/css" href="slick/slick.css?ver=1">
<link rel="stylesheet" type="text/css" href="slick/slick-theme.css?ver=1">

<style type="text/css">
a:active,a:hover{outline-width:0}
.slider {
     width: 50%;
     margin: 100px auto;
 }

 .slick-slide {
   margin: 0px 20px;
 }

 .slick-slide img {
   width: 100%;
 }

 .slick-prev:before,
 .slick-next:before {
   color: black;
 }


 .slick-slide {
   transition: all ease-in-out .3s;
   opacity: .5;
 }
 
 .slick-active {
   /* opacity: .5; */
   opacity: 1;
 }

 .slick-current {
   opacity: 1;
   }
   
.slide_div a:active,.slide_div a:link, .slide_div a:visited, .slide_div a:hover {
	text-decoration: none;
	border:0px;
	
}  

</style>
</head>
<body>
	<div id="container">
		<header><jsp:include page="header.jsp"></jsp:include></header>		
        <!--컨텐츠-->
        <article>
            <div id="contents">
                <!--상단 슬라이드 이미지-->
                <div class="slideshow">
                    <img src="images/main/acb129e6240f3711c3e5b02c2f1b1032.jpg" alt="">
                    <img src="images/main/ef31808e579b08f3b168e508de035651.jpg" alt="">
                    <img src="images/main/f690f9d3d43bb0a09dab700409e07833.jpg" alt="">
                    <img src="images/main/1fcad7c7a9b392034a1175ae13091f39.jpg" alt="">
                </div>
                
                <!--리스트들...-->
                <!--리스트1(원두)-->
            	<section>
            	<div class="list_page"><c:set var="productListLength" value="${fn:length(productList1)}"/> 
	                <div class="list_title">
	                    <h3> &nbsp;[원두]</h3>
	                </div>
	                <div class="list_page_sub"></div>
	            </div>
	            </section>
            
            	<section class="regular">
            		<c:set var="productList1Length" value="${fn:length(productList1)}"/>    
            	    <c:forEach var="productList1" items="${productList1}" varStatus="status">  
		            <div class="slide_div">
			            <a href="detail?product_idx=${productList1.idx}" onfocus="this.blur();">
				            <figure>
							    <div>
							      <div><img src="<spring:url value='/uploadImage/${productList1.image_file}'/>" /></div>
							      <figcaption>
					                  <h5>${productList1.name}</h5>
					                  <h6>${productList1.eng_name}</h6>
										${productList1.desc2}<br><br>
					
					                  ${productList1.weight} g / <fmt:formatNumber value="${productList1.price}" pattern="#,###"/>원
					              </figcaption>
							    </div>
						    </figure>
					    </a>
				    </div>
				    </c:forEach>				    
			  </section>
			  
			  
			  <!--리스트2(드립백)-->
			  <section>
            	<div class="list_page">
            	<hr><br>
	                <div class="list_title">
	                    <h3> &nbsp;[드립백]</h3>
	                </div>
	                <div class="list_page_sub"></div>
	            </div>
	          </section>
            
            	<section class="regular">         
		            <c:set var="productList2Length" value="${fn:length(productList2)}"/>    
            	    <c:forEach var="productList2" items="${productList2}" varStatus="status">  
		            <div class="slide_div">
			            <a href="detail?product_idx=${productList2.idx}">
				            <figure>
							    <div>
							      <div><img src="<spring:url value='/uploadImage/${productList2.image_file}'/>" /></div>
							      <figcaption>
					                  <h5>${productList2.name}</h5>
					                  <h6>${productList2.eng_name}</h6>
										${productList2.desc1}<br><br>
					
					                  ${productList2.weight} g / <fmt:formatNumber value="${productList2.price}" pattern="#,###"/>원
					              </figcaption>
							    </div>
						    </figure>
					    </a>
				    </div>
				    </c:forEach>	
				</section>
				
				
				<!--리스트3(블렌드)-->
				<section>
            	<div class="list_page">
            	<hr><br>
	                <div class="list_title">
	                    <h3> &nbsp;[블렌드]</h3>
	                </div>	                
	                <div class="list_page_sub"></div>
	            </div>
	          </section>
            
            	<section class="regular">           
		            <c:set var="productList3Length" value="${fn:length(productList3)}"/>    
            	    <c:forEach var="productList3" items="${productList3}" varStatus="status">  
		            <div class="slide_div">
			            <a href="detail?product_idx=${productList3.idx}">
				            <figure>
							    <div>
							      <div><img src="<spring:url value='/uploadImage/${productList3.image_file}'/>" /></div>
							      <figcaption>
					                  <h5>${productList3.name}</h5>
					                  <h6>${productList3.eng_name}</h6>
										${productList3.desc2}<br><br>
					
					                  ${productList3.weight} g / <fmt:formatNumber value="${productList3.price}" pattern="#,###"/>원
					              </figcaption>
							    </div>
						    </figure>
					    </a>
				    </div>
				    </c:forEach>	
				</section>
			  
			  
			  <!--리스트4(텀블러)-->
			  <section>
            	<div class="list_page">
            	<hr><br>
	                <div class="list_title">
	                    <h3> &nbsp;[텀블러]</h3>
	                </div>	                
	                <div class="list_page_sub"></div>
	            </div>
	          </section>
            
            	<section class="regular">          
		            <c:set var="productList4Length" value="${fn:length(productList4)}"/>    
            	    <c:forEach var="productList4" items="${productList4}" varStatus="status">  
		            <div class="slide_div">
			            <a href="detail?product_idx=${productList4.idx}">
				            <figure>
							    <div>
							      <div><img src="<spring:url value='/uploadImage/${productList4.image_file}'/>" /></div>
							      <figcaption>
					                  <h5>${productList4.name}</h5>
					                  <h6>${productList4.eng_name}</h6>
										${productList4.desc2}<br><br>
					
					                  ${productList4.weight} ml / <fmt:formatNumber value="${productList4.price}" pattern="#,###"/>원
					              </figcaption>
							    </div>
						    </figure>
					    </a>
				    </div>
				    </c:forEach>	
				    
				</section>
				
				
            </div>
        </article><br><br>
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
    
    <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	  <script src="slick/slick.js" type="text/javascript" charset="utf-8"></script>
	  <script type="text/javascript">
	    $(document).on('ready', function() {
	      
	      $(".regular").slick({
	        dots: false,
	        infinite: true,
	        slidesToShow: 4,
	        slidesToScroll: 4,
	        
	      });
	     
	    });
	</script>
</body>
</html>