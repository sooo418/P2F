package web.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import spring.biz.todo.vo.TodoVO;

public class TodoValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

	@Override
	public void validate(Object target, Errors errors) {
		TodoVO vo = (TodoVO) target;
		if(vo.getTcontent() == null || vo.getTcontent().trim().isEmpty()) {
			errors.rejectValue("tcontent", "required");
		}
		if(vo.getTododate().equals("") || vo.getTododate().contains("-")) {
			errors.rejectValue("tododate", "required");
		}
	}

}
