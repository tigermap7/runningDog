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
                                <li><a href="main.do">홈</a></li>
                                <li class="xi-angle-right"><a href="moveChatting.do">나의 채팅</a></li>
                            </ul>
                        </div>
                        <h2><span>나의 채팅</span></h2>
                        <h3>나의 채팅 목록을 한눈에<br/>확인하실 수 있습니다.</h3>
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
                            <form action="searchChatUser.do" method="get">
                            <select name="searchnickname">
                                <option value="" class="fontColor-dark">이름</option>
                            </select>
                            <div class="search-box">
                                <input type="text" placeholder="회원의 이름를 검색해주세요." name="nickname">
                                <button class="xi-search"></button>
                            </div>
                            </form>
                        </div>
                        <!--서브 검색 끝-->

                        <div class="sort-area">  
                            <h4>전체 ${listcount}개의 채팅</h4>
                        </div>
                        <table class="chattingList">
                            <colgroup>
                                <col width="10%">
                                <col width="*">
                                <col width="10%">
                            </colgroup>
                            <tbody id="chatList">
                            	<%-- <c:forEach var="room" items="${list}">
                                <tr onclick="javascript:location.href='moveChattingView.do?roomNo=${room.getRoomNo()}&receiver=${room.getNickname()}&receiverNo=${room.getMemberNo()}'">
                                    <td class="img"><img src="/runningdog/resources/images/common/userBg.png"></td>
                                    <td class="title">
                                        <h2>${room.getNickname()} <span><fmt:formatDate value="${room.getLastDate()}" pattern="YYYY.MM.dd"/>일 마지막 응답</span></h2>
                                        <p>${room.getLastMessage()}</p>
                                    </td>
                                    <!-- <td class="img"><img src="/runningdog/resources/images/test/animalNews04.jpg"></td> -->
                                    <td><span>5</span></td>
                                </tr>
                            	</c:forEach> --%>
                            </tbody>
                        </table>
                        <!-- 페이징 -->
                        <!-- <dl class="list-paging">
                            <dd>
                                <a href="#none"><i class="xi-angle-left"></i></a>
                                <a href="#none" class="active">1</a>
                                <a href="#none">2</a>
                                <a href="#none">3</a>
                                <a href="#none">4</a>
                                <a href="#none">5</a>
                                <a href="#none"><i class="xi-angle-right"></i></a>
                            </dd>
                        </dl> -->
                        <!-- //페이징 -->
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 끝 -->

            <c:import url="/WEB-INF/views/include/footer.jsp"/>
		</div>
		
		<script type="text/javascript">
			function chatList() {
				var myChatList = ${sessionScope.myChatList};
				console.log(myChatList);
				$.ajax({
					url: "chatList.do",
					cache: false,
					type: "get",
					dataType: "json",
					success: function(data) {
						console.log("success : " + data);
						var jsonStr = JSON.stringify(data);
						var json = JSON.parse(jsonStr);
						
						var values = ""; 
						for ( var i in json.list) {
							for ( var roomNo in myChatList) {
								if (myChatList[roomNo] == json.list[i].roomNo) {
									values += "<tr onclick=\"javascript:location.href='moveChattingView.do?roomNo=" + json.list[i].roomNo 
											+ "&receiver=" + decodeURIComponent(json.list[i].receiver).replace(/\+/gi, " ") 
											+ "&receiverNo=" + json.list[i].receiverNo + "'\">"
			                            	+ "<td class=\"img\"><img src=\"/runningdog/resources/images/common/userBg.png\"></td>"
			                            	+ "<td class=\"title\">"
			                                + "<h2>" + decodeURIComponent(json.list[i].receiver).replace(/\+/gi, " ") + "<span>" + json.list[i].lastdate + "일 마지막 응답</span></h2>"
			                                + "<p>" + decodeURIComponent(json.list[i].lastmessage).replace(/\+/gi, " ") + "</p></td>"
			                                + "<td><span>"+ json.list[i].unread +"</span></td></tr>"
			                            	//<td class="img"><img src="/runningdog/resources/images/test/animalNews04.jpg"></td>
								}
							}
						} // for in

						$("#chatList").html(values);
					},
					error : function(jqXHR, textstatus, errorthrown) {
						console.log("error : " + jqXHR + ", " + textstatus + ", "
								+ errorthrown);
					},
					complete: function() {
					      setTimeout(chatList, 30000);
				    }
				});
			};
    		setTimeout(chatList, 1000);
		</script>
	</body>
</html>