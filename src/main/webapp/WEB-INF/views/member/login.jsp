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
	<script>

		function statusChangeCallback(response) { // Called with the results from FB.getLoginStatus().
			console.log('statusChangeCallback');
			console.log(response); // The current login status of the person.
			if (response.status === 'connected') { // Logged into your webpage and Facebook.
				testAPI();
			} else { // Not logged into your webpage or we are unable to tell.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this webpage.';
			}
		}

		function checkLoginState() { // Called when a person is finished with the Login Button.
			FB.getLoginStatus(function(response) { // See the onlogin handler
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '{app-id}',
				cookie : true, // Enable cookies to allow the server to access the session.
				xfbml : true, // Parse social plugins on this webpage.
				version : '{api-version}' // Use this Graph API version for this call.
			});

			FB.getLoginStatus(function(response) { // Called after the JS SDK has been initialized.
				statusChangeCallback(response); // Returns the login status.
			});
		};

		function testAPI() { // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
			console.log('Welcome!  Fetching your information.... ');
			FB.api('/me?fields=id,name,email', function(response) {
				console.log('Successful login for: ' + response.name);
				document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!';

				location.href = "facebookLogin.do?name=" + response.name + "&email=" + response.email
			});
		}
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
                            <li onclick="location='#none'" class="kLogin">
                                <span><i class="xi-kickstarter"></i></span>카카오계정 로그인
                            </li>
                            <li onclick="location='#none'" class="nLogin">
                                <span><i class="xi-naver"></i></span>네이버계정 로그인
                            </li>
                            <li scope="public_profile,email" onlogin="checkLoginState();" class="fLogin fb-login-button" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" data-width="">
                                <span><i class="xi-facebook"></i></span>페이스북계정 로그인
                            </li>
							<div scope="public_profile,email" onlogin="checkLoginState();" class="fb-login-button" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false" data-width=""></div>
							
                        </ul>
                    </div>
                    </form>
                    <div id="status">
					</div>
					<div id="fb-root">
					</div>
                </div>
				<!-- 로그인 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</body>
	
</html>