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
	//회원목록
	@Override
	public List<MemberDTO> memberList(){
		return sqlSession.selectList("member.memberList");
	}
	//회원가입
	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insertMember",dto);
	}
	//회원정보보기
	@Override
	public MemberDTO vieMember(String member_id) {
		return sqlSession.selectOne("member.viewMember",member_id);
	}
	//회원삭제
	@Override
	public void deleteMember(String member_id) {
		sqlSession.delete("member.deleteMember",member_id);
	}
	//회원정보수정
	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember",dto);
	}
	//로그인
	@Override
	public boolean checklogin(String member_id, String member_pw) {
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
}
