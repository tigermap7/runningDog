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
                                <li class="xi-angle-right"><a href="#none">유기동물매칭</a></li>
                            </ul>
                        </div>
                        <h2><span>유기동물매칭</span></h2>
                        <h3>가족을 기다리는 작은 천사에게<br/>가족과 친구가 되어주세요.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        
                        <!--상세-->
                        <div class="animalView">
                            <p class="topText">*「동물보호법」 제17조, 시행령7조 및 동법 시행규칙 제20조에 따라 유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</p>
                            <dl>
                                <dt>
                                    <div class="viewImg"><img src="/runningdog/resources/images/test/animalImg01.jpg"></div>
                                    <!-- <a class="linkBtn" href="mailto:spark720@naver.com"><i class="xi-mail-o"></i> 메일보내기</a> -->
                                    <a class="linkBtn" href="tel:010-3387-7583"><i class="xi-call"></i> 전화하기</a>
                                    <a class="linkBtn" href="#none"><i class="xi-share-alt-o"></i> 공유하기</a>
                                </dt>
                                <dd>
                                    <h3>동물정보</h3>
                                    <table class="animalInfo">
                                       <colgroup>
                                           <col width="20%">
                                           <col width="30%">
                                           <col width="20%">
                                           <col width="30%">
                                       </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>공고번호</th>
                                                <td>서울-종로-2020-02497</td>
                                                <th>견종</th>
                                                <td>[강아지] 푸들</td>
                                            </tr>
                                            <tr>
                                                <th>색상</th>
                                                <td>흰색/회색</td>
                                                <th>나이/체중</th>
                                                <td>2세 / 2.7(kg)</td>
                                            </tr>
                                            <tr>
                                                <th>성별</th>
                                                <td>수컷</td>
                                                <th>중성화 여부</th>
                                                <td>아니오</td>
                                            </tr>
                                            <tr>
                                                <th>특징/성향</th>
                                                <td>온순하고 착함</td>
                                                <th>공고기한</th>
                                                <td>2020.08.25 ~ 2020.10.24</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    <h3 class="mt30">센터정보</h3>
                                    <table class="animalInfo">
                                       <colgroup>
                                           <col width="15%">
                                           <col width="35%">
                                           <col width="15%">
                                           <col width="35%">
                                       </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>보호센터</th>
                                                <td>'따뜻한 집'</td>
                                                <th>연락처</th>
                                                <td>02-980-7717</td>
                                            </tr>
                                            <tr>
                                                <th>지역</th>
                                                <td colspan="3">서울시 종로구 종로5.6가동</td>
                                            </tr>
                                            <tr>
                                                <th>관할기관</th>
                                                <td>서울시 종로구</td>
                                                <th>담당자</th>
                                                <td>-</td>
                                            </tr>
                                            <tr>
                                                <th>연락처</th>
                                                <td>055-876-5542</td>
                                                <th>특이사항</th>
                                                <td>-</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </dd>
                            </dl>
                            <div class="mapAPI">
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6324.481505654264!2d127.00051190256856!3d37.572948171699984!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca325b4d9b81b%3A0xba2de96c741b670a!2z7ISc7Jq47Yq567OE7IucIOyiheuhnOq1rCDsooXroZw1LjbqsIDrj5k!5e0!3m2!1sko!2skr!4v1598454835067!5m2!1sko!2skr" width="100%" height="281.3rem" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                            </div>
                            
                            <div class="textCon">
                                상기 동물을 분실하신 소유주께서는 보호센터로 문의하시어 동물을 찾아가시기 바라며, 동물보호 법 제17조의 규정에 따른 공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는 경우에는 유실물법 제12조 및 민법 제253조의 규정에 불구하고 해당 시,군,구 자치구가 그 동물의 소유권을 취득하게 됩니다.<br/>
                                2020년 08월 25일
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