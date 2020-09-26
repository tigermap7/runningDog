<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/WEB-INF/views/admin/include/admin_head.jsp"/>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <c:import url="/WEB-INF/views/admin/include/admin_header.jsp"/>

        <div id="container">
            <c:import url="/WEB-INF/views/admin/include/admin_util.jsp"/>

            <!-- 상단 타이틀 -->
            <div class="pageTitle">
                <div class="adminPath">
                    <h3>자원봉사모집 관리</h3>
                    <h2>상세보기</h2>
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
                                   <c:if test="${ empty volunteer.volre1 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                   </c:if>
                                   <c:if test="${ !empty volunteer.volre1 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/vfiles/${volunteer.volre1 }"/></li>
                                   </c:if>
                                   <c:if test="${ empty volunteer.volre2 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                   </c:if>
                                   <c:if test="${ !empty volunteer.volre2 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/vfiles/${volunteer.volre2 }"/></li>
                                   </c:if>
                                   <c:if test="${ empty volunteer.volre3 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                   </c:if>
                                   <c:if test="${ !empty volunteer.volre3 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/vfiles/${volunteer.volre3 }"/></li>
                                   </c:if>
                                   <c:if test="${ empty volunteer.volre4 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                   </c:if>
                                   <c:if test="${ !empty volunteer.volre4 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/vfiles/${volunteer.volre4 }"/></li>
                                   </c:if>
                                </ul>
                                <!-- Add Arrows -->
                                <div class="swiper-button-next swiper-button-white"></div>
                                <div class="swiper-button-prev swiper-button-white"></div>
                            </div>
                            <div class="swiper-container gallery-thumbs">
                                <ol class="swiper-wrapper">
                                    <c:if test="${ empty volunteer.volre1 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                   </c:if>
                                   <c:if test="${ !empty volunteer.volre1 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/vfiles/${volunteer.volre1 }"/></li>
                                   </c:if>
                                   <c:if test="${ empty volunteer.volre2 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                   </c:if>
                                   <c:if test="${ !empty volunteer.volre2 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/vfiles/${volunteer.volre2 }"/></li>
                                   </c:if>
                                   <c:if test="${ empty volunteer.volre3 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                   </c:if>
                                   <c:if test="${ !empty volunteer.volre3 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/vfiles/${volunteer.volre3 }"/></li>
                                   </c:if>
                                   <c:if test="${ empty volunteer.volre4 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/images/test/animalImg01.jpg"/></li>
                                   </c:if>
                                   <c:if test="${ !empty volunteer.volre4 }">
                                    <li class="swiper-slide"><img src="/runningdog/resources/vfiles/${volunteer.volre4 }"/></li>
                                   </c:if>
                                    <!-- <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li>
                                    <li class="swiper-slide"><img src="/runningdog/../resources/images/test/animalImg01.jpg"/></li> -->
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
                                    <c:if test="${ !empty volunteer.volche }">
                                            <c:if test="${ volunteer.volche eq 'Y' }">
                                                 <td>상시모집 / <span class="serviceOn">상시모집중</span></td>
                                            </c:if>
                                            <c:if test="${ volunteer.volche eq 'N'}">
                                                 <td>상시모집 / <span class="serviceOn">모집완료</span></td>
                                           </c:if>
                                     </c:if>
                                </tr>
                                <tr>
                                    <th>지역/주소</th>
                                    <td colspan="3">${volunteer.voladdress }</td>
                                </tr>
                                <tr>
                                    <th>봉사기간</th>
                                    <td colspan="3">${volunteer.volterm1 }~${volunteer.volterm2}</td>
                                </tr>
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
                            <c:url var="vpread" value="vpre.ad">
                            	<c:param name="volno" value="${volunteer.volno}"/>
                            	<c:param name="searchFiled" value="${ searchFiled }" />
								<c:param name="searchValue" value="${ searchValue }" />
								<c:param name="volche" value="${ volunteer.volche }"/>
                            </c:url>
                            <button class="prevBtn" onclick="javascript:location.href='${vpread}'"><i class="xi-angle-left-min"></i>이전</button>
                            <button class="listBtn" onclick="javascript:history.go(-1); return false;"><i class="xi-rotate-left"></i>목록</button>
                            <c:url var="vdel" value="vdelete.ad">
                            	<c:param name="volno" value="${volunteer.volno}"/>
                            </c:url>
                            <button class="deleteBtn" onclick="javascript:location.href='${vdel}'"><i class="xi-cut"></i>삭제</button>
                            <c:url var="vnextad" value="vnext.ad">
                            	<c:param name="volno" value="${volunteer.volno}"/>
                            	<c:param name="searchFiled" value="${ searchFiled }" />
								<c:param name="searchValue" value="${ searchValue }" />
								<c:param name="volche" value="${ volunteer.volche }"/>
                            </c:url>
                            <button class="nextBtn" onclick="javascript:location.href='${vnextad}'"></i>다음</button>
                        </div>
                        <!-- 버튼 끝 -->
        </div>
        <c:import url="/WEB-INF/views/admin/include/admin_footer.jsp"/>
    </div>
</body>
</html>