<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="header">
    <h1 onclick="location='/WEB-INF/'" title="지금 달려갈 개"><img src="/WEB-INF/resources/admin/images/common/logo.png" alt="지금 달려갈 개"></h1>
    <!-- gnb -->
    <ul class="gnb">
        <li>
            <h2><a href="#collapse1" class="collapsed" data-toggle="collapse"><i class="xi-users-o"></i> 사용자관리 <i class="xi-angle-down-min more"></i></a></h2>
            <div id="collapse1" class="collapse show" data-parent="#accordion">
                <a href="../member/allMember.jsp">전체회원 리스트</a>
                <a href="../member/leadeMember.jsp">탈퇴회원 리스트</a>
            </div>
        </li>
        <li>
            <h2><a href="#collapse2" class="collapsed" data-toggle="collapse"><i class="xi-document"></i> 사용자게시판 <i class="xi-angle-down-min more"></i></a></h2>
            <div id="collapse2" class="collapse show" data-parent="#accordion">
                <a href="../userBoard/chooseList.jsp">유기동물 주인찾기 관리</a>
                <a href="../userBoard/serviceList.jsp">자원봉사모집 관리</a>
                <a href="../userBoard/sponsorList.jsp">후원하기 관리</a>
                <a href="../userBoard/noticeList.jsp">공지사항 관리</a>
            </div>
        </li>
        <li>
            <h2><a href="#collapse3" class="collapsed" data-toggle="collapse"><i class="xi-library-bookmark"></i> 콘텐츠 <i class="xi-angle-down-min more"></i></a></h2>
            <div id="collapse3" class="collapse show" data-parent="#accordion">
                <a href="../contents/knowledgeList.jsp">반려동물 상식 관리</a>
                <a href="../contents/issueList.jsp">오늘의 이슈 관리</a>
            </div>
        </li>
        <li>
            <h2><a href="#collapse4" class="collapsed" data-toggle="collapse"><i class="xi-cog"></i> 관리자 관리 <i class="xi-angle-down-min more"></i></a></h2>
            <div id="collapse4" class="collapse show" data-parent="#accordion">
                <a href="../etc/aboutView.jsp">사이트소개 관리</a>
                <a href="../etc/etcView.jsp">사용자약관 관리</a>
                <a href="../etc/adminInfo.jsp">관리자 정보수정</a>
            </div>
        </li>
    </ul>
</div>