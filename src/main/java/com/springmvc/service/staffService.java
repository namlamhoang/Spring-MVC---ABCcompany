package com.springmvc.service;

import java.util.List;


public interface staffService<staff> {
	List<staff> getList();
	List<staff> searchList(staff s);
	List<staff> searchListbyId(String id);
	staff getStaff(int id);
	void saveStaff(staff st);
	void updateStaff(staff st);
	void deleteStaff(staff st);
	void updateStaffNoPhoto(staff st);
}
