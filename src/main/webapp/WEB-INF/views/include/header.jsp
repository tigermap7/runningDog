<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="header">
    <!-- 상단메뉴 -->
    <div class="util_wrap">
        <div>
            <ul class="sosBell">
                <li onclick="location='#none'"><i class="xi-lightbulb-o"></i><span>[서울시 강북구 미아동]</span>흰색 포메리안을 강아지를 찾습니다.</li>
            </ul>
            <c:if test="${ !empty sessionScope.loginMember and loginMember.userId eq 'admin@runningdog.com' }">
            <ul class="util">
                <li><a class="hover_line01" href="/runningdog/views/member/login.jsp">로그인</a></li>
                <li><a class="hover_line01" href="/runningdog/views/member/join.jsp">회원가입</a></li>
                <li><a class="hover_line01" href="logout.do">로그아웃</a></li>
                <li><a class="hover_line01" href="/runningdog/views/mypage/myInfo.jsp">마이페이지</a></li>
                <!-- <li><a class="hover_line01" href="/runningdog/views/admin/member/allMember.jsp">관리자페이지</a></li> -->
                <li><a class="hover_line01" href="admin.do">관리자페이지</a></li>
            </ul>
            </c:if>
            <c:if test="${ !empty sessionScope.loginMember and loginMember.userId ne 'admin@runningdog.com' }">
            <ul class="util">
                <li><a class="hover_line01" href="logout.do">로그아웃</a></li>
                <li><a class="hover_line01" href="mypage.do">마이페이지</a></li>
            </ul>
            </c:if>
            <c:if test="${ empty sessionScope.loginMember }">
            <ul class="util">
                <li><a class="hover_line01" href="login.do">로그인</a></li>
                <li><a class="hover_line01" href="join.do">회원가입</a></li>
            </ul>
            </c:if>
        </div>
    </div>
    <div class="gnbWrap clearfix">
        <h1 onclick="location='/runningdog/'" title="지금 달려갈 개"></h1>
        <ul class="gnb clearfix">
            <li class="menuBtn"><a href="#none">전체</a></li>
            <li>
                <a href="/runningdog/views/animal/animalList.jsp">유기동물정보</a>
                <div class="dep2Wrap">
                    <ul class="dep2">
                        <li><a href="/runningdog/views/animal/animalList.jsp">유기동물정보</a></li>
                        <li><a href="/runningdog/views/animal/chooseList.jsp">유기동물 주인찾기</a></li>
                    </ul>
                </div>
            
            </li>
            <li>
                <a href="/runningdog/views/protect/protectList.jsp">보호센터 정보</a>
                <div class="dep2Wrap">
                    <ul class="dep2">
                        <li><a href="/runningdog/views/protect/protectList.jsp">보호센터정보</a></li>
                        <li><a href="/runningdog/views/protect/serviceList.jsp">자원봉사모집</a></li>
                    </ul>
                </div>
            </li>
            <li>
                <a href="/runningdog/views/sponsor/sponsorList.jsp">후원하기</a>
            </li>
            <li>
                <a href="cknowlist.do">상식/이슈</a>
                <div class="dep2Wrap">
                    <ul class="dep2">
                        <li><a href="cknowlist.do">반려동물상식</a></li>
                        <li><a href="cissuelist.do">오늘의 이슈</a></li>
                    </ul>
                </div>
            </li>
           <%-- <li><a href="${ pageContext.servletContext.contextPath }/nlist.do">공지사항</a></li> --%>
           <li><a href="nlist.do">공지사항</a></li>
        </ul>
    </div>
    <!-- //상단메뉴 -->
    
    <!-- 전체메뉴 -->
    <div class="menuAll">
        <ul>
        	<li>
                <div><a href="#none">전체카테고리</a></div>
                <ul class="depth2">
                    <li><a href="aboutView.do">사이트소개</a></li>
                    <li><a href="/runningdog/views/animal/animalList.jsp">유기동물정보</a></li>
                    <li><a href="/runningdog/views/animal/chooseList.jsp">유기동물 주인찾기</a></li>
                    <li><a href="/runningdog/views/protect/protectList.jsp">보호센터정보</a></li>
                    <li><a href="/runningdog/views/protect/serviceList.jsp">자원봉사모집</a></li>
                    <li><a href="nlist.do">공지사항</a></li>
                </ul>
            </li>
            <li>
                <div><a href="#none">후원하기</a></div>
                <ul class="depth2">
                    <a href="/runningdog/views/sponsor/sponsorList.jsp">후원하기</a>
                </ul>
            </li>
            <li>
                <div><a href="#none">콘텐츠</a></div>
                <ul class="depth2">
                    <li><a href="cknowlist.do">반려동물상식</a></li>
                    <li><a href="cissuelist.do">오늘의 이슈</a></li>
                </ul>
            </li>
            <li>
                <div><a href="#none">멤버</a></div>
                <ul class="depth2">
                    <li><a href="login.do">로그인</a></li>
                    <li><a href="join.do">회원가입</a></li>
                    <li><a href="mypage.do">나의 프로필</a></li>
                    <li><a href="/runningdog/views/mypage/myservice.jsp">나의 자원봉사</a></li>
                    <li><a href="/runningdog/views/mypage/myChatting.jsp">나의 채팅</a></li>
                    <li><a href="/runningdog/views/mypage/myReview.jsp">나의 댓글</a></li>
                </ul>
            </li>
            <li class="menuAll_close xi-close-square"></li>
        </ul>
    </div>
    <!-- //전체메뉴 -->
</div>
<div id="mHeader">
    <dl>
        <dt><button class="xi-backspace" onclick="javascript:history.back();"></button></dt>
        <dd><h1 onclick="location='/runningdog/'"></h1></dd>
        <dt>
            <button class="xi-align-justify collapsed" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="true" aria-label="Toggle navigation"></button>
        </dt>
    </dl>
    <ul class="mHeader_menu collapse" id="navbarSupportedContent">
        <li><a href="/runningdog/"><i class="xi-home-o"></i> 홈으로</a></li>
        <li><a href="/runningdog/views/animal/animalList.jsp">유기동물정보</a></li>
        <li><a href="/runningdog/views/animal/chooseList.jsp">유기동물 주인찾기</a></li>
        <li><a href="/runningdog/views/protect/protectList.jsp">보호센터정보</a></li>
        <li><a href="/runningdog/views/protect/serviceList.jsp">자원봉사모집</a></li>
        <li><a href="/runningdog/views/sponsor/sponsorList.jsp">후원하기</a></li>
        <li><a href="cknowlist.do">반려동물상식</a></li>
        <li><a href="cissuelist.do">오늘의 이슈</a></li>
        <li><a href="/runningdog/views/mypage/myChatting.jsp">나의 채팅</a></li>
        <li><a href="nlist.do">공지사항</a></li>
        <li><a href="aboutView.do">사이트소개</a></li>
    </ul>
</div>