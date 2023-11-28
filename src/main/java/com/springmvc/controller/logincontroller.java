package com.springmvc.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/pagelogin")
@ComponentScan(value="com.springmvc.service")
public class logincontroller {
	
	private String urlInclude = ".jsp?v=includeIndex";
	
	@RequestMapping()
	public String login(HttpServletRequest request) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!auth.getPrincipal().equals("anonymousUser")) return "index"+urlInclude;
		return "login";	
	}
	
	
	
}
