package com.mycompany.myapp.dto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class JoinValidator implements Validator {
	private static final Logger logger = LoggerFactory.getLogger(JoinValidator.class);
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member member = (Member) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required","필수 항목입니다.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required", "필수 항목입니다.");

		int passwordLength = member.getPw().length();
		
		if(member.getPwChange()!=member.getPwCheck()){
			errors.rejectValue("pwChange", "확인 비민번호를 제대로 입력 해주세요");
		}
		
		if(passwordLength<4) {
			errors.rejectValue("pw", "minlength", new Object[] {4, passwordLength}, "최소 4자리 이상 입력");
		}else if(passwordLength>12){
			errors.rejectValue("pw", "maxlength", new Object[] {12, passwordLength}, "최대 12자리 이상 입력");
		}
	}
}
