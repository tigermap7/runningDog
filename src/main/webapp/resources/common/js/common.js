$(document).ready(function() {
	$('.menuAll > ul > li.menuAll_close').on('click',function(){
		$('#header').removeClass('active');
		$('.menuAll').slideUp(200);
		$('.menuAll').removeClass('on');
	});
	$('.menuBtn').on('click',function(){
		if($(this).hasClass('on')){

			$(this).removeClass('on');
			$('#header').removeClass('active');
			$('.menuAll').slideUp(200);
			$('.menuAll').removeClass('on');
		}else{
			$(this).addClass('on');
			$('#header').addClass('active');
			$('.menuAll').slideDown(200);
			$('.menuAll').addClass('on');
		}
	});
	$(window).on('scroll',function(){
		if($(this).scrollTop() > 10){
			$('#header').addClass('on');
			$('#mHeader').addClass('on');
		}else{
			$('#header').removeClass('on');
			$('#mHeader').removeClass('on');
		}
	});    
});




// $(document).ready(function() {
// 	// 모바일 토탈메뉴 //
// 	var mobileLnbChk = 0;
// 	$('#M_mobileLnbOpen').click(function(){ 
// 		if (mobileLnbChk == 0) {
// 			$('#header-mobile > .gnbTotal').animate({ marginLeft : '0' }, 350, 'easeOutQuad');
//         $('body').css("position", "fixed");
// 			mobileLnbChk = 1;
// 		} else {
// 			$('#header-mobile > .gnbTotal').animate({ marginLeft : '-250px' }, 350, 'easeOutQuad');
//         $('body').css("position", "static");
// 			mobileLnbChk = 0;
// 		}
// 	});
// 	$('#mobileLnbClose').click(function(){ 
// 		$('#header-mobile > .gnbTotal').animate({ marginLeft : '-250px' }, 350, 'easeOutQuad');
//         $('body').css("position", "static");
// 		mobileLnbChk = 0;
// 	});

// });


// //모바일메뉴 배경커버
// $(document).ready(function() {
//     function wrapWindowByMask(){
//         //화면의 높이와 너비를 구한다.
//         var maskHeight = $(document).height();  
//         var maskWidth = $(window).width();  
// 	    var mobileLnbChk = 0;

//         //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
//         $('#mobile_cover').css({'width':maskWidth,'height':maskHeight});  

//         //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 70% 불투명도로 간다.
//         $('#mobile_cover').fadeIn(500);      
//         //$('#mask').fadeTo("slow",0.7);    

//         //윈도우 같은 거 띄운다.
//         //$('.mobileLnbClose').show();
//     }

//     $(document).ready(function(){
//         //검은 막 띄우기
//         $('.openMask').click(function(e){
//             e.preventDefault();
//             wrapWindowByMask();
//         });

//         //닫기 버튼을 눌렀을 때
//         $('#mobileLnbClose').click(function (e) {  
//             //링크 기본동작은 작동하지 않도록 한다.
//             e.preventDefault();  
//             $('#mobile_cover').hide();  
//         });       

//         //검은 막을 눌렀을 때
// //        $('#mobile_cover').click(function () {
// //            $(this).hide();
// //            
// //        });
//     }); 
    
// });



// 서브 비주얼 //
$(document).ready(function() {
	$(".animal-vagas").vegas({
    slides: [
			{ src: "/runningdog/resources/images/content/animalBg01.jpg" },
			{ src: "/runningdog/resources/images/content/animalBg01.jpg" }
		],
		//animation: 'kenburns',
		animation: 'random',
		delay: 7000,
		overlay: '/runningdog/images/btnIcn/overlay_01.png'
	});

});

$(document).ready(function() {
	//지그재그 레이아웃
	// external js: masonry.pkgd.js, imagesloaded.pkgd.js
	// init Masonry
	var grid = document.querySelector('.grid');

	var msnry = new Masonry( grid, {
	itemSelector: '.grid-item',
	columnWidth: '.grid-sizer',
	percentPosition: true
	});

	imagesLoaded( grid ).on( 'progress', function() {
	// layout Masonry after each image loads
	msnry.layout();
	});

});

$(function() {
	//탑버튼
	$('#topRollBtn').fadeOut();
	$(window).scroll(function() {
		if ($(this).scrollTop() > 150) {
			$('#topRollBtn').fadeIn();
		} else {
			$('#topRollBtn').fadeOut();
		}
	});
	
	$("#topRollBtn").click(function() {
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return false;
	});
});