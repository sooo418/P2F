package web.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import spring.biz.user.vo.UserVO;

public class UserValidator implements Validator {

	public boolean supports(Class<?> clazz) {

		return true;
	}

	public void validate(Object target, Errors errors) {
		UserVO vo = (UserVO) target;
		if (vo.getId() == null || vo.getId().length() < 6 || vo.getId().length() > 15
				|| vo.getId().trim().isEmpty()) {
			errors.rejectValue("id", "required", new Object[] { "id" }, "input id");
		}
		if (vo.getName() == null || vo.getName().length() < 2 || vo.getName().length() > 10
				|| vo.getName().trim().isEmpty()) {
			errors.rejectValue("name", "required", new Object[] { "name" }, "input name");
		}
		if (vo.getPw() == null || vo.getPw().length() < 6 || vo.getPw().length() > 15
				|| vo.getPw().trim().isEmpty()) {
			errors.rejectValue("pw", "required", new Object[] { "pw" }, "input pw");
		}
		if (vo.getGender() == null || vo.getGender().trim().isEmpty()) {
			errors.rejectValue("gender", "required", new Object[] { "gender" }, "input gender");
		}
		if (vo.getPhone() == null || vo.getPhone().trim().isEmpty()) {
			errors.rejectValue("phone", "required", new Object[] { "phone" }, "input phone");
		}
		if (vo.getNickname() == null || vo.getNickname().length() < 3 || vo.getNickname().length() > 10
				|| vo.getNickname().trim().isEmpty()) {
			errors.rejectValue("nickname", "required", new Object[] { "nickname" }, "input nickname");
		}
		if (vo.getProfile() == null || vo.getProfile().trim().isEmpty()) {
			errors.rejectValue("profile", "required", new Object[] { "profile" }, "input profile");
		}
		if (vo.getHint() == null || vo.getHint().length() < 3 || vo.getHint().length() > 20
				|| vo.getHint().trim().isEmpty()) {
			errors.rejectValue("hint", "required", new Object[] { "hint" }, "input hint");
		}
	}

}
