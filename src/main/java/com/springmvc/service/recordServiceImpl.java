package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.springmvc.dao.daoInterface;
import com.springmvc.model.record;

@Service
public class recordServiceImpl implements recordService<record> {

	@Autowired
	daoInterface<record> dao;
	
	@Override
	@Transactional
	public List<record> getList() {
		return dao.getList();
	}

	@Override
	@Transactional
	public record getRecord(int id) {
		return dao.getEntityById(id);
	}

	@Override
	@Transactional
	public void saveRecord(record rc) {
		dao.save(rc);
	}

	@Override
	@Transactional
	public void updateRecord(record rc) {
		dao.update(rc);
	}

	@Override
	@Transactional
	public void deleteRecord(record e) {
		dao.delete(e);
	}


}
