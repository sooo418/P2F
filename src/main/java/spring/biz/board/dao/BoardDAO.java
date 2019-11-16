package spring.biz.board.dao;

import java.util.List;

import spring.biz.board.vo.BoardVO;

public interface BoardDAO {
		
	int addBoard(BoardVO board);
	
	int removeBoard(int bseq);
	
	int updateBoard(BoardVO board);
	
	List<BoardVO> getBoardList();
	
	BoardVO getBoard(int bseq);
	
	List<BoardVO> getFriendList(String keyword);
	
	List<BoardVO> getMyList(String keyword);

	List<BoardVO> footPrint(int date);
	
	int cntLike(int bseq);
	
}
