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
                        
                        <!-- searchFiled 로 구분하고 값은 searchValue 로 받음 -->
                       <form action="dboardList.do" method="">
                      	 <div class="search_wrap" id ="search">
                            <input type="hidden" name="dCategory" value="${ dboard.dCategory }">
                            <input type="hidden" name="dLocal" value="${ dboard.dLocal }">
                            <select name="searchFiled" id="searchS">t
                            <!-- 삼항연산자로 selected 여부 구분 -->
                                <option value="d_title" class="fontColor-dark" ${pageVO.searchFiled eq"d_title"?"selected":""}>제목</option>
                                <option value="d_writer" class="fontColor-dark" ${pageVO.searchFiled eq"d_writer"?"selected":""}>임시보호자</option>
                                <option value="d_find_local" class="fontColor-dark" ${pageVO.searchFiled eq"d_find_local"?"selected":""}>발견지역</option>
                            </select>
                            <div class="search-box">
                                <input type="text" id="searchI" name="searchValue" placeholder="작은 천사들을 검색해주세요." value ="${ pageVO.searchValue }">
                                <button type="submit" value="SEARCH" class="xi-search"></button>
                            </div>
                        </div>
                       </form> 
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area"> 
                         	<!-- 게시물 조회한 숫자 출력 -->
                            <h4>전체 ${ requestScope.totalCount }마리 '작은 천사'</h4>
                            <div>
                            <c:if test="${ !empty sessionScope.loginMember}">
                                <a href="dinsertPage.do" class="writeBtn">글쓰기</a>
                            </c:if>
                                <div>
                                <c:url var = "dCate" value= "dboardList.do">
									<c:param name="dLocal" value="${ dboard.dLocal }"/>
                                 	<c:param name="searchFiled" value="${pageVO.searchFiled }" />
									<c:param name="searchValue" value="${pageVO.searchValue }" />
								</c:url>
								
                                <form action="" name="dCategory">
                                    <a ${empty dCategory ?'class="active"' : "" }href="dboardList.do">전체</a>
                                    <a ${dCategory eq "d"?'class="active"' : "" }href="${dCate}&dCategory=d">강아지</a>
                                    <a ${dCategory eq "c"?'class="active"' : "" }href="${dCate}&dCategory=c">고양이</a>
                                    <a ${dCategory eq "e"?'class="active"' : "" }href="${dCate}&dCategory=e">기타</a>
                                 </form>
                                </div>
	                            <form action="dboardList.do" name="dLocal" class="location">
	                            <input type="hidden" name="dCategory" value="${ dboard.dCategory }">
									<select name="dLocal" class="LocationSelect"   onchange=this.form.submit()>
	                                    <option value=""  ${ dLocal > 16 ?"selected" :"" }>전체지역</option>
	                                    <option value="0" ${ dLocal eq"0"?"selected" :"" }>서울시</option>
	                                    <option value="1" ${ dLocal eq"1"?"selected" :"" }>인천시</option>
	                                    <option value="2" ${ dLocal eq"2"?"selected" :"" }>대전시</option>
	                                    <option value="3" ${ dLocal eq"3"?"selected" :"" }>광주시</option>
	                                    <option value="4" ${ dLocal eq"4"?"selected" :"" }>대구시</option>
	                                    <option value="5" ${ dLocal eq"5"?"selected" :"" }>울산시</option>
	                                    <option value="6" ${ dLocal eq"6"?"selected" :"" }>부산시</option>
	                                    <option value="7" ${ dLocal eq"7"?"selected" :"" }>경기도</option>
	                                    <option value="8" ${ dLocal eq"8"?"selected" :"" }>강원도</option>
	                                    <option value="9" ${ dLocal eq"9"?"selected" :"" }>세종시</option>
	                                    <option value="10" ${ dLocal eq"10"?"selected" :"" }>충청남도</option>
	                                    <option value="11" ${ dLocal eq"11"?"selected" :"" }>충청북도</option>
	                                    <option value="12" ${ dLocal eq"12"?"selected" :"" }>전라남도</option>
	                                    <option value="13" ${ dLocal eq"13"?"selected" :"" }>전라북도</option>
	                                    <option value="14" ${ dLocal eq"14"?"selected" :"" }>경상남도</option>
	                                    <option value="15" ${ dLocal eq"15"?"selected" :"" }>경상북도</option>
	                                    <option value="16" ${ dLocal eq"16"?"selected" :"" }>제주도</option>
	                            </select>
								</form>
                            </div>
                        </div>
                        <!-- 게시물이 0개라면 경고창을 띄우고 전 페이지로 이동 -->
                        <c:if test="${ totalCount == 0}">
                       <script>alert('검색결과에 해당하는 게시물이 없습니다.');
                       	history.go(-1);</script>
                        </c:if>
                        <!--리스트-->
                        <div class="animalList">
                            <ul class="grid">
                                <li class="grid-sizer"></li>
                                <!-- 게시물 리스트 출력 -->
                                 
                                 <c:forEach items="${ requestScope.dboardList }" var="d">
                                 <c:url var="dboardView" value="dboardView.do">
                                 	<c:param name="pageNo" value="${ pageVO.pageNo }"/>
                                 	<c:param name="dNum" value="${ d.dNum }"/>
                                 	<c:param name="dLocal" value="${ d.dLocal }"/>
                                 	<c:param name="searchFiled" value="${pageVO.searchFiled }" />
									<c:param name="searchValue" value="${pageVO.searchValue }" />
									<c:param name="dCategory" value="${ d.dCategory }"/>
                                 </c:url>
                                 <c:if test = "${d.dSuccess eq 'n'}">
                                 <li class="grid-item chooseIcon" onclick="location='${dboardView}'">
                                    <div>
                                        <a href="#none" class="chooseIcon">보호중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/dboard/dboardImage/${d.listImage }">
                                    </div>
                                    <h3>${ d.dTitle }</h3>
                                    <p>
                                        임시보호자 : ${ d.dWriter }<br/>
                                        발견날짜 : ${ d.dFindDate }<br/>
                                        발견지역 :  ${ d.dFindLocal } 부근<br/>
                                        보호자 지역 :  <c:set var="local" value="${fn:split('[서울시]|[인천시]|[대전시]|[광주시]|[대구시]|[울산시]|[부산시]|[경기도]|[강원도]|[세종시]|[충청남도]|[충청북도]|[전라남도]|[전라북도]|[경상남도]|[경상북도]|[제주시]', '|') }"/>
										 <c:forEach var ="lo" items="${local }" varStatus="l">
                                         <c:if test="${l.count== (d.dLocal+1) }"> ${ lo }</c:if>
										</c:forEach>
                                        <span>
                                        ${ d.dDate eq d.dMdate ?"등록일": "수정일"} : ${ d.dDate eq d.dMdate ?d.dDate : d.dMdate}
                                        </span>
                                    </p>
                                </li>
                                </c:if>
                                <c:if test = "${d.dSuccess eq 'y'}">
                                <li class="grid-item close" onclick="location='${dboardView}'">
                                    <div>
                                        <a href="#none" class="chooseIcon">인계완료</a>
                                        
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="/runningdog/resources/dboard/dboardImage/${d.listImage }">
                                    </div>
                                    <h3>${ d.dTitle }</h3>
                                    <p>
                                        임시보호자 : ${ d.dWriter }<br/>
                                        발견날짜 : ${ d.dFindDate }<br/>
                                        발견지역 : ${ d.dFindLocal } 부근<br/>
                                        보호자 지역 :<c:set var="local" value="${fn:split('[서울시]|[인천시]|[대전시]|[광주시]|[대구시]|[울산시]|[부산시]|[경기도]|[강원도]|[세종시]|[충청남도]|[충청북도]|[전라남도]|[전라북도]|[경상남도]|[경상북도]|[제주시]', '|') }"/>
										 <c:forEach var ="lo" items="${ local }" varStatus="l">
                                         <c:if test="${l.count== (d.dLocal+1) }"> ${ lo }</c:if>
										</c:forEach>
                                        <span>
                                        ${ d.dDate eq d.dMdate ?"등록일": "수정일"} : ${ d.dDate eq d.dMdate ?d.dDate : d.dMdate}
                                        
                                        </span>
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
								<c:if test="${pageVO.pageNo >0 }">
									<c:if test="${pageVO.startPageNo >5 }">
										<c:url var = "dl1" value="dboardList.do">
											<c:param name="pageNo" value="${ pageVO.startPageNo-5 }"/>
											<c:param name="searchFiled" value="${pageVO.searchFiled }"/>
											<c:param name="searchValue" value="${pageVO.searchValue }"/>
											<c:param name="dLocal" value="${ dboard.dLocal }"/>
											<c:param name="dCategory" value="${ dboard.dCategory }"/>
										</c:url>
										<a href="${dl1 }"><i class="xi-angle-left"></i></a>
									</c:if>
									<c:forEach var="i" begin="${pageVO.startPageNo}"
										end="${ pageVO.endPageNo }" step="1">
										<c:url var = "dl2" value="dboardList.do">
												<c:param name="pageNo" value="${ i }"/>
												<c:param name="searchFiled" value="${pageVO.searchFiled }"/>
												<c:param name="searchValue" value="${pageVO.searchValue }"/>
												<c:param name="dLocal" value="${ dboard.dLocal }"/>
												<c:param name="dCategory" value="${ dboard.dCategory }"/>
											</c:url>
										<c:choose>
											<c:when test="${i eq pageVO.pageNo }">
											
												<a href="${dl2}" class="active">${ i }</a>
											</c:when>
											<c:otherwise>
												<a href="${dl2}" class="">${ i }</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pageVO.pageNo != pageVO.finalPageNo and pageVO.finalPageNo > 5}">
										<c:url var = "dl3" value= "dboardList.do">
											<c:param name="pageNo" value="${ pageVO.endPageNo +1 }"/>
											<c:param name="searchFiled" value="${pageVO.searchFiled }"/>
											<c:param name="searchValue" value="${pageVO.searchValue }"/>
											<c:param name="dLocal" value="${ dboard.dLocal }"/>
											<c:param name="dCategory" value="${ dboard.dCategory }"/>
										</c:url>
										<a href="${dl3 }"><i
											class="xi-angle-right"></i></a>
									</c:if>
								</c:if>
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