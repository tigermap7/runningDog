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
                                    조회수 : 118 · 2020.08.28
                                    <a class="linkBtn" href="#none"><i class="xi-share-alt-o"></i> 공유하기</a>
                                </p>
                                
                                <div>
                                    <h3>'따뜻한 마음의 실천'</h3>
                                    <h2>이 작은 아이가 살아갈 수 있게 도와주세요.</h2>
                                    <span class="sPaymentBtn"><a href="spay.do"><i class="xi-piggy-bank"></i> 후원 참여하기 <i class="xi-angle-right-min"></i></a></span>
                                </div>
                            </div>
                            
                            <div class="textCon">
                                <img src="resources/images/test/test01.jfif"><br/><br/>
                                하얗게 흐려진 그림 속 추억의 책장 속 우리<br/>
                                그저 스쳐간 안녕<br/>
                                돌아와 끝내 말 못하고<br/>
                                시간 틈새로 흘러 점점 멀어진 기억<br/><br/>
                                
                                몇 번의 계절 지나 마주한 두 눈동자 아무 말도 못하고<br/><br/>
                                
                                가슴이 차가운 남자가 울어요<br/>
                                이별에 모질던 그녀도 우네요<br/>
                                바래진 추억 유리조각에<br/>
                                베인 상처 흔적만 남아 초라하네요<br/><br/>
                                
                                파랗게 질려버린 하늘 굳어버린 입술 울컥<br/>
                                그립다 널 외치고<br/>
                                미련에 엉킨 인연의 끈<br/>
                                차마 풀지 못하고 다시 묻어두네요<br/><br/>
                                
                                먹먹한 가슴이 참지 못하고 달려 멀어진 네 등 뒤로<br/><br/>
                                
                                가슴이 차가운 남자가 울어요<br/>
                                이별에 모질던 그녀도 우네요<br/>
                                바래진 추억 유리조각에<br/>
                                베인 상처 흔적만 남아 머물러있는걸<br/>
                                the stay stay again (oh stay~ stay again)<br/>
                            </div>
                            <span class="sPaymentBtn"><a href="slist.do"><i class="xi-piggy-bank"></i> 후원 참여하기 <i class="xi-angle-right-min"></i></a></span>
                                
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
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>