package com.cambio.org.member;

import java.util.List;

import com.cambio.org.member.MemberDTO;

public interface MemberDAO {

	//회원목록
	public List<MemberDTO> memberList();
	//회원가입
	public void insertMember(MemberDTO dto);
	//회원정보보기
	public MemberDTO viewMember(String member_id);
	//회원삭제
	public void deleteMember(MemberDTO dto);
	//회원정보수정
	public void updateMember(MemberDTO dto);
	//로그인
	public MemberDTO memberLogin(MemberDTO dto);
	//로그인체크
	public boolean checkpw(String member_id, String member_pw);
	//관리자계정 회원정보수정
	public void updateAdmin(MemberDTO dto);
}
