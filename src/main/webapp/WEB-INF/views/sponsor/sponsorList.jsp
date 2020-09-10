<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<c:import url="/WEB-INF/views/include/head.jsp"/>
		
		<style type="text/css">
		
			.popover {
			  text-align: center;
			  text-decoration: none;
			  padding: 0px 0px 9px;
			}
			
			.urlcopy {
				border: 1px solid #ff869c;
				font-size: 15px;
				position: relative;
				top: 9px;
				color: #ff869c;
				padding: 3px 5px;
				display: block;
			    z-index: 1;
			    text-decoration: none;
			}
			
			.urlcopy:hover {
			    color: #fff;
			    background-color: #fb3860;
			    border: 1px solid #fb3860;
			    text-decoration: none;
			}
			
		</style>
		
		<script type="text/javascript">
		$(function(){
			$('[data-toggle="popover"]').popover({
				container: 'body',
				title: "공유하기", 
				html: true,
				content: function() {
					var value = "";
						value += "<a href='javascript:snsGo(1);'><img src='resources/images/snsIcn/sns_naver.png' style='width:30px; margin:20' alt='네이버'></a>&nbsp;&nbsp;";
						value += "<a href='javascript:snsGo(2);'><img src='resources/images/snsIcn/sns_ka.png' style='width:30px' alt='카카오톡'></a>&nbsp;&nbsp;";
						value += "<a href='javascript:snsGo(3);'><img src='resources/images/snsIcn/sns_face.png' style='width:30px' alt='페이스북'></a>&nbsp;&nbsp;";
						value += "<a href='javascript:snsGo(4);'><img src='resources/images/snsIcn/sns_tw.png' style='width:30px' alt='트위터'></a><br>";
						value += "<a href='javascript:CopyUrlToClipboard(2);' class='urlcopy'>URL 복사</a>";
					return value;
				}
			});
		});
		
		$(document).on('click', function (e) {
		    $('[data-toggle="popover"],[data-original-title]').each(function () {
		        //the 'is' for buttons that trigger popups
		        //the 'has' for icons within a button that triggers a popup
		        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {                
		            (($(this).popover('hide').data('bs.popover')||{}).inState||{}).click = false  // fix for BS 3.3.6
		        }

		    });
		});
		
		function CopyUrlToClipboard(num) {
			//window.document.location.href 현재 url정보 얻는 방법
			var obShareUrl = "http://127.0.0.1:9392/runningdog/sdetail.do?sNum=" + num;
			/* obShareUrl.select();
			document.execCommand("copy");
			obShareUrl.blur(); */ //수정!!!!!!!!!!!!!!!!!!!1
			alert("URL이 클립보드에 복사되었습니다\n" + obShareUrl);
		}
		
		function snsGo(e) {
			
			//작업중!!!!!!!!!!!!!!!!!
			switch(e) {
			case 1 : break;
			case 2 : break;
			case 3 : break;
			case 4 : break;
			}
		}
		
		</script>
		
        
	</head>
	<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<div id="wrap">
            <c:import url="/WEB-INF/views/include/header.jsp"/>
			<!-- 컨텐츠 -->
			<div id="content">
			    <!--서브 비주얼/타이틀-->
                <div class="visual-sub-vagas animal-vagas">
                    <div class="vsv-copy sub-title">
                       <div>
                            <ul class="navi">
                                <li><a href="main.do">홈</a></li>
                                <li class="xi-angle-right"><a href="slist.do">후원하기</a></li>
                            </ul>
                        </div>
                        <h2><span>후원하기</span></h2>
                        <h3>여러분의 따뜻한 손길로<br/>작은 생명에게 새 삶을 찾아주세요.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="../include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--서브 검색-->                
                        <div class="search_wrap">
                            <form action="" name="">
                            <select>
                                <option value="" class="fontColor-dark">제목</option>
                            </select>
                            <div class="search-box">
                                <input type="text" placeholder="제목을 검색해주세요.">
                                <button onclick="#none" class="xi-search"></button>
                            </div>
                            </form>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4>전체 150개의 '따뜻한 손길'</h4>
                            <div>
                                <!-- <a href="sponsorWrite.jsp" class="writeBtn">글쓰기</a> -->
                                <div>
                                <form action="" name="">
                                    <a class="active" href="#none">전체</a>
                                    <a href="#none">후원중</a>
                                    <a href="#none">후원완료</a>
                                </form>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 공유하기 popover -->
						
					<!--리스트-->
                        <div class="sponsorList">
                            <ul>
                                <li>
                                    <div>
                                        <a href="sdetail.do" class="chooseIcon">후원중</a>
                                        <a data-placement="bottom" data-toggle="popover" class="urlIcon xi-share-alt-o"></a>
									<a href="sdetail.do"><img src="resources/images/test/test01.jfif"></a>
                                    </div>
                                    <h3 onclick="location='sdetail.do'">이 작은 아이가 살아갈 수 있게 도와주세요.</h3>
                                    <p onclick="location='sdetail.do'">
                                        이 작은 몸으로 유기되어 며칠을 굶었는지 모를만큼 건강이 악화된 아이가 있어요. 여러분의 따뜻한 손길이 필요합니다.<br/>
                                    </p>
                                    <span class="sponsorBtn">
                                        <a href="sdetail.do">자세히보기</a>
                                        <a href="spay.do">후원하기</a>
                                    </span>
                                </li>
                                <li onclick="location='sdetail.do'">
                                    <div>
                                        <a href="#none" class="chooseIcon">후원중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="resources/images/test/test01.jfif">
                                    </div>
                                    <h3>이 작은 아이가 살아갈 수 있게 도와주세요.</h3>
                                    <p>
                                        이 작은 몸으로 유기되어 며칠을 굶었는지 모를만큼 건강이 악화된 아이가 있어요. 여러분의 따뜻한 손길이 필요합니다.<br/>
                                    </p>
                                    <span class="sponsorBtn">
                                        <a href="sdetail.do">자세히보기</a>
                                        <a href="spay.do">후원하기</a>
                                    </span>
                                </li>
                                <li onclick="location='sdetail.do'">
                                    <div>
                                        <a href="#none" class="chooseIcon">후원중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="resources/images/test/test01.jfif">
                                    </div>
                                    <h3>이 작은 아이가 살아갈 수 있게 도와주세요.</h3>
                                    <p>
                                        이 작은 몸으로 유기되어 며칠을 굶었는지 모를만큼 건강이 악화된 아이가 있어요. 여러분의 따뜻한 손길이 필요합니다.<br/>
                                    </p>
                                    <span class="sponsorBtn">
                                        <a href="sdetail.do">자세히보기</a>
                                        <a href="spay.do">후원하기</a>
                                    </span>
                                </li>
                                <li onclick="location='sdetail.do'">
                                    <div>
                                        <a href="#none" class="chooseIcon">후원중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="resources/images/test/test01.jfif">
                                    </div>
                                    <h3>이 작은 아이가 살아갈 수 있게 도와주세요.</h3>
                                    <p>
                                        이 작은 몸으로 유기되어 며칠을 굶었는지 모를만큼 건강이 악화된 아이가 있어요. 여러분의 따뜻한 손길이 필요합니다.<br/>
                                    </p>
                                    <span class="sponsorBtn">
                                        <a href="sdetail.do">자세히보기</a>
                                        <a href="spay.do">후원하기</a>
                                    </span>
                                </li>
                                <li onclick="location='sdetail.do'">
                                    <div>
                                        <a href="#none" class="chooseIcon">후원중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="resources/images/test/test01.jfif">
                                    </div>
                                    <h3>이 작은 아이가 살아갈 수 있게 도와주세요.</h3>
                                    <p>
                                        이 작은 몸으로 유기되어 며칠을 굶었는지 모를만큼 건강이 악화된 아이가 있어요. 여러분의 따뜻한 손길이 필요합니다.<br/>
                                    </p>
                                    <span class="sponsorBtn">
                                        <a href="sdetail.do">자세히보기</a>
                                        <a href="spay.do">후원하기</a>
                                    </span>
                                </li>
                                <li onclick="location='sdetail.do'">
                                    <div>
                                        <a href="#none" class="chooseIcon">후원중</a>
                                        <a href="#none" class="urlIcon xi-share-alt-o"></a>
                                        <img src="resources/images/test/test01.jfif">
                                    </div>
                                    <h3>이 작은 아이가 살아갈 수 있게 도와주세요.</h3>
                                    <p>
                                        이 작은 몸으로 유기되어 며칠을 굶었는지 모를만큼 건강이 악화된 아이가 있어요. 여러분의 따뜻한 손길이 필요합니다.<br/>
                                    </p>
                                    <span class="sponsorBtn">
                                        <a href="sdetail.do">자세히보기</a>
                                        <a href="spay.do">후원하기</a>
                                    </span>
                                </li>
                            </ul>
                        </div>
                        <!-- 리스트 끝 -->
                    
                        <!-- 페이징 -->
                        <dl class="list-paging">
                            <dd>
                                <a href="#none"><i class="xi-angle-left"></i></a>
                                <a href="#none" class="active">1</a>
                                <a href="#none">2</a>
                                <a href="#none">3</a>
                                <a href="#none">4</a>
                                <a href="#none">5</a>
                                <a href="#none"><i class="xi-angle-right"></i></a>
                            </dd>
                        </dl>
                        <!-- //페이징 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>