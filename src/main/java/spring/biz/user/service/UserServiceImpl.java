package spring.biz.user.service;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Repository;

import spring.biz.user.dao.UserDAO;
import spring.biz.user.vo.UserVO;

@Repository("userservice")
public class UserServiceImpl implements UserService {
	@Resource(name = "mybatis")
	UserDAO dao;

	@Autowired
	ApplicationContext context;

	public UserServiceImpl() {
		super();
	}

	public UserServiceImpl(UserDAO dao) {
		super();
		this.dao = dao;
	}

	public UserDAO getDao() {
		return dao;
	}

	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	public UserVO login(String id, String pw) {
		UserVO vo = dao.login(id, pw);
		if (vo != null)
			System.out.println("[로그인 성공] user : " + vo.getId());
		else
			System.out.println("[로그인 실패] user : " + vo.getId());
		return vo;
	}

	public int addUser(UserVO user) {
		return dao.addUser(user);
	}

	public UserVO getUser(String id) {
		return dao.getUser(id);
	}

	public List<UserVO> getUserList() {
		return dao.getUserList();
	}

	public int updateUser(UserVO user) {
		return dao.updateUser(user);
	}

	public int setNewPassword(UserVO user) {
		return dao.setNewPassword(user);
	}
	/*
	 * public int removeUser(String id) { return dao.removeUser(id); }
	 * 
	 * public List<UserVO> searchUser(String condition, String keyword) { return
	 * dao.searchUser(condition, keyword); }
	 * 
	 * public List<UserVO> getFriendList(String id) { return dao.getFriendList(id);
	 * }
	 * 
	 * @Override public UserVO findPassword(UserVO user) { return
	 * dao.findPassword(user); }
	 */

}
