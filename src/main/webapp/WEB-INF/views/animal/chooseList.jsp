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
                        <!--서브 검색-->                
                        <div class="search_wrap">
                            <form action="" name="">
                            <select>
                                <option value="" class="fontColor-dark">전체</option>
                                <option value="" class="fontColor-dark">제목</option>
                                <option value="" class="fontColor-dark">임시보호자</option>
                                <option value="" class="fontColor-dark">발견날짜</option>
                                <option value="" class="fontColor-dark">발견지역</option>
                            </select>
                            <div class="search-box">
                                <input type="text" placeholder="작은 천사들을 검색해주세요.">
                                <button onclick="#none" class="xi-search"></button>
                            </div>
                            </form>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 150마리 '작은 천사'</h4>
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
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews03.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalImg03.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews03.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews03.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews02.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews01.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalImg01.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews01.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalImg03.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item chooseIcon" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalImg04.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item close" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="closeIcon">인계완료</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalImg01.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item close" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="closeIcon">인계완료</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalImg02.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item close" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="closeIcon">인계완료</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalImg03.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
                                <li class="grid-item close" onclick="location='chooseView.jsp'">
                                    <div>
                                        <a href="#none" class="closeIcon">인계완료</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalImg04.jpg">
                                    </div>
                                    <h3>강아지가 혼자 밖에서 울고 있었어요.</h3>
                                    <p>
                                        임시보호자 : 멍무이<br/>
                                        발견날짜 : 2020.08.26<br/>
                                        발견지역 : 서울시 도봉구 우이천로 부근<br/>
                                        <span>등록일 : 2020.08.28</span>
                                    </p>
                                </li>
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
	</body>
</html>