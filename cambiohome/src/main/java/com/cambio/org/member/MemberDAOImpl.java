package com.cambio.org.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	// 회원목록
	@Override
	public List<MemberDTO> memberList() {
		return sqlSession.selectList("member.memberList");
	}

	// 회원가입
	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember", dto);
	}

	// 회원정보보기
	@Override
	public MemberDTO viewMember(String member_id) {
		return sqlSession.selectOne("member.viewMember", member_id);
	}

	// 회원삭제
	@Override
	public void deleteMember(MemberDTO dto) {
		sqlSession.delete("member.deleteMember", dto);
	}

	// 회원정보수정
	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember", dto);
	}

	// 로그인
	@Override
	public MemberDTO memberLogin(MemberDTO dto) {
		return sqlSession.selectOne("member.memberlogin", dto);
	}

	// 로그인체크
	@Override
	public boolean checkpw(String member_id, String member_pw) {
		boolean result=false;
		//mapper에 2개 이상의 자료를 전달할때 : map,dto사용
		Map<String, String> map=new HashMap<>();
		map.put(member_id, member_id);
		map.put(member_pw, member_pw);
		int count = sqlSession.selectOne("member.checkLogin",map);
		//비번이 맞으면 1 => true , 틀리면 0 => false 리턴
		if(count==1) 
			result = true;
		return result;
	}
	
	//관리자계정 회원정보수정
	@Override
	public MemberDTO updateAdmin(MemberDTO dto) {
		return sqlSession.selectOne("member.adminUpdate", dto);
	}
	//순번셀렉
	@Override
	public MemberDTO memberSelect(int member_idx) {
		 return sqlSession.selectOne("member.memberSelect", member_idx);
	}
	
	public void memberSelectDelete(MemberDTO dto) {
		sqlSession.delete("member.memberSelectDelete", dto);
	}

	@Override
	public void deleteMember(String idxs) {
		sqlSession.delete("member.memberSelectDelete", idxs);
	}
	
}
