package com.springmvc.dao;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.model.depart;
import com.springmvc.model.staff;

@Repository
//@Scope( proxyMode = ScopedProxyMode.TARGET_CLASS )
public class staffDAO extends daoHelper<staff> implements daoInterface<staff> {

	public staffDAO() {
		super(staff.class);
	}


	@Override
	public List<staff> getList() {
		return getListDAO();
	}
	
	@Override
	public List<staff> searchList(staff e) {
		return getCurrentSession().createQuery("from staff where staff_id != '"+ e.getStaff_id() +"'and email = '"+ e.getEmail() +"' ").list();
	}
	
	@Override
	public List<staff> searchListById(String id) {
		return getCurrentSession().createQuery("FROM staff where depart_id = '"+id+"'").list();
	}

	@Override
	public staff getEntity(staff e) {
		return null;
	}

	@Override
	
	public void save(staff e) {
		saveDAO(e);
	}

	@Override
	public void update(staff e) {
		updateDAO(e);
	}

	@Override
	public void delete(staff e) {
		deleteDAO(e);
	}


	@Override
	public staff getEntityById(int id) {
		return getEntitybyIdDAO(id);
	}
	

}
