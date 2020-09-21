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
    <c:import url="/WEB-INF/views/admin/include/admin_head.jsp"/>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <c:import url="/WEB-INF/views/admin/include/admin_header.jsp"/>

        <div id="container">
            <c:import url="/WEB-INF/views/admin/include/admin_util.jsp"/>

            <!-- 상단 타이틀 -->
            <div class="pageTitle">
                <div class="adminPath">
                    <h3>자원봉사모집 관리</h3>
                    <h2>리스트</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->
            
<script type="text/javascript">
//검색 분류 선택 확인
$(function(){
   $("[name='sel']").on("click", function(){
      if($("select[name='type'] option:selected").val().length == 0) {
         alert("분류를 선택해주세요");
         return false;
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

function deleteAction(){
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
		location.href = "vdelete.ad?checkRow=" + checkRow ;
}
</script>
            <!-- 본문내용 -->
            <div class="list_wrap">
                <!-- 검색영역 -->
                <div class="sort-area">  
                    <h4>전체 ${listCount}개</h4>
                    <form action="vlist.ad" method="get" id="">
                    <div class="searchBox">
                        <select name="type" class="ListSelect">
                                <option value="" selected disabled>전체</option>
                                 <option value="address">지역</option>
                                <option value="term">봉사기간(월)</option>
                        </select>
                        <div>
                            <input type="text" name="keyword" placeholder="검색어를 입력해주세요.">
                            <button type="submit" name="sel" class="top-search"><i class="xi-search"></i></button>
                        </div>
                    </div>
                    </form>
                </div>
                <!-- 검색영역 끝 -->
                <table class="list">
                    <colgroup>
                        <col width="5%">
                        <col width="5%">
                        <col width="8%">
                        <col width="8%">
                        <col width="*">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>전체 &nbsp;&nbsp;<input type="checkbox" name="checkAll" onclick="checkAll();"></th>
                            <th>번호</th>
                            <th>모집상태</th>
                            <th>썸네일</th>
                            <!-- <th>지역</th> -->
                            <th>제목</th>
                            <th>센터명</th>
                            <th>등록일</th>
                        </tr>
                        <tr>
                        </tr>
                        <tr class="hr">
                            <th colspan="8"></th>
                        </tr>
                    </thead>
                    <tbody>
                     <c:forEach var="v" items="${requestScope.list}">
                     		<c:url var="vd" value="vdetail.ad">
                                  	 		<c:param name="volno" value="${v.volno}"/>
                                  	 		<c:param name="page" value="${currentPage}"/>
                            </c:url>
                        <tr>
                            <td><input type="checkbox" name="checkDel" id="" value="${v.volno }"></td>
                            <td class="number" onclick="location.href='${vd}'">${v.volno}</td>
                            <c:if test="${ v.volche eq'Y'}">
                            <td class="kinds" onclick="location.href='${vd}'"><span class="protect">상시모집</span></td>
                            </c:if>
                             <c:if test="${ v.volche eq'N'}">
                            <td class="kinds" onclick="location.href='${vd}'"><span class="protect">모집완료</span></td>
                            </c:if>
                            <td class="thumbnail" onclick="location.href=''">
                            <c:if test="${ empty v.volre1 }">
                            	<img src="/runningdog/resources/images/test/animalNews04.jpg">
                            </c:if>
                            <c:if test="${ !empty v.volre1 }">
                            	<img src="/runningdog/resources/vfiles/${v.volre1}">
                            </c:if>
                            </td>
                            <%-- <td class="location" onclick="location.href='${vd}'">${v.voladdress}</td> --%>
                            <td class="title" onclick="location.href='${vd}'">${ v.voltitle }</td>
                            <td class="name" onclick="location.href='${vd}'">${v.volname}</td>
                            <td class="date" onclick="location.href='${vd}'">${v.voldate}</td>
                        </tr>
                     </c:forEach>
                    </tbody>
                </table>
                <p class="warning_text"> *삭제된 게시물은 되돌릴 수 없습니다. 신중하게 선택해주세요.</p>
                <!-- //게시판 -->

                <!-- 버튼 -->
                <div class="list-btn">
                    <button type="button" id="" class="btn-left chkBtn" onclick="deleteAction();"><i class="xi-cut"></i> 선택삭제</button>
                   <!--  <button type="button" id="" class="btn-right writeBtn" onclick="location='serviceWrite.jsp'"><i class="xi-pen-o"></i> 글작성</button> -->
                </div>
                <!-- //버튼 -->

                <!-- 페이징 -->
                <c:if test="${listCount > 0}">
                        <dl class="list-paging">
                            <dd>
                            <c:if test="${currentPage <= 1 }">
                                <a><i class="xi-angle-left"></i></a>
                            </c:if>
                            <c:if test="${currentPage > 1}">
                            	<c:url var="sl" value="vlist.ad">
                               		<c:param name="page" value="1"/>
                                </c:url>
                                 <a href="${sl}"><i class="xi-angle-left"></i></a>
                            </c:if>
                            	<!-- 이전그룹으로 이동처리 -->
                            <c:if test="${currentPage > 10 }">
                            	<c:if test="${(currentPage -10) < startPage && (currentPage -10) }">
                                <c:url var="slbefore" value="vlist.ad">
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
                              		<c:url var="slp" value="vlist.ad">
                              			<c:param name="page" value="${p}"/>
                              		</c:url>
                              		   <a href="${slp}">${p}</a>
                              </c:if>
                           </c:forEach>
                             <!-- 다음그룹으로 이동처리 -->
                            <c:if test="${currentPage > 10 }">
                            	<c:if test="${(currentPage +10) > endPage &&(currentPage + 10) < maxPage }">
                                <c:url var="slafter" value="vlist.ad">
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
                            	<c:url var="sl2" value="vlist.ad">
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
        <c:import url="/WEB-INF/views/admin/include/admin_footer.jsp"/>
    </div>
</body>
</html>