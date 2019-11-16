package spring.biz.user.dao;

import java.util.List;
import spring.biz.user.vo.UserVO;

public interface UserDAO {
	public UserVO login(String id, String pw);

	public int addUser(UserVO user);

	public int updateUser(UserVO user);

	public UserVO getUser(String id);

	public int setNewPassword(UserVO user);

	public List<UserVO> getUserList();

	/*
	 * public List<UserVO> searchUser(String condition, String keyword);
	 * 
	 * public int removeUser(String id);
	 * 
	 * public List<UserVO> getFriendList(String id);
	 * 
	 * public UserVO findPassword(UserVO user);
	 */

}
