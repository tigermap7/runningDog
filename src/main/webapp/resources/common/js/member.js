
//로그인 정규표현식
$(function () {
    $('#loginUserId').blur(function () {
  	  var id = $('#loginUserId').val().trim();
        var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if (id == null || id == '' || id == 'undefined') {
    		$('#idWarning span').html("아이디(이메일)를 입력해주세요.");
        } else if (!(id.match(regExp))) {
    		$('#idWarning span').html("올바른 이메일 형식이 아닙니다.");
        } else {
    		$('#idWarning span').html('');
        }
    });
    $('#loginUserPwd').blur(function () {
	  var pwd = $('#loginUserPwd').val().trim();
        var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
        if (pwd == null || pwd == '' || pwd == 'undefined') {
    		$('#pwdWarning span').html("비밀번호를 입력해주세요.");
        } else if (!regExp.test(pwd)) {
    		$('#pwdWarning span').html("특수문자 / 문자 / 숫자 포함, 8~15자리 이내로 입력해주세요.");
        } else {
    		$('#pwdWarning span').html('');
        }
    });
});

// 로그인 아이디(이메일) 체크 저장
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#loginUserId").val(key); 
     
    if($("#loginUserId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#loginUserId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#loginUserId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#loginUserId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

//회원가입 구동/정규식
$(document).ready(function(){
	$('.join_btn').click(function() {
		var id = $('#joinUserId').val().trim();
		var pwd1 = $('#joinUserPwd').val().trim();
		var pwd2 = $('#joinUserPwd2').val().trim();
		var nick = $('#joinNickname').val().trim();
		var phone = $('#joinPhone').val().trim();
	    
		//아이디(이메일)정규식
	    var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	    //비밀번호 정규식
	    var pwqRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	    //휴대폰번호 정규식
	    var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
	    
		if (id == null || id == '' || id == 'undefined') {
			$('#idWarning span').html("아이디(이메일)를 입력해주세요.");
		} else if (!emailRegExp.test(id)) {
			$('#idWarning span').html("올바른 형식의 이메일이 아닙니다.");
			return false;
		} else {
			$('#idWarning span').html('');
		}
	
		if (pwd1 == null || pwd1 == '' || pwd1 == 'undefined') {
			$('#pwdWarning span').html("사용하실 비밀번호는 특수문자 / 문자 / 숫자 포함, 8~15자리 이내로 입력해주세요.");
		} else if (!pwqRegExp.test(pwd1)) {
			$('#pwdWarning span').html("특수문자 / 문자 / 숫자 포함, 8~15자리 이내로 입력해주세요.");
			return false;
		} else if (!(pwd2 == pwd1)) {
			$('#joinUserPwd2').focus();
			$('#pwdWarning span').html("입력하신 비밀번호와 동일하게 입력해주세요.");
			return false;
		} else {
			$('#pwdWarning span').html('');
		}
	
		if (nick == null || nick == '' || nick == 'undefined') {
			$('#nicknameWarning span').html("사용하실 닉네임을 입력해주세요.");
		} else {
			$('#nicknameWarning span').html('');
		}
	
		if (phone == null || phone == '' || phone == 'undefined') {
			$('#phoneWarning span').html("사용하실 휴대폰 번호를 입력해주세요.");
		} else if(!phoneRegExp.test(phone)) {
			$('#phoneWarning span').html("올바른 형식의 휴대폰번호가 아닙니다.");
			return false;
		} else {
			$('#phoneWarning span').html('');
		}
		if ($("#chkY").is(":checked") == false) {
			console.log('체크된 상태');
			alert("서비스 이용약관, 개인정보처리방침 동의 시 회원가입이 가능합니다.");
			$('#chkY').focus();
			return false;
		}
		
		if(id != '' && pwd1 != '' && pwd2 != '' && nick != '' && phone != '' && $("#chkY").is(":checked") == true){
			
			//formData 객체생성
			var formData = new FormData($('#joinForm')[0]);
			
			$.ajax({
	            type:'post',
	            enctype: 'multipart/form-data',
	            url:'joinAction.do',
	            data: formData, // 필수
	            processData: false, // 필수
	            contentType: false, // 필수
	            cache: false,
	            success : function(data) {
	                if (data == "notUserId") {
	        			$('#idWarning span').html("이미 가입된 아이디(이메일)입니다.");
	                	$("#joinUserId").focus();
	                } else if(data == "notNickname") {
	        			$('#nicknameWarning span').html("이미 존재하는 닉네임 입니다.");
	                	nickname.focus();
	                } else if(data == "notPhone") {
	        			$('#phoneWarning span').html("이미 가입된 핸드폰 번호 입니다.");
	                	phone.focus();
	                } else if(data == "joinOk") {
	                	alert("회원가입을 축하합니다.\n로그인 후 '지금 달려갈 개'의 서비스를 이용하실 수 있습니다.");
	    				location.reload();
	                	window.location.href = "login.do";
	                }
	            },
	    		error : function(jqXHR, textstatus, errorthrown) { console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);}
    		});
		}
	});
});

