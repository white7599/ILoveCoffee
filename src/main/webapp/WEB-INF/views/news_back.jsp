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
                            <span class="cell col2 font_weight">Title</span>
                            <span class="cell col3 font_weight">Date</span>
                        </div>
                        <c:set var="noticeLength" value="${fn:length(noticeList)}"/>
                        <c:forEach var="newsList" items="${noticeList}" varStatus="status">
                        <div class="row">
                            <span class="cell col1">${noticeLength-status.index}</span>
                            <span class="cell col2"><a href="news_view/${newsList.idx }">${newsList.title}</a></span>
                            <span class="cell col3">${newsList.reg_date}</span>
                        </div>
                        </c:forEach>
                    </div>
                    
                    <div class=""><a href="1">1</a> | <a href="2">2</a></div>
                    
                </section>
            </div>
        </article>
        <br><br>

        <!--footer-->
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
</body>
</html>