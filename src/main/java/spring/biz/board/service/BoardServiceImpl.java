package spring.biz.board.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import spring.biz.board.dao.BoardDAO;
import spring.biz.board.vo.BoardVO;

@Repository("boardservice")
public class BoardServiceImpl implements BoardService{

	@Resource(name = "bmybatis")
	BoardDAO dao;
	//dao생성자
	public BoardServiceImpl() {
		super();
	}

	public BoardServiceImpl(BoardDAO dao) {
		super();
		this.dao = dao;
	}

	//인터페이스 구현 부.

	public int addBoard(BoardVO board) {
		return dao.addBoard(board);
	}

	public int removeBoard(int bseq) {
		return dao.removeBoard(bseq);
	}

	public int updateBoard(BoardVO board) {
		return dao.updateBoard(board);
	}

	public List<BoardVO> getBoardList() {
		return dao.getBoardList();
	}

	public BoardVO getBoard(int bseq) {
		return dao.getBoard(bseq);
	}

	public List<BoardVO> getFriendList(String keyword) {
		return dao.getFriendList(keyword);
	}

	public List<BoardVO> getMyList(String keyword) {
		return dao.getMyList(keyword);
	}

	public List<BoardVO> footPrint(int date) {
		return dao.footPrint(date);
	}

	public int cntLike(int bseq) {
		return dao.cntLike(bseq);
	}

}
