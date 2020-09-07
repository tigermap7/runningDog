<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="../include/admin_head.jsp"/>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <c:import url="../include/admin_header.jsp"/>

        <div id="container">
            <c:import url="../include/admin_util.jsp"/>

            <!-- 상단 타이틀 -->
            <div class="pageTitle">
                <div class="adminPath">
                    <h3>자원봉사모집 관리</h3>
                    <h2>| 상세</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="serviceView">
                <p class="topText" style="text-align:center;">
                    Tip. 전화상 문의하실 때에는 '지금 달려갈 개, 자원봉사 모집글 보고 연락드렸습니다.' 라고 문의주시면 빠른 답변이 가능합니다.
                </p>
                <dl>
                    <dt>
                        <div class="viewImg">                                        
                            <div class="swiper-container gallery-top">
                                <ul class="swiper-wrapper">
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                </ul>
                                <!-- Add Arrows -->
                                <div class="swiper-button-next swiper-button-white"></div>
                                <div class="swiper-button-prev swiper-button-white"></div>
                            </div>
                            <div class="swiper-container gallery-thumbs">
                                <ol class="swiper-wrapper">
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                </ol>
                            </div>
                            <!-- Initialize Swiper -->
                            <script>
                                var galleryThumbs = new Swiper('.gallery-thumbs', {
                                    slidesPerView: 4,
                                    freeMode: true,
                                    watchSlidesVisibility: true,
                                    watchSlidesProgress: true,
                                });
                                var galleryTop = new Swiper('.gallery-top', {
                                    loop:true,
                                    autoplay: {
                                        delay: 2500,
                                        disableOnInteraction: false,
                                    },
                                    navigation: {
                                    nextEl: '.swiper-button-next',
                                    prevEl: '.swiper-button-prev',
                                    },
                                    thumbs: {
                                    swiper: galleryThumbs,
                                    },
                                });
                            </script>
                        </div>
                        <a class="linkBtn" href="tel:010-3387-7583"><i class="xi-call"></i> 전화하기</a>
                        <a class="linkBtn" href="#none"><i class="xi-message-o"></i> 채팅하기</a>
                        <a class="linkBtn" href="#none"><i class="xi-share-alt-o"></i> 공유하기</a>
                    </dt>
                    <dd>
                        <div><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6324.481505654264!2d127.00051190256856!3d37.572948171699984!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca325b4d9b81b%3A0xba2de96c741b670a!2z7ISc7Jq47Yq567OE7IucIOyiheuhnOq1rCDsooXroZw1LjbqsIDrj5k!5e0!3m2!1sko!2skr!4v1598454835067!5m2!1sko!2skr" width="100%" height="281.3rem" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></div>                  
                        <h3 class="mt30">센터정보</h3>
                        <table class="serviceInfo">
                           <colgroup>
                               <col width="15%">
                               <col width="35%">
                               <col width="15%">
                               <col width="35%">
                           </colgroup>
                            <tbody>
                                <tr>
                                    <th>제목</th>
                                    <td colspan="3">★ '따뜻한 집' 보호센터에서 자원봉사자 여러분을 모집합니다. ★</td>
                                </tr>
                                <tr>
                                    <th>보호센터</th>
                                    <td>'따뜻한 집'</td>
                                    <th>연락처</th>
                                    <td>02-980-7717</td>
                                </tr>
                                <tr>
                                    <th>담당자</th>
                                    <td>박보검 / #1971345</td>
                                    <th>모집기간</th>
                                    <td>상시모집 / <span class="serviceOn">모집중</span></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td colspan="3">서울시 종로구 종로5.6가동</td>
                                </tr>
                                <tr>
                                    <th>봉사기간</th>
                                    <td colspan="3">2020.08.26 ~ 2020.09.30</td>
                                </tr>
                                <tr>
                                    <th>홈페이지</th>
                                    <td colspan="3"><a href="https://www.naver.com" target="_blink">https://www.naver.com</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </dd>
                </dl>

                <div class="viewContent">
                    하얗게 흐려진 그림 속 추억의 책장 속 우리<br>
                    그저 스쳐간 안녕<br>
                    돌아와 끝내 말 못하고<br>
                    시간 틈새로 흘러 점점 멀어진 기억<br><br>
                    
                    몇 번의 계절 지나 마주한 두 눈동자 아무 말도 못하고<br><br>
                    
                    가슴이 차가운 남자가 울어요<br>
                    이별에 모질던 그녀도 우네요<br>
                    바래진 추억 유리조각에<br>
                    베인 상처 흔적만 남아 초라하네요<br><br>
                    
                    파랗게 질려버린 하늘 굳어버린 입술 울컥<br>
                    그립다 널 외치고<br>
                    미련에 엉킨 인연의 끈<br>
                    차마 풀지 못하고 다시 묻어두네요<br><br>
                    
                    먹먹한 가슴이 참지 못하고 달려 멀어진 네 등 뒤로<br><br>
                    
                    가슴이 차가운 남자가 울어요<br>
                    이별에 모질던 그녀도 우네요<br>
                    바래진 추억 유리조각에<br>
                    베인 상처 흔적만 남아 머물러있는걸<br>
                    the stay stay again (oh stay~ stay again)<br>

                </div>

            </div>
        </div>
        <c:import url="../include/admin_footer.jsp"/>
    </div>
</body>
</html>