<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko" class="animalBg">
<head>
<c:import url="/WEB-INF/views/include/head.jsp" />
<!-- Load the JS SDK asynchronously -->


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
						<h1 onclick="location='/runningdog/'">
							<img src="/runningdog/resources/images/common/logo_over.png"
								alt="logo">
						</h1>
						<div class="loginInfo">
							<div>
								<span><i class="xi-mail-o"></i></span> <span><input
									type="email" name="userId" title="아이디" id="userIdChk"
									class="w100p" placeholder="아이디(이메일)" required /></span>
							</div>
							<p id="idWarning">
								<span></span>
							</p>
							<div>
								<span><i class="xi-lock-o"></i></span> <span><input
									type="password" name="userPwd" title="비밀번호" id="userPwdChk"
									class="w100p" placeholder="비밀번호" required /></span>
							</div>
							<p id="pwdWarning">
								<span></span>
							</p>
							<dl>
								<dt>
									<label><input type="checkbox" name="" id="idSaveCheck">
										이메일 저장</label>
								</dt>
								<dd onclick="location='accountFind.do'">
									아이디(이메일)/비밀번호 찾기 <i class="xi-angle-right"></i>
								</dd>
							</dl>
							<input class="login_btn" type="submit" name="" value="로그인">
						</div>
						<a href="join.do" class="join_btn">회원가입</a>

						<ul class="snsLogin">
							<li class="kLogin" onclick="javascript:loginWithKakao()"><span><i class="xi-kickstarter"></i></span>카카오 로그인</li>
							<li id="naverIdLogin" class="nLogin"><span><i class="xi-naver"></i></span>네이버 로그인</li>
							<li id="status" scope="public_profile,email" onclick="javascript:facebookLogin();" class="fLogin"><span><i class="xi-facebook"></i></span>페이스북 로그인</li>
            			</ul>
					</div>
				</form>
				<script>
				var naverLogin = new naver.LoginWithNaverId({
					clientId: "BH_kSon1igZkUqwElBdD",
					callbackUrl: "http://localhost:9392/runningdog/naverLogin.do",
					isPopup: true, /* 팝업을 통한 연동처리 여부 */
					loginButton: {color: "green", type: 3, height: 60}
					/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
					}
				);
					
				/* 설정정보를 초기화하고 연동을 준비 */
				naverLogin.init();
				
				/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
				window.addEventListener('load', function () {
					naverLogin.getLoginStatus(function (status) {
						if (status) {
								/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
							var email = naverLogin.user.getEmail();
							var nickname = naverLogin.user.getNickName();
							var profileImage = naverLogin.user.getProfileImage();
							
							if( email == undefined || email == null) {
								alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
								naverLogin.reprompt();
								return;
							} else if( nickname == undefined || nickname == null) {
								alert("별명 필수정보입니다. 정보제공을 동의해주세요.");
								naverLogin.reprompt();
								return;
							} else if( profileImage == undefined || profileImage == null) {
								alert("프로필사진은 필수정보입니다. 정보제공을 동의해주세요.");
								naverLogin.reprompt();
								return;
							}
					
							console.log("email : " + email);
							console.log("nickname : " + nickname);
							console.log("profileImage : " + profileImage);
							console.log("status : " + status);
						
							console.log("확인2");
							//location.href="naverLogin.do?id=" + email + "&nickname=" + nickname + "&profileImage=" + profileImage;
							window.opener.location.replace("naverLogin.do?id=" + email + "&nickname=" + nickname + "&profileImage=" + profileImage);

						} else {
							console.log("callback 처리에 실패하였습니다.");
						}
					});
				});

				</script>
			</div>
			<!-- 로그인 끝 -->
		</div>
		<!-- 컨텐츠 끝 -->
	</div>
</body>

</html>