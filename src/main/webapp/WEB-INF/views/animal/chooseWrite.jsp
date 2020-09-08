<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                <li><a href="#none">홈</a></li>
                                <li class="xi-angle-right"><a href="#none">유기동물 주인찾기</a></li>
                            </ul>
                        </div>
                        <h2><span>유기동물 주인찾기</span></h2>
                        <h3>회원님들이 임시로 맡고 있는<br/>유기동물의 가족이 되어주세요.</h3>
                    </div>
                </div>
			    <!--서브 비주얼/타이틀 끝-->
                
                <div class="subContent_wrap">
                    <!-- 좌측메뉴 -->
                    <c:import url="/WEB-INF/views/include/leftMenu.jsp"/>
                    <!-- 좌측메뉴 끝 -->

                    <div class="subContent">
                        <!--상세-->
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
                                        <td><input type="text" name="dTitle" title="" class="form-control w100p" placeholder="제목 입력" required/></td>
                                    </tr>
                                    <tr>
                                        <td>썸네일</td>
                                        <td><input type="file" name="ofile" title="" required/></td>
                                    </tr>
                                    <tr>
                                        <td>발견날짜</td>
                                        <td><input type="date" name="dFindDate" title="" class="form-control w50p" placeholder="발견날짜 입력" required/></td>
                                    </tr>
                                    <tr>
                                        <td>보호중 반려동물</td>
                                        <td><label><input type="radio" name="dCategory" value="d" checked/>강아지</label>
                                        	<label><input type="radio" name="dCategory" value="c" />고양이</label>
                                        	<label><input type="radio" name="dCategory" value="e" />기타</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>성별</td>
                                        <td><label><input type="radio" name="dGender" value="m" checked/>수컷</label>
                                        	<label><input type="radio" name="dGender" value="f"/>암컷</label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>연락처</td>
                                        <td><input type="text" name="dPhone" onKeyup="inputTelNumber(this);"
                                        	maxlength="13" class="form-control w50p" placeholder="특수문자없이 숫자만 입력해 주세요" required/></td>
                                    </tr>
                                    <tr>
                                        <td>발견장소</td>
                                        <td><select name="Dlocal" required="required">
												<option value="">지역선택</option>
												<option value="1" ${param.local eq"1"?"selected" :"" }>강남구</option>
												<option value="2" ${param.local eq"2"?"selected" :"" }>강동구</option>
												<option value="3" ${param.local eq"3"?"selected" :"" }>강북구</option>
												<option value="4" ${param.local eq"4"?"selected" :"" }>강서구</option>
												<option value="5" ${param.local eq"5"?"selected" :"" }>관악구</option>
												<option value="6" ${param.local eq"6"?"selected" :"" }>광진구</option>
												<option value="7" ${param.local eq"7"?"selected" :"" }>구로구</option>
												<option value="8" ${param.local eq"8"?"selected" :"" }>금천구</option>
												<option value="9" ${param.local eq"9"?"selected" :"" }>노원구</option>
												<option value="10" ${param.local eq"10"?"selected" :"" }>도봉구</option>
												<option value="11" ${param.local eq"11"?"selected" :"" }>동대문구</option>
												<option value="12" ${param.local eq"12"?"selected" :"" }>동작구</option>
												<option value="13" ${param.local eq"13"?"selected" :"" }>마포구</option>
												<option value="14" ${param.local eq"14"?"selected" :"" }>서대문구</option>
												<option value="15" ${param.local eq"15"?"selected" :"" }>서초구</option>
												<option value="16" ${param.local eq"16"?"selected" :"" }>성동구</option>
												<option value="17" ${param.local eq"17"?"selected" :"" }>성북구</option>
												<option value="18" ${param.local eq"18"?"selected" :"" }>송파구</option>
												<option value="19" ${param.local eq"19"?"selected" :"" }>양천구</option>
												<option value="20" ${param.local eq"20"?"selected" :"" }>영등포구</option>
												<option value="21" ${param.local eq"21"?"selected" :"" }>용산구</option>
												<option value="22" ${param.local eq"22"?"selected" :"" }>은평구</option>
												<option value="23" ${param.local eq"23"?"selected" :"" }>종로구</option>
												<option value="24" ${param.local eq"24"?"selected" :"" }>중구</option>
												<option value="25" ${param.local eq"25"?"selected" :"" }>중랑구</option>
										</select> 
										<input type="text" name="dFindLocal" title="" class="form-control w50p" placeholder="발견장소 입력" required/></td>
                                    </tr>
                                    <tr>
                                        <td>특이사항</td>
                                        <td><input type="text" name="dPoint" title="" class="form-control w100p" placeholder="특징/성향/색상 입력" /></td>
                                    </tr>
                                    <tr>
                                        <td>내용</td>
                                        <td><textarea name="dContent" rows="" cols="" class="form-control" style="resize: none; width:100%; min-height:300px; max-height:300px;"placeholder="게시판 성격과 다른글을 올리시면,사이트 이용이 정지되실 수 있습니다."></textarea></td>
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
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>