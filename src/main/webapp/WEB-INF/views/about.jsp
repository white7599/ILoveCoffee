<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="project.title"/></title>

    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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
                <section>
                    <div class="about_title"><h3>[서울/경기]</h3></div>
                </section>
                <section>
                    <div class="about_section">
                        <div id="" class="float_left aboutSectionImage"><img src="images/about/about_pic19.jpg"></div>
                        <div id="aboutSectionDesc" class="float_right">
                            <p>|서울|</p>
                            <p>포스코센터점</p>
                            <p>I Love Coffee!!가 부산 수영점에 이어 ‘철’을 소재로 한 또 다른 매장을 열었다. 
                            	포스코 창립 50주년을 기념한 리노베이션 공간에 초대받아 ‘철’과 포스코가 보유한 1만여 권의 책으로 둘러싼 압도적인 커피 공간을 마련하였다. 
                            	거센 철이 아닌 철의 부드러움을 느낄 수 있는 이번 공간은 I Love Coffee!! 커피와 베이커리 외에도 키친 아이템까지 함께한다. 
                            	이웃한 코엑스점과 마찬가지로 이른 아침 7시 30분부터 문을 연다. 주말은 8시 30분부터. 주차 1시간 무료.</p><br><br><br><br>
                            	
                        </div>
                        <div class="float_left" style="height:98px; padding-left: 40px; padding-bottom:10px;">
                        	<table style="vertical-align:bottom; height:100%; margin-bottom:0px;">
                        		<tr style="vertical-align:bottom;">
                        			<td>위치 전송:</td>
                        			<td><a id="kakao-link-btn" href="javascript:;">
										<img src="<spring:url value='/uploadImage/kakaolink_btn_medium.png'/>" width=30 title="위치전송하기"/>
									</a></td>
                        		</tr>
                        	</table>                            	 
						</div>
                        <div class="about_section_line"></div>
                    </div>
                </section>

                <section>
                    <div class="about_section">
                        <div id="" class="float_right aboutSectionImage"><img src="images/about/about_pic18.jpg"></div>
                        <div id="aboutSectionDesc" class="float_left">
                            <p>|서울|</p>
                            <p>한남점</p>
                            <p>Flavor, I Love Coffee!!에게 늘 화두와 같은 단어. 한남점은 ‘향’을 모티브로 한 공간이다. 고객들이 커피 향을 좀 더 여유롭게, 각각의 커피가 품고 있는 개성을 보다 세밀하게 알아가는 공간. 12월 23일부터 I Love Coffee!! 커피 공장의 트레이드 마크였던 테이스팅 코스를 즐길 수 있다. 1층은 바와 시향코너, 테이블로 구성되어 있고 2층은 이태원 전경이 내려다보여 서울의 지금을 느낄 수 있다.</p>
                        </div>
                    </div>
                    <div class="about_section_line"></div>
                </section>

                <section>
                    <div class="about_section">
                        <div id="" class="float_left aboutSectionImage"><img src="images/about/about_pic15.jpg"></div>
                        <div id="aboutSectionDesc" class="float_right">
                            <p>|서울|</p>
                            <p>소월길점</p>
                            <p>모든 장소에는 역사가 깃들어 있다. 그 장소가 지닌 시간성과 공간성, 사회성에 관심이 많은 I Love Coffee!!가 열한 번째 장소를 골랐다. 70~80년대 가속도로 진행되었던 서울 개발의 흔적이 남아 있는 곳, 소월길. 한국과 일본을 오가며 철학적인 디자인 작업을 해온 신성순 씨가 공간을 맡았다. “공사하려고 뜯어보니 70~80년대에 철근도 없이 지은 날림집이에요. 그때는 다 그렇게 지었죠. 그 흔적을 없애지 않고 보존하고 싶었어요. 새로 만드는 게 아니라 수선하며 쓰는 태도, 그런 삶에 대한 태도를 말하고 싶었습니다. 모든 게 ‘Always something new'일 필요는 없으니까요.” 이 공간에 새것이라고는 없다. 르 코르뷔지에가 집단주택에 사용했던 계단 등 누군가의 안목으로 모아진 오래된 물건들, 오래된 공간이 주는 숨결이 있는 이곳에 이제 I Love Coffee!!의 커피 향이 더해진다.</p>
                        </div>
                        <div class="about_section_line"></div>
                    </div>
                </section>

                <section>
                    <div class="about_section">
                        <div id="" class="float_right aboutSectionImage"><img src="images/about/about_pic16.jpg"></div>
                        <div id="aboutSectionDesc" class="float_left">
                            <p>|서울|</p>
                            <p>예술의전당점</p>
                            <p> I Love Coffee!!는 오래 전부터 이따금 이런 그림을 그려왔다. ‘좋은 전시와 좋은 공연이 있는 곳에 함께하고 싶다.’ 그 오랜 바람이 이루어졌다. 커피가 한 편의 음악이 되고, 또 건축이 되고 책과 그림도 되는 그런 문화적인 공간이 될 수 있도록 최선을 다하려 한다. 공연 관계자들을 볼 수 있는 것도 예술의전당점이 주는 묘미.</p>
                        </div>
                    </div>
                    <div class="about_section_line"></div>
                </section>
                <section>
                    <div class="about_section">
                        <div id="" class="float_left aboutSectionImage"><img src="images/about/about_pic12.jpg"></div>
                        <div id="aboutSectionDesc" class="float_right">
                            <p>|서울|</p>
                            <p>여의도점</p>
                            <p>아침 7시 30분 부지런히 문을 연다. 커피 한 잔 바삐 사들고 가는 사람들과 잠시나마 테이블에 앉아 하루를 준비하는 사람들이 아침 풍경을 이룬다. 주말이면 한적한 여의도를 즐기려 책 한 권 들고 오는 이들도 많다. 여의도 공원을 마주하고 있어 커피와 산책 코스를 묶어도 좋다.</p>
                        </div>
                        <div class="about_section_line"></div>
                    </div>
                </section>

                <section>
                    <div class="about_section">
                        <div id="" class="float_right aboutSectionImage"><img src="images/about/about_pic10.jpg"></div>
                        <div id="aboutSectionDesc" class="float_left">
                            <p>|서울|</p>
                            <p>코엑스점</p>
                            <p>매일 아침이면 코엑스에 커피 향이 퍼져나간다. 산지별 커피들이 지닌 향긋함으로, 또는 보드라운 카푸치노나 라테로 아침을 깨운다. 여기에 크루아상이나 뺑오 쇼콜라 같이 버터 풍미가 근사한 빵 한 조각을 곁들이면 먹는 즐거움은 배가 된다. 코엑스 1층 남2문 옆에 위치해 있으며, 공간 한 편에는 작은 회의실이 마련되어 있다.</p>
                        </div>
                    </div>
                    <div class="about_section_line"></div>
                </section>
				
				<span id="aboutK" class="anchor"></span>
                <section>
                    <div id="" class="about_title"><h3>[강릉]</h3></div>
                </section>
                <section>
                    <div class="about_section">
                        <div id="" class="float_left aboutSectionImage"><img src="images/about/about_pic17.jpg"></div>
                        <div id="aboutSectionDesc" class="float_right">
                            <p>|강릉|</p>
                            <p>I Love Coffee!! 커피공장</p>
                            <p>2002년 문을 연 I Love Coffee!! 첫 번째 매장이자 본점. 본래 커피를 볶아 카페, 호텔, 레스토랑 등에 공급하는 로스팅 팩토리로 출발하였으나, 소문을 듣고 커피를 맛보러 오는 이들이 늘어나면서 카페의 역할을 겸하게 되었다. 하얀 회벽으로 된 작디작은 공간이 커피를 좋아하는 많은 분들에게 큰 사랑을 받았다. 2017년 7월, 본점이 정든 작은 집을 떠나 바로 앞 밤나무숲 속에 오랜 시간 준비해온 빨간 벽돌 건물로 자리를 옮겼다. 새로운 공간, 새로운 무드로 손님들을 맞으려 한다. 커피, 베이커리, 레스토랑으로 구성되어 있으며, 레스토랑에서는 제철 식재료를 I Love Coffee!! 식으로 섬세하게 풀어낸 브런치와 디너를 즐길 수 있다.</p>
                        </div>
                        <div class="about_section_line"></div>
                    </div>
                </section>
                <section>
                    <div class="about_section">
                        <div id="" class="float_right aboutSectionImage"><img src="images/about/about_pic3.jpg"></div>
                        <div id="aboutSectionDesc" class="float_left">
                            <p>|강릉|</p>
                            <p>사천점</p>
                            <p>경포 바다에서 사천으로 올라가는 길, 바다를 마주하고 소나무가 우거진 곳에 I Love Coffee!! 커피 사천점이 있다. 순긋과 순포라는 작은 해변을 지나는 이 푸른 바닷길은 한적하고 아름다워 하이커들에게 많은 사랑을 받는 곳이다.<br>1, 2층으로 된 사천점은 가운데를 비운 ㄷ자 구조로 되어 있어 공간감이 시원하고 현대적이다. 건물 앞뒤로 너른 테라스와 바다가 내려다보이는 2층 야외 테이블이 준비되어 있다. 다양한 싱글 오리진 커피와 에스프레소 베리에이션 메뉴, 몇 가지 디저트를 맛볼 수 있다. 원두도 일부 판매한다. </p>
                        </div>
                    </div>
                    <div class="about_section_line"></div><br><br>
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
	Kakao.Link.createDefaultButton({
	  container: '#kakao-link-btn',
	  objectType: 'location',
	  address: '서울시 강남구 테헤란로 440 포스코센터 1층',
	  addressTitle: 'I Love Coffee-서울-포스코센터점',
	  content: {
		title: 'I Love Coffee-서울-포스코센터점',
		description: 'I Love Coffee-서울-포스코센터점 위치',
		imageUrl: 'https://white7599.github.io/imgTest/about_pic19.jpg',
		link: {
		  mobileWebUrl: 'http://localhost:8090/',
		  webUrl: 'http://localhost:8090/'
		}
	  },
	  social: {
	    likeCount: 286,
	    commentCount: 45,
	    sharedCount: 845
	  },
	  buttons: [
	    {
	      title: '웹으로 보기',
	      link: {
	        mobileWebUrl: 'http://localhost:8090/',
	        webUrl: 'http://localhost:8090/'
	      }
	    }
	  ]
	});
//]]>
</script>  
</body>
</html>