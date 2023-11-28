package com.springmvc.rest;

import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.springmvc.exception.inputException;
import com.springmvc.exception.serverException;
import com.springmvc.message.messages;
import com.springmvc.message.validTestResult;
import com.springmvc.model.staff;
import com.springmvc.service.staffService;
import com.springmvc.service.validatorSevice;

@RestController
@RequestMapping("/staff/")
public class staffRest {
	
	@Autowired
	staffService<staff> staffservice;
	
	@Autowired
	validatorSevice vlservice;

	@RequestMapping(value= "update/{staff_id}",method=RequestMethod.GET)
	public ResponseEntity<staff> showStaffModal(@PathVariable("staff_id") int id,Model model) {
		try {
			staff s= staffservice.getStaff(id);
			return new ResponseEntity<staff> (s,HttpStatus.OK);
		} catch (inputException e) { // bad request 400
			throw new inputException();
		} catch (Exception e) {
			throw new serverException(); // error from server 500
		}
	}
	

	@RequestMapping(value= "liststaff/{depart_id}",method=RequestMethod.GET)
	public List<staff> getStaffFlowDepart(@PathVariable("depart_id") String id,Model model) {
			List<staff> listStaff;
			if(id.equals("all")) {
				listStaff = staffservice.getList();
			}else {
					listStaff= staffservice.searchListbyId(id);
			}
			return listStaff;
	}

	
	@RequestMapping(value= "save",method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public messages excuteSave(@RequestParam("image") MultipartFile file,	
			 @RequestParam(value="id",required= true) int id
			,@RequestParam(value="name",required= true) String name
			,@RequestParam(value="gender",required= true) boolean gender
			,@RequestParam(value="birthday",required= true) String birthday
			,@RequestParam(value="email",required= true) String email
			,@RequestParam(value="phone",required= true) String phone  
			,@RequestParam(value="salary",required= true) double salary
			,@RequestParam(value="level",required= true) int level
			,@RequestParam(value="note",required= true) String note
			,@RequestParam(value="departId",required= true) int depart_id) {
		try {
			staff st = new staff();
			st.setName(name);
			st.setGender(gender);
			st.setBirthday(birthday);
			st.setEmail(email);
			st.setPhone(phone);
			st.setSalary(salary);
			st.setLevel(level);
			st.setNote(note);
			st.setDepart_id(depart_id);
			List<validTestResult> result = vlservice.checkStaff(st, file); // to validate staff - > return invalid list
			if (result.size() > 0) return new messages(0, "invalid", result); 
			st.setPhoto(file.getBytes());
			staffservice.saveStaff(st);
			return new messages(1, "success");
		} catch (Exception e) {
			throw new serverException();
		}
	}
	
	
	
	@RequestMapping(value= "update",method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public messages excuteUpdate(@RequestParam("image") MultipartFile file,	
			 @RequestParam(value="id",required= true) int id
			,@RequestParam(value="name",required= true) String name
			,@RequestParam(value="gender",required= true) boolean gender
			,@RequestParam(value="birthday",required= true) String birthday
			,@RequestParam(value="email",required= true) String email
			,@RequestParam(value="phone",required= true) String phone  
			,@RequestParam(value="salary",required= true) double salary
			,@RequestParam(value="level",required= true) int level
			,@RequestParam(value="note",required= true) String note
			,@RequestParam(value="departId",required= true) int depart_id ) throws IOException {
		try {
			staff st = staffservice.getStaff(id);
			st.setName(name);
			st.setGender(gender);
			st.setBirthday(birthday);
			st.setEmail(email);
			st.setPhone(phone);
			st.setSalary(salary);
			st.setLevel(level);
			st.setNote(note);
			st.setDepart_id(depart_id);
			st.setPhoto(file.getBytes());
			List<validTestResult> result = vlservice.checkStaff(st, file); // to validate staff return invalid list
			if (result.size() > 0) return new messages(0, "invalid", result); 
			staffservice.updateStaff(st);
			return new messages(1, st.getName() );
		} catch (Exception e) {
			throw new serverException();
		}
	}
	
	
	@RequestMapping(value= "delete",method = RequestMethod.DELETE, produces = "application/json")
	public messages excuteDelete(@RequestBody staff s) {
			staff st = staffservice.getStaff(s.getStaff_id());
			staffservice.deleteStaff(st);
			return new messages(1, " Success to delete staff: "+ s.getName() );
	}
	
}
