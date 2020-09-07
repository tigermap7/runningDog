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
                    <h2>| 작성</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <form name="formname" method="post" enctype="" action="" class="form-inline">
            <div class="write-area">
            
                <h2>공지사항 작성</h2>
                <p>공지사항을 입력해주세요.</p>
                
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>공지</td>
                            <td><label><input type="radio" "="" name="" title="">공지여부</label></td>
                        </tr>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="" title="" class="form-control w100p" placeholder="제목 입력" required=""></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td><textarea name="" rows="" cols="" class="form-control" style="resize: none; width:100%; min-height:300px; max-height:300px;"></textarea></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="write-btn">
                <input type="button" class="btn btn-list" value="목록으로">
                <input type="reset" class="btn btn-cancel" value="취소하기">
                <input type="submit" class="btn btn-success" value="작성하기">
            </div>
            </form>
        </div>
        <c:import url="../include/admin_footer.jsp"/>
    </div>
</body>
</html>