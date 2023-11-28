package com.springmvc.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.springmvc.model.users;

@Repository
public class userDAO extends daoHelper<users> implements daoInterface<users> {

	public userDAO() {
		super(users.class);
	}

	@Override
	public List<users> getList() {
		return getListDAO();
	}
	
	@Override
	public List<users> searchListById(String id) {
		return null;
	}

	@Override
	public List<users> searchList(users e) {
		return null;
	}

	@Override
	public users getEntityById(int id) {
		return getEntityById(id);
	}

	@Override
	public users getEntity(users e) {
		return getEntitybyNameDAO(e.getUsername());
	}

	@Override
	public void save(users e) {
		saveDAO(e);
	}

	@Override
	public void update(users e) {
		updateDAO(e);
	}

	@Override
	public void delete(users e) {
		deleteDAO(e);
	}

	

}
