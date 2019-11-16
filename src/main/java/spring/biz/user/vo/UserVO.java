package spring.biz.user.vo;

public class UserVO {
	private String id;
	private String name;
	private String pw;
	private String nickname;
	private String phone;
	private String profile;
	private String gender;
	private String hint;
	public UserVO() {
		super();
	}

	public UserVO(String id, String name, String pw, String nickname, String phone, String profile, String gender,
			String hint) {
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.nickname = nickname;
		this.phone = phone;
		this.profile = profile;
		this.gender = gender;
		this.hint = hint;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHint() {
		return hint;
	}

	public void setHint(String hint) {
		this.hint = hint;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", name=" + name + ", pw=" + pw + ", nickname=" + nickname + ", phone=" + phone
				+ ", profile=" + profile + ", gender=" + gender + ", hint=" + hint + "]";
	}

}
