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
	var url = "http://127.0.0.1:9392/runningdog/sdetail.do?sNum=" + id + "&page=1";
	var title = title;
	var summary = summary;
	
//	$("meta[property='og\\:title']").attr("content", title );
//    $("meta[property='og\\:url']").attr("content", url );                    
//    $("meta[property='og\\:description']").attr("content", summary );
//    console.log(url + "\n" + title + "\n" + summary);
//	$('head').append( StringTool.format('<meta property="og:url" content="{0}" />', url) );
//	$('head').append(StringTool.format('<meta property="og:type" content="{0}" />', 'article'));
//	$('head').append(StringTool.format('<meta property="og:title" content="{0}" />', title));
//	$('head').append(StringTool.format('<meta property="og:summary" content="{0}" />', summary));
	
//	window.open('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(url) + '&t=' + encodeURIComponent(title));
	
	var loc = "";
//	var href = "http://127.0.0.1:9392/runningdog/sdetail.do?sNum=" + thid + "&page=1";
//
	url = encodeURIComponent(url);
//	tit = encodeURIComponent(tit);
//	
//	console.log(tit + "\n" + href);
	
	switch(e) {
	case 1 : break; //네이버
	case 2 : break; //카카오톡
	case 3 : loc = 'http://www.facebook.com/sharer/sharer.php?u=' + url + '&t=' + title; break; //페이스북
	case 4 : break; //트위터
	}
	window.open(loc, '', 'width=400,height=400,left=600');
}

//sns공유하기 끝

//썸머노트 이미지 업로드
function sendFile(file, el) {
	console.log("파일업로드 함수 작동");
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
			console.log("파일업로드명 받아오기");
			$(el).summernote('editor.insertImage', img_name);
		}
	});
}

//금액 콤마
function addCommas(x) {
	x = x.replace(/[^0-9]/g,'');
	x = x.replace(/,/g,'');
	$("#amt").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));
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





