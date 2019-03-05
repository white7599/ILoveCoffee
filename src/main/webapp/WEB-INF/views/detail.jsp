<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="css/main.css?ver=1" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
    	$(function(){
    		$("#goListBtn").on("click", function(){
    			window.location.href="shop";
    		})
    	})
    </script>
</head>

<body style="background-color:black">
	<div id="container">
	    <header><jsp:include page="header.jsp"></jsp:include></header>	        
	    <!--컨텐츠-->
	    <article>
            <div id="contents">                
                <section class="detail_section">
                    <div class="detail_section_container">
                        <div class="detail_section_image float_left"><img src="<spring:url value='/uploadImage/${productDetail.image_file}'/>"  width=400 /></div>
                        <div class="detail_section_desc float_right">
                        	
                            <h3>${productDetail.name}</h3>
                            <h4>${productDetail.eng_name}</h4>
                            <h4 class="font_color_red"><br><fmt:formatNumber value="${productDetail.price}" pattern="#,###"/>원</h4>
                            <h5>${productDetail.desc2}</h5><br>
                            <h5>${productDetail.desc1}</h5>
                            <h5>${productDetail.weight} 
                            	<c:set var="product_type" value="${productDetail.type_idx}"/>
								<c:choose>
									<c:when test="${product_type eq '4'}">&nbsp;ml</c:when>
									<c:otherwise>&nbsp;g</c:otherwise>
								</c:choose> / <fmt:formatNumber value="${productDetail.price}" pattern="#,###"/> 원</h5>
							<form method="post" name="form">
							<input type="hidden" name="product_idx" value="${productDetail.idx}">
                            <div class="detail_section_desc_order">
                                <div>원산지: ${productDetail.origin}<br><br></div>
                                <div>수량: <input type="number" name="count" min=1 max=10 style="width:40px;color:black;" value="1"></div>
                            </div><br><br>
                            
                            <div class="text_align_center detail_section_desc_submit">
                            	<a id="kakao-link-btn" href="javascript:sendLink();"><img src="<spring:url value='/uploadImage/kakaolink_btn_medium.png'/>" width=30 title="친구에게조르기"/></a>&nbsp;&nbsp;<input type="submit" value="장바구니담기" ><!-- &nbsp;&nbsp;<input type="button" value="바로구매하기"> -->
                            	&nbsp;&nbsp;<input type="button" value="리스트" id="goListBtn" class="total_btn"></div>
                        	</form>
                        </div>
                    </div>
                </section>               
            </div>
        </article>
	    <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
    
    <script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('987d65dcda35668a8a994c54917e30e9');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    function sendLink() {
    	
    	var productTitle = '<c:out value="${productDetail.name}"/>'; 
    	var productDesc = '<c:out value="${productDetail.desc2}"/>'; 
    	var productImg = '<c:out value="${productDetail.image_file}"/>'; 
    	
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: productTitle,
          description: productDesc,
          imageUrl: 'https://white7599.github.io/imgTest/'+productImg,
          link: {
            mobileWebUrl: 'https://white7599.github.io/imgTest/detail.html',
            webUrl: 'https://white7599.github.io/imgTest/detail.html'
          }
        }/*,
        social: {
          likeCount: 286,
          commentCount: 45,
          sharedCount: 845
        }*/ ,
        buttons: [
          {
            title: '사이트 방문하여 선물하기',
            link: {
              mobileWebUrl: 'https://white7599.github.io/imgTest/detail.html',
              webUrl: 'https://white7599.github.io/imgTest/detail.html'
            }
          }/*,
          {
            title: '앱으로 보기',
            link: {
              mobileWebUrl: 'http://localhost:8090/detail?product_idx=17',
              webUrl: 'http://localhost:8090/detail?product_idx=17'
            }
          }*/
        ] 
      });
    }
  //]]>
</script>

</body>
</html>