package spring.biz.user.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mappers.UserMapper;
import spring.biz.user.vo.UserVO;

@Repository("mybatis")
public class UserDAO_MyBatis implements UserDAO {

	SqlSession sqlSession = null;

	UserMapper ui = null;

	@Inject
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		ui = sqlSession.getMapper(UserMapper.class);
	}

	public UserVO login(String id, String pw) {
		System.out.println("nullpoint검사1");
		UserVO re = ui.loginUser(id, pw);
		System.out.println("nullpoint검사2!");
		System.out.println("re 출력: " + re);
		if (re == null) {
			re = new UserVO();
			re.setId("-1");
		}
		return re;
	}

	public int addUser(UserVO user) {
		System.out.println(user);
		return ui.addUser(user);
	}

	public UserVO getUser(String id) {
		UserVO vo = new UserVO();
		vo.setId(id);
		return ui.getUser(vo);
	}

	public List<UserVO> getUserList() {
		return ui.getuserlist();
	}

	public int updateUser(UserVO user) {
		return ui.updateUser(user);
	}

	public int removeUser(String id) {
		UserVO vo = new UserVO();
		vo.setId(id);
		return ui.removeUser(vo);
	}

	public List<UserVO> searchUser(String condition, String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		return ui.searchUser(map);
	}

	public List<UserVO> getFriendList(String id) {
		return ui.getFriendList(id);
	}

	public int setNewPassword(UserVO user) {
		return ui.setNewPassword(user);
	}

	public UserVO findPassword(UserVO user) {
		return ui.findPassword(user);
	}

}
