<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><spring:message code="project.title"/></title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">

    <link href="css/main.css?ver=1" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="slick/slick.css">
  	<link rel="stylesheet" type="text/css" href="slick/slick-theme.css?ver=3">
  	<link rel="stylesheet" type="text/css" href="css/index.css">
  	<style>
  	.anchor{
	    display: block;
	    height: 210px; /*고정헤더와 동일한 높이*/
	    margin-top: -210px; /*고정헤더와 동일한높이*/
	    visibility: hidden;
	}
	</style>
</head>
<body>
	<div id="container">
        <header><jsp:include page="header.jsp"></jsp:include></header>
        
        <!--컨텐츠-->
        <article>
            <div id="contents">
            
            	<c:forEach var="productTypeMenu" items="${productTypeListMain}" varStatus="status">
            		<span id="${productTypeMenu.link_category}" class="anchor"></span>
                	<section>
	            	<div class="list_page">
		                <div class="list_title">
		                    <h3> &nbsp;[${productTypeMenu.type}]</h3>
		                </div>
		                <div class="list_page_sub"></div>
		            </div>
		            </section>
	            
	            	<section class="regular">  
	            	    <c:forEach var="productListMain" items="${productListMain}" varStatus="status"> 
		            	    <c:forEach items="${productListMain}" var="productListMainSub">
								<c:if test="${productListMainSub.type_idx eq productTypeMenu.idx}"> 
						            <div class="slide_div">
							            <a href="detail?product_idx=${productListMainSub.idx}" onfocus="this.blur();">
								            <figure>
											    <div>
											      <div><img src="<spring:url value='/uploadImage/${productListMainSub.image_file}'/>" /></div>
											      <figcaption>
									                  <h5>${productListMainSub.name}</h5>
									                  <h6>${productListMainSub.eng_name}</h6>
														${productListMainSub.desc2}<br><br>
									                  	${productListMainSub.weight} g / <fmt:formatNumber value="${productListMainSub.price}" pattern="#,###"/>원
									              </figcaption>
											    </div>
										    </figure>
									    </a>
								    </div>
					    		</c:if>
					    	</c:forEach>
					    </c:forEach>				    
				  </section>
                </c:forEach>
            </div>
        </article>
		<br><br>
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