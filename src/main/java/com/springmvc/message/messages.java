package com.springmvc.message;

import java.util.List;


public class messages {
	
	private int status;
	
	private String message;
	
	private List<validTestResult> validator;
	
	public messages() {
		// TODO Auto-generated constructor stub
	}

	
	
	public List<validTestResult> getValidator() {
		return validator;
	}



	public void setValidator(List<validTestResult> validator) {
		this.validator = validator;
	}



	public messages(int status, String message, List<validTestResult> validator) {
		this.status = status;
		this.message = message;
		this.validator = validator;
	}

	public messages(int status, String message) {
		this.status = status;
		this.message = message;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	
	
	
	
	
}
