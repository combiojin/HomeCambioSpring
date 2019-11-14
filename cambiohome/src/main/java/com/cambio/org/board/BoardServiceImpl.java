package com.cambio.org.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cambio.org.board.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO boardDAO;

	public List<BoardDTO> getBoardList() throws Exception {
		return boardDAO.getBoardList();
	}
	
	@Override
	public void insertBoard(BoardDTO dto) throws Exception {
		boardDAO.insertBoard(dto);
	}
	
	public BoardDTO getBoardContent(int bid) throws Exception {
		boardDAO.updateViewCnt(bid);
		return boardDAO.getBoardContent(bid);
	}
	
	@Override
	public void updateBoard(BoardDTO dto) throws Exception {
		boardDAO.updateBoard(dto);
	}
	
	@Override
	public void deleteBoard(int bid) throws Exception {
		boardDAO.deleteBoard(bid);
	}
	
}
