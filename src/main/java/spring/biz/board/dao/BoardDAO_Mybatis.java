package spring.biz.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mappers.BoardMapper;
import spring.biz.board.vo.BoardVO;


@Repository("bmybatis")
public class BoardDAO_Mybatis implements BoardDAO{
	
	SqlSession sqlSession = null;
	BoardMapper ui = null;
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		// sqlsession이 생성자에 의해 메모에 띄워진 후 ui에 주입되어야 하므로
		// 순서를 잘 생각해야 한다~
		this.sqlSession = sqlSession;
		ui = sqlSession.getMapper(BoardMapper.class);
	}
	public int addBoard(BoardVO board) {
		System.out.println("mybatis");
		int row = ui.addBoard(board);
		System.out.println(row);
		return row;

	}

	public int removeBoard(int bseq) {
		System.out.println("mybatis");

		return ui.removeBoard(bseq);
	}

	public int updateBoard(BoardVO board) {
		return ui.updateBoard(board);
	}

	public List<BoardVO> getBoardList() {
		System.out.println("mybatis");

		return ui.getBoardList();
	}

	
	
	public BoardVO getBoard(int bseq) {
		return ui.getBoard(bseq);
	}

	
	
	public List<BoardVO> getFriendList(String Keyword) {
		return ui.getFriendList(Keyword);
	}

	public List<BoardVO> getMyList(String Keyword) {
		return ui.getMyList(Keyword);
	}

	public List<BoardVO> footPrint(int date) {
		return ui.footPrint(date);
	}

	public int cntLike(int bseq) {
		return cntLike(bseq);
	}

}
