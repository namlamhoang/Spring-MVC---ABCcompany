package com.springmvc.service;

import java.util.Base64;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ResponseBody;

import com.springmvc.dao.statisticalDAO;

@Service
@Transactional
public class statisticalServiceImpl implements statisticalService {
	
	@Autowired
	statisticalDAO dao;

	@Override
	@Transactional
	public List  getListTop10() {
		return dao.getListTop10();
	}
	
	@Override
	@Transactional
	public List getListAllYear() {
		return dao.getListAllYear();
	}

	@Override
	@Transactional
	public List getListLastMonth() {
		return dao.getListLastMonth();
	}

	@Override
	@Transactional
	public List getListFollowMonth(String year) {
		return dao.getListFollowMonth(year);
	}
	
	@Override
	@Transactional
	public long getTotalStaff() {
		return dao.totalStaff();
	}

	@Override
	@Transactional
	public double getTotalSalary() {
		return dao.totalSalaryStaff();
	}

	@Override
	@Transactional
	public long getTotalAchievement() {
		return dao.totalAchievement();
	}

	@Override
	@Transactional
	public long getTotalDiscipline() {
		return dao.totalDiscipline();
	}
	
	@Transactional
	private double totalRecord() {
		return getTotalAchievement()+getTotalDiscipline();
	}
	
	@Autowired
	@Transactional
	public double getPercentAchievement() {
		return getTotalAchievement() / totalRecord();
	}
	
	
	
	@Autowired
	@Transactional
	public double getPercentDiscipline() {
		return getTotalDiscipline() / totalRecord();
	}



}
