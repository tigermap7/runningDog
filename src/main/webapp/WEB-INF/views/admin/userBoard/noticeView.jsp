<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/WEB-INF/views/admin/include/admin_head.jsp"/>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <c:import url="/WEB-INF/views/admin/include/admin_header.jsp"/>

        <div id="container">
            <c:import url="/WEB-INF/views/admin/include/admin_util.jsp"/>

            <!-- 상단 타이틀 -->
            <div class="pageTitle">
                <div class="adminPath">
                    <h3>공지사항 관리</h3>
                    <h2>| 상세</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="view-area">
                <h3><span>공지</span></h3>
                <h2>유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</h2>
                <ul>
                    <li><span>작성자 : </span>관리자</li>
                    <li><span>등록일 : </span>2020.08.28</li>
                    <li><span>조회수 : </span>102</li>
                    <li><span>첨부파일 : </span><a href="#none" download="">asdasddsa.hwp</a></li>
                </ul>

                <div class="view-ctn">
                「동물보호법」 제17조, 시행령7조 및 동법 시행규칙 제20조에 따라 유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.<br><br>
                공고 중인 동물 소유자는 해당 시군구 및 동물보호센터에 문의하시어 동물을 찾아가시기 바랍니다.<br>
                다만, 「동물보호법」 제19조 및 동법 시행규칙 제21조에 따라 소유자에게 보호비용이 청구될 수 있습니다.<br>
                또한 「동물보호법」 제17조에 따른 공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는 경우에는 「유실물법」 제12조 및 「민법」 제253조의 규정에도 불구하고 해당 시·도지사 또는 시장·군수·구청장이 그 동물의 소유권을 취득하게 됩니다.
                </div>

				<c:url var="mnuad" value="movenoticeupdate.ad">
					<c:param name="" value=""/>
				</c:url>


                <!-- 버튼 -->
                <div class="viewBtn-wrap">
                    <button class="nextBtn"><i class="xi-angle-left-min"></i> 이전</button>
                    <button class="listBtn" onclick="location.href='nlist.ad'"><i class="xi-rotate-left"></i> 목록</button>
                    <button class="deleteBtn"><i class="xi-cut"></i> 삭제</button>
                    <button class="modifiedBtn" onclick="javascript:location.href='${ mnuad }';"><i class="xi-pen-o"></i> 수정</button>
                    <button class="prevBtn">다음 <i class="xi-angle-right-min"></i></button>
                </div>
                <!-- 버튼 끝 -->
            </div>
        </div>
        <c:import url="/WEB-INF/views/admin/include/admin_footer.jsp"/>
    </div>
</body>
</html>