<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="page" value="${ page }"/>
<c:set var="totalList" value="${ totalList }"/>
<c:set var="totalPage" value="${ totalPage }"/>
<c:set var="startPage" value="${ startPage }"/>
<c:set var="endPage" value="${ endPage }"/>
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
                                <li><a href="main.do">홈</a></li>
                                <li class="xi-angle-right"><a href="slist.do">후원하기</a></li>
                            </ul>
                        </div>
                        <h2><span>후원하기</span></h2>
                        <h3>여러분의 따뜻한 손길로<br/>작은 생명에게 새 삶을 찾아주세요.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="../include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--서브 검색-->                
                        <div class="search_wrap">
                            <form action="ssearch.do">
                            <select name="selected">
								<option value="" selected disabled>분류 선택</option>
                            	<option value="title" class="fontColor-dark">제목</option>
                            	<option value="content" class="fontColor-dark">내용</option>
                            </select>
                            <div class="search-box">
                                <input type="text" name="keyword" placeholder="검색어를 검색해주세요." required>
                                <button name="seld" onclick="#none" type="submit" class="xi-search"></button>
                            </div>
                            </form>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 ${ totalList }개의 '따뜻한 손길'</h4>
                            <div>
                                <!-- <a href="sponsorWrite.jsp" class="writeBtn">글쓰기</a> -->
                                <div>
                                <form action="" name="">
                                    <a class="active" href="slist.do">전체</a>
                                    <a href="#none">후원중</a>
                                    <a href="#none">후원완료</a>
                                </form>
                                </div>
                            </div>
                        </div>
                        
						
					<!--리스트-->
                        <div class="sponsorList">
                            <ul>
                            <c:forEach var="s" items="${ list }" varStatus="status">
                                <li>
                                    <div>
                                    	<c:url var="sdt" value="sdetail.do">
                                    		<c:param name="sNum" value="${ s.sNum }"/>
                                    		<c:param name="page" value="${ page }" />
                                    	</c:url>
                                    	<c:if test="${ s.sAmount > s.sCurrent }">
                                        <a href="${ sdt }" class="chooseIcon">후원중</a>
                                        </c:if>
                                        <a data-id="${ s.sNum }" data-title="${ s.sTitle }" data-summary="${ s.sSummary }" 
                                        	data-toggle="popover" class="urlIcon xi-share-alt-o"></a>
									<a href="${ sdt }"><img src="resources/sponsor/thumbnail/${ s.sRename }"></a>
                                    </div>
                                    <h3 onclick="location='${ sdt }'">${ s.sTitle }</h3>
                                    <p onclick="location='${ sdt }'">${ s.sSummary }<br/>
                                    </p>
                                    <span class="sponsorBtn">
                                        <a href="${ sdt }">자세히보기</a>
                                        	<c:url var="spd" value="spay.do">
                                        		<c:param value="${ s.sNum }" name="sNum"/>
                                        		<c:param value="${ s.sTitle }" name="title"/>
                                        	</c:url>
                                        <a href="${ spd }">후원하기</a>
                                    </span>
                                </li>
                            </c:forEach>
                            </ul>
                            
                            <c:if test="${ list.size() eq 0 }">
                            	<br><br><br><br><br><br><br><br>
								<p align="center"><img src="resources/images/btnIcn/icn_big_listNo.png" alt="" title="" /></p>
								<h1 align="center">목록이 없습니다.</h1>
								<br><br><br><br><br><br><br><br>
							</c:if>
                        </div>
                        <!-- 리스트 끝 -->
                    
                        <!-- 페이징 -->
                        <c:if test="${ totalPage eq 1 }"><br><br><br><br></c:if>
                        <c:if test="${ totalPage ne 1 }">
                        <dl class="list-paging">
                            <dd>
                            	<c:if test="${ page > 1 }">
                            		<c:url var="sl1" value="slist.do">
                            			<c:param name="page" value="1"/>
                            		</c:url>
                                	<a href="${ sl1 }"><i class="xi-angle-left"></i></a>
                                </c:if>
                                <c:if test="${ page eq 1 }">
                                	<a><i class="xi-angle-left"></i></a>
                                </c:if>
                                
                                <c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
                                	<c:if test="${ page eq p }">
                                		<a class="active">${ p }</a>
                                	</c:if>
                                	<c:if test="${ page ne p }">
                                		<c:url var="sl2" value="slist.do">
                                			<c:param value="${ p }" name="page"/>
                                		</c:url>
                                		<a href="${ sl2 }">${ p }</a>
                                	</c:if>
								</c:forEach>
								
								<c:if test="${ page < totalPage }">
									<c:url var="sl3" value="slist.do">
										<c:param name="page" value="${ totalPage }"/>
									</c:url>
                                	<a href="${ sl3 }"><i class="xi-angle-right"></i></a>
                                </c:if>
                                <c:if test="${ page eq totalPage }">
                                	<a><i class="xi-angle-right"></i></a>
                                </c:if>
                            </dd>
                        </dl>
                        </c:if>
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>