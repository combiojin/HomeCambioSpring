package com.cambio.org.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cambio.common.Pagination;
import com.cambio.common.Search;
import com.cambio.org.board.BoardDTO;
import com.cambio.org.error.NotFoundException;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;

//	public List<BoardDTO> getBoardList(Pagination pagination) throws Exception {
//		return boardDAO.getBoardList(pagination);
//	}

	@Override
	public List<BoardDTO> getBoardList(Search search) throws Exception {
		return boardDAO.getBoardList(search);
	}

	@Override
	public void insertBoard(BoardDTO dto) throws Exception {
		boardDAO.insertBoard(dto);
	}

	@Transactional
	@Override
	public BoardDTO getBoardContent(int bid) throws Exception {
		BoardDTO dto = new BoardDTO();
		boardDAO.updateViewCnt(bid);
		dto = boardDAO.getBoardContent(bid);
//		try {
//			dto.setBid(bid);
//			dto.setCate_cd("11111111111111111111111111111111111111111111111111111111111111111");
//			boardDAO.updateBoard(dto);	
//		} catch (RuntimeException e) {
//			throw new NotFoundException();
//		}
//				
		return dto;
	}

	@Override
	public void updateBoard(BoardDTO dto) throws Exception {
		boardDAO.updateBoard(dto);
	}

	@Override
	public void deleteBoard(int bid) throws Exception {
		boardDAO.deleteBoard(bid);
	}

//	@Override
//	public int getBoardListCnt() throws Exception {
//		return boardDAO.getBoardListCnt();
//	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return boardDAO.getBoardListCnt(search);
	}
	
	@Override
	public void deleteSelectBoard(String idxs) {
		boardDAO.deleteSelectBoard(idxs);
	}
		

	// 댓글 리스트
	@Override
	public List<ReplyDTO> getReplyList(int bid) throws Exception {
		return boardDAO.getReplyList(bid);
	}

	@Override
	public int saveReply(ReplyDTO replyDTO) throws Exception {
		return boardDAO.saveReply(replyDTO);
	}

	@Override
	public int updateRelpy(ReplyDTO replyDTO) throws Exception {
		return boardDAO.updateRelpy(replyDTO);
	}

	@Override
	public int deleteReply(int rid) throws Exception {
		return boardDAO.deleteReply(rid);
	}
}
