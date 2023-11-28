package com.springmvc.rest;


import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.springmvc.message.messages;
import com.springmvc.model.record;
import com.springmvc.model.staff;
import com.springmvc.service.recordService;
import com.springmvc.service.staffService;

@RestController
@RequestMapping("/record/")
public class recordRest {
	
	@Autowired
	recordService<record> recordservice;

	@Autowired
	staffService<staff> staffservice;
	
	@RequestMapping(value= "listrecord",method=RequestMethod.GET)
	public List<record> getStaffFlowDepart(Model model) {
		try {	
				List<record> listRecord = recordservice.getList();
			return listRecord;
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping(value = "excutesave",method=RequestMethod.POST)
	public @ResponseBody messages saveRecord(
			 @RequestParam("type") String type
			,@RequestParam("reason") String reason
			,@RequestParam("date") Date date
			,@RequestParam("staff_id") String [] staff_id ) 
	{
		messages mess;
		String staffname="You Record Staff Name: "; 
		String typemess = "Success";
		try {
			for(int i =0; i < staff_id.length;i++) {
				staff s = null;
				try {
					s = staffservice.getStaff(Integer.parseInt(staff_id[i]));
					if(s == null) {
						typemess="Fail";
						staffname +=  "Not Foud Staff Id:"+ staff_id[i] +",";
					}
					record rc = new record(Boolean.parseBoolean(type), reason, date, s);
					recordservice.saveRecord(rc);
					staffname += s.getName() +"<br/>";
				} catch (Exception e) {
					typemess="Fail";
					staffname +=  "Not Foud Staff Id:"+ staff_id[i] +",";
				}
			}
//			mess = new messages("Add Record", staffname, typemess);
		} catch (Exception e) {
//			mess = new messages("Add Record", "Can not found you request data", "Fail");
		}
		
		return null;
	}
	
	@RequestMapping(value= "delete/{record_id}",method=RequestMethod.DELETE)
	public messages deleteRecord(@PathVariable("record_id") int id) {
		try {	
			record rc = recordservice.getRecord(id);
			recordservice.deleteRecord(rc);
//			return new messages("Delete Record", "You Delete One Record", "Success");
		} catch (Exception e) {
//			return new messages("Delete Record", "This Record Not Found", "Fail");
		}
		return null;
	} 
	
	
	@RequestMapping(value= "getrecord/{record_id}",method=RequestMethod.GET)
	public record getRecord(@PathVariable("record_id") int id) {
		try {	
			return recordservice.getRecord(id);
		} catch (Exception e) {
			return null;
		}
	} 
	
	
	@RequestMapping(value= "update",method=RequestMethod.POST)
	public messages updateRecord(@RequestParam("record_id") int id,@RequestParam("type") boolean type,@RequestParam("reason") String reason) {
		try {	
			record rc =	 recordservice.getRecord(id);
			rc.setDate(new Date());
			rc.setReason(reason);
			rc.setType(type);
			recordservice.updateRecord(rc);
//			return new messages("<s:message code = 'data.recordUpdate'/>", rc.getStaff().getName(), "Success");
		} catch (Exception e) {
//			return new messages("<s:message code = 'data.recordUpdate'/>", "Your Input is Not Valid", "Fail");
		}
		return null;
	} 
	
	
}
