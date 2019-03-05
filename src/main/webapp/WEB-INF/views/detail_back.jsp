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
    <link href="css/main.css?ver=1" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
	<div id="container">
        <header><jsp:include page="header.jsp"></jsp:include></header>
        <!--컨텐츠-->
        <article>
            <div id="contents">                
                <section class="detail_section" style="border: 2px solid blue">
                    <div class="detail_section_container">
                        <div class="detail_section_image float_left"><img src="images/shop/haksanshopping_564.jpg"></div>
                        <div class="detail_section_desc float_right">
                            <h3>[생두] 콜롬비아</h3>
                            <h4>라 프리마베라 Colombia La Primavera</h4>
                            <h4 class="font_color_red"><br>16,500원</h4>
                            <h5>
                                안티오키아는 콜롬비아의 중부 지역이다. 이 곳은 거의 일 년 내내 커피를 수확할 수 있는 자연 조건을 가지고 있어 콜롬비아 내에서 가장 많은 생산량을 자랑한다. 이번 커피는 라 프리마베라 농장에서 카스티요, 콜롬비아, 카투라 품종을 워시드 방식으로 가공한 것이다. 콜롬비아 특유의 균형감에 호두, 꿀, 오렌지 같은 풍미가 돋보인다.
                            </h5>
                            <h5>Aroma & Flavor walnut, honey, orange
                                    Acidity malic, citric
                                    Other smooth, balanced</h5>
                            <h5>1kg 16,500원 / 5kg 74,000원</h5>
                            <div class="detail_section_desc_order">
                                <div>원산지: 콜롬비아<br>농장 La Primavera</div>
                                <div>중량: <select name="" style="color:black;"><option>1kg</option><option>5kg</option></select></div>
                            </div><br><br>
                            <div class="text_align_center detail_section_desc_submit"><input type="submit" value="장바구니담기" >&nbsp;&nbsp;<input type="submit" value="바로구매하기"></div>
                        </div>
                    </div>
                </section>               
            </div>
        </article>
        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
        
    </div>
</body>
</html>