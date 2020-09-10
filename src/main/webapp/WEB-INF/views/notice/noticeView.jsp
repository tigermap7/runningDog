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
					
					<!-- 공지사항 new 알람을 위한 한달 전 날짜 -->
                    <jsp:useBean id="nowDate" class="java.util.Date"/>
					<jsp:setProperty name="nowDate" property="time" value="${nowDate.time - 86400000 * 32}"/>
					<fmt:formatDate value="${nowDate}" type="date" pattern="yyyy/MM/dd" var="monthAgo"/>
							
                    <!-- 상세 -->
                    <div class="view-area">
 
                    	<c:if test="${ !empty notice.noticeState }">
                        	<h3><span>공지</span></h3>
                        </c:if>
                        
                        <c:if test="${ empty notice.noticeState }">
                        <fmt:formatDate value="${notice.noticeDate}" type="date" pattern="yyyy/MM/dd" var="ndate"/>
                        	<c:if test="${ monthAgo < ndate }">
                        		<h3><span>new</span></h3>
                       		</c:if>
                        </c:if>
                        
                        <h2>${ notice.noticeTitle }</h2>
                        <ul>
                            <li><span>작성자 : </span>${ notice.noticeWriter }</li>
                            <li><span>등록일 : </span>${ notice.noticeDate }</li>
                            <li><span>조회수 : </span>${ notice.noticeReadcount }</li>
                            <li><span>첨부파일 : </span><a href="#none" download>asdasddsa.hwp</a></li>
                        </ul>

                        <div class="view-ctn">
                       		${ notice.noticeContent }
                        </div>
                    </div>
                    <!-- 상세 끝 -->
                    
                    <!-- 버튼 -->
                    <div class="viewBtn-wrap">
                        <button class="nextBtn"><i class="xi-angle-left-min"></i> 이전</button>
						<c:url var="nlisturl" value="nlist.do">
							<c:param name="page" value="${ noticePage.currentPage }"/>
							<c:param name="searchNotice" value="${ noticePage.search }"/>
							<c:param name="keyword" value="${ noticePage.keyword }"/>
						</c:url>
                        <button class="listBtn" onclick="location.href='${nlisturl}'"><i class="xi-rotate-left"></i> 목록</button>
                        <button class="deleteBtn"><i class="xi-cut"></i> 삭제</button>
                        <button class="modifiedBtn" onclick="location.href='movenoticeupdate.do'"><i class="xi-pen-o"></i> 수정</button>
                        <button class="prevBtn">다음 <i class="xi-angle-right-min"></i></button>
                    </div>
                    <!-- 버튼 끝 -->
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
			</div>
		</div>
	</body>
</html>