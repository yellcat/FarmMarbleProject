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

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required","fill in the blank");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required", "fill in the blank.");

		int passwordLength = member.getPw().length();
		
		if(member.getPwChange()!=member.getPwCheck()){
			errors.rejectValue("pwChange", "enter the same as above");
		}
		
		if(passwordLength<4) {
			errors.rejectValue("pw", "minlength", new Object[] {4, passwordLength}, "at least 4 characters long");
		}else if(passwordLength>12){
			errors.rejectValue("pw", "maxlength", new Object[] {12, passwordLength}, "12 characters maximum");
		}
	}
}
