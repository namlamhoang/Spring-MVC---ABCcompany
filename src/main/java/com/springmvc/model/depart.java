package com.springmvc.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class depart {
	@Id
	@Column
	private int depart_id;
	@Column
	private String name;
	@Column
	private String thewriter;
	
	public depart() {
		// TODO Auto-generated constructor stub
	}
	
	

	public depart(int depart_id) {
		this.depart_id = depart_id;
	}



	public depart(String name, String thewriter) {
		this.name = name;
		this.thewriter = thewriter;
	}



	public int getDepart_id() {
		return depart_id;
	}

	public void setDepart_id(int depart_id) {
		this.depart_id = depart_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getThewriter() {
		return thewriter;
	}

	public void setThewriter(String thewriter) {
		this.thewriter = thewriter;
	}
	
	
}
