/* 파일용량체크 */
function che_Size(input) {
    if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
        alert("이미지 크기가 10mb 를 넘습니다.");
        input.value = null;
    }
}


// 파일업로드 시 이미지만 받게함
 function chk_type(obj){
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



