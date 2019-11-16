package spring.biz.todo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import spring.biz.todo.vo.TodoVO;

@Service
public interface TodoService {
	public int addTodo(TodoVO vo);
	
	public int removeTodo(int tseq);
	
	public int updateTodo(TodoVO vo);
	
	public TodoVO getTodo(int tseq);
	
	public List<TodoVO> getTodoList(String tododate, String id);
}
