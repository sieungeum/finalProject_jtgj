<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport"
        content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>채팅</title>

    <!-- header 부분 -->
    <%@ include file="/WEB-INF/inc/header.jsp"%>
    
    <style>
        .chatcontent {
            height: calc(100vh - 200px); /* 화면 높이에 따라 유동적으로 조정 */
            width: 100%;
            overflow-y: scroll;
        }
        .myChat {
            background-color: #E0B1D0;
        }
        li {
            list-style-type: none;
        }
        .me {
            text-align: right;
        }
        .chat-box {
            max-width: 200px;
            display: inline-block;
            border-radius: 15px;
        }
    </style>
</head>
<body id="page-top">

    <!-- 로그인 확인 -->
    <c:if test="${empty sessionScope.login}">
        <script>
            alert('로그인이 필요합니다.');
            location.href = '${pageContext.request.contextPath}/loginView';
        </script>
    </c:if>

    <!-- navigation 부분 -->
    <%@ include file="/WEB-INF/inc/nav.jsp"%>

    <section class="page-section" id="contact">
        <div class="container pt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xl-7">
                    <div class="chatWrap">
                        <div class="main_tit">
                            <h1>방 정보: [ ${room.roomNo}번방 ${room.roomName } ] </h1>
                        </div>
                        <div class="content chatcontent border border-secondary" data-room-no="${room.roomNo}">
                            <div id="chatList" class="">
                                <c:forEach items="${chatList}" var="chat">
                                    <c:if test="${sessionScope.login.userId eq chat.userId}">
                                        <li data-no="${chat.chatNo}" class="me pr-2">
                                            <strong>${chat.userName}</strong>
                                            <div class="me">
                                                <strong style="display: inline;" class="align-self-end">${chat.sendDate}</strong>
                                                <p class="myChat chat-box text-left p-3">${chat.chatMsg}</p>
                                            </div>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.login.userId ne chat.userId}">
                                        <li data-no="${chat.chatNo}" class="pl-2">
                                            <strong>${chat.userName}</strong>
                                            <div>
                                                <p class="chat-box bg-light p-3">${chat.chatMsg}</p>
                                                <strong style="display: inline;" class="align-self-center">${chat.sendDate}</strong>
                                            </div>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div>
                            <div class="d-flex justify-content-center" style="height: 60px">
                                <input type="text" id="msgi" name="msg" class="form-control" style="width: 75%; height: 100%">
                                <button type="button" id="btnSend" class="send btn btn-secondary" style="width: 25%; height: 100%">보내기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- footer 부분 -->
    <%@ include file="/WEB-INF/inc/footer.jsp"%>

    <!-- 소켓통신 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <script type="text/javascript">
        var client;

        $(document).ready(function() {
            $(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);

            var sock = new SockJS("${pageContext.request.contextPath}/endpoint");
            client = Stomp.over(sock);

            function sendmsg() {
                var message = $('#msgi').val();
                if (message === "") return false;

                console.log("보내는 메시지:", message);

                client.send('/app/hello/' + "${room.roomNo}", {}, 
                    JSON.stringify({
                        chatMsg: message,
                        memId: "${sessionScope.login.userId }",
                        memName: "${sessionScope.login.userName }",
                        roomNo: "${room.roomNo}"
                    })
                );

                $('#msgi').val('');
            }

            client.connect({}, function() {
                client.subscribe('/subscribe/chat/' + "${room.roomNo}", function(chat) {
                    let content = JSON.parse(chat.body);
                    console.log("수신한 메시지:", content);
                    let v_tag = renderList(content);
                    $("#chatList").append(v_tag);
                    $(".chatcontent").scrollTop($(".chatcontent")[0].scrollHeight);
                });
            });

            $('#btnSend').click(function() {
                sendmsg();
            });

            $('#msgi').keydown(function(e) {
                if (e.keyCode === 13) {
                    sendmsg();
                }
            });

            window.onbeforeunload = function() {
                if (client != null) {
                    client.disconnect();
                    sock.close();
                }
            };
        });
    </script>
</body>
</html>
