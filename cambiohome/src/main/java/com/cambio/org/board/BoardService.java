package com.cambio.org.board;

import java.util.List;
import java.util.Map;

import com.cambio.org.board.BoardDTO;

public interface BoardService {

	public List<BoardDTO> getBoardList() throws Exception;
	
	public void insertBoard(BoardDTO dto) throws Exception;
	
	public BoardDTO getBoardContent(int bid) throws Exception;
	
	public void updateBoard(BoardDTO dto) throws Exception;
	
	public void deleteBoard(int bid) throws Exception;
}
