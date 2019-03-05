<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("br", "<br>");
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title><spring:message code="project.title"/></title>	
	<link href="css/main.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="js/main.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
	<div id="container">
		<header><jsp:include page="header.jsp"></jsp:include></header>

		<article>
			<div id="contents">
				<div class="login_container">
					<section>
						<div class="about_title">
							<h3>[자주 묻는 질문]</h3>
						</div>
					</section><br>
					
					<section>
						<c:forEach var="faqList" items="${faqList}" varStatus="status">
							<button class="accordion">+ ${faqList.question}</button>
							<div class="panel">
								<p>${fn:replace(faqList.answer, cn, br)}</p>
							</div>
							<hr>
						</c:forEach>
					</section>
				</div>
			</div><br><br>
			
		</article>

		<footer><jsp:include page="footer.jsp"></jsp:include></footer>
	</div>

	<script>
        var acc = document.getElementsByClassName("accordion");
        var i;
        
        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.display === "block") {
                    panel.style.display = "none";
                } else {
                    panel.style.display = "block";
                }
            });
        }
      </script>
</body>
</html>