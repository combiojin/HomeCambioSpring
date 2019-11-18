package com.cambio.org.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class ReplyDTO {
	
	public int rid;
	public int bid;
	public String content;
	public String reg_id;
	public String reg_dt;
	public String edit_dt;
	
}
