package com.springmvc.model;

import java.util.List;

public class test {
	private String test1;
	
	private String test2;
	
	private testObject test3;
	
	private List<testObject> test4;
	
	public test() {
		// TODO Auto-generated constructor stub
	}

	public test(String test1, String test2, testObject test3) {
		this.test1 = test1;
		this.test2 = test2;
		this.test3 = test3;
	}

	public String getTest1() {
		return test1;
	}

	public void setTest1(String test1) {
		this.test1 = test1;
	}

	public String getTest2() {
		return test2;
	}

	public void setTest2(String test2) {
		this.test2 = test2;
	}

	public testObject getTest3() {
		return test3;
	}

	public void setTest3(testObject test3) {
		this.test3 = test3;
	}

	public List<testObject> getTest4() {
		return test4;
	}

	public void setTest4(List<testObject> test4) {
		this.test4 = test4;
	}
	
	
}
