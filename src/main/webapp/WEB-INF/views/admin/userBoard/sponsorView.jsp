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
                    <h3>후원하기 관리</h3>
                    <h2>| 상세</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="sponsorView">
                <div class="sPaymentTitle">
                    <p>
                        조회수 : 118 · 2020.08.28
                        <a class="linkBtn" href="#none"><i class="xi-share-alt-o"></i> 공유하기</a>
                    </p>
                    
                    <div>
                        <h3>'따뜻한 마음의 실천'</h3>
                        <h2>이 작은 아이가 살아갈 수 있게 도와주세요.</h2>
                    </div>
                </div>
                
                <div class="textCon">
                    <img src="/runningdog/../resources/images/test/test01.jfif"><br><br>
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
        <c:import url="../include/admin_footer.jsp"/>
    </div>
</body>
</html>