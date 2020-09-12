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
                                <li><a href="#none">홈</a></li>
                                <li class="xi-angle-right"><a href="#none">프로필 편집</a></li>
                            </ul>
                        </div>
                        <h2><span>프로필 편집</span></h2>
                        <h3>나의 프로필 정보를 변경할 수 있습니다.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->
                    <div class="subContent">
                        <div class="mypage_area">
                            <h2 class="mypage_title">나의 프로필 수정</h2>
                            <table class="InfoModify_table">
                                <colgroup>
                                    <col width="25%">
                                    <col width="75%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>아이디(이메일)</td>
                                        <td><input type="text" name="" title="아이디(이메일)" class="form-control w80p" placeholder="아이디(이메일)" value="${sessionScope.loginMember.userId}" readonly/></td>
                                    </tr>
                                    <tr>
                                        <td>프로필 사진</td>
                                        <td><input type="file" name="" title="프로필 사진"/></td>
                                    </tr>
                                    <tr>
                                        <td>닉네임</td>
                                        <td><input type="text" name="" title="이름" class="form-control w80p" placeholder="닉네임" value="${sessionScope.loginMember.nickname}"/></td>
                                    </tr>
                                    <tr>
                                        <td>휴대폰번호</td>
                                        <td class="telArea"><input type="tel" name="" title="휴대폰번호" class="form-control w80p" placeholder="'-' 포함 입력"  value="${sessionScope.loginMember.phone}"/></td>
                                    </tr>
                                    <tr>
                                        <td>비밀번호</td>
                                        <td><input type="password" name="" title="비밀번호" class="form-control w80p" placeholder="기존 비밀번호"/></td>
                                    </tr>
                                    <tr>
                                        <td>신규 비밀번호</td>
                                        <td class="newPwd">
                                            <input type="password" name="" title="신규 비밀번호" class="form-control w80p mb5" placeholder="신규 비밀번호 입력"/><br/>
                                            <input type="password" name="" title="신규 비밀번호 재확인" class="form-control w80p mb10" placeholder="신규 비밀번호 재입력"/><br/>
                                            <button>변경하기</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
            
                            <div class="write-btn">
                                <input type="reset" class="btn btn-list" value="취소하기">
                                <input type="submit" class="btn btn-success" value="수정하기">
                            </div>
            
                        </div>
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>