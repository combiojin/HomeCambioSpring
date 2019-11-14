package com.cambio.org.board;

import java.util.List;

import com.cambio.org.board.BoardDTO;

public interface BoardDAO {

	public List<BoardDTO> getBoardList() throws Exception;
	public BoardDTO getBoardContent(int bid) throws Exception;
	public int insertBoard(BoardDTO dto) throws Exception;
	public int updateBoard(BoardDTO dto) throws Exception;
	public int deleteBoard(int bid) throws Exception;
	public int updateViewCnt(int bid) throws Exception;
	
}
