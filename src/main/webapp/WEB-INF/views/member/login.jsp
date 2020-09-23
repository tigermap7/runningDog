<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko" class="animalBg">
	<head>
	<c:import url="/WEB-INF/views/include/head.jsp"/>
	<!-- Load the JS SDK asynchronously -->
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v8.0&appId=1200941690288936&autoLogAppEvents=1" nonce="T57R8Bl1"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="resources/common/js/facebookLogin.js"></script>
	<script type="text/javascript">

	componentDidMount(){
		Kakao.init('30a4b3e3e223c1a9da5e2de7977c3569');
	}
	
	/* function loginWithKakao(){
		console.log("loginWithKakao 실행중");
		kakao.init('30a4b3e3e223c1a9da5e2de7977c3569');
		
		Kakao.Auth.createLoginButton({
			container: '#kakao-login-btn',
			success: function(authObj) {
		    Kakao.API.request({
				url: '/v2/user/me',
				success: function(res) {
		        alert(JSON.stringify(res))
				},
				fail: function(error) {
					alert('login success, but failed to request user information: ' + JSON.stringify(error))
					},
				})
			},
			fail: function(err) {
			    alert('failed to login: ' + JSON.stringify(err))
			    alert('failed to login: ' + JSON.stringify(err))
			},
		})
	} */
	
</script>
</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<div id="wrap">
		    <!-- 컨텐츠 -->
			<div id="content">
			    <!-- 로그인 -->
				<div class="member_wrap">
				    <form name="loginFrom" method="post" action="loginAction.do">
				    <legend>로그인</legend>
				    <div class="login_wrap">
				        <h1 onclick="location='/runningdog/'"><img src="/runningdog/resources/images/common/logo_over.png" alt="logo"></h1>
						<div class="loginInfo">
						    <div>
						        <span><i class="xi-mail-o"></i></span>
						        <span><input type="email" name="userId" title="아이디" id="userIdChk" class="w100p" placeholder="아이디(이메일)" required/></span>
						    </div>
						    <p id="idWarning">
						        <span></span>
						    </p>
						    <div>
						        <span><i class="xi-lock-o"></i></span>
						        <span><input type="password" name="userPwd" title="비밀번호" id="userPwdChk" class="w100p" placeholder="비밀번호" required/></span>
						    </div>
						    <p id="pwdWarning">
						        <span></span>
						    </p>
						    <dl>
						        <dt><label><input type="checkbox" name="" id="idSaveCheck"> 이메일 저장</label></dt>
						        <dd onclick="location='accountFind.do'">아이디(이메일)/비밀번호 찾기 <i class="xi-angle-right"></i></dd>
						    </dl>
						    <input class="login_btn" type="submit" name="" value="로그인">
						</div>
						<a href="join.do" class="join_btn">회원가입</a>
						
						<ul class="snsLogin">
					    <li id="kakao-login-btn" onclick="javascript:loginWithKakao();" class="kLogin">
						    <span><i class="xi-kickstarter"></i></span>카카오 로그인
						</li>
						<li onclick="location='#none'" class="nLogin">
						    <span><i class="xi-naver"></i></span>네이버 로그인
						</li>
						<li id="status" scope="public_profile,email" onclick="javascript:facebookLogin();" class="fLogin">
						    <span><i class="xi-facebook"></i></span>페이스북 로그인
						</li>
						<!-- div id="status" scope="public_profile,email" onlogin="checkLoginState();" class="fb-login-button" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" data-width=""></div-->
							
							<a id="custom-login-btn" href="javascript:loginWithKakao()">
								<img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
							</a>
						</ul>
					</div>
					</form>
				</div>
				<!-- 로그인 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</body>
   
</html>