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
                        <!--서브 검색-->                
                        <div class="search_wrap">
                            <form action="" name="">
                            <select>
                                <option value="0" class="fontColor-dark">전체보기</option>
                                <option value="1" class="fontColor-dark">강남구</option>
                                <option value="2" class="fontColor-dark">강동구</option>
                                <option value="3" class="fontColor-dark">강북구</option>
                                <option value="4" class="fontColor-dark">강서구</option>
                                <option value="5" class="fontColor-dark">관악구</option>
                                <option value="6" class="fontColor-dark">광진구</option>
                                <option value="7" class="fontColor-dark">구로구</option>
                                <option value="8" class="fontColor-dark">금천구</option>
                                <option value="9" class="fontColor-dark">노원구</option>
                                <option value="10" class="fontColor-dark">도봉구</option>
                                <option value="11" class="fontColor-dark">동대문구</option>
                                <option value="12" class="fontColor-dark">동작구</option>
                                <option value="13" class="fontColor-dark">마포구</option>
                                <option value="14" class="fontColor-dark">서대문구</option>
                                <option value="15" class="fontColor-dark">서초구</option>
                                <option value="16" class="fontColor-dark">성동구</option>
                                <option value="17" class="fontColor-dark">성북구</option>
                                <option value="18" class="fontColor-dark">송파구</option>
                                <option value="19" class="fontColor-dark">양천구</option>
                                <option value="20" class="fontColor-dark">영등포구</option>
                                <option value="21" class="fontColor-dark">용산구</option>
                                <option value="22" class="fontColor-dark">은평구</option>
                                <option value="23" class="fontColor-dark">종로구</option>
                                <option value="24" class="fontColor-dark">중구</option>
                                <option value="25" class="fontColor-dark">중랑구</option>
                                
                            </select>
                            <div class="search-box">
                                <input type="text" placeholder="원하시는 지역을 검색해주세요.">
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
                                <tr class="serviceOn" onclick="location.href='protectView.jsp'">
                                    <td class="img">
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </td>
                                    <td>
                                        <h3>서울유기동물입양센터</h3>
                                        <ul>
                                            <li class="location"><span>지역 : </span>서울특별시 중랑구 용마산로139나길 83</li>
                                            <li><span>운영방식 : </span>직영</li>
                                        </ul>
                                    </td>
                                    <td><a href="protectView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                </tr>
                                <tr class="serviceOn" onclick="location.href='protectView.jsp'">
                                    <td class="img">
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </td>
                                    <td>
                                        <h3>서울유기동물입양센터</h3>
                                        <ul>
                                            <li class="location"><span>지역 : </span>서울특별시 중랑구 용마산로139나길 83</li>
                                            <li><span>운영방식 : </span>직영</li>
                                        </ul>
                                    </td>
                                    <td><a href="protectView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                </tr>
                                <tr class="serviceOn" onclick="location.href='protectView.jsp'">
                                    <td class="img">
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </td>
                                    <td>
                                        <h3>서울유기동물입양센터</h3>
                                        <ul>
                                            <li class="location"><span>지역 : </span>서울특별시 중랑구 용마산로139나길 83</li>
                                            <li><span>운영방식 : </span>직영</li>
                                        </ul>
                                    </td>
                                    <td><a href="protectView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                </tr>
                                <tr class="serviceOn" onclick="location.href='protectView.jsp'">
                                    <td class="img">
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </td>
                                    <td>
                                        <h3>서울유기동물입양센터</h3>
                                        <ul>
                                            <li class="location"><span>지역 : </span>서울특별시 중랑구 용마산로139나길 83</li>
                                            <li><span>운영방식 : </span>직영</li>
                                        </ul>
                                    </td>
                                    <td><a href="protectView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                </tr>
                                <tr class="serviceOn" onclick="location.href='protectView.jsp'">
                                    <td class="img">
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </td>
                                    <td>
                                        <h3>서울유기동물입양센터</h3>
                                        <ul>
                                            <li class="location"><span>지역 : </span>서울특별시 중랑구 용마산로139나길 83</li>
                                            <li><span>운영방식 : </span>직영</li>
                                        </ul>
                                    </td>
                                    <td><a href="protectView.jsp">자세히 보기 <i class="xi-eye-o"></i></a></td>
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