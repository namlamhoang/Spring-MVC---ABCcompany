package com.springmvc.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.springmvc.helper.datehelper;
import com.springmvc.model.depart;
import com.springmvc.model.record;
import com.springmvc.model.users;
import com.springmvc.service.departService;
import com.springmvc.service.recordService;
import com.springmvc.service.statisticalService;
import com.springmvc.service.userService;

@Controller
@RequestMapping("/home/")
public class homecontroller {
	
	private String urlInclude = ".jsp?v=includeHome";
	
	@Autowired
	userService<users> userservice;
	
	@Autowired
	recordService<record> recordservice;
	
	@Autowired
	statisticalService statisticalservice;
	
	
	@Autowired
	departService<depart> departservice;

	@RequestMapping("/index")
	public String home(HttpSession session,Model model) {
		
		
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		users u = userservice.getUser(auth.getName());
		
		session.setAttribute("users",u);
		
		model.addAttribute("totalStaff", statisticalservice.getTotalStaff());
		
		model.addAttribute("totalSalary", statisticalservice.getTotalSalary());
			
		model.addAttribute("totalAchievement", statisticalservice.getTotalAchievement());
		
		model.addAttribute("totalDiscipline", statisticalservice.getTotalDiscipline());
		
		model.addAttribute("percentAchievement", statisticalservice.getPercentAchievement());
		
		model.addAttribute("percentDiscipline", statisticalservice.getPercentDiscipline());
		
		model.addAttribute("listDepart", departservice.getList());
		
		model.addAttribute("listTop10", statisticalservice.getListTop10());
		// thông kê theo từng năm
		model.addAttribute("listallyear", statisticalservice.getListAllYear());
		// thông kê theo từng tháng của năm
		model.addAttribute("listallmonth", statisticalservice.getListFollowMonth( String.valueOf(datehelper.now().getYear()+1900 )  ));
		// thống kê this year
		model.addAttribute("listthisyear", statisticalservice.getListLastMonth());
		
		return "index"+urlInclude;
	} 
	

}
