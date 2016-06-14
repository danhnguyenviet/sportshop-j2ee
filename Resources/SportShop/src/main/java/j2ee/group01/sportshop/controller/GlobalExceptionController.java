package j2ee.group01.sportshop.controller;

import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionController {

	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {

		ModelAndView model = new ModelAndView("redirect:/error");
		model.addObject("msg", "Đã có lỗi xảy ra trong quá trình làm việc. Chúng tôi đã nhận phản hồi và sẽ sớm khắc phục xin cám ơn!");

		return model;

	}
	
}
