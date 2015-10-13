package com.mycompany.myapp.dto;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class PwValidator implements Validator {
	private static final Logger logger = LoggerFactory.getLogger(PwValidator.class);
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member member = (Member) target;
		
		int passwordLength = member.getPwChange().length();
		if(passwordLength<4) {
			errors.rejectValue("pwChange", "minlength", new Object[] {4, passwordLength}, "at least 4 characters long");
		}else if(passwordLength>12){
			errors.rejectValue("pwChange", "maxlength", new Object[] {12, passwordLength}, "12 characters maximum");
		}

		if(!member.getPwChange().equals(member.getPwCheck())){
			errors.rejectValue("pwCheck", "wrong_checkPass", "enter the same as above");
		}
	}
}
