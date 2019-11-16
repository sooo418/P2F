package spring.biz.todo.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;

import spring.biz.todo.dao.TodoDAO;
import spring.biz.todo.vo.TodoVO;

@Repository("todoservice")
public class TodoServiceImpl implements TodoService{
	
	@Autowired
	TodoDAO dao;
	
	@Autowired
	ApplicationContext context;
	
	static final Logger LOGGER = LoggerFactory.getLogger("root");
	
	public TodoServiceImpl() {
		super();
	}

	public TodoServiceImpl(TodoDAO dao) {
		this.dao = dao;
	}

	public TodoDAO getDao() {
		return dao;
	}

	public void setDao(TodoDAO dao) {
		this.dao = dao;
	}

	@Override
	public int addTodo(TodoVO vo) {
		LOGGER.info("Todo_addTodo==================================================================================");
		return dao.addTodo(vo);
	}

	@Override
	public int removeTodo(int tseq) {
		return dao.removeTodo(tseq);
	}

	@Override
	public int updateTodo(TodoVO vo) {
		LOGGER.info("Todo_updateTodo==================================================================================");
		return dao.updateTodo(vo);
	}

	@Override
	public TodoVO getTodo(int tseq) {
		LOGGER.info("Todo_getTodo==================================================================================");
		return dao.getTodo(tseq);
	}

	@Override
	public List<TodoVO> getTodoList(String tododate, String id) {
		return dao.getTodoList(tododate, id);
	}

}
