<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="listCount" value="${ requestScope.totalCount }" />
<c:set var="startPage"  value="${ requestScope.startPage }"/>
<c:set var="endPage"  value="${ requestScope.endPage }"/>
<c:set var="maxPage"  value="${ requestScope.maxPage }"/>
<c:set var="currentPage"  value="${ requestScope.currentPage }"/>
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
                                <li class="xi-angle-right"><a href="vlistmy.do">나의 자원봉사</a></li>
                            </ul>
                        </div>
                        <h2><span>나의 자원봉사</span></h2>
                        <h3>나의 자원봉사 지원 목록을<br/>확인하실 수 있습니다.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->
<script type="text/javascript">
//검색 분류 선택 확인
$(function(){
   $("[name='sel']").on("click", function(){
      if($("select[name='type'] option:selected").val().length == 0) {
         alert("분류를 선택해주세요");
         return false;
      }
   });
});
</script>
                    <div class="subContent">
                        <!--서브 검색-->                
                        <div class="search_wrap">
                            <form action="vlistmy.do" name="">
                            <select name="type">
                                <option value="" class="fontColor-dark" selected disabled >전체</option>
                                <option value="address" class="fontColor-dark">지역</option>
                                <option value="name" class="fontColor-dark">센터명</option>
                                <option value="term" class="fontColor-dark">기간(월)</option>
                            </select>
                            <div class="search-box">
                                <input type="text" name="keyword" placeholder="원하시는 키워드를 검색해주세요.">
                                 <button type="submit" name="sel" class="xi-search"></button>
                            </div>
                            </form>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 ${listCount}개</h4>
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
                                    <c:forEach var="v" items="${requestScope.list}">
                                  		<c:url var="vd" value="vdetailmy.do">
                                  	 		<c:param name="volno" value="${v.volno}"/>
                                  	 		<c:param name="page" value="${currentPage}"/>
                                  		</c:url>
                                  		<c:if test="${ v.volche eq 'Y' }">
                                    <tr class="serviceOn" onclick="location.href='${vd}'">
                                    	</c:if>
                                    	<c:if test="${ v.volche ne 'Y' }">
                                    <tr class="serviceOut" onclick="location.href='${vd}'">
                                        </c:if>
                                        <td class="img">
                                           <c:if test="${ v.volche eq 'Y' }">  
                                              <span>모집중</span>
                                           </c:if>
                                           <c:if test="${ v.volche ne 'Y' }">
                                          	  <span>마감</span>
                                           </c:if>
                                           <c:if test="${ empty v.volre1 }">
                                            <img src="/runningdog/resources/images/test/animalNews04.jpg">
                                           </c:if>
                                           <c:if test="${ !empty v.volre1 }">
                                            <img src="/runningdog/resources/vfiles/${v.volre1 }">
                                           </c:if>
                                        </td>
                                        <td>
                                            <h3>${ v.voltitle }</h3>
                                            <ul>
                                                <li class="location"><span>지역 : </span>${v.voladdress}</li>
                                                <li><span>센터명 : </span>${v.volname}</li>
                                                 <li><span>모집기간 :</span> 상시모집 /
                                                	<c:if test="${ v.volche eq'y'}">
                                                			모집중</li>
                                               		</c:if>
                                               		<c:if test="${ v.volche ne'y'}">
                                               				모집완료</li>
                                               		</c:if>
                                               		<c:if test="${!empty v.volterm1 }">
                                                <li><span>봉사기간 : </span>${v.volterm1}~${v.volterm2}</li>
                                                    </c:if>
                                            </ul>
                                        </td>
                                        <td><a href="${vd}">자세히 보기 <i class="xi-eye-o"></i></a></td>
                                    </tr>
                                   </c:forEach>
                                </tbody>
                            </table>
                        <!-- 리스트 끝 -->
                    
                        <!-- 페이징 -->
                         <c:if test="${listCount > 0}">
                        <dl class="list-paging">
                            <dd>
                            <c:if test="${currentPage <= 1 }">
                                <a><i class="xi-angle-left"></i></a>
                            </c:if>
                            <c:if test="${currentPage > 1}">
                            	<c:url var="sl" value="vlistmy.do">
                               		<c:param name="page" value="1"/>
                                </c:url>
                                 <a href="${sl}"><i class="xi-angle-left"></i></a>
                            </c:if>
                            	<!-- 이전그룹으로 이동처리 -->
                            <c:if test="${currentPage > 10 }">
                            	<c:if test="${(currentPage -10) < startPage && (currentPage -10) }">
                                <c:url var="slbefore" value="vlistmy.do">
                                	<c:param name="page" value="${startPage - 10}"/>
                                </c:url>
                                  <a href="${slbefore}"><i class="xi-angle-left"></i></a>
                                </c:if>
                             </c:if>
                             	<!-- 현재 페이지가 속한 페이지 그룹의 숫자 출력 처리 -->
                           <c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
                              <c:if test="${p eq currentPage }">
                              		<a class="active">${ p }</a>
                              </c:if>	
                              <c:if test="${p ne currentPage }">
                              		<c:url var="slp" value="vlistmy.do">
                              			<c:param name="page" value="${p}"/>
                              		</c:url>
                              		   <a href="${slp}">${p}</a>
                              </c:if>
                           </c:forEach>
                             <!-- 다음그룹으로 이동처리 -->
                            <c:if test="${currentPage > 10 }">
                            	<c:if test="${(currentPage +10) > endPage &&(currentPage + 10) < maxPage }">
                                <c:url var="slafter" value="vlistmy.do">
                                	<c:param name="page" value="${ endPage +10 }"/>
                                </c:url>
                                  <a href="${slafter}"><i class="xi-angle-right"></i></a>
                                </c:if>
                             </c:if>
                             <!-- 맨끝 페이지로 이동처리 -->
                             <c:if test="${currentPage >= maxPage }">
                                <a><i class="xi-angle-right"></i></a>
                            </c:if>
                            <c:if test="${currentPage < maxPage}">
                            	<c:url var="sl2" value="vlistmy.do">
                               		<c:param name="page" value="${maxPage }"/>
                                </c:url>
                                 <a href="${sl2}"><i class="xi-angle-right"></i></a>
                            </c:if>
                            </dd>
                        </dl>
                        </c:if>
                        <c:if test="${listCount < 0 and listCount eq 0}">
                        <tr class="list-no">
							<td colspan="7">
								<p><img src="/runningdog/resources/images/btnIcn/icn_big_listNo.png" alt="" title="" /></p>
								<h1>목록이 없습니다.</h1>
							</td>
						</tr>
                    </c:if>
                        <!-- //페이징 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>