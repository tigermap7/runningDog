<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
        <c:import url="/WEB-INF/views/include/head.jsp"/>
<script type="text/javascript">
$(function() {
	$(document).on('click',".Subcmt_btn",function() {
		$(this).siblings(".Subcmt").toggle(200);
	});
	$(document).on('click',".Subcmt_update_btn",function() {
		$(this).siblings(".Subcmt_update").toggle(200);
	});
	$(document).on('click',".Cmt_update_btn",function() {
		$(this).siblings(".Cmt_update").toggle(200);
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
                        <div class="animalView">
                            <p class="topText">*「동물보호법」 제17조, 시행령7조 및 동법 시행규칙 제20조에 따라 유기·유실동물을 보호하고 있는 경우에는 소유자 등이 보호조치 사실을 알 수 있도록 7일 동안 공고하여야 합니다.</p>
                            <dl>
                                <dt>
                                	
                                    <div class="viewImg"><img src="/runningdog/resources/dboard/dboardImage/${ dboard.viewImage }" id="imgControll" onclick="fnImgPop(this.src)" ></div>
                                    <!--<a class="linkBtn" href="mailto:spark720@naver.com"><i class="xi-mail-o"> 메일보내기</i></a> -->
                                    <c:url var = "dSuccess" value= "dUpSuccess.do">
										<c:param name="dNum" value="${ dboard.dNum }"/>
										<c:param name="dSuccess" value="${ dboard.dSuccess }"/>
									</c:url>
                                    <a class="linkBtn" href="startChat.do?receiver=${ dboard.dWriter }&receiverNo=${ dboard.uniqueNum }"><i class="xi-message-o"></i> 채팅하기</a>
                                    <a class="linkBtn" href="#none"><i class="xi-share-alt-o"></i> 공유하기</a>
                                    <!-- 분양 완료 버튼 클릭시 분양완료 상태였으면 분양취소를 분양이 아직 안된상태면 완료하기 표시 -->
                                    <c:if test= "${sessionScope.loginMember.userId == dboard.userId }">
                                    	<a class="linkBtn" href="${ dSuccess }"><i class="xi-share-alt-o"></i> ${ dboard.dSuccess eq 'y'? '분양완료취소':'분양완료하기'}</a>
                                    
                                    </c:if>
                                </dt>
                                <dd>
                                    <h3>동물정보</h3>
                                    <table class="animalInfo">
                                       <colgroup>
                                           <col width="20%">
                                           <col width="30%">
                                           <col width="20%">
                                           <col width="30%">
                                       </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>반려 동물 종류</th>
                                                
                                                <td>
                                                ${ dboard.dCategory eq "d" ? "강아지" : "" }
                                                ${ dboard.dCategory eq "c" ? "고양이" : "" }
                                                ${ dboard.dCategory eq "e" ? "기  타" : "" }
                                                </td>
                                                <th>발견날짜</th>
                                                <td>${ dboard.dFindDate }</td>
                                            </tr>
                                            <tr>
                                                <th>성별</th>
                                                <td>
                                                ${ dboard.dGender eq "m" ? "남/男" : "여/女" }
												</td>
                                                <th>분양 여부</th>
                                                <td>
                                                ${ dboard.dSuccess eq "y" ? "새로운 가족을 찾았어요" : ""}
                                                ${ dboard.dSuccess eq "n" ? "가족을 기다리고 있어요" : ""}
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>발견장소</th>
                                                <td colspan="3">${ dboard.dFindLocal } 부근</td>
                                            </tr>
                                            <tr>
                                                <th>특이사항</th>
                                                <td colspan="3">${ dboard.dPoint }</td>
                                               
                                            </tr>
                                        </tbody>
                                    </table>
                                    
                                    <h3 class="mt30">임시보호자 정보</h3>
                                    <table class="animalInfo">
                                       <colgroup>
                                           <col width="15%">
                                           <col width="35%">
                                           <col width="15%">
                                           <col width="35%">
                                       </colgroup>
                                        <tbody>
                                            <tr>
                                                <th>임시보호자</th>
                                                <td>${ dboard.dWriter } / # ${ dboard.uniqueNum }</td>
                                                <th>${ dboard.dDate ne dboard.dMdate ?"수정일": "작성일"}</th>
                                                <td>${ dboard.dDate eq dboard.dMdate ?dboard.dDate : dboard.dMdate}
                                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>연락처</th>
                                                <td>${ dboard.dPhone }</td>
                                                <th>이메일</th>
                                                <td>${ dboard.userId }</td>
                                            </tr>
                                            <tr>
                                                <th>지역</th>
                                                <td colspan="1">
                                                <c:set var="local" value="${fn:split('[서울시]|[인천시]|[대전시]|[광주시]|[대구시]|[울산시]|[부산시]|[경기도]|[강원도]|[세종시]|[충청남도]|[충청북도]|[전라남도]|[전라북도]|[경상남도]|[경상북도]|[제주시]', '|') }" />
												<c:forEach var="lo" items="${local }" varStatus="l">
													<c:if test="${l.count== (dboard.dLocal+1) }"> ${lo }</c:if>
												</c:forEach></td>
												<th>조회수</th>
												<td colspan="1">${ dboard.dCount }</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </dd>
                            </dl>

                            <div class="viewContent">
                            ${ dboard.dContent }
                            </div>
					
							<td>발견 장소</td>
						
								<div class="map_wrap">
									<div class="hAddr">
										<div id="map"
											style="width: 1000px; height: 300px; position: relative; overflow: hidden;">
										</div>
									</div>
								</div> <script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68c702b1618fe5e7850fb8b93c89734b&libraries=services"></script>
								<script>
									var mapContainer = document
											.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(
												'${dboard.mapY}', '${dboard.mapX}'), // 지도의 중심좌표
										level : 8
									// 지도의 확대 레벨
									};

									var map = new kakao.maps.Map(mapContainer,
											mapOption); // 지도를 생성합니다

									// 마커가 표시될 위치입니다 
									var markerPosition = new kakao.maps.LatLng(
											'${dboard.mapY}', '${dboard.mapX}');

									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
										position : markerPosition
									});

									// 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(map);
									
									var iwContent = '<div style="padding:5px;"><style="color:blue" target="_blank">${dboard.dFindLocal}</div>',
								    iwPosition = new kakao.maps.LatLng('${dboard.mapY}', '${dboard.mapX}'); //인포윈도우 표시 위치입니다
								    
									// 인포윈도우를 생성합니다
									var infowindow = new kakao.maps.InfoWindow({
								    position : iwPosition, 
								    content : iwContent
									});
								    
									infowindow.open(map, marker); 
								</script>
							</td>
						</tr>

						<div class="textCon">
                                상기 동물을 분실하신 소유주께서는 보호센터로 문의하시어 동물을 찾아가시기 바라며, 동물보호 법 제17조의 규정에 따른 공고가 있는 날부터 10일이 경과하여도 소유자 등을 알 수 없는 경우에는 유실물법 제12조 및 민법 제253조의 규정에 불구하고 해당 시,군,구 자치구가 그 동물의 소유권을 취득하게 됩니다.<br/>
                                ${ dboard.dDate }
                            </div>
                                
                        </div>
                        <!-- 상세 끝 -->
                    
                        <!-- 버튼 -->
                        <c:url var = "dupPageMove" value= "dupView.do">
							<c:param name="dNum" value="${ dboard.dNum }"/>
						</c:url>
						<c:url var = "dlistMove" value= "dboardList.do">
							<c:param name="pageNo" value="${ dboard.pageNo }"/>
						</c:url>
						<c:url var="dboardHide" value="dHide.do">
							<c:param name="dNum" value="${ dboard.dNum }"/>
						</c:url>
						<c:url var="dboardNext" value="dboardnext.do">
							<c:param name="dNum" value="${ dboard.dNum }"/>
							<c:param name="dLocal" value="${ dboard.dLocal }"/>
                            <c:param name="searchFiled" value="${ dboard.searchFiled }" />
							<c:param name="searchValue" value="${ dboard.searchValue }" />
							<c:param name="dCategory" value="${ dboard.dCategory }"/>
						</c:url>
						<c:url var="dboardPrev" value="dboardprev.do">
							<c:param name="dNum" value="${ dboard.dNum }"/>
							<c:param name="dLocal" value="${ dboard.dLocal }"/>
                            <c:param name="searchFiled" value="${ dboard.searchFiled }" />
							<c:param name="searchValue" value="${ dboard.searchValue }" />
							<c:param name="dCategory" value="${ dboard.dCategory }"/>
						</c:url>
                        <div class="viewBtn-wrap">
                            <button class="nextBtn" onclick="location='${ dboardPrev }'"><i class="xi-angle-left-min"></i> 이전</button>
                            <button class="listBtn" onclick="location='${ dlistMove }'"><i class="xi-rotate-left"></i> 목록</button>
                            <c:if test= "${ sessionScope.loginMember.userId == dboard.userId }">
                            <button class="deleteBtn" onclick="location='${ dboardHide }'"><i class="xi-cut"></i> 삭제</button>
                            <button class="modifiedBtn" onclick="location='${ dupPageMove }'"><i class="xi-pen-o"></i> 수정</button>
                            </c:if>
                            <button class="prevBtn" onclick="location='${ dboardNext }'">다음 <i class="xi-angle-right-min"></i></button>
                        </div>
                        <!-- 버튼 끝 -->
                        
                        <!-- 댓글 시작 -->
                          <div class="cmt_wrap">
                            <form name = ""action="insertDreply.do" method="post">
                            <input type="hidden" id= "dNum" name="dNum" value="${dboard.dNum }">
                            <input type="hidden" id="dreWriter" name="dreWriter" value="${loginMember.nickname }">
                            <input type="hidden" id= "uniqueNum" name="uniqueNum" value="${loginMember.uniqueNum }">
                                <fieldset>
                                    <div class="cmt_form">
                                        <h4 class="cmt_head">댓글 ${ dreplyCount }</h4>
                                        <div class="cmt_body">
        								<textarea name="dreContent" style="resize: none; width: 100%; min-height: 100px; max-height: 100px;" id = "dreContent" onfocus="this.value='';">비방글은 작성하실 수 없습니다.</textarea>
                                            <div class="cmt_ok">
                                            	<input type="submit" value="등록" >
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                            </form>
                            <ul class="cmt_con" id="dreply">
							<c:forEach items="${ requestScope.dreplyList }" var="d">
							<!--  대댓글일 경우 대댓글 창 색상 다르게함 -->
								<li ${ d.dreLevel eq 2? "style='background-color: #E6E6E6;'" : "" }>
								<dl>
									<dt class="img">
										<img src="/runningdog/resources/images/memberImg/${savePath}${selectUser.renameProfile}">
									</dt>
										<dd>
											<h4>${ d.dreWriter }/#${ d.uniqueNum }</h4>
										</dd>
										<dt class="cmt_date">${ d.dreMdate }</dt>
									</dl>
									<p>${ d.dreContent }</p>
									<div class="cmt_conBtn">
										<c:if test="${ d.dreLevel eq 1 and d.dreDelete eq 'n'}">
										<button class="Subcmt_btn">대댓글</button>
										</c:if>
										<c:if test="${ sessionScope.loginMember.uniqueNum == d.uniqueNum and d.dreDelete eq 'n'}">
										<button onclick="location.href='updateDreplyDel.do?dreNum=${d.dreNum}&dNum=${d.dNum}'" style="float: right;">삭제</button>
										<button class="Cmt_update_btn" style="float: right; margin-right: 10px;">수정</button>
										</c:if>
										<br>
										<br>
										<div class="Cmt_update" style="display: none;">
											<form name="updateDreply" action="updateDreply.do" method="post">
												<input type="hidden" name="dreNum" id="dreNumUp" value="${ d.dreNum }">
												<input type="hidden" name="dNum" value="${ d.dNum }">
												<input type="hidden" name="dreParents" value="${ d.dreParents }">
												<fieldset>
													<div class="cmt_form">
														<div class="cmt_body">
															<textarea name="dreContent"
																style="resize: none; width: 100%; min-height: 100px; max-height: 100px;">${ d.dreContent }</textarea>
															<div class="cmt_ok">
																<input type="submit" class="updateDreply" value="수정">
															</div>
														</div>
													</div>
												</fieldset>
											</form>
										</div>
										<div style="display: none" class="Subcmt" id="commentReply">
											<form action="insertDreplyLevel.do" method="post">
												<input type="hidden" name="dreNum" id="dreNum" value="${ d.dreNum }"> 
												<input type="hidden" name="dNum" id="dNum" value="${ d.dNum }"> 
												<input type="hidden" name="dreWriter" id="dreWriter" value="${loginMember.nickname}"> 
												<input type="hidden" name="uniqueNum" id="uniqueNum" value="${loginMember.uniqueNum}">
												<fieldset>
													<div class="cmt_form">
														<div class="cmt_body">
															<textarea name="dreContent" id="dreContent" style="resize: none; width: 100%; min-height: 100px; max-height: 100px;"
																onfocus="this.value='';">비방글은 작성할 수 없습니다.</textarea>
															<div class="cmt_ok">
																<input type="submit"  value="등록">
															</div>
														</div>
													</div>
												</fieldset>
											</form>
										</div></li>
							</c:forEach>



						</ul>
<!--  <script type="text/javascript">
                      $(function(){
                    	  getCommentList()
                      });
                      var arrdreNum = new Array();
          			var arrdNum = new Array();
          			var arrdreWriter = new Array();
          			var arrdreMdate = new Array();
          			var arrdreContent = new Array();
          			var arruniqueNum = new Array();
          			var arrLevel =new Array();
          			var index = new Array();
					var idx ="";
function getCommentList() {	
	$.ajax({
		url : "dreplyList.do",
		type : "post",
		data : {dNum : ${dboard.dNum}},
		dataType : "json",
		success : function(data) {
			console.log(data);

			var objStr = JSON.stringify(data);
			var jsonObj = JSON.parse(objStr);
			var totalcount = (jsonObj.list).length;	
			
			var output = "";
			$("#totalcount").text('댓글 갯수 : ' + totalcount );

			for(var i in jsonObj.list) {
				idx = i;
				arrdreNum[i] = jsonObj.list[i].dreNum;
				arrdNum[i] = jsonObj.list[i].dNum;
				arrdreWriter[i] = decodeURIComponent(jsonObj.list[i].dreWriter).replace(/\+/gi, " ");
				arrdreMdate[i] = jsonObj.list[i].dreMdate;
				arrdreContent[i] = decodeURIComponent(jsonObj.list[i].dreContent).replace(/\+/gi, " ");
				arruniqueNum[i] = jsonObj.list[i].uniqueNum;
				output +='<li><dl>'+
                        '<dt class="img"><img src="/runningdog/resources/images/memberImg/${savePath}${selectUser.renameProfile}"></dt>'+
                        '<dd><h4>'+arrdreWriter[i]+ '/'+ arruniqueNum[i]+'</h4></dd>'+
                        '<dt class="cmt_date">'+arrdreMdate[i]+'</dt></dl>'+
                    	'<p>'+arrdreContent[i]+'</p>'+
                    	'<div class="cmt_conBtn"> <button class="Subcmt_btn">대댓글</button>'+
            			'<button onclick= \"location.href='+"''"+'" style="float: right;">삭제</button>'+
            			'<button class="Cmt_update_btn" >수정</button><br><br><div class="Cmt_update" style="display: none;">'+
						'<form name="updateDreply" action="" method="post">'+
						'<input type="hidden" name="dreNum" id="dreNumUp" value="'+arrdreNum[i]+'">'+
						'<fieldset><div class="cmt_form">'+
						'<div class="cmt_body"><textarea name="dreContent" style="resize: none; width: 100%; min-height: 100px; max-height: 100px;" >'+arrdreContent[i]+'</textarea>'+
						'<div class="cmt_ok"><input type="button" class="updateDreply" onclick="updateDreply(${result.code})" value="수정"></div></div></div></fieldset>'+
						'</form></div><div style="display:none" class="Subcmt" id="commentReply">'+
           			    '<form action="" method="post">'+
           			 	'<input type="hidden" name="dreNumLevel" id="dreNumLevel" value="'+arrdreNum[i]+'"'+
						'<input type="hidden" name="dNumLevel" id="dNum" value="'+arrdNum[i]+'">'+
						'<input type="hidden" name="dreWriterLevel" id="dreWriterLevel" value="${loginMember.nickname}">'+
						'<input type="hidden" name="uniqueNumLevel" id="uniqueNumLevel" value="${loginMember.uniqueNum}">'+
						'<fieldset><div class="cmt_form"><div class="cmt_body">'+
						'<textarea name="dreContentLevel" id="dreContentLevel" style="resize: none; width:100%; min-height:100px; max-height:100px;"'+ 'onfocus="this.value='+"''"+';"></textarea>'+
                        '<div class="cmt_ok"><input type="button" onclick="DreplyLevelSubmit('+idx+')" value="등록" ></div></div></div></fieldset></form></div></li>';
			}
	
			
			$("#dreply").empty();
			$("#dreply").html(output);
			
		},
		error : function(jqXHR, textstatus, errorthrown) {
			console.log("error : " + jqXHR + ", " + textstatus
					+ ", " + errorthrown);
		}
	}); // ajax
}	

// 댓글 추가
function DreplySubmit(code) {
	if (document.getElementById("dreContent").value == "") {
		alert("내용을 입력해주세요");
		return false;
	}else
		$.ajax({
			url : "insertDreply.do",
			type:'POST',
			data : {dreContent : $('#dreContent').val(),dNum : $('#dNum').val(), dreWriter : $('#dreWriter').val(), uniqueNum : $('#uniqueNum').val()},
			success : function(data){
				console.log(data);
				if(data == 1) {
					alert("댓글이 등록되었습니다."); 
				} else {
					alert("댓글 등록을 실패했습니다."); 
				}
				$("#dreContent").val("");
				getCommentList();
			},
			error:function(request,status,error){
				alert("로그인후 이용해주세요.");
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
			}
		});
}

//대댓글 추가
function DreplyLevelSubmit(idx) {
	if (document.getElementById("dreContentLevel").value == "") {
		alert("내용을 입력해주세요");
		return false;
	}else
		$.ajax({
			url : "insertDreplyLevel.do",
			type:'POST',
			data : {dreContent :$('#dreContent').val() ,dNum : $('#dNum').val(),dreNum : $('#dreNumLevel').val(), dreWriter : $('#dreWriterLevel').val(), uniqueNum : $('#uniqueNumLevel').val()},
			success : function(data){
				console.log(data);
				if(data == 1) {
					
					alert("대댓글이 등록되었습니다."); 
				} else {
					alert("대댓글 등록을 실패했습니다."); 
				}
				$("#dreContentLevel").val("");
				getCommentList();
			},
			error:function(request,status,error){
				console.log(dNum);
				console.log(dreNum);
				alert("로그인후 이용해주세요.");
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
			}
		});
}
//댓글 수정

function updateDreply(code) {
	if (document.getElementById("dreContentup").value == "") {
		alert("내용을 입력해주세요");
		return false;
	}else
		$.ajax({
			url : "updateDreply.do",
			type:'POST',
			data : {dreContent : $('#dreContentup').val(),dreNum : $('#dreNum').val()},
			success : function(data){
				console.log(data);
				if(data == 1) {
					alert("댓글이 수정 되었습니다."); 
				} else {
					alert("댓글 수정을 실패했습니다."); 
				}
				$("#dreContent").val("");
				getCommentList();
			},
			error:function(request,status,error){
				alert("로그인후 이용해주세요.");
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
			}
		});
}



// 댓글 삭제
function Dreplydelete(dreNum) {
	console.log(dreNum + "댓글 삭제하기")
	
	$.ajax({
		url : "updateDreplyDel.do",
		type:'POST',
		data : {dreNum : dreNum },
		success : function(data){
			if(data == 1) {
				alert("댓글이 삭제되었습니다."); 
			} else {
				alert("댓글 삭제를 실패했습니다."); 
			}
			getCommentList();
		},
		error:function(request,status,error){
			console.log("error : " + jqXHR + ", " + textstatus + ", " + errorthrown);
		}
	});
}

</script> -->

                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
	</body>
</html>