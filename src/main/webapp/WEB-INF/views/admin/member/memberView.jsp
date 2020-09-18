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
                    <h3>전체회원 관리</h3>
                    <h2>| 상세</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="adminInfo_wrap">
                <h2>회원정보 수정</h2>
                
                
                <!-- 프로필 -->
				<dl class="profile">
					<dt>
						<div>
					        <c:if test="${ selectUser.renameProfile eq null }">
					        <img src="/runningdog/resources/images/common/userBg.png">
					        </c:if>        
					        <c:if test="${ selectUser.renameProfile ne null }">
					        <img src="/runningdog/resources/images/memberImg/${savePath}${selectUser.renameProfile}"/>
					        </c:if>
						</div>
					</dt>
					<dd>
						<div name="uniqueNum"><span>회원번호</span>&nbsp;&nbsp;:&nbsp;&nbsp;${selectUser.uniqueNum}</div>
						<div><span>아이디(이메일)</span>&nbsp;&nbsp;:&nbsp;&nbsp;${selectUser.userId}</div>
						<div><span>닉네임</span>&nbsp;&nbsp;:&nbsp;&nbsp;${selectUser.nickname}</div>
						<div><span>전화번호</span>&nbsp;&nbsp;:&nbsp;&nbsp;${selectUser.phone}</div>
						<div><span>가입일</span>&nbsp;&nbsp;:&nbsp;&nbsp;${selectUser.joinDate}</div>
						<div><span>최근접속일</span>&nbsp;&nbsp;:&nbsp;&nbsp;${selectUser.lastAccessDate}</div>
						<div class="loginType"><span>로그인유형</span>&nbsp;&nbsp;:&nbsp;&nbsp;
							<i class="xi-kakaotalk"></i>
							<c:if test="${ selectUser.loginType }">
							<i class="xi-kakaotalk"></i>
							</c:if>
							<c:if test="${ selectUser.loginType }">
							<i class="xi-facebook-official"></i>
							</c:if>
							<c:if test="${ selectUser.loginType }">
							<i class="xi-naver-square"></i></td>
							</c:if>
							<c:if test="${ selectUser.loginType }">
							일반
							</c:if>
						</div>
					</dd>
				</dl>
				<!-- 프로필 끝 -->
				
				<form method="post" action="memberModified.ad" enctype="multipart/form-data">
				<input type="hidden" value="${ selectUser.uniqueNum }" name="uniqueNum">
                <table class="adminInfo">
                    <colgroup>
                        <col width="25%">
                        <col width="25%">
                        <col width="25%">
                        <col width="25%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>아이디(이메일)</td>
                            <td colspan="3">
	                            <input type="text" name="userId" title="아이디(이메일)" id="userIdChk" class="form-control w80p" placeholder="아이디(이메일)" value="${ selectUser.userId }" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>프로필 사진</td>
                            <td colspan="3">
                                <c:if test="${ !empty selectUser.originProfile }">
								${ selectUser.originProfile } &nbsp;
								<label><input type="checkbox" name="deleteFlag" value="yes"> 삭제하기</label>
								</c:if>
								<c:if test="${ empty selectUser.originProfile }">
								<input type="file" name="profilImage" title="프로필 사진"/>
								</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>닉네임</td>
                            <td colspan="3">
                            	<input type="text" name="nickname" title="닉네임" id="nicknameChk" class="form-control w80p" placeholder="닉네임" value="${ selectUser.nickname }"/>
	                            <p id="nicknameWarning">
	                                <span></span>
	                            </p>
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰번호</td>
                            <td colspan="3" class="tel">
	                            <input type="tel" name="phone" title="휴대폰번호" id="phoneChk" class="form-control w80p" placeholder="'-' 포함 입력" value="${ selectUser.phone }" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <td>로그인 제한설정</td>
                            <td class="loginLimit">
                                <select name="loginLimit" class="loginLimit">
                                	<c:if test="${ selectUser.loginLimit == 'Y'}">
		                            <option value="Y" selected>제한하기</option>
		                            <option value="N">제한없음</option>                   
                                	</c:if>
                                	<c:if test="${ selectUser.loginLimit == 'N'}">
		                            <option value="Y">제한하기</option>
		                            <option value="N" selected>제한없음</option>                   
                                	</c:if>
                       			</select>
                            </td>
                            <td style="text-align:center; font-weight:500;">관리자 권한설정</td>
                            <td class="adminChk">
                                <select name="adminChk" class="adminChk">
                                	<c:if test="${ selectUser.adminChk == 'Y' }">
		                            <option value="Y" selected>관리자</option>
		                            <option value="N">일반회원</option>         
                                	</c:if>
                                	<c:if test="${ selectUser.adminChk == 'N' }">
		                            <option value="Y">관리자 권한부여</option>
		                            <option value="N" selected>일반회원</option>                   
                                	</c:if>
                       			</select>
                            </td>
                        </tr>
                        <tr>
                        </tr>
                    </tbody>
                </table>

                <div class="write-btn">
                    <input type="button" class="btn btn-delete" value="탈퇴처리" onclick="location.href='adminLeaveMember.ad?uniqueNum=${selectUser.uniqueNum}'">
                    <input type="reset" class="btn btn-list" value="취소하기">
                    <input type="submit" class="btn btn-success" value="수정하기">
                </div>
                </form>

            </div>
        </div>
        <c:import url="../include/admin_footer.jsp"/>
    </div>
</body>
</html>