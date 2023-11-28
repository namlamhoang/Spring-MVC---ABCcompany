package com.springmvc.dao;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.model.depart;


@Repository
public class departDAO extends daoHelper<depart> implements daoInterface<depart> {


	
	public departDAO() {
		super(depart.class);
	}

	@Override
	public List<depart> getList() {
		return getListDAO();
	}
	
	@Override
	public List<depart> searchList(depart e) {
		return searchList(e);
	}
	
	@Override
	public List<depart> searchListById(String id) {
		return null;
	}
	
	@Override
	public depart getEntity(depart e) {
		return null;
	}
	
	@Override
	public depart getEntityById(int id) {
		return getEntitybyIdDAO(id);
	}

	@Override
	public void save(depart e) {
		saveDAO(e);
	}

	@Override
	public void update(depart e) {
		updateDAO(e);
	}

	@Override
	public void delete(depart e) {
		deleteDAO(e);
	}

	


}
