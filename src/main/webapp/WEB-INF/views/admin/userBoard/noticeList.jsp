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
                    <h3>공지사항 관리</h3>
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
                                <option value="">제목</option>
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
                        <col width="*">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>번호</th>
                            <th>공지여부</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>첨부파일</th>
                        </tr>
                        <tr>
                        </tr>
                        <tr class="hr">
                            <th colspan="7"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='noticeView.jsp'">6</td>
                            <td class="kinds" onclick="location='noticeView.jsp'"><span class="protect">공지</span></td>
                            <td class="title" onclick="location='noticeView.jsp'">유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</td>
                            <td class="name" onclick="location='noticeView.jsp'">관리자</td>
                            <td class="date" onclick="location='noticeView.jsp'">2020.09.01</td>
                            <td class="file" onclick="location='noticeView.jsp'"><i class="xi-file-text"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='noticeView.jsp'">5</td>
                            <td class="kinds" onclick="location='noticeView.jsp'"></td>
                            <td class="title" onclick="location='noticeView.jsp'">유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</td>
                            <td class="name" onclick="location='noticeView.jsp'">관리자</td>
                            <td class="date" onclick="location='noticeView.jsp'">2020.09.01</td>
                            <td class="file" onclick="location='noticeView.jsp'"><i class="xi-file-text"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='noticeView.jsp'">4</td>
                            <td class="kinds" onclick="location='noticeView.jsp'"></td>
                            <td class="title" onclick="location='noticeView.jsp'">유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</td>
                            <td class="name" onclick="location='noticeView.jsp'">관리자</td>
                            <td class="date" onclick="location='noticeView.jsp'">2020.09.01</td>
                            <td class="file" onclick="location='noticeView.jsp'"><i class="xi-file-text"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='noticeView.jsp'">3</td>
                            <td class="kinds" onclick="location='noticeView.jsp'"></td>
                            <td class="title" onclick="location='noticeView.jsp'">유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</td>
                            <td class="name" onclick="location='noticeView.jsp'">관리자</td>
                            <td class="date" onclick="location='noticeView.jsp'">2020.09.01</td>
                            <td class="file" onclick="location='noticeView.jsp'"><i class="xi-file-text"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='noticeView.jsp'">2</td>
                            <td class="kinds" onclick="location='noticeView.jsp'"></td>
                            <td class="title" onclick="location='noticeView.jsp'">유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</td>
                            <td class="name" onclick="location='noticeView.jsp'">관리자</td>
                            <td class="date" onclick="location='noticeView.jsp'">2020.09.01</td>
                            <td class="file" onclick="location='noticeView.jsp'"><i class="xi-file-text"></i></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id="" value=""></td>
                            <td class="number" onclick="location='noticeView.jsp'">1</td>
                            <td class="kinds" onclick="location='noticeView.jsp'"></td>
                            <td class="title" onclick="location='noticeView.jsp'">유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</td>
                            <td class="name" onclick="location='noticeView.jsp'">관리자</td>
                            <td class="date" onclick="location='noticeView.jsp'">2020.09.01</td>
                            <td class="file" onclick="location='noticeView.jsp'"><i class="xi-file-text"></i></td>
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
                    <button type="button" id="" class="btn-right writeBtn" onclick="location='noticeWrite.jsp'"><i class="xi-pen-o"></i> 글작성</button>
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