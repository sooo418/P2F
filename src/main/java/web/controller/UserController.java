package web.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.biz.user.service.UserService;
import spring.biz.user.vo.UserVO;
import web.validator.UserValidator;

@Controller
public class UserController {

	@Autowired
	UserService service;

//	@RequestMapping("/user/list.do")
//	public ModelAndView getUserList() {
//		ModelAndView mav = new ModelAndView();
//
//		mav.addObject("users", service.getUserList());
//		mav.setViewName("user/user_list");
//
//		return mav;
//	}

	@RequestMapping(value = "add.do", method = RequestMethod.GET)
	public String addUser() {
		return "user/user_add";
	}

	@RequestMapping(value = "add.do", method = RequestMethod.POST)
	public String addUserProc(@ModelAttribute("user") UserVO user, @RequestParam("file") MultipartFile file,
			HttpServletRequest request, BindingResult errors) throws IOException {

		String path = request.getRealPath("/images/");
		System.out.println("[파일 경로] : path " + path);
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			file.transferTo(new File(path + filename));
			user.setProfile(filename);
		}
		String pw = user.getPw().split(",")[1];
		user.setPw(pw);
		System.out.println(user);
		service.addUser(user);
		return "redirect:index.do";
	}

	/*
	 * @RequestMapping("/checklogin.do")
	 * 
	 * @ResponseBody public int getLogin(@RequestParam("id") String
	 * id,@RequestParam("pw") String pw) { int cnt = 0; UserVO vo =
	 * service.login(id, pw); if (vo != null) cnt = 1; System.out.println("cnt " +
	 * cnt);
	 * 
	 * return cnt; }
	 */
	@RequestMapping("/idcheck.do")
	@ResponseBody
	public int getIdCheck(@RequestParam("id") String id) {
		int cnt = 0;
		UserVO vo = service.getUser(id);
		if (vo != null)
			cnt = 1;
		return cnt;
	}

	@RequestMapping("/hintcheck.do")
	@ResponseBody
	public int getIdCheck(@RequestParam("id") String id, @RequestParam("hint") String hint) {
		int cnt = 0;
		UserVO vo = service.getUser(id);
		if (vo != null) {
			System.out.println(vo.getHint() + " " + hint);
			if (hint.equals(vo.getHint()))
				cnt = 1;
		}
		return cnt;
	}

	@RequestMapping(value = "findpw.do", method = RequestMethod.GET)
	public String findPassword() {
		return "user/user_findpw";
	}

	@RequestMapping(value = "findpw.do", method = RequestMethod.POST)
	public String findPasswordProc(@ModelAttribute("user") UserVO user, HttpServletRequest request,
			BindingResult errors) {
		new UserValidator().validate(user, errors);
		System.out.println(errors);
		if (errors.hasErrors()) {
			return "user/user_add";
		}
		System.out.println(user);
		service.addUser(user);

		return "redirect:index.do";
	}

	@RequestMapping(value = "changepw.do", method = RequestMethod.POST)

	public String changePw(@ModelAttribute("user") UserVO user, HttpServletRequest request, BindingResult errors) {

		// new UserValidator().validate(user, errors);
		// System.out.println(errors);
		String pw = user.getPw().split(",")[1];
		user.setPw(pw);
		int res = service.setNewPassword(user);
		System.out.println("[ 비밀번호 재설정 ] [id : " + user.getId() + " pw : " + user.getPw() + "]");
		return "redirect:index.do";
	}

	@RequestMapping(value = "/user/view.do")
	public ModelAndView getView(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("user", service.getUser(id));
		System.out.println("[프로필 수정 요청]");
		mav.setViewName("user/user_view");
		return mav;
	}

	@RequestMapping("/user/modify.do")
	public ModelAndView modify(@RequestParam("id") String id) {
		ModelAndView mav = new ModelAndView();
		UserVO vo = service.getUser(id);
		mav.addObject("user", service.getUser(id));
		System.out.println("[프로필 수정중]");
		mav.setViewName("user/user_modify");
		return mav;
	}

	@RequestMapping(value = "/user/update.do")
	public ModelAndView update(@ModelAttribute("user") UserVO user, @RequestParam("file") MultipartFile file,
			HttpServletRequest request, BindingResult errors) throws IOException {

		String path = request.getRealPath("/images/projectimg/");
		System.out.println("[파일 경로] : path " + path);
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			file.transferTo(new File(path + filename));
			user.setProfile(filename);
		}
		ModelAndView mav = new ModelAndView();
		service.updateUser(user);
		mav.addObject("user", service.getUser(user.getId()));
		System.out.println("[프로필 수정 완료]");
		mav.setViewName("user/user_view");
		return mav;
	}

//
//	@RequestMapping(value = "/user/search.do")
//	public ModelAndView search(String searchCondition, String searchKeyword) {
//
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("users", service.searchUser(searchCondition, searchKeyword));
//		mav.setViewName("user/user_list");
//
//		return mav;
//	}
//
	/*
	 * @ExceptionHandler(Exception.class) public String Ex(Exception exception,
	 * Model model) { model.addAttribute("exception", exception); return "error"; }
	 */

}
