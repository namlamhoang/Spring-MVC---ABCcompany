package com.springmvc.service;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import com.springmvc.exception.inputException;
import com.springmvc.helper.regularExpression;
import com.springmvc.message.validTestResult;
import com.springmvc.model.record;
import com.springmvc.model.staff;



@Repository
public class validatorServiceImpl implements validatorSevice {
	

	regularExpression regex = new regularExpression();
	
	@Autowired
	staffService<staff> staffservice;
	
	// check load image file
	public void isValidImage(MultipartFile file) {
		try {
			ImageIO.read(file.getInputStream()).flush();
		} catch (IOException e) {
			
		}

	}
	
	// *** check input
	@Override
	public List<validTestResult> checkStaff(staff s,MultipartFile file) {
		List<validTestResult> result = new ArrayList<validTestResult>();
		
		//check name 
		boolean namelength =  regex.validname(s.getName());
		if(!namelength) throw new inputException("name is not valid");
		
		
		//check year old
		int yearold = new Date().getYear() - s.getBirthday().getYear();
		if(yearold < 18 || yearold > 60) throw new inputException("birthday is not valid");
		
		//check salary
		if(s.getSalary() < 1000000 || s.getSalary() >50000000) throw new inputException("salary is not valid");
		
		// check email 
		validTestResult email = new validTestResult();
		
		boolean typeemail = regex.validemail(s.getEmail()); 
		if (!typeemail) throw new inputException("email is not valid");
		
		boolean usedemail = staffservice.searchList(s).size() < 1 ? true : false; 
		if (!usedemail) {
			email.setInvalidOb("email");
			email.setMessage("email already used");
		}
		
		// check phone number
		validTestResult phone = new validTestResult();
		
		boolean typephone = regex.validphone(s.getPhone());
		if(!typephone) throw new inputException("phone number is not valid");
		
		
		// check image file
		validTestResult image = new validTestResult();
		
		
		boolean existFile = !file.isEmpty() ? true : false;
		if(!existFile) throw new inputException("file doesn't exist");
		
		
		boolean nameextension = regex.contentTypes.contains(file.getContentType());
		if (!nameextension)	throw new inputException("file name extension mismatch");
		
		isValidImage(file);
		
		
		// add to List result
		if(email.getInvalidOb() == "email" ) {
			result.add(email);
		}
		
		if(image.getInvalidOb() == "file") {
			result.add(image);
		}
		
		return result;
		
	}

	@Override
	public  List<validTestResult> checkRecord(record r) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
