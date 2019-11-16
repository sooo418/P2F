package web.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import spring.biz.board.vo.BoardVO;

public class BoardValidator implements Validator{

	public boolean supports(Class<?> clazz) {
		
		
		return true;
	}

	public void validate(Object target, Errors errors) {
		BoardVO vo = (BoardVO) target;
		if(vo.getOpen()==null || vo.getOpen().trim().isEmpty()) {
			errors.rejectValue("open","required",
					new Object[] {"open"},"input open");
		}
		if(vo.getBcontent()==null || vo.getBcontent().trim().isEmpty()) {
			errors.rejectValue("bcontent","required",
					new Object[] {"bcontent"},"input bcontent");
		}

	}

}
