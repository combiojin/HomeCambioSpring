package com.cambio.org.board;

import java.util.List;

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
	
}
