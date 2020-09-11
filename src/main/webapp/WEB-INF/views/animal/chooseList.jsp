<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="listCount" value="${ requestScope.totalCount }" />
<!DOCTYPE html>
<html lang="ko">
	<head>
        <c:import url="/WEB-INF/views/include/head.jsp"/>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
	<form name="frm">
		<input type= "hidden" name="pageNo" />
		<input type= "hidden" name="searchFiled" value="${ dboard.searchFiled }"/>
		<input type= "hidden" name="searchValue" value="${ dboard.searchValue }"/>
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
                        <!--서브 검색-->                
                        <div class="search_wrap" id ="search">
                            <input type="hidden" name="dCategory" value="${ d.dCategory }">
                            <select id="searchS">
                                <option value="d_title" class="fontColor-dark">제목</option>
                                <option value="d_writer" class="fontColor-dark">임시보호자</option>
                                <option value="d_local" class="fontColor-dark">발견지역</option>
                            </select>
                            <div class="search-box">
                                <input type="text" id="searchI" name="keyword" placeholder="작은 천사들을 검색해주세요.">
                                <button type="submit" class="xi-search"></button>
                            </div>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 ${ requestScope.totalCount }마리 '작은 천사'</h4>
                            <div>
                                <a href="dinsertPage.do" class="writeBtn">글쓰기</a>
                                <div>
                                <form action="" name="">
                                    <a class="active" href="#none">전체</a>
                                    <a href="#none">강아지</a>
                                    <a href="#none">고양이</a>
                                </form>
                                </div>
                            </div>
                        </div>
                        
                        <!--리스트-->
                        <div class="animalList">
                            <ul class="grid">
                                <li class="grid-sizer"></li>
                                 <c:forEach items="${ requestScope.dboardList }" var="d">
                                 <c:if test = "${d.dSuccess eq 'n'}">
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/dboard/dboardImage/${d.listImage }">
                                    </div>
                                    <h3>${ d.dTitle }</h3>
                                    <p>
                                        임시보호자 : ${ d.dWriter }<br/>
                                        발견날짜 : ${ d.dFindDate }<br/>
                                        발견지역 : ${ d.dLocal } ${ d.dFindLocal }<br/>
                                        <span>등록일 : ${ d.dDate }</span>
                                    </p>
                                </li>
                                </c:if>
                                <c:if test = "${d.dSuccess eq 'y'}">
                                <li class="grid-item close" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">인계완료</a>
                                        
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/dboard/dboardImage/${d.listImage }">
                                    </div>
                                    <h3>${ d.dTitle }</h3>
                                    <p>
                                        임시보호자 : ${ d.dWriter }<br/>
                                        발견날짜 : ${ d.dFindDate }<br/>
                                        발견지역 : ${ d.dLocal } ${ d.dFindLocal }<br/>
                                        <span>등록일 : ${ d.dDate }</span>
                                    </p>
                                </li>
                                </c:if>
                                </c:forEach>
                               
                            </ul>
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
		</form>
	</body>
</html>