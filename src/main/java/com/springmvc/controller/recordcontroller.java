package com.springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.model.depart;
import com.springmvc.model.record;
import com.springmvc.service.departService;
import com.springmvc.service.recordService;


@Controller
@RequestMapping("/record/")
public class recordcontroller {
	
	private String urlInclude  = ".jsp?v=includeRecord";
	
	@Autowired
	recordService<record> service;
	
	@Autowired
	departService<depart> departservice; 
	
	@RequestMapping("viewrecord")
	public String viewDepart(Model model) {
		List<depart> departList = departservice.getList();
		model.addAttribute("departList",departList);
		return "index"+urlInclude;
	}
	
	
	
}
