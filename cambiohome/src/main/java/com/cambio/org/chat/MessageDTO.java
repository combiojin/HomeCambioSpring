package com.cambio.org.chat;

import com.cambio.org.board.BoardDTO;
import com.google.gson.Gson;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class MessageDTO {

	private String message;
	private String type;
	private String to;
	
	public static MessageDTO converMessage(String source) {
		MessageDTO message = new MessageDTO();
		Gson gson = new Gson();
		message = gson.fromJson(source, MessageDTO.class);
		
		return message;
	}
}
