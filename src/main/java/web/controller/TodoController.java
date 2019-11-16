package web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.biz.board.vo.BoardVO;
import spring.biz.todo.service.TodoService;
import spring.biz.todo.vo.TodoVO;
import web.validator.TodoValidator;

@Controller
public class TodoController {

	static final Logger LOGGER = LoggerFactory.getLogger("root");
	
	@Autowired
	ApplicationContext context;
	
	@Autowired
	TodoService tservice;
	
	@RequestMapping(value = "/todo/add.do", method = RequestMethod.GET)
	public String addTodo() {
		return "todo/todo_write";
	}
	
	@RequestMapping(value = "/todo/add.do", method = RequestMethod.POST)
	public String addTodoProc(@ModelAttribute("todo") TodoVO vo, 
			HttpServletRequest request, 
			BindingResult errors) {
		new TodoValidator().validate(vo, errors);
		if(errors.hasErrors()) {
			return "todo/todo_write";
		}
		int row = 0;
		row = tservice.addTodo(vo);
		String msg = null;
		msg = context.getMessage("add", new Object[] {vo.toString()}, Locale.KOREA);
		System.out.println(msg);
		LOGGER.info(msg);
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat( "yyyyMMdd", Locale.KOREA );
		Date currentdate = new Date();
		String date = mSimpleDateFormat.format(currentdate);
		List<TodoVO> list = tservice.getTodoList(date, request.getParameter("id"));
		request.getSession().setAttribute("todos", list);
		return "redirect:../index.do";
	}
	@RequestMapping("/todo/view.do")
	public ModelAndView getView(int tseq) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("todo", tservice.getTodo(tseq));
		mav.setViewName("todo/todo_view");
		return mav;
	}
	@RequestMapping(value = "/todo/update.do", method = RequestMethod.GET)
	public ModelAndView updateTodo(int tseq) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("todo", tservice.getTodo(tseq));
		mav.setViewName("todo/todo_modify");
		return mav;
	}
	@RequestMapping(value = "/todo/update.do", method = RequestMethod.POST)
	public String updateTodo(@ModelAttribute("todo") TodoVO vo,
			HttpServletRequest request,
			BindingResult errors) {
		new TodoValidator().validate(vo, errors);
		if(errors.hasErrors()) {
			return "todo/todo_modify";
		}
		int row = 0;
		row = tservice.updateTodo(vo);
		String msg = null;
		msg = context.getMessage("update", new Object[] {vo.toString()}, Locale.KOREA);
		LOGGER.info(msg);
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat( "yyyyMMdd", Locale.KOREA );
		Date currentdate = new Date();
		String date = mSimpleDateFormat.format(currentdate);
		List<TodoVO> list = tservice.getTodoList(date, request.getParameter("id"));
		request.getSession().setAttribute("todos", list);
		return "redirect:../index.do";
	}
	@RequestMapping("/todo/remove.do")
	public String removeTodo(int tseq,
			HttpServletRequest request) {
		int row = 0;
		String msg = null;
		msg = context.getMessage("remove", new Object[] {tservice.getTodo(tseq).toString()}, Locale.KOREA);
		System.out.println(msg);
		LOGGER.info("TodoDAO_removeTodo==================================================================================");
		LOGGER.info(msg);
		row = tservice.removeTodo(tseq);
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat( "yyyyMMdd", Locale.KOREA );
		Date currentdate = new Date();
		String date = mSimpleDateFormat.format(currentdate);
		List<TodoVO> list = tservice.getTodoList(date, request.getParameter("id"));
		request.getSession().setAttribute("todos", list);
		return "redirect:../index.do";
	}
	@RequestMapping("/todo/addboard.do")
	public ModelAndView addBoard(@RequestParam("tseq") int tseq) {
		System.out.println("tseq:"+tseq);
		ModelAndView mav = new ModelAndView();
		TodoVO vo = tservice.getTodo(tseq);
		BoardVO board = new BoardVO();
		board.setBcontent(vo.getTcontent());
		board.setLatitude(vo.getLatitude());
		board.setLongitude(vo.getLongitude());
		board.setId(vo.getId());
		mav.addObject("board", board);
		mav.setViewName("/board/board_GetTodo");
		
		return mav;
	}
}
