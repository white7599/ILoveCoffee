<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>I Love Coffee!!</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="js/main.js"></script> -->
    <script>
        window.onload = function(){
            document.getElementById("list_btn").addEventListener("click", function(){
                window.location.href = "<%=request.getContextPath()%>/news";
            });
        }
        
    </script>
    <style>
        #news_title {
            display: table;
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
            border-top: 2px solid rgb(95, 95, 95);
            border-bottom: 1px solid rgb(151, 151, 151);
            padding: 12px;
            vertical-align: middle;
        }

        #news_contents{
            display: table;
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
            font-size: 11pt; 
            padding: 12px;
            vertical-align: middle;
            border-bottom: 1px solid rgb(151, 151, 151);
        }

        #news_list{
            display: table;
            width: 70%;
            margin-left: auto;
            margin-right: auto;
            text-align: right;
            vertical-align: middle;
            height: 50px;
            padding: 20px 0px;
        }

        .news_table{
            width: 70%;
            margin: auto;
            padding: 5px 0px;
            border-top: 1px solid black;
        }

        .news_row{
            border-bottom: 1px solid rgb(179, 169, 169);
        }

        .news_table th{
            background-color: rgb(216, 215, 215);
            padding: 10px;
        }

        .news_table td{
            padding: 10px 20px;
        }

        .font_weight{
            font-weight: bold;
        }
        
    </style>
</head>

<body>
	<div id="container">
        <header><jsp:include page="header.jsp"></jsp:include></header>
        
        <!--컨텐츠-->
        <article>
            <div id="contents">
                <section class="news_section" style="height: 1050px;">
                    <div class="news_title">공지사항</div>
                        <div id="news_title" class="row font_weight">${notice.title }</div>
                        <div id="news_contents" class="div_contents">${notice.contents}</div>
                        <div id="news_list"><a href="news${cri.makeQuery()}" class="btn btn-primary">목록으로</a></div>
                </section>

                <section class="news_section_list">
                    <table class="news_table">
                        <tr class="news_row">
                            <th>윗글</th>
                            <td class="cell"><a href="news_view${cri.makeQuery()}&idx=${prev.idx}">${prev.title}</a></td>
                        </tr>
                        <tr class="news_row">
                            <th>아랫글</th>
                            <td><a href="news_view${cri.makeQuery()}&idx=${next.idx}">${next.title}</a></td>
                        </tr>
                    </table>
                </section>
                <br><br>
            </div>
        </article>
        <br><br>

        <!--footer-->
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
</body>
</html>