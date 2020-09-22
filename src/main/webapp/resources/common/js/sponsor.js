//sns공유하기
$(function(){
	$('[data-toggle="popover"]').popover({
		container: $(this).attr('id'),
		placement: 'bottom',
		title: "공유하기",
		html: true,
		content: function() {
			var id = $(this).attr('data-id');
			var title = $(this).attr('data-title');
			var summary = $(this).attr('data-summary');
			
			var value = "";
			value += "<a href='javascript:snsGo(1, "+id+", \""+title+"\", \""+summary+"\");'><img src='resources/images/snsIcn/sns_naver.png' style='width:30px;' alt='네이버'></a>&nbsp;&nbsp;";
			value += "<a href='javascript:snsGo(2, "+id+", \""+title+"\", \""+summary+"\");'><img src='resources/images/snsIcn/sns_ka.png' style='width:30px' alt='카카오톡'></a>&nbsp;&nbsp;";
			value += "<a href='javascript:snsGo(3, "+id+", \""+title+"\", \""+summary+"\");'><img src='resources/images/snsIcn/sns_face.png' style='width:30px' alt='페이스북'></a>&nbsp;&nbsp;";
			value += "<a href='javascript:snsGo(4, "+id+", \""+title+"\", \""+summary+"\");'><img src='resources/images/snsIcn/sns_tw.png' style='width:30px' alt='트위터'></a><br>";
			value += "<a href='javascript:CopyUrlToClipboard("+id+");' class='urlcopy'>URL 복사</a>";
			return value;
		}
	});
});

//팝오버 범위 밖 클릭하면 닫기
$(document).on('click', function (e) {
    $('[data-toggle="popover"],[data-original-title]').each(function () {
        //the 'is' for buttons that trigger popups
        //the 'has' for icons within a button that triggers a popup
        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {                
            (($(this).popover('hide').data('bs.popover')||{}).inState||{}).click = false  // fix for BS 3.3.6
        }

    });
});

//url 복사
function CopyUrlToClipboard(num) {
	//window.document.location.href -> 현재 url정보 얻는 방법
	var obShareUrl = "http://127.0.0.1:9392/runningdog/sdetail.do?sNum=" + num + "&page=1";

	var t = document.createElement("textarea");
	document.body.appendChild(t);
	t.value = obShareUrl;
	t.select();
	document.execCommand('copy');
	document.body.removeChild(t);

	alert("URL이 클립보드에 복사되었습니다");
}

function snsGo(e, id, title, summary) {
	//var url = "http://127.0.0.1:9392/runningdog/sdetail.do?sNum=" + id + "&page=1";
//	var url = "http://127.0.0.1:9392/runningdog/";
	//$("meta[property='og\\:title']").attr("content", title );
    //$("meta[property='og\\:url']").attr("content", url );                    
    //$("meta[property='og\\:description']").attr("content", summary );
//    console.log(url + "\n" + title + "\n" + summary);
//	$('head').append('<meta property=og:url/>', url);
//	$('head').append(StringTool.format('<meta property="og:type" content="{0}" />', 'article'));
//	$('head').append(StringTool.format('<meta property="og:title" content="{0}" />', title));
//	$('head').append(StringTool.format('<meta property="og:summary" content="{0}" />', summary));
	
//	window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(url) + '&t=' + encodeURIComponent(title));
	
	var loc = "";
	
	switch(e) {
	case 1 : break; //네이버
	case 2 : break; //카카오톡
	case 3 : loc = 'http://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(url) + '&t=' + encodeURIComponent(title); break;
	case 4 : loc = 'http://www.twitter.com/intent/tweet?url=' + encodeURIComponent(url) + '&t=' + encodeURIComponent(title); break; //트위터
	}
	window.open(loc, '', 'width=400,height=400,left=600');
}

//sns공유하기 끝

//썸머노트 이미지 업로드
function sendFile(file, el) {
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data: form_data,
		type: "post",
		url: 'summer_image.ad',
		cache: false,
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(img_name) {
			$(el).summernote('editor.insertImage', img_name);
		}
	});
}

//금액 콤마
function addCommas(x) {
	x = x.replace(/[^0-9]/g,'');
	x = x.replace(/,/g,'');
	var pay = $("#amt").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}

//후원금액
function payOption(ele) {
	var ele = $(ele);
	var pay = $('#amt');
	
	if(ele.val() == "") {
		pay.attr('readonly', false);
		pay.val('');
	}else {
		pay.attr('readonly', true);
		pay.val(ele.val());
	}
}

//썸머노트 내용 빈칸 확인
$(function(){
	$("#editor").on('submit', function(e) {
		if ($('#summernote').summernote('isEmpty')) {
		  alert('내용을 입력해주세요');
		  e.preventDefault();
		}
	});
});

//(전체/선택) 삭제
function checkAll(){
	if($("input[name=checkAll]").is(":checked")){
		$("input[name=checkDel]").prop("checked", true);
	}else{
		$("input[name=checkDel]").prop("checked", false);
	}
}

function deleteAction(page){
	var page = page;
	var checkRow = "";
	$("input[name='checkDel']:checked").each(function(){
		checkRow = checkRow + $(this).val()+",";
	});
	checkRow = checkRow.substring(0, checkRow.lastIndexOf(","));
	
	if(checkRow == ""){
		alert("삭제할 대상을 선택하세요.");
		return false;
	}
	
	console.log("### checkRow => {"+checkRow+"}");
	
	if(confirm("삭제 하시겠습니까?"))
		location.href = "sdelete.ad?checkRow=" + checkRow + "&page=" + page;
}

$(function(){
	$("[name='seld']").on("click", function(){
		if($("select[name='selected'] option:selected").val().length == 0) {
			alert("분류를 선택해주세요");
			return false;
		}
	});
});	

//썸머노트때문에 리셋추가
function Refresh() {
	$('#summernote').summernote('reset');
	window.location.reload();
}

//파일삭제되면 파일첨부칸 열림
$(document).ready(function() {
	$('#showSelect').hide();
});

//ajax로 파일삭제
function showFileSelect(snum) {
	$.ajax({
		data: {snum},
		type: "post",
		url: 'sfileDel.ad',
		success: function(){
			console.log("파일 삭제 성공");
			
//			var editor = document.getElementById("editor");
//			var inof = document.getElementById("of");
//			var inrf = document.getElementById("rf");
//			
//			editor.removeChild(inof);
//			editor.removeChild(inrf);
//			
//			editor.addChild('<input type="hidden" value="null" name="sRename">');
//			editor.addChild('<input type="hidden" value="null" name="sOriginal">');
			
			$("input[name=sOriginal]").attr("value", "null");
			$("input[name=sOriginal]").attr("value", "null");
		},
		error : function(reqest, status, errorData){
			console.log("error code : " + request.status
					+ "\nMessage : " + request.responseText
					+ "\nError : " + errorData);
		}
	});
	
	var files = document.getElementById("file");
	var originalFile = document.getElementById("ofile");
	files.removeChild(originalFile);
	$('#showSelect').show();
	
}

//기부금 영수증
$(function(){
	$('#spnum').hide();
	$("#yes").on("click", function(){
		$("#spnum").show();
		$('#no').removeClass('active');
		$('#yes').addClass('active');
	});
	$("#no").on("click", function(){
		$("#spnum").hide();
		$('#yes').removeClass('active');
		$('#no').addClass('active');
	});
});

//개인 or 사업자
$(function(){
	$("#per").on("click", function(){
		$('#peer').removeClass('active');
		$('#per').addClass('active');
	});
	$("#peer").on("click", function(){
		$('#per').removeClass('active');
		$('#peer').addClass('active');
	});
});

//이메일 & 전화 수신 동의 여부 & 결제방법
$(function(){
	$("input[name=spEch]").is(":checked").each(function(){
		$("input[name=spEch]").attr("value", $(this).attr("id"));
	});
});

//주민번호 유효성 검사
function aaa() {
	var jumins3 = $("#jumin1").val() + $("#jumin2").val();
	
	var fmt = RegExp(/^\d{6}[1234]\d{6}$/);
	var buf = new Array(13);
	
	if(!fmt.test(jumins3)) {
		alert("주민등록번호 형식에 맞게 입력해주세요");
		$("#jumin1").focus();
		return false;
	}
	
	for(var i=0; i<buf.length; i++) {
		buf[i] = parseInt(jumins3.charAt(i));
	}
	
	var multipliers = [2,3,4,5,6,7,8,9,2,3,4,5];
	var sum = 0;
	
	for(var i=0; i<12; i++) {
		sum += (buf[i] *= multipliers[i]);
	}
	
	if((11 - (sum % 11)) % 10 != buf[12]) {
		alert("잘못된 주민등록번호입니다.");
		return false;
	}else {
		$("#re").attr("value", "y");
		$("input[name=spSnumber]").attr("value", $("#jumin1").val() +"-"+ $("#jumin2").val());
		alert("올바른 주민등록번호입니다.");
		return false;
	}	
}

$(function(){
	$("#sub").on("click", function(){
		if($("#jumin2").val() != "" && $("#re").val() == "n") {
			alert("주민등록번호 확인을 눌러주세요.");
			$("re").focus();
			return false;
		}
	});
});




