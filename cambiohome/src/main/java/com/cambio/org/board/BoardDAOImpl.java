package com.cambio.org.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cambio.common.Pagination;
import com.cambio.common.Search;
import com.cambio.org.board.BoardDTO;
import com.cambio.org.board.ReplyDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	
//	@Override
//	public List<BoardDTO> getBoardList(Pagination pagination) throws Exception {
//		return sqlSession.selectList("board.getBoardList",pagination);
//	}
	@Override
	public List<BoardDTO> getBoardList(Search search) throws Exception {
		return sqlSession.selectList("board.getBoardList",search);
	}
	
	@Override
	public BoardDTO getBoardContent(int bid) throws Exception {
		return sqlSession.selectOne("board.getBoardContent", bid);
	}
	@Override
	public int insertBoard(BoardDTO dto) throws Exception {
		return sqlSession.insert("board.insertBoard", dto);
	}
	@Override
	public int updateBoard(BoardDTO dto) throws Exception {
		return sqlSession.update("board.updateBoard", dto);
	}
	@Override
	public int deleteBoard(int bid) throws Exception {
		return sqlSession.delete("board.deleteBoard", bid);
	}
	@Override
	public int updateViewCnt(int bid) throws Exception {
		return sqlSession.update("board.updateViewCnt", bid);
	}
//	@Override
//	public int getBoardListCnt() throws Exception {
//		return sqlSession.selectOne("board.getBoardListCnt");
//	}
	
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return sqlSession.selectOne("board.getBoardListCnt",search);
	}
	
	//댓글 리스트
	@Override
	public List<ReplyDTO> getReplyList(int bid) throws Exception {
		return sqlSession.selectList("boardreply.getReplyList", bid);
	}
	@Override
	public int saveReply(ReplyDTO replyDTO) throws Exception {
		return sqlSession.insert("boardreply.saveReply",replyDTO);
	}
	@Override
	public int updateRelpy(ReplyDTO replyDTO) throws Exception {
		return sqlSession.update("boardreply.updateReply",replyDTO);
	}
	@Override
	public int deleteReply(int rid) throws Exception {
		return sqlSession.delete("boardreply.deleteReply", rid);
	}
	
}
