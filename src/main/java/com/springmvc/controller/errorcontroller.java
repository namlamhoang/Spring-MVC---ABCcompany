package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@Controller
@RequestMapping("/error/")
public class errorcontroller extends ResponseEntityExceptionHandler {
	
	private String urlInclude = ".jsp?v=includeError";
	
	 // page request
	
	@GetMapping("/access-denied")
	public String errormessage() {
		
	    return "403";
	}
	
	

}
