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
                    <h3>오늘의 이슈 관리</h3>
                    <h2>| 리스트</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <div class="list_wrap">
                <!-- 검색영역 -->
                <div class="sort-area">  
                    <h4>전체 게시물 100개</h4>
                </div>
                <!-- 검색영역 끝 -->
                <table class="list">
                    <colgroup>
                        <col width="5%">
                        <col width="5%">
                        <col width="8%">
                        <col width="*">
                        <col width="15%">
                        <col width="10%">
                        <col width="8%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>번호</th>
                            <th>썸네일</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
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
                            <td class="number" onclick="location='issueView.jsp'">6</td>
                            <td class="thumbnail" onclick="location='issueView.jsp'"><img src="/runningdog/../resources/images/test/animalNews02.jpg"></td>
                            <td class="title" onclick="location='issueView.jsp'">강아지가 아령을? 덤벨 들고 운동하는 강아지.</td>
                            <td class="name" onclick="location='issueView.jsp'">koreadognews</td>
                            <td class="date" onclick="location='issueView.jsp'">2020.09.01</td>
                            <td class="views" onclick="location='issueView.jsp'">102</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='issueView.jsp'">5</td>
                            <td class="thumbnail" onclick="location='issueView.jsp'"><img src="/runningdog/../resources/images/test/animalNews02.jpg"></td>
                            <td class="title" onclick="location='issueView.jsp'">강아지가 아령을? 덤벨 들고 운동하는 강아지.</td>
                            <td class="name" onclick="location='issueView.jsp'">koreadognews</td>
                            <td class="date" onclick="location='issueView.jsp'">2020.09.01</td>
                            <td class="views" onclick="location='issueView.jsp'">102</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='issueView.jsp'">4</td>
                            <td class="thumbnail" onclick="location='issueView.jsp'"><img src="/runningdog/../resources/images/test/animalNews02.jpg"></td>
                            <td class="title" onclick="location='issueView.jsp'">강아지가 아령을? 덤벨 들고 운동하는 강아지.</td>
                            <td class="name" onclick="location='issueView.jsp'">koreadognews</td>
                            <td class="date" onclick="location='issueView.jsp'">2020.09.01</td>
                            <td class="views" onclick="location='issueView.jsp'">102</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='issueView.jsp'">3</td>
                            <td class="thumbnail" onclick="location='issueView.jsp'"><img src="/runningdog/../resources/images/test/animalNews02.jpg"></td>
                            <td class="title" onclick="location='issueView.jsp'">강아지가 아령을? 덤벨 들고 운동하는 강아지.</td>
                            <td class="name" onclick="location='issueView.jsp'">koreadognews</td>
                            <td class="date" onclick="location='issueView.jsp'">2020.09.01</td>
                            <td class="views" onclick="location='issueView.jsp'">102</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='issueView.jsp'">2</td>
                            <td class="thumbnail" onclick="location='issueView.jsp'"><img src="/runningdog/../resources/images/test/animalNews02.jpg"></td>
                            <td class="title" onclick="location='issueView.jsp'">강아지가 아령을? 덤벨 들고 운동하는 강아지.</td>
                            <td class="name" onclick="location='issueView.jsp'">koreadognews</td>
                            <td class="date" onclick="location='issueView.jsp'">2020.09.01</td>
                            <td class="views" onclick="location='issueView.jsp'">102</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='issueView.jsp'">1</td>
                            <td class="thumbnail" onclick="location='issueView.jsp'"><img src="/runningdog/../resources/images/test/animalNews02.jpg"></td>
                            <td class="title" onclick="location='issueView.jsp'">강아지가 아령을? 덤벨 들고 운동하는 강아지.</td>
                            <td class="name" onclick="location='issueView.jsp'">koreadognews</td>
                            <td class="date" onclick="location='issueView.jsp'">2020.09.01</td>
                            <td class="views" onclick="location='issueView.jsp'">102</td>
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