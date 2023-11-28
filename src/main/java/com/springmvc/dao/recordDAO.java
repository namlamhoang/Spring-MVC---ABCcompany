package com.springmvc.dao;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.model.depart;
import com.springmvc.model.record;

@Repository
public class recordDAO extends daoHelper<record> implements daoInterface<record> {

	public recordDAO() {
		super(record.class);
	}

	@Override
	public List<record> getList() {
		return getListDAO();
	}

	@Override
	public record getEntity(record e) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public record getEntityById(int id) {
		return getEntitybyIdDAO(id);
	}

	@Override
	public void save(record e) {
		saveDAO(e);
	}

	@Override
	public void update(record e) {
		updateDAO(e);
	}

	@Override
	public void delete(record e) {
		deleteDAO(e);
	}

	@Override
	public List<record> searchListById(String id) {
		return null;
	}

	@Override
	public List<record> searchList(record e) {
		return null;
	}

	
}
