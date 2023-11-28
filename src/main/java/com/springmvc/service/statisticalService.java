package com.springmvc.service;

import java.util.List;

public interface statisticalService {
	
	List<Object> getListTop10();
	List<Object> getListAllYear();
	List<Object> getListLastMonth();
	List<Object> getListFollowMonth(String year);
	long getTotalStaff();
	double getTotalSalary();
	long getTotalAchievement();
	long getTotalDiscipline();
	double getPercentAchievement();
	double getPercentDiscipline();
	
	
	
}
