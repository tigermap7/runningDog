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
                    <h3>유기동물 주인찾기 관리</h3>
                    <h2>| 작성</h2>
                </div>
            </div>
            <!-- //상단 타이틀 -->

            <!-- 본문내용 -->
            <form name="formname" method="post" enctype="" action="" class="form-inline">
            <div class="write-area">
            
                <h2>유기동물 주인찾기 작성</h2>
                <p>가족을 잃은 동물들에게 가족을 찾아주세요.</p>
                
                <table>
                    <colgroup>
                        <col width="20%">
                        <col width="80%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="" title="" class="form-control w100p" placeholder="제목 입력" required=""></td>
                        </tr>
                        <tr>
                            <td>썸네일</td>
                            <td><input type="file" name="" title=""></td>
                        </tr>
                        <tr>
                            <td>발견날짜</td>
                            <td><input type="date" name="" title="" class="form-control w50p" placeholder="발견날짜 입력" required=""></td>
                        </tr>
                        <tr>
                            <td>견종</td>
                            <td><input type="text" name="" title="" class="form-control w50p" placeholder="견종 입력"></td>
                        </tr>
                        <tr>
                            <td>색상</td>
                            <td><input type="text" name="" title="" class="form-control w50p" placeholder="색상 입력"></td>
                        </tr>
                        <tr>
                            <td>발견장소</td>
                            <td><input type="text" name="" title="" class="form-control w100p" placeholder="발견장소 입력" required=""></td>
                        </tr>
                        <tr>
                            <td>특이사항</td>
                            <td><input type="text" name="" title="" class="form-control w100p" placeholder="특징/성향 입력"></td>
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
            <!-- 글쓰기 끝 -->
        </div>
        <c:import url="../include/admin_footer.jsp"/>
    </div>
</body>
</html>