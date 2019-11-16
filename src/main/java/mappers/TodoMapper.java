package mappers;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import spring.biz.todo.vo.TodoVO;

public interface TodoMapper {

	@Insert("insert into todo (tseq, tcontent, latitude,"
			+ " longitude, tododate, priority, sharing, id)"
			+ " values((select nvl(max(tseq),0)+1 from todo), #{tcontent},"
			+ " #{latitude}, #{longitude}, TO_TIMESTAMP(#{tododate},'YYYY.MM.DD HH24:MI'), #{priority}, #{sharing}, #{id})")
	int addTodo(TodoVO vo);
	
	@Delete("delete from todo where tseq=#{tseq}")
	int removeTodo(int tseq);
	
	@Update("update todo set tcontent=#{tcontent}, latitude=#{latitude}, longitude=#{longitude},"
			+ " tododate=TO_TIMESTAMP(#{tododate},'YYYY.MM.DD HH24:MI'), priority=#{priority}, "
			+ "sharing=#{sharing} where tseq=#{tseq}")
	int updateTodo(TodoVO vo);
	
	@Select("select tseq, tcontent, latitude, longitude, to_char(tododate,'yyyy.mm.dd hh24:mi') as tododate,"
			+ " priority, sharing, id from todo where tseq=#{tseq}")
	TodoVO getTodo(int tseq);
	
	@Select("select tseq, tcontent, latitude, longitude, to_char(tododate,'yyyy.mm.dd hh24:mi') as tododate,"
			+ " priority, sharing, id from todo where id=#{id} and tododate between to_date(#{tododate}, 'YYYYMMDD')"
			+ " and to_date(#{tododate}, 'YYYYMMDD')+1")
	List<TodoVO> getTodoList(@Param("tododate")String tododate, @Param("id") String id);
	
}
