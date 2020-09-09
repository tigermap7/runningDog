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
                                <li class="xi-angle-right"><a href="#none">유기동물 주인찾기</a></li>
                            </ul>
                        </div>
                        <h2><span>유기동물 주인찾기</span></h2>
                        <h3>회원님들이 임시로 맡고 있는<br/>유기동물의 가족이 되어주세요.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--상세-->
                        <form name="formname" method="post" enctype="multipart/form-data" action="dinsert.do" class="form-inline">
                        <div class="write-area">
                        
                            <h2>유기동물 주인찾기 작성</h2>
                            <p>가족을 잃은 동물들에게 가족을 찾아주세요.</p>
                            
                            <table>
                                <colgroup>
                                    <col width="20%">
                                    <col width="80%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>제목</td>
                                        <td><input type="text" name="dTitle" title="" class="form-control w100p" placeholder="제목 입력" required/></td>
                                    </tr>
                                    <tr>
                                        <td>썸네일</td>
                                        <td><input type="file" name="upfile" title="" required/></td>
                                    </tr>
                                    <tr>
                                        <td>발견날짜</td>
                                        <td><input type="date" name="dFindDate" title="" class="form-control w50p" placeholder="발견날짜 입력" required/></td>
                                    </tr>
                                    <tr>
                                        <td>보호중 반려동물</td>
                                        <td><label><input type="radio" name="dCategory" value="d" checked/>강아지</label>
                                        	<label><input type="radio" name="dCategory" value="c" />고양이</label>
                                        	<label><input type="radio" name="dCategory" value="e" />기타</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>성별</td>
                                        <td><label><input type="radio" name="dGender" value="m" checked/>수컷</label>
                                        	<label><input type="radio" name="dGender" value="f"/>암컷</label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>연락처</td>
                                        <td><input type="text" name="dPhone" onKeyup="inputTelNumber(this);"
                                        	maxlength="13" class="form-control w50p" placeholder="특수문자없이 숫자만 입력해 주세요" required/></td>
                                    </tr>
                                    <tr>
                                        <td>보호자 대략 위치</td>
                                        <td><select name="dLocal" required="required">
												<option value="1" >서울시</option>
												<option value="2" >인천시</option>
												<option value="3" >대전시</option>
												<option value="4" >광주시</option>
												<option value="5" >대구시</option>
												<option value="6" >울산시</option>
												<option value="7" >부산시</option>
												<option value="8" >경기도</option>
												<option value="9" >강원도</option>
												<option value="10" >세종시</option>
												<option value="11" >충청남도</option>
												<option value="12" >충청북도</option>
												<option value="13" >전라남도</option>
												<option value="14" >전라북도</option>
												<option value="15" >경상남도</option>
												<option value="16" >경상북도</option>
												<option value="17" >제주도</option>
										</select> 
										<input type="text" name="dFindLocal" title="" class="form-control w50p" placeholder="발견장소 입력 구/동" required/></td>
                                    </tr>
                                    <tr>
                                        <td>특이사항</td>
                                        <td><input type="text" name="dPoint" title="" class="form-control w100p" placeholder="특징/성향/색상 입력" /></td>
                                    </tr>
                                    <tr>
                                        <td>내용</td>
                                        <td><textarea name="dContent" rows="" cols="" class="form-control" style="resize: none; width:100%; min-height:300px; max-height:300px;"placeholder="게시판 성격과 다른글을 올리시면,사이트 이용이 정지되실 수 있습니다."></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>발견 장소를 클릭해 주세요</td>
                                        <!-- 카카오 지도 출력 -->
                                        <td><div id="map" style="width:500px;height:300px;"></div>
                                        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68c702b1618fe5e7850fb8b93c89734b&libraries=services"></script>
											<script>
											var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
											    mapOption = { 
											        center: new kakao.maps.LatLng(36.627718, 127.967794), // 지도의 중심좌표
											        level: 20 // 지도의 확대 레벨
											    };

											var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

											// 지도를 클릭한 위치에 표출할 마커입니다
											var marker = new kakao.maps.Marker({ 
											    // 지도 중심좌표에 마커를 생성합니다 
											    position: map.getCenter() 
											}); 
											// 지도에 마커를 표시합니다
											marker.setMap(map);

											// 지도에 클릭 이벤트를 등록합니다
											// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
											kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
												
											    // 클릭한 위도, 경도 정보를 가져옵니다 
											    
											    var latlng = mouseEvent.latLng;
											    marker.getPosition();
											    var mapX = latlng.getLng(); //경도
											    var mapY = latlng.getLat(); //위도
											    // 마커 위치를 클릭한 위치로 옮깁니다
											    marker.setPosition(latlng);
											    
											    var resultDiv = document.getElementById('clickLatlng'); 
								
											   console.log("mapX : " +mapX);
											   console.log("mapY : " +mapY);
											   document.formname.mapX.value=mapX;
											   document.formname.mapY.value=mapY;
											});
 											</script>
											<input type="hidden" name="mapX" id="mapX">
											<input type="hidden" name="mapY" id="mapY">
										</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="write-btn">
                            <input type="button" class="btn btn-list" value="목록으로">
                            <input type="reset" class="btn btn-cancel" value="취소하기">
                            <input type="submit" class="btn btn-success" value="작성하기">
                        </div>
                        </form>
                        <!-- 글쓰기 끝 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>