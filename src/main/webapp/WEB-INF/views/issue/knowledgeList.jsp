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
                                <li class="xi-angle-right"><a href="#none">반려동물 상식</a></li>
                            </ul>
                        </div>
                        <h2><span>반려동물 상식</span></h2>
                        <h3>작은 천사들에게 필요한<br/>정보를 알기 쉽게 알려드려요.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--서브 정렬-->       
                        <!--서브 정렬 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 150개의 영상/이슈</h4>
                            <div>
                                <div>
                                <form action="" name="">
                                    <a class="active" href="#none">최신순</a>
                                </form>
                                </div>
                            </div>
                        </div>
                        
                        <!--리스트-->
                        <div class="list-area">
                            <table>
                                <colgroup>
                                    <col width="10%">
                                    <col width="*">
                                    <col width="20%">
                                </colgroup>
                                <tbody>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">10</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">9</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">8</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">7</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">6</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">5</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">4</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">3</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">2</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                    <tr onclick="location.href='knowledgeView.jsp';">
                                        <td class="number">1</td>
                                        <td class="title">
                                            <h2><span>상식</span>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="writerUser">작성인 : 유기견센터</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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