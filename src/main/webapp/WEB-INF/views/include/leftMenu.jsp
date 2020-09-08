<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="leftMenu_wrap">
    <div class="leftProfile">
        <div><img src="/runningdog/resources/images/test/animalImg03.jpg"></div>
        <h3>멍무이 님</h3>
        <p>회원번호 #1971345</p>
        <ul>
            <li><b>게시글 12</b></li>
            <li><button type="button">로그아웃</button></li>
        </ul>
    </div>
    <ul class="leftGnb">
        <li><a href="/WEB-INF/views/mypage/myInfo.jsp">나의 프로필</a></li>
        <li><a href="/WEB-INF/views/mypage/myServiceList.jsp">나의 자원봉사</a></li>
        <li><a href="/WEB-INF/views/mypage/myChatting.jsp">나의 채팅</a></li>
        <li><a href="/WEB-INF/views/mypage/myComment.jsp">나의 댓글</a></li>
    </ul>

    <ul class="leftBanner">
        <li onclick="location='/WEB-INF/views/sponsor/sponsorList.jsp'">
            <h2><i class="xi-piggy-bank"></i> 후원 참여하기</h2>
            <p>
                함께하는 여러분의 따뜻한 손길이 모여 큰 힘이 됩니다.<br>
            </p>
        </li>
        <li onclick="location='nlist.do'">
            <h2><i class="xi-bell-o"></i> 공지사항 확인</i></h2>
            <p>'지금 달려갈 개'의 공지사항을 꼭 확인해주세요.<br>&nbsp;</p>
        </li>
    </ul>
</div>