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
	private String member_gender;
	private String member_birth;
	private String member_phone;
	private String member_mail;
	private String member_addressnumber;
	private String member_address;
	private String member_detailaddress;
	private String reg_dt;
	private String edit_dt;
		
}
