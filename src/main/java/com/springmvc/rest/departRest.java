package com.springmvc.rest;

import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.springmvc.message.messages;
import com.springmvc.model.depart;
import com.springmvc.service.departService;

@RestController
@RequestMapping("/depart/")
public class departRest {
	
	@Autowired
	departService<depart> departservice;
	
	
	@RequestMapping(value= "listdepart",method=RequestMethod.GET)
	public List<depart> getStaffFlowDepart(Model model) {
		try {	
			return departservice.getList();
		} catch (Exception e) {
			return null;
		}
	}
	
	@RequestMapping(value= "update/{depart_id}",method=RequestMethod.GET)
	public depart getUpdateDepart(@PathVariable("depart_id") int id,Model model) {
		try {	
			return departservice.getDepart(id);
		} catch (Exception e) {
			return null;
		}
	} 
	
	
	@RequestMapping(value= "excute",method = RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public String excuteSave(@RequestBody String json) {
		depart db = new depart();
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(json);
			String departId = jsonObject.get("depart_id").toString(); 
			String departName = jsonObject.get("name").toString();
			String departTheWriter = jsonObject.get("thewriter").toString();
			if(departId.equals("")) {
				try {
					db.setName(departName);
					db.setThewriter(departTheWriter);
					departservice.saveDepart(db);
					 
//					mess = new messages("Add Depart", "You add Depart Name: "+departName, "Success !!!");
	
				} catch (Exception e) {
//					mess = new messages("Add Depart", "You add Depart Name: "+departName, "Fail !!!");
				}
			}else {
				try {
					int id = Integer.parseInt(departId); 
					db = departservice.getDepart(id);
					db.setName(departName);
					db.setThewriter(departTheWriter);
					departservice.updateDepart(db);
//					mess = new messages("Update Depart", "You Update Depart Name: "+departName, "Success !!!"); 
				} catch (Exception e) {
//					mess = new messages("Update Depart", "You Update Depart Name: "+departName, "Fail !!!"); 
				}
			}
//			return mess;
		} catch (Exception e) {
			e.printStackTrace();
//			return new messages("Action Depart", "Can not find depart infomation ", "Fail !!!");
		}
		return "ok";
	}
	
	
	@RequestMapping(value= "delete",method = RequestMethod.DELETE)
	public messages excuteDelete(@RequestBody String json) {
		depart dp = null;
		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonObject = (JSONObject) parser.parse(json);
			int departId = Integer.parseInt(jsonObject.get("depart_id").toString());
			dp = departservice.getDepart(departId);
			departservice.deleteDepart(dp);
//			return new messages("Delete Depart", "You Delete Depart Name: "+dp.getName(), "Success");
		} catch (Exception e) {
//			return new messages("Delete Depart", "You Delete Depart Name: "+dp.getName(), "Fail !!!");
		}
		return null;
	}
	
}
