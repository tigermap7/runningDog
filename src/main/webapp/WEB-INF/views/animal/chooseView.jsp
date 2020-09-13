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
                        <div class="animalView">
                            <p class="topText">*「동물보호법」 제17조, 시행령7조 및 동법 시행규칙 제20조에 따라 유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</p>
                            <dl>
                                <dt>
                                	클릭하시면 원본 이미지 크기를 팝업합니다.
                                    <div class="viewImg"><img id="imgControll" onclick="fnImgPop(this.src)" src="/runningdog/resources/dboard/dboardImage/${ dboard.viewImage }"></div>
                                    <!-- <a class="linkBtn" href="mailto:spark720@naver.com"><i class="xi-mail-o"> 메일보내기</i></a> -->
                                    <a class="linkBtn" href="##none"><i class="xi-message-o"></i> 채팅하기</a>
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
                                                <th>반려 동물 종류</th>
                                                <td>${ dboard.dCategory eq "d"?"강아지": "" }
                                                	${ dboard.dCategory eq "c"?"고양이": "" }
                                                	${ dboard.dCategory eq "e"?"기  타": "" }
                                                </td>
                                                <th>발견날짜</th>
                                                <td>${ dboard.dFindDate }</td>
                                            </tr>
                                            <tr>
                                                <th>성별</th>
                                                <td>
                                                ${ dboard.dGender eq "m"?"남/男" : "" }
                                                ${ dboard.dGender eq "f"?"여/女" : "" }
												</td>
                                                <th>분양 여부</th>
                                                <td>
                                                ${ dboard.dSuccess eq "y"? "새로운 가족을 찾았어요" : ""}
                                                ${ dboard.dSuccess eq "n"? "가족을 기다리고 있어요" : ""}
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>발견장소</th>
                                                <td colspan="3">${ dboard.dFindLocal }</td>
                                            </tr>
                                            <tr>
                                                <th>특이사항</th>
                                                <td colspan="3">${ dboard.dPoint }</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    <h3 class="mt30">임시보호자 정보</h3>
                                    <table class="animalInfo">
                                       <colgroup>
                                           <col width="15%">
                                           <col width="35%">
                                           <col width="15%">
                                           <col width="35%">
                                       </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>임시보호자</th>
                                                <td>${ dboard.dWriter } / # ${ dboard.uniqueNum }</td>
                                                <th>${ dboard.dDate ne dboard.dMdate ?"수정일": "작성일"}</th>
                                                <td>${ dboard.dDate eq dboard.dMdate ?dboard.dDate : "dboard.dMdate"}
                                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>연락처</th>
                                                <td>${ dboard.dPhone }</td>
                                                <th>이메일</th>
                                                <td>${ dboard.userId }</td>
                                            </tr>
                                            <tr>
                                                <th>지역</th>
                                                <td colspan="3">
                                                <c:forEach items="${fn:split('[서울시]|[인천시]|[대전시]|[광주시]|[대구시]|[울산시]|[부산시]|[경기도]|[강원도]|[세종시]|[충청남도]|[충청북도]|[전라남도]|[경상북도]|[제주시]', '|') }"
                                         		var="item" begin="${ d.dLocal }" end="${ d.dLocal }"> ${ item }
												</c:forEach>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </dd>
                            </dl>

                            <div class="viewContent">
                            ${ dboard.dContent }
                            </div>
                            <tr>
 						 <td>발견 장소</td>
 						 <td>
											<div class="map_wrap">
												<div class="hAddr">
													<div id="map"
														style="width: 1000px; height: 300px; position: relative; overflow: hidden;">
													</div>
												</div>
											</div>
											<script type="text/javascript"
												src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68c702b1618fe5e7850fb8b93c89734b&libraries=services"></script>
								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(
												'${dboard.mapY}', '${dboard.mapX}'), // 지도의 중심좌표
										level : 8
									// 지도의 확대 레벨
									};

									var map = new kakao.maps.Map(mapContainer,
											mapOption); // 지도를 생성합니다

									// 마커가 표시될 위치입니다 
									var markerPosition = new kakao.maps.LatLng(
											'${dboard.mapY}', '${dboard.mapX}');

									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
										position : markerPosition
									});

									// 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(map);

									// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
									// marker.setMap(null);
								</script>
							</td>
						</tr>

						<div class="textCon">
                                상기 동물을 분실하신 소유주께서는 보호센터로 문의하시어 동물을 찾아가시기 바라며, 동물보호 법 제17조의 규정에 따른 공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는 경우에는 유실물법 제12조 및 민법 제253조의 규정에 불구하고 해당 시,군,구 자치구가 그 동물의 소유권을 취득하게 됩니다.<br/>
                                ${ dboard.dDate }
                            </div>
                                
                        </div>
                        <!-- 상세 끝 -->
                    
                        <!-- 버튼 -->
                        <c:url var = "dupPageMove" value= "dupView.do">
							<c:param name="dNum" value="${ dboard.dNum }"/>
						</c:url>
                        <div class="viewBtn-wrap">
                            <button class="nextBtn" onclick="location=''"><i class="xi-angle-left-min"></i> 이전</button>
                            <button class="listBtn" onclick="location=''"><i class="xi-rotate-left"></i> 목록</button>
                            <button class="deleteBtn" onclick="location=''"><i class="xi-cut"></i> 삭제</button>
                            <button class="modifiedBtn" onclick="location='${ dupPageMove }'"><i class="xi-pen-o"></i> 수정</button>
                            <button class="prevBtn" onclick="location=''">다음 <i class="xi-angle-right-min"></i></button>
                        </div>
                        <!-- 버튼 끝 -->

                        <!-- 댓글 -->
                        <div class="cmt_wrap">
                            <form action="" method="">
                                <fieldset>
                                    <div class="cmt_form">
                                        <h4 class="cmt_head">댓글 77</h4>
                                        <div class="cmt_body">
        <textarea name="" onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
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
                                        <form action="dboardList.do" method="post">
                                            <fieldset>
                                                <div class="cmt_form">
                                                    <div class="cmt_body">
        <textarea name="" onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
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
                        <!-- 댓글 끝 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>