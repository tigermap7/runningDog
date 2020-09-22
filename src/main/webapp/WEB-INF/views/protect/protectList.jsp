<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="listCount"  value="${ requestScope.listCount }"/>
<c:set var="startPage"  value="${ requestScope.startPage }"/>
<c:set var="endPage"  value="${ requestScope.endPage }"/>
<c:set var="maxPage"  value="${ requestScope.maxPage }"/>
<c:set var="currentPage"  value="${ requestScope.currentPage }"/>
<!DOCTYPE html>
<html lang="ko">
	<head>
        <c:import url="/WEB-INF/views/include/head.jsp"/>
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
                                <li class="xi-angle-right"><a href="#none">보호센터 정보</a></li>
                            </ul>
                        </div>
                        <h2><span>보호센터 정보</span></h2>
                        <h3>지역 안의 보호센터의<br/>위치와 정보를 알려드립니다.</h3>
                    </div>
                </div>
                <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--서브 검색-->                
                        <div class="search_wrap">
                            <form action="" name="">
                            <select>
                                <option value="0" class="fontColor-dark">전체보기</option>
                                <option value="1" class="fontColor-dark">강남구</option>
                                <option value="2" class="fontColor-dark">강동구</option>
                                <option value="3" class="fontColor-dark">강북구</option>
                                <option value="4" class="fontColor-dark">강서구</option>
                                <option value="5" class="fontColor-dark">관악구</option>
                                <option value="6" class="fontColor-dark">광진구</option>
                                <option value="7" class="fontColor-dark">구로구</option>
                                <option value="8" class="fontColor-dark">금천구</option>
                                <option value="9" class="fontColor-dark">노원구</option>
                                <option value="10" class="fontColor-dark">도봉구</option>
                                <option value="11" class="fontColor-dark">동대문구</option>
                                <option value="12" class="fontColor-dark">동작구</option>
                                <option value="13" class="fontColor-dark">마포구</option>
                                <option value="14" class="fontColor-dark">서대문구</option>
                                <option value="15" class="fontColor-dark">서초구</option>
                                <option value="16" class="fontColor-dark">성동구</option>
                                <option value="17" class="fontColor-dark">성북구</option>
                                <option value="18" class="fontColor-dark">송파구</option>
                                <option value="19" class="fontColor-dark">양천구</option>
                                <option value="20" class="fontColor-dark">영등포구</option>
                                <option value="21" class="fontColor-dark">용산구</option>
                                <option value="22" class="fontColor-dark">은평구</option>
                                <option value="23" class="fontColor-dark">종로구</option>
                                <option value="24" class="fontColor-dark">중구</option>
                                <option value="25" class="fontColor-dark">중랑구</option>
                                
                            </select>
                            <div class="search-box">
                                <input type="text" placeholder="원하시는 지역을 검색해주세요.">
                                <button onclick="none" class="xi-search"></button>
                            </div>
                            </form>
                        </div>
                        <!--서브 검색 끝-->
                        
                        <div class="sort-area">  
                            <h4 id="totalcount">개</h4>
                            <div>
                                <div>
                                <form action="" name="">
                                    <a class="active" href="#none">전체</a>
                                </form>
                                </div>
                            </div>
                        </div>

                        
                        <!--리스트-->
                        <table id="plist" class="servicelList">
                            <colgroup>
                                <col width="20%">
                                <col width="*">
                                <col width="20%">
                            </colgroup>
                            <tbody>
                                
                            </tbody>
                        </table>
                        <!-- 리스트 끝 -->
                    
                        <!-- 페이징 -->
                        <c:if test="${listCount > 0}">
                        <dl class="list-paging">
                            <dd>
                            <c:if test="${currentPage <= 1 }">
                                <a><i class="xi-angle-left"></i></a>
                            </c:if>
                            <c:if test="${currentPage > 1}">
                            	<c:url var="sl" value="movePlist.do">
                               		<c:param name="page" value="1"/>
                                </c:url>
                                 <a href="${sl}"><i class="xi-angle-left"></i></a>
                            </c:if>
                            	<!-- 이전그룹으로 이동처리 -->
                            <c:if test="${currentPage > 10 }">
                            	<c:if test="${(currentPage -10) < startPage && (currentPage -10) }">
                                <c:url var="slbefore" value="movePlist.do">
                                	<c:param name="page" value="${startPage - 10}"/>
                                </c:url>
                                  <a href="${slbefore}"><i class="xi-angle-left"></i></a>
                                </c:if>
                             </c:if>
                             	<!-- 현재 페이지가 속한 페이지 그룹의 숫자 출력 처리 -->
                           <c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
                              <c:if test="${p eq currentPage }">
                              		<a class="active">${ p }</a>
                              </c:if>	
                              <c:if test="${p ne currentPage }">
                              		<c:url var="slp" value="movePlist.do">
                              			<c:param name="page" value="${p}"/>
                              		</c:url>
                              		   <a href="${slp}">${p}</a>
                              </c:if>
                           </c:forEach>
                             <!-- 다음그룹으로 이동처리 -->
                            <c:if test="${currentPage > 10 }">
                            	<c:if test="${(currentPage +10) > endPage &&(currentPage + 10) < maxPage }">
                                <c:url var="slafter" value="movePlist.do">
                                	<c:param name="page" value="${ endPage +10 }"/>
                                </c:url>
                                  <a href="${slafter}"><i class="xi-angle-right"></i></a>
                                </c:if>
                             </c:if>
                             <!-- 맨끝 페이지로 이동처리 -->
                             <c:if test="${currentPage >= maxPage }">
                                <a><i class="xi-angle-right"></i></a>
                            </c:if>
                            <c:if test="${currentPage < maxPage}">
                            	<c:url var="sl2" value="movePlist.do">
                               		<c:param name="page" value="${maxPage }"/>
                                </c:url>
                                 <a href="${sl2}"><i class="xi-angle-right"></i></a>
                            </c:if>
                            </dd>
                        </dl>
                        </c:if>
                     <c:if test="${listCount < 0 and listCount eq 0}">
                        <tr class="list-no">
							<td colspan="7">
								<p><img src="/runningdog/resources/images/btnIcn/icn_big_listNo.png" alt="" title="" /></p>
								<h1>목록이 없습니다.</h1>
							</td>
						</tr>
                    </c:if>
                        <!-- //페이징 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
		
		<!-- ajax로 JSON객체 가져오기 -->
<script type="text/javascript">
$(function(){
	var currentPage = <c:out value="${currentPage}"/>
	console.log(currentPage)
	$.ajax({
		url : "plist.do",
		type : "get",
		data : {currentPage : currentPage},
		dataType: "json",
		success : function(data){
			console.log("success:성공");
			
			var jsonStr = JSON.stringify(data);
			var json = JSON.parse(jsonStr);
			var totalcount = (json.list).length;
			var values = "";
			$("#totalcount").text('전체 :' +totalcount +"개");
			console.log((json.list).length);
			for(var i in json.list){
				values += 
	            "<tr class='serviceOn' onclick=movePdetail('"+json.list[i].careNm +"')>"
                +"<td class='img'>"
                  +"<img src='/runningdog/resources/images/test/animalNews04.jpg'>"
                +"</td>"
                +"<td>"
                    +"<h3>"+decodeURIComponent(json.list[i].careNm).replace(/\+/gi, "  ")+"</h3>"
                    +"<ul>"
                        +"<li class='location'><span>관할구역 : </span>"+decodeURIComponent(json.list[i].orgNm).replace(/\+/gi, "  ")+"</li>"
                        +"<li><span>동물보호센터유형 : </span>" + decodeURIComponent(json.list[i].divisionNm).replace(/\+/gi, "  ") + "</li>"
                    +"</ul>"
                +"</td>"
                +"<td><a href='movePdetail.do?careNm=json.list[i].careNm'>자세히 보기 <i class='xi-eye-o'></i></a></td>"
            +"</tr>" } //for in
            
   
            $('#plist > tbody').html(values); 
            },
            error : function(jqXHR, textstatus, errorthrown) {
               console.log("error : " + jqXHR + ", " + textstatus
                     + ", " + errorthrown); 
		}
	});//ajax
	
});//document.ready

function movePdetail(careNm){
  console.log("클릭성공: " +careNm);
	location.href="movePdetail.do?careNm="+careNm;
}

</script> 
		
	</body>
</html>