package com.cambio.org.member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class MemberDTO {

	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_cpw;
	private String member_mail;
	
}
