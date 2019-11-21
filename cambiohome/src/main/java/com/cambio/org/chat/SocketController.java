package com.cambio.org.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketController {

	@RequestMapping(value = "/chat/chat.do")
	public String viewChattingPage() {
		return "chat/chat";
	}

}
