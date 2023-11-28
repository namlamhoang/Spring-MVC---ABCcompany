package com.springmvc.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.model.depart;
import com.springmvc.model.staff;
import com.springmvc.service.departService;
import com.springmvc.service.staffService;
import com.springmvc.model.test;

@Controller
@RequestMapping("/staff/")
public class staffcontroller {
	
	private String urlInclude = ".jsp?v=includeStaff";
	
	@Autowired
	staffService<staff> staffservice;
	
	@Autowired
	departService<depart> departservice;
	
	@RequestMapping("viewstaff")
	public String viewStaff(Model model) {
		List<staff> staffList = staffservice.getList();
		List<depart> departList = departservice.getList();
		model.addAttribute("staffList",staffList);
		model.addAttribute("departList",departList);
		
		return "index"+urlInclude;
	} 
	
	@RequestMapping(value="test", method = RequestMethod.POST)
	public @ResponseBody test test(@RequestBody test t) {
		System.out.println(t.getTest3().getTestObject());
		return t;
	} 
	
	
}
