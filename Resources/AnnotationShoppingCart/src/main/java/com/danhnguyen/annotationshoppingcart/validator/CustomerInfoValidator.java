package com.danhnguyen.annotationshoppingcart.validator;

import org.apache.commons.validator.routines.EmailValidator;
import com.danhnguyen.annotationshoppingcart.model.CustomerInfo;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

// Khai báo là một @Component (Nghĩa là 1 Bean).
@Component
public class CustomerInfoValidator implements Validator {

	private EmailValidator emailValidator = EmailValidator.getInstance();

	// Validator này chỉ dùng để kiểm tra class CustomerInfo.

	public boolean supports(Class<?> clazz) {
		return clazz == CustomerInfo.class;
	}

	public void validate(Object target, Errors errors) {
		CustomerInfo custInfo = (CustomerInfo) target;

		// Kiểm tra các trường (field) của CustomerInfo.
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.customerForm.name");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.customerForm.email");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty.customerForm.address");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "NotEmpty.customerForm.phone");

		if (!emailValidator.isValid(custInfo.getEmail())) {
			errors.rejectValue("email", "Pattern.customerForm.email");
		}
	}

}