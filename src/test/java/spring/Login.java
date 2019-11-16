//package spring;
//
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//
//import spring.biz.board.service.BoardService;
//import spring.biz.board.vo.BoardVO;
//import spring.biz.user.service.UserService;
//import spring.biz.user.vo.UserVO;
//
//public class Login {
//
//	public static void main(String[] args) {
//		String[] config = { "applicationContext.xml" };
//		ApplicationContext context = new ClassPathXmlApplicationContext(config);
//
//		BoardService bs = (BoardService) context.getBean("boardservice");
//		UserService us = (UserService) context.getBean("userservice");
//
//		UserVO uvo = us.login("서혁진바보", "귀찮아");
//		if (uvo != null) {
//			BoardVO vo = new BoardVO();
//			vo.setTitle("서혁진은");
//			vo.setWriter("ㅇㅇㅇ");
//			vo.setContent("바보.....");
//			vo.setUserid(uvo.getUserid());
//			bs.addBoard(vo);
//
//		} else {
//			System.out.println("등록되지 않은 회원 정보입니다.");
//		}
//
//	}
//
//}
