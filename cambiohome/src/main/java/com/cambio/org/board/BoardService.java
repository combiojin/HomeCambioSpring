package com.cambio.org.board;

import java.util.List;
import java.util.Map;

import com.cambio.common.Pagination;
import com.cambio.common.Search;
import com.cambio.org.board.BoardDTO;

public interface BoardService {

//	public List<BoardDTO> getBoardList(Pagination pagination ) throws Exception;
	public List<BoardDTO> getBoardList(Search search) throws Exception;
	
	public void insertBoard(BoardDTO dto) throws Exception;
	
	public BoardDTO getBoardContent(int bid) throws Exception;
	
	public void updateBoard(BoardDTO dto) throws Exception;
	
	public void deleteBoard(int bid) throws Exception;
	
//	public int getBoardListCnt() throws Exception;
	public int getBoardListCnt(Search search) throws Exception;
	
	public void deleteSelectBoard(String idxs);
	
	//댓글 리스트
	public List<ReplyDTO> getReplyList(int bid) throws Exception;
	public int saveReply(ReplyDTO replyDTO) throws Exception;
	public int updateRelpy(ReplyDTO replyDTO) throws Exception;
	public int deleteReply(int rid) throws Exception;
}
