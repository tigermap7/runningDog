<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
        <c:import url="/WEB-INF/views/include/head.jsp"/>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<div id="wrap">
            <c:import url="/WEB-INF/views/include/header.jsp"/>
			<!-- 컨텐츠 -->
			<div id="content">
			    <!--서브 비주얼/타이틀-->
                <div class="visual-sub-vagas animal-vagas">
                    <div class="vsv-copy sub-title">
                       <div>
                            <ul class="navi">
                                <li><a href="#none">홈</a></li>
                                <li class="xi-angle-right"><a href="#none">보호센터 정보</a></li>
                            </ul>
                        </div>
                        <h2><span>보호센터 정보</span></h2>
                        <h3>지역 안의 보호센터의<br/>위치와 정보를 알려드립니다.</h3>
                    </div>
                </div>
                <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--상세-->
                        <div class="serviceView">
                            <p class="topText" style="text-align:center;">
                                Tip. 보호센터의 정보는 본 내용과 같거나 다를 수 있습니다. 정확한 정보를 원하실 경우 이메일 또는 전화로 문의주시기 바랍니다.
                            </p>
                            <dl>
                                <dt>
                                    <div class="viewImg">                                        
                                        <div class="swiper-container gallery-top">
                                            <ul class="swiper-wrapper">
                                                <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                                <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                                <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                                <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                            </ul>
                                            <!-- Add Arrows -->
                                            <div class="swiper-button-next swiper-button-white"></div>
                                            <div class="swiper-button-prev swiper-button-white"></div>
                                        </div>
                                        <div class="swiper-container gallery-thumbs">
                                            <ol class="swiper-wrapper">
                                                <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                                <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                                <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                                <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
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
                                    <!-- <a class="linkBtn" href="mailto:spark720@naver.com"><i class="xi-mail-o"></i> 메일보내기</a> -->
                                    <a class="linkBtn" href="tel:010-3387-7583"><i class="xi-call"></i> 전화하기</a>
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
                                                <th>보호센터</th>
                                                <td colspan="3">서울유기동물입양센터</td>
                                            </tr>
                                            <tr>
                                                <th>동물보호센터유형</th>
                                                <td>법인</td>
                                                <th>연락처</th>
                                                <td>02-980-7717</td>
                                            </tr>
                                            <tr>
                                                <th>운영방식</th>
                                                <td>직영</td>
                                                <th>운영시간</th>
                                                <td>09:00 ~ 18:00 (평일)</td>
                                            </tr>
                                            <tr>
                                                <th>지역</th>
                                                <td colspan="3">서울특별시 중랑구 용마산로139나길 83</td>
                                            </tr>
                                            <tr>
                                                <th>홈페이지</th>
                                                <td colspan="3"><a href="https://www.naver.com" target="_blink">https://www.naver.com</a></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </dd>
                            </dl>
                            <div class="textCon">
                                바람직한 반려동물 문화 조성, 동물학대 사건대응, 피학대 동물 구조 및 보호, 유기동물재입양, 개식용금지, 길고양이와 공존 등 다양한 분야에 대한 제도 정비 및 인식 개선 캠페인을 진행하고 있습니다.
                            </div>
                        </div>
                        <!-- 상세 끝 -->
                    
                        <!-- 버튼 -->
                        <div class="viewBtn-wrap">
                            <button class="nextBtn"><i class="xi-angle-left-min"></i> 이전</button>
                            <button class="listBtn"><i class="xi-rotate-left"></i> 목록</button>
                            <button class="prevBtn">다음 <i class="xi-angle-right-min"></i></button>
                        </div>
                        <!-- 버튼 끝 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>