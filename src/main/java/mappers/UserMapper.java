package mappers;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import spring.biz.user.vo.UserVO;

public interface UserMapper {
	@Select("select * from userinfo where id=#{id} and pw=#{pw}")
	UserVO loginUser(@Param("id")String id , @Param("pw")String pw);

	@Select("select * from userinfo")
	List<UserVO> getuserlist();

	@Insert("insert into userinfo (id,pw,name,nickname,phone,profile,gender,hint) "
			+ "values (#{id}, #{pw}, #{name}, #{nickname}, #{phone}, #{profile},#{gender},#{hint})")
	int addUser(UserVO user);

	@Select("select * from userinfo where id = #{id}")
	UserVO getUser(UserVO user);

	@Update("update userinfo " + "set pw=#{pw},nickname=#{nickname},phone=#{phone}, "
			+ "name=#{name},profile=#{profile},gender=#{gender},hint=#{hint} " + "where id =#{id}")
	int updateUser(UserVO user);

	@Delete("delete from userinfo where id=#{id}")
	int removeUser(UserVO user);

	@Select("select * from userinfo where ${condition} like '%'||#{keyword}||'%'")
	List<UserVO> searchUser(HashMap<String, String> map);

	@Select("select * from userinfo where id = #{id} and hint=#{hint}")
	UserVO findPassword(UserVO user);

	@Update("update userinfo set pw=#{pw} where id =#{id}")
	int setNewPassword(UserVO user);

	@Select("select * from friendlist where myid = #{myid}")
	List<UserVO> getFriendList(String myid);

}
