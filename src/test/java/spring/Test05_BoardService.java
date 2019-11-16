//package spring;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//
//import spring.biz.board.service.BoardService;
//import spring.biz.board.vo.BoardVO;
//import spring.biz.user.service.UserService;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
//
//public class Test05_BoardService {
//
//	@Resource(name = "boardservice")
//	BoardService service;
//	@Resource(name = "userservice")
//	UserService uservice;
//
//	// @Test
//	public void login() {
//
//		System.out.println(uservice.login("admin", "a1234"));
//	}
//
//	// @Test
//	public void list() {
//		if (service != null) {
//			List<BoardVO> list = service.getBoardList();
//			list.forEach(i -> System.out.println(i));
//		}
//	}
//
//	// @Test
//	public void add() {
//		BoardVO vo = new BoardVO();
//		vo.setTitle("임시제목");
//		vo.setWriter("ㅇㅇㅇ");
//		vo.setContent("임시내용.....");
//		int row = service.addBoard(vo);
//		System.out.println("insert => " + row);
//	}
//
//	// @Test
//	public void update() {
//		BoardVO Board = service.getBoard(11);
//		Board.setTitle("바보");
//		int row = service.updateBoard(Board);
//		System.out.println("update : " + row);
//	}
//
//	// @Test
//	public void getBoard() {
//		System.out.println(service.getBoard(12));
//
//	}
//
//	// @Test
//	public void searchBoard() {
//		if (service != null) {
//			List<BoardVO> list = service.searchBoard("seq", "1");
//			list.forEach(i -> System.out.println(i));
//		}
//	}
//
//	@Test
//	public void removeBoard() {
//		int row = service.removeBoard(9);
//		System.out.println("remove : " + row);
//	}
//
//}
