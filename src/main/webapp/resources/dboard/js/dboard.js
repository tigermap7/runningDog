
//댓글


function getCommentList() {	
	$.ajax({
		url : "selectDreply.do",
		type : "post",
		dataType : "json",
		success : function(data) {
			console.log(obj);

			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var totalcount = (jsonObj.list).length;	
			
			var output = $("#dreply").html();
			$("#totalcount").text('댓글 갯수 : ' + totalcount );

			for(var i in jsonObj.list) {
				output += '<li><div>' +
				'<h4>user : ' + jsonObj.list[i].dreWriter + '</h4><span>' + jsonObj.list[i].dreply.dreDate + '</span>' +
				'</div><pre>' + decodeURIComponent(jsonObj.list[i].dreContent).replace(/\+/gi, " ") + '</pre>' + 
				'<div class="cmt_delete" style="float: right;"><input type="button" value="삭제" onclick="Replydelete(' + jsonObj.list[i].dreNum + ');">' + 
				'</div><br></li>'
			}	// for in

			$("#dreply").empty();
			$("#dreply").html(output);

			/*
			 * $("#reply").html($("#reply").html() +
			 * values);
			 */
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus
					+ ", " + errorthrown);
		}
	}); // ajax
}	

// 댓글 추가
function ReplySubmit(code) {
	if (document.getElementById("dreContent").value == "") {
		alert("내용을 입력해주세요");
		return false;
	}else
		$.ajax({
			url : "insertDreply.do",
			type:'POST',
			data : {dreContent : $('#dreContent').val(), dreNum : $('#dreNum').val()},
			success : function(data){
				if(data == 1) {
					alert("댓글이 등록되었습니다."); 
				} else {
					alert("댓글 등록을 실패했습니다."); 
				}
				$("#dreContent").val("");
				getCommentList();
			},
			error:function(request,status,error){
				alert("로그인후 이용해주세요.");
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
			}
		});
}

// 댓글 삭제
function Replydelete(dreNum) {
	console.log(dreNum + "댓글 삭제하기")

	$.ajax({
		url : "updateDreplyDel.do",
		type:'POST',
		data : {dreNum : dreNum },
		success : function(data){
			if(data == 1) {
				alert("댓글이 삭제되었습니다."); 
			} else {
				alert("댓글 삭제를 실패했습니다."); 
			}
			getCommentList();
		},
		error:function(request,status,error){
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
		}
	});
}



/* 파일용량체크 */
function checkSize(input) {
    if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
        alert("이미지 크기가 10mb 를 넘습니다.");
        input.value = null;
    }
}

//좌표값 미지정시 alert창
function check() {
  if(formname.mapX.value == "") {
    alert("발견장소를 클릭해 주세요.");
    formname.mapX.focus();
    return false;
  }
  else if(formname.mapY.value == "") {
    alert("발견장소를 클릭해 주세요.");
    formname.mapY.focus();
    return false;
  }
  else return true;

}
//이미지 클릭시 원본 사이즈 팝업
 function fnImgPop(url){
  var img=new Image();
  img.src=url;
  var img_width=img.width;
  var win_width=img.width+25;
  var img_height=img.height;
  var win=img.height+30;
  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
 }

 
// 파일업로드 시 이미지만 받게함
 function chk_file_type(obj){
	 var file_kind = obj.value.lastIndexOf('.');
	 var file_name = obj.value.substring(file_kind+1,obj.length);
	 var file_type = file_name.toLowerCase();
	 
	 var check_file_type = new Array();
	 
	 check_file_type = ['jpg' ,'png', 'jpeg', 'bmp'];
	 
	 if (check_file_type.indexOf(file_type)==-1){
		 alert('이미지 파일만 선택할 수 있습니다.');
		 var parent_Obj = obj.parentNode
		 var node = parent_Obj.replaceChild(obj.cloneNode(true), obj);
		return false;
	 }
 }

 
 /*연락처 입력 폼*/
function inputTelNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var tel = "";

    // 서울 지역번호(02)가 들어오는 경우
    if(number.substring(0, 2).indexOf('02') == 0) {
        if(number.length < 3) {
            return number;
        } else if(number.length < 6) {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2);
        } else if(number.length < 10) {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2, 3);
            tel += "-";
            tel += number.substr(5);
        } else {
            tel += number.substr(0, 2);
            tel += "-";
            tel += number.substr(2, 4);
            tel += "-";
            tel += number.substr(6);
        }
    
    // 서울 지역번호(02)가 아닌경우
    } else {
        if(number.length < 4) {
            return number;
        } else if(number.length < 7) {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3);
        } else if(number.length < 11) {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3, 3);
            tel += "-";
            tel += number.substr(6);
        } else {
            tel += number.substr(0, 3);
            tel += "-";
            tel += number.substr(3, 4);
            tel += "-";
            tel += number.substr(7);
        }
    }

    obj.value = tel;
}