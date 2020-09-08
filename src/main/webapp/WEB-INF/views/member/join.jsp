<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko" class="animalBg">
	<head>
        <c:import url="/WEB-INF/views/include/head.jsp"/>
        <script>
            $(function(){
                $(".privacyCke a.con1").click(function(){
                    $(".privacyCke_con textarea.con2").removeClass('on');
                    $(".privacyCke_con textarea.con1").toggleClass('on');
                });
                $(".privacyCke a.con2").click(function(){
                    $(".privacyCke_con textarea.con1").removeClass('on');
                    $(".privacyCke_con textarea.con2").toggleClass('on');
                });
            });
        </script>
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<div id="wrap">
			<!-- 컨텐츠 -->
			<div id="content">
				<!-- 로그인 -->
                <div class="member_wrap">
                    <form method="post" action="#">
                    <legend>회원가입</legend>
                    <div class="login_wrap">
                        <h1 onclick="location='/WEB-INF/'"><img src="/runningdog/resources/images/common/logo_over.png" alt="logo"></h1>
                        <div class="loginInfo">
                            <div>
                                <span><i class="xi-mail-o"></i></span>
                                <span><input type="email" name="" title="아이디" class="w100p" placeholder="아이디(이메일)" required/></span>
                            </div>
                            <p>
                                <span>아이디(이메일)를 입력해주세요.</span>
                                <span>아이디(이메일)가 이메일 형식이 아닙니다.</span>
                                <span>이미 가입된 아이디(이메일) 입니다.</span>
                            </p>
                            <div>
                                <span><i class="xi-lock-o"></i></span>
                                <span><input type="password" name="" title="비밀번호" class="w100p" placeholder="비밀번호" required/></span>
                            </div>
                            <div>
                                <span><i class="xi-lock"></i></span>
                                <span><input type="password" name="" title="비밀번호 확인" class="w100p" placeholder="비밀번호 확인" required/></span>
                            </div>
                            <p>
                                <span>비밀번호를 입력해주세요.</span>
                                <span>비밀번호가 동일하지 않습니다.</span>
                            </p>
                            <div>
                                <span><i class="xi-user-o"></i></span>
                                <span><input type="text" name="" title="이름" class="w100p" placeholder="닉네임" required/></span>
                            </div>
                            <p>
                                <span>이미 존재하는 닉네임 입니다.</span>
                            </p>
                            <!-- <div>
                                <span><i class="xi-toilet"></i></span>
                                <span class="genderChk"><label><input type="radio"" name="genderChk" title="남자" />남자</label> <label><input type="radio"" name="genderChk" title="여자" />여자</label></span>
                            </div> -->
                            <div>
                                <span><i class="xi-call"></i></span>
                                <span><input type="tel" name="" title="휴대폰번호" class="w100p" placeholder="휴대폰번호('-'포함 입력)" required/></span>
                            </div>
                            <p class="privacyCke" style="margin:1.25rem 0;">
                                <label><input type="checkbox" name="" id=""/> 서비스의 <a href="#none" class="con1">이용약관</a>과 <a href="#none" class="con2">개인정보처리방침</a>에 동의합니다.</label>
                            </p>

                            <input class="join_btn" type="submit" name="" value="회원가입">
                        </div>
                        <div class="privacyCke_con">
                            <c:import url="termsCon.do"/>
                            <c:import url="privacyCon.do"/>
                        </div>
                    </div>
				    </form>
                </div>
				<!-- 로그인 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</body>
</html>