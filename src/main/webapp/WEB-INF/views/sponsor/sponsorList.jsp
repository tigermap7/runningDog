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
			}
			
			.urlcopy:hover {
			    color: #fff;
			    background-color: #fb3860;
			    border: 1px solid #fb3860;
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
						value += "<a href='#'><img src='resources/images/snsIcn/sns_naver.png' style='width:30px; margin:20'></a>&nbsp;&nbsp;";
						value += "<a href='#'><img src='resources/images/snsIcn/sns_ka.png' style='width:30px'></a>&nbsp;&nbsp;";
						value += "<a href='#'><img src='resources/images/snsIcn/sns_face.png' style='width:30px'></a>&nbsp;&nbsp;";
						value += "<a href='#'><img src='resources/images/snsIcn/sns_tw.png' style='width:30px'></a><br>";
						value += "<a href='#' class='urlcopy'>URL 복사</a>";
					return value;
				}
			});
		});
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
                                        <a data-placement="bottom" data-toggle="popover" 
                                        	class="urlIcon xi-share-alt-o" id="popover"></a>
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