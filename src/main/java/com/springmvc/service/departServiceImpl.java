package com.springmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.springmvc.dao.daoInterface;
import com.springmvc.model.depart;

@Service
public class departServiceImpl implements departService<depart> {

	@Autowired
	daoInterface<depart> dao;
	
	@Override
	@Transactional
	public List<depart> getList() {
		return dao.getList();
	}

	@Override
	@Transactional
	public depart getDepart(int id) {
		return dao.getEntityById(id);
	}

	@Override
	@Transactional
	public void saveDepart(depart db) {
		dao.save(db);
	}

	@Override
	@Transactional
	public void updateDepart(depart db) {
		dao.update(db);
	}

	@Override
	@Transactional
	public void deleteDepart(depart db) {
		dao.delete(db);
	}

}
