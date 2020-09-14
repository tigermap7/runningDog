<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="../include/admin_head.jsp"/>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <c:import url="../include/admin_header.jsp"/>

        <div id="container">
            <c:import url="../include/admin_util.jsp"/>

            <!-- 상단 타이틀 -->
            <div class="pageTitle">
                <div class="adminPath">
                    <h3>후원하기 관리</h3>
                    <h2>| 상세</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="sponsorView">
                <div class="sPaymentTitle">
                    <p>
                        조회수 : 118 · <fmt:formatDate value="${ sponsor.sDate }" pattern="yyyy.MM.dd" />
                    </p>
                    
                    <div>
                        <h3>'따뜻한 마음의 실천'</h3>
                        <h2>${ sponsor.sTitle }</h2>
                    </div>
                </div>
                
                <div class="textCon">
                    <img src="resources\\sponsor\\thumbnail/${ sponsor.sOriginal }"><br><br><br><br>
                    ${ sponsor.sContent }
                </div>

                <!-- 버튼 -->
                <div class="viewBtn-wrap">
                    <button class="nextBtn"><i class="xi-angle-left-min"></i> 이전</button>
	                    <c:url var="sl" value="aslist.ad">
	                    	<c:param name="page" value="${ page }"/>
	                    </c:url>
                    <button class="listBtn" onclick="javascript:location.href='${ sl }'"><i class="xi-rotate-left"></i> 목록</button>
                    	<c:url var="del" value="sdelete.ad">
	                    	<c:param name="page" value="${ page }"/>
	                    	<c:param name="ck" value="${ sponsor.sNum }"/>
	                    </c:url>
                    <button class="deleteBtn" onclick="javascript:location.href='${ del }'"><i class="xi-cut"></i> 삭제</button>
                    <button class="modifiedBtn"><i class="xi-pen-o"></i> 수정</button>
                    <button class="prevBtn">다음 <i class="xi-angle-right-min"></i></button>
                </div>
                <!-- 버튼 끝 -->
            </div>
        </div>
        <c:import url="../include/admin_footer.jsp"/>
    </div>
</body>
</html>