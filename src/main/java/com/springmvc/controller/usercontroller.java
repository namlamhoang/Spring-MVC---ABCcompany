package com.springmvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.model.users;
import com.springmvc.service.userService;

@Controller
@RequestMapping("/user/")
public class usercontroller {
	@Autowired
	userService<users> userservice;
	
	
	@RequestMapping(value = "photo",method=RequestMethod.GET,produces = MediaType.IMAGE_JPEG_VALUE)
	public @ResponseBody byte[] getImageWithMediaType() {
		users u = userservice.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
		return u.getPhoto();
	}
	
	
	
	
}
