package spring.biz.todo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import mappers.TodoMapper;
import spring.biz.todo.vo.TodoVO;

@Repository("tododao")
public class TodoDAO {
	
	SqlSession sqlSession = null;
	TodoMapper ui = null;
	
	@Inject
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
		ui = sqlSession.getMapper(TodoMapper.class);
	}
	public SqlSession getSqlSession() {
		return sqlSession;
	}
	
	public int addTodo(TodoVO vo) {
		System.out.println("TodoDAO_addTodo");
		return ui.addTodo(vo);
	}
	
	public int removeTodo(int tseq) {
		System.out.println("TodoDAO_removeTodo");
		return ui.removeTodo(tseq);
	}
	
	public int updateTodo(TodoVO vo) {
		System.out.println("TodoDAO_updateTodo");
		return ui.updateTodo(vo);
	}
	
	public TodoVO getTodo(int tseq) {
		System.out.println("TodoDAO_getTodo");
		return ui.getTodo(tseq);
	}
	
	public List<TodoVO> getTodoList(String tododate, String id){
		return ui.getTodoList(tododate, id);
	}
	
}
