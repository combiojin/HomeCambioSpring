package com.cambio.org.chat;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.cambio.org.chat.MessageDTO;

public class EcoHandler extends TextWebSocketHandler {

	private Logger logger = LoggerFactory.getLogger(EcoHandler.class);

	// 서버에 연결한 사용자들을 저장하는 리스트
	private List<WebSocketSession> connectedUsers;

	public EcoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}

	// 접속과 관련된 Event Method @param WebSocketSession 접속한 사용자
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		connectedUsers.add(session);

		logger.info(session.getId() + "님이 접속했습니다.");
		logger.info("연결 IP : " + session.getRemoteAddress().getHostName());
	}

	/*
	 * 2가지 이벤트 처리
	 * 1.Send : 클라이언트가 서버에게 메시지를보냄 2.Emit : 서버에 연결되어 있는 클라이언트에게 메시지를 보냄
	 * @param WebSocketSession 메시지를 보낸 클라이언트
	 * @param TextMessage 메시지의 내용
	 */

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(message.getPayload());
		MessageDTO messageDTO = MessageDTO.converMessage(message.getPayload());
		String hostName = "";

		for (WebSocketSession webSocketSession : connectedUsers) {
			if (!session.getId().equals(webSocketSession)) {
				webSocketSession.sendMessage(
						new TextMessage(session.getRemoteAddress().getHostName() + " ▶ " + messageDTO.getMessage()));
			} else {
				hostName = webSocketSession.getRemoteAddress().getHostName();
				if (messageDTO.getTo().equals(hostName)) {
					webSocketSession.sendMessage(new TextMessage("<span style='color:red; font-weight: bold;' >"
							+ session.getRemoteAddress().getHostName() + "▶ " + messageDTO.getMessage() + "</span>"));
					break;
				}
			}
		}
		// Paylod : 사용자가 보낸 메시지
		logger.info(session.getId() + "님의 메시지 : " + message.getPayload());
	}

	/*
	 * 클라이언트가 서버와 연결을 끊었을때 실행되는 메소드
	 * @param WebSocketSession 연결을 끊은 클라이언트
	 * @param CloseStatus 연결 상태 (확인 필요함)
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		connectedUsers.remove(session);

		for (WebSocketSession webSocketSession : connectedUsers) {
			// 자신이 보낸 메시지를 받지 않는다.
			if (!session.getId().equals(webSocketSession.getId())) {
				webSocketSession.sendMessage(new TextMessage(session.getRemoteAddress().getHostName() + "퇴장했습니다."));
			}
		}
		logger.info(session.getId() + "님이 퇴장했습니다.");
	}
}
