

    function checkHideAll(){
    	if($("input[name=checkHideAll]").is(":checked")){
    		$("input[name=checkHide]").prop("checked", true);
    	}else{
    		$("input[name=checkHide]").prop("checked", false);
    	}
    }
			
    function dboardHide(page){
    	var page = page;
    	var checkRow = "";
    	$("input[name='checkHide']:checked").each(function(){
    		checkRow = checkRow + $(this).val()+",";
    	});
    	checkRow = checkRow.substring(0, checkRow.lastIndexOf(","));
    	
    	if(checkRow == ""){
    		alert("숨길 게시물을 선택해 주세요");
    		return false;
    	}
    	
    	console.log("### checkRow => {"+checkRow+"}");
    	
    	if(confirm("게시물을 숨김 처리 하겠습니까?"))
    		location.href = "dHide.ad?checkRow=" + checkRow + "&page=" + page;
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