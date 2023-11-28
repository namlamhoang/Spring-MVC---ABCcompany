package com.springmvc.service;

import java.util.List;

public interface recordService<record> {
	List<record> getList();
	record getRecord(int id);
	void saveRecord(record st);
	void updateRecord(record st);
	void deleteRecord(record e);
}
