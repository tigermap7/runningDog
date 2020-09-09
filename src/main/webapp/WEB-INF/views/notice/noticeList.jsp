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
                                <li><a href="main.do">홈</a></li>
                                <li class="xi-angle-right"><a href="nlist.do">공지사항</a></li>
                            </ul>
                        </div>
                        <h2><span>공지사항</span></h2>
                        <h3>'지금 달려갈 개'의 공지사항을 꼭 확인해주세요.</h3>
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
                                <option value="" class="fontColor-dark">제목</option>
                                <option value="" class="fontColor-dark">내용</option>
                                <option value="" class="fontColor-dark">제목 + 내용</option>
                            </select>
                            <div class="search-box">
                                <input type="text" placeholder="원하시는 키워드를 검색해주세요.">
                                <button onclick="#none" class="xi-search"></button>
                            </div>
                            </form>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 ${ noticePage.listCount }개의 공지사항</h4>
                            <div>
                                <a href="movenoticeinsert.do" class="writeBtn">글쓰기</a>
                            </div>
                        </div>

                        <!--리스트-->
                        <div class="list-area">
                            <table>
                                <colgroup>
                                    <col width="10%">
                                    <col width="*">
                                    <col width="15%">
                                </colgroup>
                                <tbody>
                                
                        	<!-- 공지사항 new 알람을 위한 한달 전 날짜 -->
                            <jsp:useBean id="nowDate" class="java.util.Date"/>
							<jsp:setProperty name="nowDate" property="time" value="${nowDate.time - 86400000 * 31}"/>
							<fmt:formatDate value="${nowDate}" type="date" pattern="yyyy/MM/dd" var="monthAgo"/>
                                
                                <c:forEach items="${ requestScope.list }" var="n">
                                
                                <c:if test="${ !empty n.noticeState }">
                                     <tr onclick="location.href='ndetail.do';" class="active">
                                        <td class="number">${n.noticeNo}</td>
                                        <td class="title">
                                            <h2><span>공지</span>${ n.noticeTitle }</h2>
                                            <ul>
                                                <li>${ n.noticeDate }</li>
                                                <li>${ n.noticeReadcount }</li>
                                            </ul>
                                        </td>
                                        <td class="fileIcon">
                                        <c:if test="${ !empty n.noticeOriginalFilename1 || !empty n.noticeOriginalFilename2 || !empty n.noticeOriginalFilename3 }">
                                      	  <i class="xi-file-text"></i>
                                        </c:if>
                                        </td>
                                        
                                    </tr> 
                                </c:if> 
                                    
                                <c:if test="${ empty n.noticeState }">    
                                    <tr onclick="location.href='noticeView.jsp';">
                                        <td class="number">${n.noticeNo}</td>
                                        <td class="title">
                                        <fmt:formatDate value="${n.noticeDate}" type="date" pattern="yyyy/MM/dd" var="ndate"/>

                                            <h2>
											<c:if test="${monthAgo < ndate}"> <!-- 공지사항 작성일이 한달안에 작성된 공지사항은 new 알림-->
												<span>new</span>
											</c:if>	                                            
                                            ${ n.noticeTitle }</h2>
                                            <ul>
                                                <li>${ n.noticeDate }</li>
                                                <li>${ n.noticeReadcount }</li>
                                            </ul>
                                        </td>
                                        <td class="fileIcon">
                                        <c:if test="${ !empty n.noticeOriginalFilename1 || !empty n.noticeOriginalFilename2 || !empty n.noticeOriginalFilename3 }">
                                      	  <i class="xi-file-text"></i>
                                        </c:if>
                                        </td>
                                    </tr>
                                 </c:if>   
                                </c:forEach>
<!--                                    <tr onclick="location.href='noticeView.jsp';">
                                        <td class="number">4</td>
                                        <td class="title">
                                            <h2>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="fileIcon"><i class="xi-file-text"></i></td>
                                    </tr>
                                    <tr onclick="location.href='noticeView.jsp';">
                                        <td class="number">3</td>
                                        <td class="title">
                                            <h2>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="fileIcon"><i class="xi-file-text"></i></td>
                                    </tr>
                                    <tr onclick="location.href='noticeView.jsp';">
                                        <td class="number">2</td>
                                        <td class="title">
                                            <h2>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="fileIcon"><i class="xi-file-text"></i></td>
                                    </tr>
                                    <tr onclick="location.href='noticeView.jsp';">
                                        <td class="number">1</td>
                                        <td class="title">
                                            <h2>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                                            <ul>
                                                <li>2020.08.28</li>
                                                <li>102</li>
                                            </ul>
                                        </td>
                                        <td class="fileIcon"><i class="xi-file-text"></i></td>
                                    </tr> -->
                                    
                                    <!-- 목록이 없을 때 -->
<!--                                     <tr>
                                        <td colspan="3">
                                            <div class="list-no">
                                                <p>
                                                    <img src="/WEB-INF/resources/images/btnIcn/icn_big_listNo.png"
                                                        alt="" title="" />
                                                </p>
                                                <h1>목록이 없습니다.</h1>
                                            </div>
                                        </td>
                                    </tr> -->
                                    
                                    
                                </tbody>
                            </table>
                        </div>
                        <!-- 리스트 끝 -->
                    
                        <!-- 페이징 -->
                        <dl class="list-paging">
                            <dd>
                            <!-- 이전 그룹 페이지 이동 -->
                            	<c:if test="${ (noticePage.currentPage - 5) lt noticePage.startPage and (noticePage.currentPage - 5) >= 1 }">
								<c:url var="np1" value="nlist.do">
								<c:param name="page" value="${ noticePage.startPage - 5 }"/>
								</c:url>
									 <a href="${ np1 }"><i class="xi-angle-left"></i></a>
								</c:if>
								<c:if test="${ !((noticePage.currentPage - 5) lt noticePage.startPage and (noticePage.currentPage - 5) >= 1) }">
								<!-- 	<a href="#none"><i class="xi-angle-left"></i></a> -->
								</c:if>
                               
                                
                                <!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리  -->
                                <c:forEach var="p" begin="${ noticePage.startPage }" end="${ noticePage.endPage }" step="1">
                               		<c:if test="${ p eq noticePage.currentPage }">
                                		<a href="#none" class="active">${ p }</a>
 	                                </c:if>
 	                                <c:if test="${ p ne noticePage.currentPage }">
 	                                	<c:url var="nlp2" value="nlist.do">
 	                                		<c:param name="page" value="${ p }"/>
 	                                	</c:url>
 	                                	<a href="${ nlp2 }">${ p }</a>
 	                                </c:if>
                                </c:forEach>
                                
                            <!-- 다음 그룹 페이지 이동 -->
                            	<c:if test="${ (noticePage.currentPage + 5) > noticePage.endPage and noticePage.endPage < noticePage.maxPage }">
								<c:url var="np3" value="nlist.do">
								<c:param name="page" value="${ noticePage.startPage + 5 }"/>
								</c:url>
									 <a href="${ np3 }"><i class="xi-angle-right"></i></a>
								</c:if>
								<c:if test="${ !((noticePage.currentPage + 5) > noticePage.endPage and noticePage.endPage < noticePage.maxPage) }">
									<!-- <a href="#none"><i class="xi-angle-right"></i></a> -->
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