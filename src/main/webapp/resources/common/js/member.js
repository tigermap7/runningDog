
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


$(function () {    
    $('#joinUserId').blur(function () {
    	var id = $('#joinUserId').val().trim();
        var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

		if (id == null || id == '' || id == 'undefined') {
			$('#idWarning span').html("아이디(이메일)를 입력해주세요.");
		} else if (!(id.match(regExp))) {
			$('#idWarning span').html("올바른 이메일 형식이 아닙니다.");
		} else {
			$('#idWarning span').html('');
			$('#joinUserPwd').focus();
		}
    });
    $('#joinUserPwd, #joinUserPwd2').blur(function () {
    	var pwd1 = $('#joinUserPwd').val().trim();
    	var pwd2 = $('#joinUserPwd2').val().trim();
        var pwqRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if (pwd1 == null || pwd1 == '' || pwd1 == 'undefined') {
			$('#pwdWarning span').html("사용하실 비밀번호를 입력해주세요.");
		} else if (!pwqRegExp.test(pwd1)) {
			$('#pwdWarning span').html("특수문자 / 문자 / 숫자 포함, 8~15자리 이내로 입력해주세요.");
		} else if (!(pwd2 == pwd1)) {
			$('#joinUserPwd2').focus();
			$('#pwdWarning span').html("입력하신 비밀번호와 동일하게 입력해주세요.");
		} else {
			$('#pwdWarning span').html('');
			$('#joinNickname').focus();
		}
    });
});




//회원가입 정규표현식
//$(function () {
//  $('#joinUserId').blur(function () {
//	  var id = $('#joinUserId').val().trim();
//      var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
//      if (id == null || id == '' || id == 'undefined') {
//  		$('#idWarning span').html("아이디(이메일)를 입력해주세요.");
//      } else if (!(id.match(regExp))) {
//  		$('#idWarning span').html("올바른 이메일 형식이 아닙니다.");
//      } else {
//  		$('#idWarning span').html('');
//  		$('#joinUserPwd').focus();
//      }
//	});
//	$('#joinUserPwd, #joinUserPwd2').blur(function () {
//	  var pwd1 = $('#joinUserPwd').val().trim();
//	  var pwd2 = $('#joinUserPwd2').val().trim();
//      var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
//      if (pwd1 == null || pwd1 == '' || pwd1 == 'undefined') {
//  		$('#pwdWarning span').html("사용하실 비밀번호를 입력해주세요.");
//      } else if (!regExp.test(pwd1)) {
//  		$('#pwdWarning span').html("특수문자 / 문자 / 숫자 포함, 8~15자리 이내로 입력해주세요.");
//      } else if (!(pwd2 == pwd1)) {
//		$('#joinUserPwd2').focus();
//		$('#pwdWarning span').html("입력하신 비밀번호와 동일하게 입력해주세요.");
//      } else {
//  		$('#pwdWarning span').html('');
//  		$('#joinNickname').focus();
//      }
//  });
//});

//$(document).ready(function(){
//	$('.join_btn').click(function() {
//		var id = $('#joinUserId').val().trim();
//		var pwd1 = $('#joinUserPwd').val().trim();
//		var pwd2 = $('#joinUserPwd2').val().trim();
//		var nick = $('#joinNickname').val().trim();
//		var phone = $('#joinPhone').val().trim();
//	    
//	    var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
//	    var pwqRegExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
//	    
//		if (id == null || id == '' || id == 'undefined') {
//			$('#idWarning span').html("아이디(이메일)를 입력해주세요.");
//		} else if (!(id.match(regExp))) {
//			$('#idWarning span').html("올바른 이메일 형식이 아닙니다.");
//		} else {
//			$('#idWarning span').html('');
//			$('#joinUserPwd').focus();
//		}
//	
//		if (pwd1 == null || pwd1 == '' || pwd1 == 'undefined') {
//			$('#pwdWarning span').html("사용하실 비밀번호를 입력해주세요.");
//		} else if (!pwqRegExp.test(pwd1)) {
//			$('#pwdWarning span').html("특수문자 / 문자 / 숫자 포함, 8~15자리 이내로 입력해주세요.");
//		} else if (!(pwd2 == pwd1)) {
//			$('#joinUserPwd2').focus();
//			$('#pwdWarning span').html("입력하신 비밀번호와 동일하게 입력해주세요.");
//		} else {
//			$('#pwdWarning span').html('');
//			$('#joinNickname').focus();
//		}
//		
//		if(id != '' && pwd1 != '' && pwd2 != '' && nick != '' && phone != '' ){
//			$.ajax({
//	            url:'joinAction.do',
//	            type:'post',
//	            data : {
//					userId : $("#joinUserId").val(),
//					userPwd : $("#joinUserPwd").val(),
//					userPwd2 : $("#joinUserPwd2").val(),
//					nickname : $("#joinNickname").val(),
//					phone : $("#joinPhone").val()
//            	},
//	            success : function(data) {
//	                if (data == "notUserId") {
//	                	alert("이미 가입된 아이디(이메일)입니다.");
//	                } else if(data == "notNickname") {
//	                	alert("이미 존재하는 닉네임 입니다.");
//	                } else if(data == "notPhone") {
//	                	alert("이미 가입된 핸드폰 번호 입니다.");
//	                }
//	            },
//	    		error : function(jqXHR, textstatus, errorthrown) { // jqXHR, textstatus, errorthrown : 에러표시 함수가 있음.
//				console.log("error : " + jqXHR + ", " + textstatus + ", "
//						+ errorthrown);
//	    		}
//    		});
//			return false;
//		}
//	});
//});



////아이디 중복체크
//function userIdChk() {
//	$.ajax({
//		url : "userIdChk.do",
//		type : "post",
//		data : {
//			userId : $("#joinUserId").val()
//		},
//		success : function(data) {
//			if (data == "ok") { // == 같다. 표현
//				alert("사용 가능한 아이디입니다.");
//				$("#joinUserId").focus();
//			} else {
//				alert("이미 사용중인 아이디입니다.\n다시 입력하세요.");
//				$("#joinUserId").select();
//			}
//		},
//		error : function(jqXHR, textstatus, errorthrown) { // jqXHR, textstatus, errorthrown : 에러표시 함수가 있음.
//			console.log("error : " + jqXHR + ", " + textstatus + ", "
//					+ errorthrown);
//		}
//	});
//	return false;
//}