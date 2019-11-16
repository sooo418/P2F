package mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import spring.biz.board.vo.BoardVO;

public interface BoardMapper {

	@Insert("insert into board(bseq, bcontent,latitude,longitude, img,open,cntlike, id) "
			+ "values((select nvl(max(bseq),0)+1 from board),"
			+ "#{bcontent},#{latitude},#{longitude},#{img},#{open},0, #{id})")
	int addBoard(BoardVO board);

	@Delete("delete from Board where bseq = #{bseq}")
	int removeBoard(int bseq);

	@Select("select * from board order by regdate desc")
	List<BoardVO> getBoardList();

	@Select("select * from board where bseq = #{bseq}")
	BoardVO getBoard(int bseq);

	@Update("update board set bcontent=#{bcontent}, img=#{img},"
			+ "latitude=#{latitude}, longitude=#{longitude}, open=#{open} where bseq =#{bseq}")
	int updateBoard(BoardVO board);

	@Select("select * from board where regdate between sysdate -#{date} and sysdate")
	List<BoardVO> footPrint(int date);

	@Select("select * from board where id = #{id}  order by regdate desc")
	List<BoardVO> getMyList(String keyword);

	@Select("select * from board where id = #{id} and latitude is not null and longitude is not null order by regdate desc")
	List<BoardVO> getFriendList(String keyword);
}
