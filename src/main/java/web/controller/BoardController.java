package web.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.biz.board.service.BoardService;
import spring.biz.board.vo.BoardVO;
import web.validator.BoardValidator;

@Controller
public class BoardController {// login 세션을 활용하는 부분은 수정 요망.. 나머지 보드관련은 Bseq로 접근해서 괜춘
	@Autowired
	BoardService service;

	@RequestMapping("/index.do")
	   public ModelAndView getBoardList() {
	      ModelAndView mav = new ModelAndView();         
	      mav.addObject("boards",service.getBoardList());//전체리스트는 로그인 여부에 상관없이 뿌려준다.
	     
	      mav.setViewName("index");
	      
	      return mav;
	   }

	@RequestMapping("/mylist.do")
	public ModelAndView getMyList(@RequestParam("id")String id) {// 발자취에서도 재활용 할수 있을듯
		ModelAndView mav = new ModelAndView();

		mav.addObject("boards", service.getMyList(id));// test01에 로그인 세션에 저장된 아이디 삽입
		mav.setViewName("index");

		return mav;
	}

	@RequestMapping("/board/footprint.do")
	public ModelAndView getFootprint(@RequestParam("id")String id) {// 발자취에서도 재활용 할수 있을듯
		ModelAndView mav = new ModelAndView();

		mav.addObject("boards", service.getFriendList(id));// test01에 로그인 세션에 저장된 아이디 삽입
		mav.setViewName("board/board_footprint");

		return mav;
	}

	@RequestMapping(value = "/board/add.do", method = RequestMethod.GET)
	public String addBoard() {// board추가 페이지를 단순히 띄워주는 용도
		System.out.println("여기까진 된거지???");
		return "board/board_write";
	}

	@RequestMapping(value = "/board/add.do", method = RequestMethod.POST)
	public String addBoardProc(@ModelAttribute("board") BoardVO vo, HttpServletRequest request, BindingResult errors)
			throws IOException {
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println("uploadFile: " + uploadFile);

		System.out.println("img: " + vo.getImg());
		String path = request.getRealPath("/images/projectimg/");
		System.out.println("path!!!!  " + path);
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(path + fileName));

			System.out.println("sppp: " + fileName);
			vo.setImg(fileName);
		}

		new BoardValidator().validate(vo, errors);
		// 여기서 중요한게 만들때 login session 안에 있는 아이디를 또 삽입 시켜줘야함
		if (errors.hasErrors()) {
			System.out.println("에러가뜨면?");
			return "board/board_write";
		}
		System.out.println(vo);
		service.addBoard(vo);

		return "redirect:../index.do";

	}

	@RequestMapping(value = "/board/view.do") // 상세화면
	public ModelAndView getView(@RequestParam("bseq") int bseq) {
		ModelAndView mav = new ModelAndView();
		System.out.println("bseq" + bseq);
		mav.addObject("board", service.getBoard(bseq));
		mav.setViewName("board/board_view");

		return mav;

	}

	@RequestMapping(value = "/board/modify.do") // 수정화면으로 진입할때 그 글의 id를 받아온다.
	public ModelAndView modify(@RequestParam("bseq") int bseq) {
		ModelAndView mav = new ModelAndView();
		System.out.println("이거떠요? ");
		System.out.println("시퀀스 잘떠요?: " + bseq);
		System.out.println("수정화면에서의 vo: " + service.getBoard(bseq));
		mav.addObject("board", service.getBoard(bseq));

		mav.setViewName("board/board_modify");
		return mav;
	}

	@RequestMapping(value = "/board/update.do") // 진짜 수정하는 부분
	public ModelAndView update(@ModelAttribute("board") BoardVO vo, HttpServletRequest request) throws IOException {
		ModelAndView mav = new ModelAndView();
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println("uploadFile:  updated에서 ㅎㅎ" + uploadFile);

		System.out.println("img:  updated에서 ㅎ" + vo.getImg());
		String path = request.getRealPath("/images/projectimg/");
		System.out.println("path!!!! updated에서 " + path);

		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File(path + fileName));

			System.out.println("sppp(update에서 ㅋ): " + fileName);
			vo.setImg(fileName);
		}

		System.out.println("Boardvo 출력해보기1" + vo);

		service.updateBoard(vo);
		System.out.println("Boardvo 출력해보기2" + vo);

		mav.addObject("board", service.getBoard(vo.getBseq()));
		service.getBoard(vo.getBseq());

		System.out.println("수정가능??");
		System.out.println("Boardvo 출력해보기3" + vo);
		mav.setViewName("board/board_view");
		return mav;
	}

	@RequestMapping("/board/remove.do")
	public String remove(int bseq) {
		service.removeBoard(bseq);
		System.out.println("시퀀스: " + bseq);

		return "redirect:../index.do";
	}

}
