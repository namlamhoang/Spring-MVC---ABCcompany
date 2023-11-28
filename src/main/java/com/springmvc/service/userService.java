package com.springmvc.service;

import java.util.List;

public interface userService<user> {
	List<user> getList();
	user getUser(String username);
	void saveUser(user e);
	void updateUser(user e);
	void deleteUser(String username);
}

