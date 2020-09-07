<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="../include/admin_head.jsp"/>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
    <div id="wrap">
        <c:import url="../include/admin_header.jsp"/>

        <div id="container">
            <c:import url="../include/admin_util.jsp"/>

            <!-- 상단 타이틀 -->
            <div class="pageTitle">
                <div class="adminPath">
                    <h3>자원봉사모집 관리</h3>
                    <h2>| 리스트</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="list_wrap">
                <!-- 검색영역 -->
                <div class="sort-area">  
                    <h4>전체 게시물 100개</h4>
                    <form action="" method="get" id="">
                    <div class="searchBox">
                        <select name="search" class="ListSelect">
                                <option value="" elected="selected">전체</option>
                                <option value="">제목</option>
                                <option value="">임시보호자</option>
                                <option value="">발견날짜</option>
                                <option value="">발견지역</option>
                        </select>
                        <div>
                            <input type="text" name="keyword" placeholder="검색어를 입력해주세요.">
                            <button type="submit" class="top-search"><i class="xi-search"></i></button>
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
                            <th>선택</th>
                            <th>번호</th>
                            <th>분류</th>
                            <th>썸네일</th>
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
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='serviceView.jsp'">6</td>
                            <td class="kinds" onclick="location='serviceView.jsp'"><span class="protect">모집중</span></td>
                            <td class="thumbnail" onclick="location='serviceView.jsp'"><img src="/runningdog/../resources/images/test/animalNews04.jpg"></td>
                            <td class="title" onclick="location='serviceView.jsp'">작은 생명을 위한 도움의 손길이 필요합니다.</td>
                            <td class="name" onclick="location='serviceView.jsp'">조남동 센터</td>
                            <td class="date" onclick="location='serviceView.jsp'">2020.09.01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='serviceView.jsp'">5</td>
                            <td class="kinds" onclick="location='serviceView.jsp'"><span class="protect">모집중</span></td>
                            <td class="thumbnail" onclick="location='serviceView.jsp'"><img src="/runningdog/../resources/images/test/animalNews04.jpg"></td>
                            <td class="title" onclick="location='serviceView.jsp'">작은 생명을 위한 도움의 손길이 필요합니다.</td>
                            <td class="name" onclick="location='serviceView.jsp'">조남동 센터</td>
                            <td class="date" onclick="location='serviceView.jsp'">2020.09.01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='serviceView.jsp'">4</td>
                            <td class="kinds" onclick="location='serviceView.jsp'"><span class="protect">모집중</span></td>
                            <td class="thumbnail" onclick="location='serviceView.jsp'"><img src="/runningdog/../resources/images/test/animalNews04.jpg"></td>
                            <td class="title" onclick="location='serviceView.jsp'">작은 생명을 위한 도움의 손길이 필요합니다.</td>
                            <td class="name" onclick="location='serviceView.jsp'">조남동 센터</td>
                            <td class="date" onclick="location='serviceView.jsp'">2020.09.01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='serviceView.jsp'">3</td>
                            <td class="kinds" onclick="location='serviceView.jsp'"><span class="protect">모집중</span></td>
                            <td class="thumbnail" onclick="location='serviceView.jsp'"><img src="/runningdog/../resources/images/test/animalNews04.jpg"></td>
                            <td class="title" onclick="location='serviceView.jsp'">작은 생명을 위한 도움의 손길이 필요합니다.</td>
                            <td class="name" onclick="location='serviceView.jsp'">조남동 센터</td>
                            <td class="date" onclick="location='serviceView.jsp'">2020.09.01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='serviceView.jsp'">2</td>
                            <td class="kinds" onclick="location='serviceView.jsp'"><span class="complete">모집완료</span></td>
                            <td class="thumbnail" onclick="location='serviceView.jsp'"><img src="/runningdog/../resources/images/test/animalNews04.jpg"></td>
                            <td class="title" onclick="location='serviceView.jsp'">작은 생명을 위한 도움의 손길이 필요합니다.</td>
                            <td class="name" onclick="location='serviceView.jsp'">조남동 센터</td>
                            <td class="date" onclick="location='serviceView.jsp'">2020.09.01</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='serviceView.jsp'">1</td>
                            <td class="kinds" onclick="location='serviceView.jsp'"><span class="complete">모집완료</span></td>
                            <td class="thumbnail" onclick="location='serviceView.jsp'"><img src="/runningdog/../resources/images/test/animalNews04.jpg"></td>
                            <td class="title" onclick="location='serviceView.jsp'">작은 생명을 위한 도움의 손길이 필요합니다.</td>
                            <td class="name" onclick="location='serviceView.jsp'">조남동 센터</td>
                            <td class="date" onclick="location='serviceView.jsp'">2020.09.01</td>
                        </tr>
						<tr class="list-no">
							<td colspan="7">
								<p><img src="/WEB-INF/resources/images/btnIcn/icn_big_listNo.png" alt="" title="" /></p>
								<h1>목록이 없습니다.</h1>
							</td>
						</tr>
                    </tbody>
                </table>
                <p class="warning_text"> *삭제된 게시물은 되돌릴 수 없습니다. 신중하게 선택해주세요.</p>
                <!-- //게시판 -->

                <!-- 버튼 -->
                <div class="list-btn">
                    <button type="button" id="" class="btn-left chkBtn"><i class="xi-cut"></i> 선택삭제</button>
                    <button type="button" id="" class="btn-right writeBtn" onclick="location='serviceWrite.jsp'"><i class="xi-pen-o"></i> 글작성</button>
                </div>
                <!-- //버튼 -->

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
        <c:import url="../include/admin_footer.jsp"/>
    </div>
</body>
</html>