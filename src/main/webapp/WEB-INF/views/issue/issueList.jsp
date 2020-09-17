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
                                <li class="xi-angle-right"><a href="#none">오늘의 이슈</a></li>
                            </ul>
                        </div>
                        <h2><span>오늘의 이슈</span></h2>
                        <h3>오늘의 이슈를 통해<br/>새로운 정보를 빠르게 찾아보세요.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--서브 정렬-->       
                        <!--서브 정렬 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 150개의 오늘의 이슈</h4>
                            <div>
                                <div>
                                <form action="" name="">
                                    <a class="active" href="#none">인기순</a>
                                    <a href="#none">발행순</a>
                                </form>
                                </div>
                            </div>
                        </div>
                        
                        <!--리스트-->
                        <div class="issueList">
                            <ul class="grid">
                                <li class="grid-sizer"></li>
                                <li class="grid-item" onclick="location='cissuedetail.do'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews01.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg02.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews02.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg01.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews03.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg03.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg04.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews03.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg03.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews01.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg02.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg04.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews02.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg01.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews01.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg02.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews02.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg01.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews03.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg03.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg04.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews03.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg03.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews01.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg02.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg04.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="grid-item" onclick="location='issueView.jsp'">
                                    <div>
                                        <a href="#none" class="xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/images/test/animalNews02.jpg">
                                    </div>
                                    <dl>
                                        <dt><img src="/runningdog/resources/images/test/animalImg01.jpg"></dt>
                                        <dd>
                                            <h3>강아지가 아령을? 덤벨 들고 운동하는 강아지.</h3>
                                            <p>
                                                작성자 : koreadognews<br/>
                                                조회수 : 102
                                            </p>
                                        </dd>
                                    </dl>
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