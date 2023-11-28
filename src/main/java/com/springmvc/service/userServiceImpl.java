package com.springmvc.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.dao.daoInterface;
import com.springmvc.model.users;


@Service
public class userServiceImpl implements userService<users> {

	@Autowired
	daoInterface<users> dao;
	
	@Override
	@Transactional
	public List<users> getList() {
		return dao.getList();
	}

	@Override
	@Transactional
	public users getUser(String username) {
		users e = new users();
		e.setUsername(username);
		return dao.getEntity(e);
	}

	@Override
	@Transactional
	public void saveUser(users e) {
		dao.save(e);
	}

	@Override
	@Transactional
	public void updateUser(users e) {
		dao.update(e);
	}


	@Override
	@Transactional
	public void deleteUser(String username) {
		users e = new users();
		e.setUsername(username);
		dao.delete(e);
	}

}
