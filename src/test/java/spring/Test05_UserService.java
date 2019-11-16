/*
 * package spring;
 * 
 * import java.util.List;
 * 
 * import org.junit.Test; import org.junit.runner.RunWith; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.test.context.ContextConfiguration; import
 * org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 * 
 * import spring.biz.user.service.UserService; import spring.biz.user.vo.UserVO;
 * 
 * @RunWith(SpringJUnit4ClassRunner.class)
 * 
 * @ContextConfiguration(locations = { "classpath:applicationContext.xml" })
 * 
 * public class Test05_UserService {
 * 
 * @Autowired UserService service;
 * 
 * // @Test public void login() { System.out.println(service.login("ooo",
 * "0805")); }
 * 
 * // @Test public void list() { if (service != null) { List<UserVO> list =
 * service.getUserList(); list.forEach(i -> System.out.println(i)); } }
 * 
 * // @Test public void add() { UserVO user = new UserVO("ms", "황민승", "1011",
 * "깍1", "010-1616-1616", "ms.jpg", "남", "멀캠16층"); // UserVO user = new
 * UserVO("서혁진바보", "아이고", "귀찮아", "igo@gmail.com", // "010-5252-5252", "인천 부평");
 * int row = service.addUser(user); System.out.println("insert => " + row); }
 * 
 * @Test public void update() { UserVO user = service.getUser("ms");
 * user.setPhone("010-5469-7452"); user.setHint("밥그릇"); int row =
 * service.updateUser(user); System.out.println("update : " + row); }
 * 
 * // @Test public void getUser() { System.out.println(service.getUser("ooo"));
 * 
 * }
 * 
 * // @Test public void searchUser() { if (service != null) { List<UserVO> list
 * = service.searchUser("name", "오은애"); list.forEach(i ->
 * System.out.println(i)); } }
 * 
 * // @Test public void removeUser() { int row = service.removeUser("ms");
 * System.out.println("remove : " + row); }
 * 
 * //@Test public void getFriendList() { List<UserVO> list =
 * service.getFriendList("ooo"); list.forEach(i -> System.out.println(i)); }
 * 
 * }
 */