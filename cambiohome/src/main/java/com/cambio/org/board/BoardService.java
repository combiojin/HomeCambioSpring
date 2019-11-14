package com.cambio.org.board;

import java.util.List;

import com.cambio.org.board.BoardDTO;

public interface BoardService {

	public List<BoardDTO> getBoardList() throws Exception;
	
}
