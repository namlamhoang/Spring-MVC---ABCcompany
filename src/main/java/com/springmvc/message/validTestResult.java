package com.springmvc.message;






public class validTestResult {
	
	private String invalidOb;
	
	private String message;
	
	public validTestResult() {
		// TODO Auto-generated constructor stub
	}
	
	
	public validTestResult(String invalidOb, String message) {
		this.invalidOb = invalidOb;
		this.message = message;
	}


	public String getInvalidOb() {
		return invalidOb;
	}

	public void setInvalidOb(String invalidOb) {
		this.invalidOb = invalidOb;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
}
