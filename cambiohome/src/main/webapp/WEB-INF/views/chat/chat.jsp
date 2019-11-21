<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../head.jsp"%>
<script type="text/javascript">
	var sock = null;
	var message = {};

	$(document).ready(function() {
		chatSock = new SockJS("/org/echo-ws");
		
		chatSock.onopen = function() {
			message = {};
			message.message = "반갑습니다.";
			message.type = "all";
			message.to = "all";
			chatSock.send(JSON.stringify(message));
		};

		chatSock.onmessage = function(evt) {
			$("#chatMessage").append(evt.data);
			$("#chatMessage").append("<br />");
			$("#chatMessage").scrollTop(99999999);
		};

		chatSock.onclose = function() {
			// sock.send("채팅을 종료합니다.");
		}

		$("#message").keydown(function(key) {
			if (key.keyCode == 13) {
				$("#sendMessage").click();
			}
		});

		$("#sendMessage").click(function() {
			if ($("#message").val() != "") {

				message = {};
				message.message = $("#message").val();
				message.type = "all";
				message.to = "all";

				var to = $("#to").val();
				if (to != "") {
					message.type = "one";
					message.to = to;
				}

// 				chatSock.send(JSON.stringify(message));
				$("#chatMessage").append("나 ->  " + $("#message").val() + "<br/>");
				$("#chatMessage").scrollTop(99999999);
				$("#message").val("");
			}
		});
});
</script>
</head>
<body>
	<!-- menu -->
	<%@include file="../menu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-12" style="text-align: center;">
				<div id="chatMessage" style="overFlow: auto; height:500px; max-height: 500px; text-align: left; border: 1px solid;"></div>
				<input type="text" id="message" placeholder="메시지 내용" /> 
				<input type="text" id="to" placeholder="귓속말대상" />
				<input type="button" class="btn btn-dark btn-sm" id="sendMessage" value="엔터" />
				
			</div>
		</div>
	</div>
</body>
</html>