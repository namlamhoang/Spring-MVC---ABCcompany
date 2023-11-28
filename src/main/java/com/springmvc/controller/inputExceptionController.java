package com.springmvc.controller;


import java.io.IOException;

import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import com.springmvc.exception.inputException;
import com.springmvc.message.messages;

@ControllerAdvice
@Order(Ordered.HIGHEST_PRECEDENCE)
public class inputExceptionController {
	
	// ajax request
	
//	@ExceptionHandler(value = HibernateJdbcException.class) 
//	public ResponseEntity<messages> handleException(HibernateJdbcException ex) {
//		return new ResponseEntity<messages> ( new messages(2, "SQL ERROR"),HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//	
//
//	@ExceptionHandler(value = DataException.class) 
//	public ResponseEntity<messages> handleException(DataException ex) {
//		return new ResponseEntity<messages> ( new messages(2, "SQL ERROR"),HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	
	@ExceptionHandler(value = MaxUploadSizeExceededException.class) 
	public ResponseEntity<messages> handleException(MaxUploadSizeExceededException ex) {
		return new ResponseEntity<messages> ( new messages(2, "FILE IS TOO BIG"),HttpStatus.PAYLOAD_TOO_LARGE);
	}
	
	
	@ExceptionHandler(value = inputException.class) 
	public ResponseEntity<messages> handleException(inputException ex, WebRequest request) {
		return new ResponseEntity<messages> ( new messages(2, ex.getMessage() ),HttpStatus.BAD_REQUEST);
	}
	
	

	
}
