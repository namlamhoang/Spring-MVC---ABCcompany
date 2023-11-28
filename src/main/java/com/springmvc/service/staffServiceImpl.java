package com.springmvc.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.springmvc.dao.daoInterface;
import com.springmvc.model.staff;

@Service
public class staffServiceImpl implements staffService<staff> {
	
	@Autowired
	daoInterface<staff> dao;
	


	@Override
	@Transactional
	public List<staff> getList() {
		return dao.getList();
	}

	@Override
	@Transactional
	public staff getStaff(int id) {
		return dao.getEntityById(id);
	}
 
	@Override
	@Transactional
	public void saveStaff(staff st) {
			dao.save(st);
	}	

	@Override
	@Transactional
	public void updateStaff(staff st) {
		dao.update(st);
	}
	
	@Override
	@Transactional
	public void updateStaffNoPhoto(staff st) {
		dao.update(st);
	}
	
	
	@Override
	@Transactional
	public void deleteStaff(staff st) {
		dao.delete(st);
	}

	@Override
	@Transactional
	public List<staff> searchList(staff s) {
		 return dao.searchList(s);
	}

	@Override
	@Transactional
	public List<staff> searchListbyId(String id) {
		return dao.searchListById(id);
	}
	
	

}
