package com.cambio.org.board;

import com.cambio.org.member.MemberDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class BoardDTO {
	
	public int bid;
	public String cate_cd;
	public String title;
	public String content;
	public String tag;
	public int view_cnt;
	public String reg_id;
	public String reg_dt;
	public String edit_dt;

}
