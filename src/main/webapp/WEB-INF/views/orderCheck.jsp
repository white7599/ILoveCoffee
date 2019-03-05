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
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>

    <!-- 2018.10.30 추가(jQuery 추가 시작) -->
    <script src="../js/jquery_1.12.4.js"></script>
    <Script>
        $(function(){
            $("#member_order_submit").on("click", function(){
                if($("#id").val() == ""){
                    alert("아이디를 입력하세요.");
                    $("#id").focus();
                    return false;                    
                }
                if($("#pwd").val() == ""){
                    alert("비밀번호를 입력하세요.");
                    $("#pwd").focus();
                    return false;    
                }
            });

            $("#order_submit").on("click", function(){
                if($("#order_name").val() == ""){
                    alert("주문자명을 입력하세요.");
                    $("#order_name").focus();
                    return false;                    
                }
                if($("#order_no").val() == ""){
                    alert("주문번호를 입력하세요.");
                    $("#order_no").focus();
                    return false;    
                }
                if($("#order_pwd").val() == ""){
                    alert("비밀번호를 입력하세요.");
                    $("#order_pwd").focus();
                    return false;    
                }
            });
        })
    </Script>
    <!-- 2018.10.30 추가(jQuery 추가 종료) -->

</head>

<body>
	<div id="container">
        <header><jsp:include page="header.jsp"></jsp:include></header>
        
        <!--컨텐츠-->
        <article>
            <div id="contents">
                <div class="login_container">
                    <section>
                        <div class="about_title">
                            <h3>[주문/배송]</h3>
                        </div>
                    </section>
                    <section>
                        <form>
                            <div class="login_section"><label>회원조회</label>
                                <div><label>아이디: </label><input type="text" size="25" id="id"></div>
                                <div><label>비밀번호: </label><input type="text" size="25" id="pwd"></div>
                                <div><input type="submit" id="member_order_submit" value="로그인">&nbsp;<input type="button" value="회원가입" onclick="window.location.href='join'"></div>
                            </div>
                        </form>

                        <form>
                            <div class="login_section"><label>비회원조회</label>
                                <div><label>주문자명: </label><input type="text" size="25" id="order_name"></div>
                                <div><label>주문번호: </label><input type="text" size="25" id="order_no"></div>
                                <div><label>비밀번호: </label><input type="text" size="25" id="order_pwd"></div>
                                <div><input type="submit" id="order_submit" value="확인"></div>
                            </div>
                        </form>
                    </section>
                </div>
            </div><br><br>
        </article>

        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
        
	</div>
</body>
</html>