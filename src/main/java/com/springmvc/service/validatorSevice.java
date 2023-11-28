package com.springmvc.service;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.springmvc.message.validTestResult;
import com.springmvc.model.record;
import com.springmvc.model.staff;

public interface validatorSevice {
	
	public List<validTestResult> checkStaff(staff s,MultipartFile file);
	
	public List<validTestResult> checkRecord(record r);
	
	
}
