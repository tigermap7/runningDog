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
                                <li class="xi-angle-right"><a href="#none">나의 자원봉사</a></li>
                            </ul>
                        </div>
                        <h2><span>나의 자원봉사</span></h2>
                        <h3>나의 자원봉사 지원 목록을<br/>확인하실 수 있습니다.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--서브 검색-->                
                        <div class="search_wrap">
                            <form action="" name="">
                            <select>
                                <option value="" class="fontColor-dark">전체</option>
                                <option value="" class="fontColor-dark">보호센터</option>
                                <option value="" class="fontColor-dark">지역</option>
                                <option value="" class="fontColor-dark">주소</option>
                            </select>
                            <div class="search-box">
                                <input type="text" placeholder="원하시는 키워드를 검색해주세요.">
                                <button onclick="#none" class="xi-search"></button>
                            </div>
                            </form>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 150개</h4>
                            <div>
                                <div>
                                <form action="" name="">
                                    <a class="active" href="#none">전체</a>
                                </form>
                                </div>
                            </div>
                        </div>
                        
                        <!--리스트-->
                            <table class="servicelList">
                                <colgroup>
                                    <col width="20%">
                                    <col width="*">
                                    <col width="20%">
                                </colgroup>
                                <tbody>
                                    <tr class="serviceOn" onclick="location.href='serviceView.jsp'">
                                        <td class="img">
                                            <span>모집중</span>
                                            <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                        </td>
                                        <td>
                                            <h3>작은 생명을 위한 도움의 손길이 필요합니다.</h3>
                                            <ul>
                                                <li class="location"><span>지역 : </span>서울시 종로구 신설동</li>
                                                <li><span>센터명 : </span>조남동 쉼터</li>
                                                <li><span>모집기간 : </span>상시모집</li>
                                                <li><span>봉사기간 : </span>2020.08.26 ~ 2020.09.30</li>
                                            </ul>
                                        </td>
                                        <td><a href="serviceView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                    </tr>
                                    <tr class="serviceOn" onclick="location.href='serviceView.jsp'">
                                        <td class="img">
                                            <span>모집중</span>
                                            <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                        </td>
                                        <td>
                                            <h3>작은 생명을 위한 도움의 손길이 필요합니다.</h3>
                                            <ul>
                                                <li class="location"><span>지역 : </span>서울시 종로구 신설동</li>
                                                <li><span>센터명 : </span>조남동 쉼터</li>
                                                <li><span>모집기간 : </span>상시모집</li>
                                                <li><span>봉사기간 : </span>2020.08.26 ~ 2020.09.30</li>
                                            </ul>
                                        </td>
                                        <td><a href="serviceView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                    </tr>
                                    <tr class="serviceOn" onclick="location.href='serviceView.jsp'">
                                        <td class="img">
                                            <span>모집중</span>
                                            <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                        </td>
                                        <td>
                                            <h3>작은 생명을 위한 도움의 손길이 필요합니다.</h3>
                                            <ul>
                                                <li class="location"><span>지역 : </span>서울시 종로구 신설동</li>
                                                <li><span>센터명 : </span>조남동 쉼터</li>
                                                <li><span>모집기간 : </span>상시모집</li>
                                                <li><span>봉사기간 : </span>2020.08.26 ~ 2020.09.30</li>
                                            </ul>
                                        </td>
                                        <td><a href="serviceView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                    </tr>
                                    <tr class="serviceOn" onclick="location.href='serviceView.jsp'">
                                        <td class="img">
                                            <span>모집중</span>
                                            <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                        </td>
                                        <td>
                                            <h3>작은 생명을 위한 도움의 손길이 필요합니다.</h3>
                                            <ul>
                                                <li class="location"><span>지역 : </span>서울시 종로구 신설동</li>
                                                <li><span>센터명 : </span>조남동 쉼터</li>
                                                <li><span>모집기간 : </span>상시모집</li>
                                                <li><span>봉사기간 : </span>2020.08.26 ~ 2020.09.30</li>
                                            </ul>
                                        </td>
                                        <td><a href="serviceView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                    </tr>
                                    <tr class="serviceOn" onclick="location.href='serviceView.jsp'">
                                        <td class="img">
                                            <span>모집중</span>
                                            <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                        </td>
                                        <td>
                                            <h3>작은 생명을 위한 도움의 손길이 필요합니다.</h3>
                                            <ul>
                                                <li class="location"><span>지역 : </span>서울시 종로구 신설동</li>
                                                <li><span>센터명 : </span>조남동 쉼터</li>
                                                <li><span>모집기간 : </span>상시모집</li>
                                                <li><span>봉사기간 : </span>2020.08.26 ~ 2020.09.30</li>
                                            </ul>
                                        </td>
                                        <td><a href="serviceView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                    </tr>
                                    <tr class="serviceOut" onclick="location.href='serviceView.jsp'">
                                        <td class="img">
                                            <span>마감</span>
                                            <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                        </td>
                                        <td>
                                            <h3>작은 생명을 위한 도움의 손길이 필요합니다.</h3>
                                            <ul>
                                                <li class="location"><span>지역 : </span>서울시 종로구 신설동</li>
                                                <li><span>센터명 : </span>조남동 쉼터</li>
                                                <li><span>모집기간 : </span>상시모집</li>
                                                <li><span>봉사기간 : </span>2020.08.26 ~ 2020.09.30</li>
                                            </ul>
                                        </td>
                                        <td><a href="serviceView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        <!-- 리스트 끝 -->
                    
                        <!-- 페이징 -->
                        <dl class="list-paging">
                            <dd>
                                <a href="#none"><i class="xi-angle-left"></i></a>
                                <a href="#none" class="active">1</a>
                                <a href="#none">2</a>
                                <a href="#none">3</a>
                                <a href="#none">4</a>
                                <a href="#none">5</a>
                                <a href="#none"><i class="xi-angle-right"></i></a>
                            </dd>
                        </dl>
                        <!-- //페이징 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>