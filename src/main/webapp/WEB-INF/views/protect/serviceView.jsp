<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="currentPage"  value="${ requestScope.currentPage }"/>
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
                                <li class="xi-angle-right"><a href="#none">자원봉사모집</a></li>
                            </ul>
                        </div>
                        <h2><span>자원봉사모집</span></h2>
                        <h3>작은 천사들을 위해 도와주실<br/>자원봉사자 여러분을 모집하고 있습니다.</h3>
                    </div>
                </div>
                <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        
                        <!--상세-->
                        <div class="serviceView">
                            <p class="topText" style="text-align:center;">
                                Tip. 전화상 문의하실 때에는 '지금 달려갈 개, 자원봉사 모집글 보고 연락드렸습니다.' 라고 문의주시면 빠른 답변이 가능합니다.
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
                                    <a class="linkBtn" href="##none"><i class="xi-message-o"></i> 채팅하기</a>
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
                                                <td colspan="3">${ volunteer.voltitle }</td>
                                            </tr>
                                            <tr>
                                                <th>보호센터</th>
                                                <td>${volunteer.volname }</td>
                                                <th>연락처</th>
                                                <td>${volunteer.voltel }</td>
                                            </tr>
                                            <tr>
                                                <th>담당자</th>
                                                <td>${volunteer.volwriter }</td>
                                                <th>모집기간</th>
                                                <td>${volunteer.volche } / <span class="serviceOn">모집중</span></td>
                                            </tr>
                                            <tr>
                                                <th>지역</th>
                                                <td colspan="3">${volunteer.voladdress }</td>
                                            </tr>
                                            <tr>
                                                <th>봉사기간</th>
                                                <td colspan="3">${volunteer.volterm }</td>
                                            </tr>
                                            <!-- <tr>
                                                <th>홈페이지</th>
                                                <td colspan="3"><a href="https://www.naver.com" target="_blink">https://www.naver.com</a></td>
                                            </tr> -->
                                        </tbody>
                                    </table>
                                </dd>
                            </dl>

                            <div class="viewContent">
                            ${volunteer.volcontent }
                            </div>
                                
                        </div>
                        <!-- 상세 끝 -->
                    
                        <!-- 버튼 -->
                        <div class="viewBtn-wrap">
                            <button class="nextBtn"><i class="xi-angle-left-min"></i> 이전</button>
                            <button class="listBtn"><i class="xi-rotate-left"></i> 목록</button>
                            <button class="deleteBtn"><i class="xi-cut"></i> 삭제</button>
                            <button class="modifiedBtn"><i class="xi-pen-o"></i> 수정</button>
                            <button class="prevBtn">다음 <i class="xi-angle-right-min"></i></button>
                        </div>
                        <!-- 버튼 끝 -->

                        <div class="cmt_wrap">
                            <form action="" method="">
                                <fieldset>
                                    <div class="cmt_form">
                                        <h4 class="cmt_head">댓글 77</h4>
                                        <div class="cmt_body">
        <textarea name="" style="resize: none; width:100%; min-height:100px; max-height:100px;" onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
                                            <div class="cmt_ok"><input type="submit" value="등록"></div>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                            <ul class="cmt_con">
                                <li>
                                    <dl>
                                        <dt class="img"><img src="/runningdog/resources/images/test/animalImg02.jpg"></dt>
                                        <dd><h4>멍무이 / #1971345</h4></dd>
                                        <dt class="cmt_date">2020.08.16. 12:12:00</dt>
                                    </dl>
                                    <p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를 미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
                                    <div class="cmt_conBtn">
                                        <button>댓글</button>
                                        <button>삭제</button>
                                        <button>수정</button>
                                    </div>
                                    <div class="Subcmt_form">
                                        <form action="" method="">
                                            <fieldset>
                                                <div class="cmt_form">
                                                    <div class="cmt_body">
        <textarea name="" style="resize: none; width:100%; min-height:100px; max-height:100px;" onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
                                                    <div class="cmt_ok"><input type="submit" value="등록"></div>
                                                    </div>
                                                </div>
                                            </fieldset>
                                        </form>
                                    </div>
                                </li>
                                <li>
                                    <dl>
                                        <dt class="img"><img src="/runningdog/resources/images/test/animalImg02.jpg"></dt>
                                        <dd><h4>멍무이 / #1971345</h4></dd>
                                        <dt class="cmt_date">2020.08.16. 12:12:00</dt>
                                    </dl>
                                    <p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를 미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
                                    <div class="cmt_conBtn">
                                        <button>댓글</button>
                                        <button>삭제</button>
                                        <button>수정</button>
                                    </div>
                                    <div class="Subcmt_form">
                                        <dl>
                                            <dt class="img"><img src="/runningdog/resources/images/test/animalImg02.jpg"></dt>
                                            <dd><h4>담당자 : 박보검</h4></dd>
                                            <dt class="cmt_date">2020.08.16. 12:12:00</dt>
                                        </dl>
                                        <p>가시가 되어 제발 가라고 아주 가라고 외쳐도 나는 그대로인데. 아주 사랑했던 나를 크게 두려웠던 나를 미치도록 너를 그리워했던 날 이제는 놓아줘. 보이지 않아. 내 안에 숨어. 잊으려 하면 할 수 록 더 다가와.</p>
                                        <div class="cmt_conBtn">
                                            <button>삭제</button>
                                            <button>수정</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>