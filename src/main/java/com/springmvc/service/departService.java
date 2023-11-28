package com.springmvc.service;

import java.util.List;

public interface departService<depart> {
	List<depart> getList();
	depart getDepart(int id);
	void saveDepart(depart db);
	void updateDepart(depart db);
	void deleteDepart(depart db);
}
