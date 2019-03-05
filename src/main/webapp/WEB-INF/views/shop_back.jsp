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

    <link href="css/main.css" rel="stylesheet" type="text/css">
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
                

                <!--리스트들...-->
                <!--리스트1(원두)-->
                <section>
                    <div class="list_page">
                        
                        <div class="list_title">
                            <h3> &nbsp;원두<!--<span>&nbsp;<input type="button" value="More" class="btn"></span>--></h3>
                        </div>

                        <div class="list_page_sub">
                            <ul class="list_properties">
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_584.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>[생두] 콜롬비아</h5>
                                                <h6>라 프리마베라</h6>Aroma & Flavor walnut, honey, orange
                                                Acidity malic, citric
                                                Other smooth, balanced<br>

                                                1kg 16,500원 / 5kg 74,000원.
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_586.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>[생두] 파나마</h5>
                                                <h6>게이샤 워시드 & 내추럴</h6>
                                                Aroma & Flavor orange, cherry, black tea, cane sugar Acidity citric Other silky
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_585.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>[생두] 에티오피아</h5>
                                                <h6>구지 오도 샤키소</h6>
                                                Aroma & Flavor rasberry, apricot jam, jasmine, honey Acidity complex Other long finish
                                            </figcaption>
                                        </figure>
                                        
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_548.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>[생두] 과테말라</h5><a id="drip"></a>
                                                <h6>페드로 II</h6>
                                                Tasting Note  적포도, 바닐라, 밀크 초콜릿, 굿 밸런스
                                            </figcaption>
                                        </figure>
                                        
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div><br>


                    <!--리스트2(드립백)-->
                    <div class="list_page" >
                        <hr><br>
                        <div class="list_title">
                            <h3> &nbsp;드립백<span>&nbsp;<input type="button" value="More" class="btn"></span></h3>
                        </div>

                        <div class="list_page_sub">
                            <ul class="list_properties">                                
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_280.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>드립백</h5>
                                                <h6>Drip Bag (2ea)</h6>
                                                10월 드립백 3종 중 2가지 선택, 각 10g
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_281.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>드립백 세트</h5>
                                                <h6>10개입 Drip Bag Set (10ea)</h6>
                                                과테말라 페드로, 에티오피아 구지 함벨라, 풀문 블렌드, 각 10g, 10개 세트
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_282.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>드립백 세트</h5>
                                                <h6>30개입 Drip Bag Set (30ea)</h6>
                                                과테말라 페드로, 에티오피아 구지 함벨라, 풀문 블렌드 각 10g, 30개 세트
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_283.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>드립백 세트</h5><a  id="blend"></a>
                                                <h6>100개 (예약발송) Drip Bag (100ea, bulk)</h6>
                                                과테말라 페드로, 에티오피아 구지 함벨라, 풀문 블렌드, 각 10g, 100개로 구성 (벌크포장)
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div><br>

                    <!--리스트3(블렌드)-->
                    <div class="list_page">
                        <hr><br>
                        <div class="list_title">
                            <h3> &nbsp;블렌드<span>&nbsp;<input type="button" value="More" class="btn"></span></h3>
                        </div>

                        <div class="list_page_sub">
                            <ul class="list_properties">
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_574.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>가을을 담은</h5>
                                                <h6>풀문 블렌드 Full Moon Blend</h6>
                                                원산지 파나마 40%, 온두라스30%, 그 외 30%
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_555.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>어센틱 No. 5</h5>
                                                <h6>에스프레소 블렌드 Authentic Espresso Blend No. 5</h6>
                                                원산지 에티오피아 30%, 코스타리카 30%, 과테말라 20%, 온두라스 20%
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_35.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>클래식</h5>
                                                <h6>에스프레소 블렌드 Classic Espresso Blend</h6>
                                                원산지 에티오피아 30%,  브라질 25%, 그 외 45%
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_34.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>하우스</h5>
                                                <h6>블렌드 House Blend</h6>
                                                원산지 에티오피아 45%,  브라질 25%, 그 외 30%
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div><br>

                    <!--리스트4(텀블러)-->
                    <div class="list_page">
                        <hr><br>
                        <div class="list_title" id="tum">
                            <h3> &nbsp;텀블러<span>&nbsp;<input type="button" value="More" class="btn"></span></h3>
                        </div>

                        <div class="list_page_sub">
                            <ul class="list_properties">
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_578.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>엠파워풀 콜렉션</h5>
                                                <h6>캠프컵 Limited Edition</h6>
                                                이중 진공 단열 구조 BPA Free
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_579.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>엠파워풀 콜렉션</h5>
                                                <h6>보틀 Limited Edition</h6>
                                                이중 진공 단열 구조 BPA Free
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_577.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>엠파워풀 콜렉션</h5>
                                                <h6>텀블러 Limited Edition</h6>
                                                이중 진공 단열 구조 BPA Free
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                                <li>
                                    <a href="detail">
                                        <figure>
                                            <div><img src="images/shop/haksanshopping_497.jpg" alt="" title="" class="property_img" /></div>
                                            <figcaption>
                                                <h5>보틀</h5>
                                                <h6>손잡이가 톡  Bottle</h6>
                                                이중 진공 단열 구조 BPA Free
                                            </figcaption>
                                        </figure>
                                    </a>
                                </li>
                            </ul>
                        </div>

                    </div><br>
                </section>
            </div>
        </article>

        <footer><jsp:include page="footer.jsp"></jsp:include></footer>
    </div>
</body>
</html>