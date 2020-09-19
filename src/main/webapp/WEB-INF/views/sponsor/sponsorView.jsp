<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="page" value="${ page }"/>
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
                                <li><a href="main.do">홈</a></li>
                                <li class="xi-angle-right"><a href="slist.do">후원하기</a></li>
                            </ul>
                        </div>
                        <h2><span>후원하기</span></h2>
                        <h3>여러분의 따뜻한 손길로<br/>작은 생명에게 새 삶을 찾아주세요.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->
                    <div class="subContent">
                        <!--상세-->
                        <div class="sponsorView">
                            <div class="sPaymentTitle">
                                <p>
                                    조회수 : ${ sponsor.sCount } · <fmt:formatDate value="${ sponsor.sDate }" pattern="yyyy.MM.dd" />
                                    <a data-id="${ sponsor.sNum }" data-title="${ sponsor.sTitle }" data-summary="${ sponsor.sSummary }" class="linkBtn" data-toggle="popover"><i class="xi-share-alt-o"></i> 공유하기</a>
                                </p>
                                
                                <div>
                                    <h3>'따뜻한 마음의 실천'</h3>
                                    <h2>${ sponsor.sTitle }</h2>
                                    <span class="sPaymentBtn"><a href="spay.do"><i class="xi-piggy-bank"></i> 후원 참여하기 <i class="xi-angle-right-min"></i></a></span>
                                </div>
                            </div>
                            
                            <div class="textCon">
                                <img src="resources\\sponsor\\thumbnail/${ sponsor.sOriginal }"><br/><br/><br/>
                                ${ sponsor.sContent }
                            </div>
                            <span class="sPaymentBtn"><a href="slist.do"><i class="xi-piggy-bank"></i> 후원 참여하기 <i class="xi-angle-right-min"></i></a></span>
                                
                        </div>
                        <!-- 상세 끝 -->
                    
                        <!-- 버튼 -->
                        <div class="viewBtn-wrap">
                            <button class="nextBtn"><i class="xi-angle-left-min"></i> 이전</button>
                            <c:url var="sl" value="slist.do">
                            	<c:param name="page" value="${ page }"/>
                            </c:url>
                            <button class="listBtn" onclick="javascript:location.href='${ sl }'"><i class="xi-rotate-left"></i> 목록</button>
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