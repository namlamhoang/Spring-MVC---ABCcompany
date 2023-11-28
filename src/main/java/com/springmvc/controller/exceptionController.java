package com.springmvc.controller;


import java.io.IOException;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.springmvc.message.messages;

@ControllerAdvice
@Order(Ordered.LOWEST_PRECEDENCE)
public class exceptionController {
	
//	@ExceptionHandler(value = Exception.class) 
//	public ModelAndView redirectToErrorPage(Exception e) {
//		System.out.println("vào");
//	    ModelAndView mav = new ModelAndView("error"+urlInclude);
//	    mav.getModelMap().addAttribute("data", new messages(2, "500 INTERNAL_SERVER_ERROR"));
//	    return mav;
//	}
//	

	// ajax reponse

	
	@ExceptionHandler(value = Exception.class) 
	public ResponseEntity<messages> handleException(Exception ex) {
		ex.printStackTrace();
		
		return new ResponseEntity<messages> ( new messages(2, "500 INTERNAL_SERVER_ERROR"),HttpStatus.INTERNAL_SERVER_ERROR);
	}
	

	
	
}
