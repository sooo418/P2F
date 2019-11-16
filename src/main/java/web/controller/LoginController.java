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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.biz.todo.service.TodoService;
import spring.biz.todo.vo.TodoVO;
import spring.biz.user.service.UserService;
import spring.biz.user.vo.UserVO;

@Controller
public class LoginController {
	@Autowired
	UserService service;
	@Autowired
	TodoService tservice;
	@Autowired
	ApplicationContext context;
	private String userid = null;

	static final Logger LOGGER = LoggerFactory.getLogger("root");

	public String getUserId() {
		return userid;
	}

	public void setUserId(String userid) {
		this.userid = userid;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "redirect:index.do";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginProc(@ModelAttribute("user") UserVO vo, HttpServletRequest request) {
		if (vo.getId() == null || vo.getPw() == null) {
			return "redirect:login.do";
		}
		UserVO user = service.login(vo.getId(), vo.getPw());
		if (user.getId() !="-1") {
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("login", user);
			setUserId(vo.getId());
			System.out.println(getUserId());
			SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
			Date currentdate = new Date();
			String date = mSimpleDateFormat.format(currentdate);
			List<TodoVO> list = tservice.getTodoList(date, user.getId());
			request.getSession().setAttribute("todos", list);
			System.out.println("userinfo" + user);
			return "redirect:index.do";
		} else {
			request.setAttribute("msg", "로그인 정보를 다시 입력하세요.");
			return "redirect:index.do";
		}

	}

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		String msg = null;
		msg = context.getMessage("logout", new Object[] { getUserId() }, Locale.KOREA);
		System.out.println(msg);
		LOGGER.info(msg);
		request.getSession().invalidate(); // 세션객체 파괴
		request.setAttribute("msg", "로그아웃 되었습니다.");
		return "redirect:index.do";
	}

	@RequestMapping("/todo/cal.do")
	public String calTodo(String href, String tododate, HttpServletRequest request) {
		List<TodoVO> list = tservice.getTodoList(tododate, getUserId());
		request.getSession().setAttribute("todos", list);
		String location = "redirect:"+href;
		return location;
	}
}
