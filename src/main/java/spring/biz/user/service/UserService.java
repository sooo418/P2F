package spring.biz.user.service;

import java.util.List;

import spring.biz.user.vo.UserVO;

public interface UserService {

	public UserVO login(String id, String pw);

	public int addUser(UserVO user);

	public int updateUser(UserVO user);

	public UserVO getUser(String id);

	public int setNewPassword(UserVO user);

	/*
	 * public int removeUser(String id);
	 * 
	 * public List<UserVO> searchUser(String condition, String keyword);
	 * 
	 * public List<UserVO> getUserList();
	 * 
	 * public List<UserVO> getFriendList(String id);
	 * 
	 * public UserVO findPassword(UserVO user);
	 */


};
